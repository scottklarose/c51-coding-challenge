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
    
    func fetchOffers(shouldSortByName: Bool, completion: @escaping ([OfferItem]) -> Void) {
        networkService.executeRequest { [weak self] responseData, error in
            if error == nil {
                guard let response = responseData,
                        let offersResponse = self?.decodeOfferResponse(offerData: response) else {
                    return
                }
                
                self?.currentOffers = offersResponse.offers
                let sortedOffers = shouldSortByName ? self?.offersSortedByName() : self?.offersSortedByCashBack()
                
                completion(sortedOffers ?? [])
                return
            }
            
            completion([])
        }
    }
    
    private func decodeOfferResponse(offerData: Data) -> OffersResponse? {
        do {
            let offersResponse = try JSONDecoder().decode(OffersResponse.self, from: offerData)
            return offersResponse
        } catch let error {
            print("Error parsing offers response: \(error.localizedDescription)")
            return nil
        }
    }
    
    func offersSortedByName() -> [OfferItem] {
        let sortedByNameOffers = sortOffersByName()
        return convertOffersToOfferItems(offers: sortedByNameOffers)
    }
    
    private func sortOffersByName() -> [Offer] {
        return currentOffers.sorted { $0.name < $1.name }
    }
    
    private func convertOffersToOfferItems(offers: [Offer]) -> [OfferItem] {
        return offers.compactMap {
            transformOffer(offer: $0)
        }
    }
    
    private func transformOffer(offer: Offer) -> OfferItem? {
        guard let offerImageUrl = URL(string: offer.imageUrl) else {
            return nil
        }
        
        let cashBackTitle = String(format:"$%.2f", offer.cashBack)
        
        return OfferItem(offerImageUrl: offerImageUrl, offerName: offer.name, cashBack: cashBackTitle)
    }
    
    func offersSortedByCashBack() -> [OfferItem] {
        let sortedByCashBackOffers = sortOffersByCashBack()
        return convertOffersToOfferItems(offers: sortedByCashBackOffers)
    }
    
    private func sortOffersByCashBack() -> [Offer] {
        return currentOffers.sorted { $0.cashBack > $1.cashBack }
    }
}
