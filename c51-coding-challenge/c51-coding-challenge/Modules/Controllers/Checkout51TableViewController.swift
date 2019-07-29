//
//  Checkout51TableViewController.swift
//  c51-coding-challenge
//

import UIKit


class Checkout51TableViewController: UITableViewController {
    let testItem1 = OfferItem(offerImageUrl: URL(string: "https://www.w3schools.com/w3images/avatar2.png")!, offerName: "Test 1 Offer", cashBack: "$1.20")
    let testItem2 = OfferItem(offerImageUrl: URL(string: "https://www.w3schools.com/w3images/avatar2.png")!, offerName: "Test 2 Offer", cashBack: "$3.20")
    let testItem3 = OfferItem(offerImageUrl: URL(string: "https://www.w3schools.com/w3images/avatar2.png")!, offerName: "Test 3 Offer", cashBack: "$0.20")
    
    private var testArray = [OfferItem]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        testArray = [testItem1, testItem2, testItem1, testItem3, testItem3, testItem1]
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return testArray.count
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "Checkout51TableViewCell", for: indexPath) as? Checkout51TableViewCell else {
            return UITableViewCell()
        }
        
        let item = testArray[indexPath.row]
        cell.populate(with: item)
        
        return cell
    }
}
