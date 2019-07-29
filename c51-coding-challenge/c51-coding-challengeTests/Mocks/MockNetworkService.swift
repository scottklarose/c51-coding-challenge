//
//  MockNetworkService.swift
//  c51-coding-challengeTests
//

import Foundation
@testable import c51_coding_challenge


class MockNetworkService: NetworkService {
    private let offersResponseJSONString = """
                                    {"batch_id":0,"offers":[{"offer_id":"40408","name":"Buy 2: Select TRISCUIT Crackers","image_url":"https://d3bx4ud3idzsqf.cloudfront.net/public/production/6840/67561_1535141624.jpg","cash_back":1.0},{"offer_id":"39271","name":"Tide Liquid Detergent","image_url":"https://d3bx4ud3idzsqf.cloudfront.net/public/production/4902/56910_1527084051.jpg","cash_back":1.05},{"offer_id":"38744","name":"Dawn","image_url":"https://d3bx4ud3idzsqf.cloudfront.net/public/production/1795/10751_1439567381","cash_back":0.5},{"offer_id":"41050","name":"Dove Shower Foam or Dove Men+Care Foaming Body Wash","image_url":"https://d3bx4ud3idzsqf.cloudfront.net/public/production/7754/68780_1536591544.jpg","cash_back":2.5}]}
                                    """
    
    func executeRequest(completion: @escaping (Data?, Error?) -> Void) {
        if let offerJSONData = offersResponseJSONString.data(using: .utf8) {
            completion(offerJSONData, nil)
            return
        }
        
        completion(nil, CustomError(description: "Invalid JSON string in MockNetworkService."))
    }
}
