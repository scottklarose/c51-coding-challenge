//
//  OfferGateway.swift
//  c51-coding-challenge
//

protocol OfferGateway {
    func fetchOffers(shouldSortByName: Bool, completion: @escaping ([OfferItem]) -> Void)
    func offersSortedByName() -> [OfferItem]
    func offersSortedByCashBack() -> [OfferItem]
}
