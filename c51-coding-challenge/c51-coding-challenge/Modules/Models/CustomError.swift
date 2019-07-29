//
//  CustomError.swift
//  c51-coding-challenge
//

import Foundation


struct CustomError: LocalizedError {
    var errorDescription: String? { return presentableDescription }
    private let presentableDescription: String
    
    init(description: String) {
        presentableDescription = description
    }
}
