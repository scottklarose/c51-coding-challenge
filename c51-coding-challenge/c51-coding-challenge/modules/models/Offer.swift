//
//  Offer.swift
//  c51-coding-challenge
//

import Foundation


struct Offer: Codable {
    let offerId: String
    let name: String
    let imageUrl: String
    let cashBack: Int
    
    enum CodingKeys: String, CodingKey {
        case offerId = "offer_id"
        case name
        case imageUrl = "image_url"
        case cashBack = "cash_back"
    }
}
