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

    }
    
    func test_offersSortedByCashBack_withValidJSON_ShouldReturnOffersInDescendingOrder() {
        
    }
}
