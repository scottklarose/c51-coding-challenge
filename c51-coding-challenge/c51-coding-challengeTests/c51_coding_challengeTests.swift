//
//  c51_coding_challengeTests.swift
//  c51-coding-challengeTests
//

import XCTest
@testable import c51_coding_challenge


class c51_coding_challengeTests: XCTestCase {
    let mockNetworkService = MockNetworkService()

    override func setUp() {
        ServiceManager.shared.setup(networkService: mockNetworkService)
    }

    func test_offersSortedByName_withValidJSON_ShouldReturnOffersInAlphabeticalOrder() {
        guard let offerGateway = ServiceManager.shared.offerGateway else {
            return
        }
        
        let expectedResult = [OfferItem(offerImageUrl: URL(string: "http://www.google.com/")!, offerName: "Buy 2: Select TRISCUIT Crackers", cashBack: "$1.00"),
            OfferItem(offerImageUrl: URL(string: "http://www.google.com/")!, offerName: "Dawn", cashBack: "$0.50"),
            OfferItem(offerImageUrl: URL(string: "http://www.google.com/")!, offerName: "Dove Shower Foam or Dove Men+Care Foaming Body Wash", cashBack: "$2.50"),
            OfferItem(offerImageUrl: URL(string: "http://www.google.com/")!, offerName: "Tide Liquid Detergent", cashBack: "$1.05")]
        
        let actualResult = offerGateway.offersSortedByName()
        
        XCTAssert(actualResult == expectedResult, "The offers should be sorted alphabetically.")
    }
    
    func test_offersSortedByCashBack_withValidJSON_ShouldReturnOffersInDescendingOrder() {
        guard let offerGateway = ServiceManager.shared.offerGateway else {
            return
        }
        
        let expectedResult = [OfferItem(offerImageUrl: URL(string: "http://www.google.com/")!, offerName: "Dove Shower Foam or Dove Men+Care Foaming Body Wash", cashBack: "$2.50"),
            OfferItem(offerImageUrl: URL(string: "http://www.google.com/")!, offerName: "Tide Liquid Detergent", cashBack: "$1.05"),
            OfferItem(offerImageUrl: URL(string: "http://www.google.com/")!, offerName: "Buy 2: Select TRISCUIT Crackers", cashBack: "$1.00"),
            OfferItem(offerImageUrl: URL(string: "http://www.google.com/")!, offerName: "Dawn", cashBack: "$0.50")]
        
        let actualResult = offerGateway.offersSortedByCashBack()
        
        XCTAssert(actualResult == expectedResult, "The offers should be sorted by cash back in descending order.")
    }
}
