//
//  Offer.swift
//  c51-coding-challenge
//

import Foundation


struct Offer: Codable {
    let offerId: String
    let name: String
    let imageUrl: String
    let cashBack: Double
    
    enum CodingKeys: String, CodingKey {
        case offerId = "offer_id"
        case name
        case imageUrl = "image_url"
        case cashBack = "cash_back"
    }
}

struct OffersResponse: Codable {
    let offers: [Offer]
}
