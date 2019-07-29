//
//  NetworkServiceImpl.swift
//  c51-coding-challenge
//

import Foundation


class NetworkServiceImpl: NetworkService {
    let offersUrlString = "https://api.myjson.com/bins/rgv6d"
    private let httpPresentableError = "Invalid HTTP status code."
    
    func executeRequest(completion: @escaping (Data?, Error?) -> Void) {
        guard let apiURL = URL(string: offersUrlString) else {
            return
        }
        
        let request = URLRequest(url: apiURL)
        executeSessionTaskWith(request: request, completion: completion)
    }
    
    private func executeSessionTaskWith(request: URLRequest, completion: @escaping (Data?, Error?) -> Void) {
        let config = URLSessionConfiguration.default
        let session = URLSession(configuration: config)

        let task = session.dataTask(with: request) { [weak self] (data, response, error) in
            if error == nil {
                if self?.isResponseValid(response: response) ?? false {
                    completion(data, nil)
                } else {
                    let presentableError = self?.httpPresentableError ?? "Oops, something went wrong."
                    completion(nil, CustomError(description: presentableError))
                }

                return
            }

            completion(nil, error)
        }

        task.resume()
    }
    
    private func isResponseValid(response: URLResponse?) -> Bool {
        if let response = response as? HTTPURLResponse {
            let statusCode = response.statusCode
            
            if 200...299 ~= statusCode {
                return true
            }
        }

        return false
    }
}
