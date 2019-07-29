//
//  Checkout51TableViewCell.swift
//  c51-coding-challenge
//

import UIKit


class Checkout51TableViewCell: UITableViewCell {
    @IBOutlet weak var offerImage: UIImageView!
    @IBOutlet weak var offerName: UILabel!
    @IBOutlet weak var cashBack: UILabel!
    
    func populate(with item: OfferItem) {
        offerName.text = item.offerName
        cashBack.text = item.cashBack
    }
}
