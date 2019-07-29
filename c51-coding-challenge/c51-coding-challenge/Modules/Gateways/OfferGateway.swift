//
//  OfferGateway.swift
//  c51-coding-challenge
//

protocol OfferGateway {
    func setup()
    func offersSortedByName() -> [OfferItem]
    func offersSortedByCashBack() -> [OfferItem]
}
