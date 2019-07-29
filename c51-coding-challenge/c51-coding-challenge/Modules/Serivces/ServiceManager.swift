//
//  ServiceManager.swift
//  c51-coding-challenge
//

import Foundation


class ServiceManager {
    static let shared = ServiceManager()
    var offerGateway: OfferGateway?
    
    private init() { }
    
    func setup(networkService: NetworkService) {
        offerGateway = OfferGatewayImpl(networkService: networkService)
        offerGateway?.setup()
    }
}
