//
//  OfferGatewayImpl.swift
//  c51-coding-challenge
//

import Foundation


class OfferGatewayImpl: OfferGateway {
    private let networkService: NetworkService
    private var currentOffers = [Offer]()
    
    init(networkService: NetworkService) {
        self.networkService = networkService
    }
    
    func setup() {
        networkService.executeRequest { [weak self] responseData, error in
            if error == nil {
                guard let response = responseData,
                        let offersResponse = self?.decodeOfferResponse(offerData: response) else {
                    return
                }
                
                self?.currentOffers = offersResponse.offers
            }
        }
    }
    
    private func decodeOfferResponse(offerData: Data) -> OffersResponse? {
        do {
            let offersResponse = try JSONDecoder().decode(OffersResponse.self, from: offerData)
            return offersResponse
        } catch {
            return nil
        }
    }
    
    func offersSortedByName() -> [OfferItem] {
        return [OfferItem]()
    }
    
    func offersSortedByCashBack() -> [OfferItem] {
        return [OfferItem]()
    }
}
