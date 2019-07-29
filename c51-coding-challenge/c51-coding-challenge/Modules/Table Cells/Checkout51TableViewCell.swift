//
//  Checkout51TableViewCell.swift
//  c51-coding-challenge
//

import UIKit
import SDWebImage


class Checkout51TableViewCell: UITableViewCell {
    @IBOutlet weak var offerImage: UIImageView!
    @IBOutlet weak var offerName: UILabel!
    @IBOutlet weak var cashBack: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        styleOfferImage()
    }
    
    private func styleOfferImage() {
        offerImage.layer.borderWidth = 2
        offerImage.layer.masksToBounds = false
        offerImage.layer.borderColor = UIColor.darkGray.cgColor
        offerImage.layer.cornerRadius = offerImage.frame.height/2
        offerImage.clipsToBounds = true
    }
    
    func populate(with item: OfferItem) {
        offerImage.sd_setImage(with: item.offerImageUrl, completed: nil)
        offerName.text = item.offerName
        cashBack.text = item.cashBack
    }
}
