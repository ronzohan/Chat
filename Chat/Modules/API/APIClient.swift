//
//  APIClient.swift
//  Chat
//
//  Created by Ron Daryl Magno on 02/08/2019.
//  Copyright © 2019 Ron Daryl Magno. All rights reserved.
//
import Foundation
import RxSwift

#warning("TODO: Create unit test for API Client")
class APIClient {
    var authManager: AuthManagerProtocol?
    var appToken: String?

    private var dateFormatter = DateFormatter()
    private var session: URLSessionProtocol

    init(session: URLSessionProtocol = URLSession.shared, authManager: AuthManagerProtocol) {
        self.session = session
        self.authManager = authManager

        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
    }

    private func handleNoConnectionError<T: Codable>(error: Error, to observer: AnyObserver<Result<T>>) {
        DispatchQueue.main.async {
            // Check here if the error is that there is no connection
            debugPrint("No connection")
            observer.onNext(Result.failure(error))
        }
    }

    func send<T: Codable>(request: Request) -> Observable<Result<T>> {
        let observer = Observable<Result<T>>.create { [unowned self] observer in
            let request = self.urlRequest(for: request)

            let task = self.session.dataTask(with: request) { data, urlResponse, error in
                // Check here if the url response has an error
                if let data = data,
                    let jsonData = try? JSONSerialization.jsonObject(with: data, options: []),
                    jsonData as? [String: Any] != nil,
                    let httpURLResponse = urlResponse as? HTTPURLResponse,
                    httpURLResponse.statusCode >= 400 {
                    if let error = error {
                        observer.onNext(.failure(error))
                    } else {
                        let jsonDecoder = JSONDecoder()
                        do {
                            let errorResponseInfo = try jsonDecoder.decode(ResponseInfo.self, from: data)
                            let errorMessage = errorResponseInfo.error ?? "Something went wrong"
                            let error = NSError(domain: "",
                                                code: httpURLResponse.statusCode,
                                                userInfo: [NSLocalizedDescriptionKey: errorMessage])
                            observer.onNext(.failure(error))
                        } catch let decodingError {
                            DispatchQueue.main.async {
                                debugPrint("Error decoding \(T.self)")
                                debugPrint(decodingError)
                                observer.onNext(.failure(decodingError))
                            }
                        }
                    }
                } else if let error = error {
                    self.handleNoConnectionError(error: error, to: observer)
                } else {
                    do {
                        let jsonDecoder = JSONDecoder()
                        let model: T = try jsonDecoder.decode(T.self, from: data ?? Data())
                        DispatchQueue.main.async {
                            observer.onNext(.success(model))
                        }
                    } catch let decodingError {
                        DispatchQueue.main.async {
                            debugPrint("Error decoding \(T.self)")
                            debugPrint(decodingError)
                            observer.onNext(.failure(decodingError))
                        }
                    }
                    DispatchQueue.main.async {
                        observer.onCompleted()
                    }
                }
            }
            task.resume()

            return Disposables.create {
                task.cancel()
            }
        }

        return observer
    }

    func urlRequest(for request: Request) -> URLRequest {
        var urlRequest = request.urlRequest()

        // Add Authorization Header if the Request needs authorization
        if let token = authManager?.userToken, request.endpoint.authNeeded {
            urlRequest.addValue("\(token)", forHTTPHeaderField: "Authorization")
        }

        request.endpoint.commonHeader.forEach { (header) in
            urlRequest.addValue(header.value, forHTTPHeaderField: header.key)
        }

        return urlRequest
    }
}
