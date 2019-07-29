//
//  OfferItem.swift
//  c51-coding-challenge
//

import Foundation


struct OfferItem: Equatable {
    let offerImageUrl: URL
    let offerName: String
    let cashBack: String
    
    static func == (lhs: OfferItem, rhs: OfferItem) -> Bool {
        return lhs.offerName == rhs.offerName && lhs.cashBack == rhs.cashBack
    }
}
