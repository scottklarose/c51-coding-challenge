//
//  NetworkService.swift
//  c51-coding-challenge
//

import Foundation


protocol NetworkService {
    func executeRequest(completion: @escaping (Data?, Error?) -> Void)
}
