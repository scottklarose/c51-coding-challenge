//
//  OfferGateway.swift
//  c51-coding-challenge
//

protocol OfferGateway {
    func setup(shouldSortByName: Bool, completion: @escaping ([OfferItem]) -> Void)
    func offersSortedByName() -> [OfferItem]
    func offersSortedByCashBack() -> [OfferItem]
}
