//
//  ProductsCollectionViewCell.swift
//  Products
//
//  Created by Rinto Andrews on 05/04/22.
//

import UIKit

class ProductsCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var offlbl: UILabel!
    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var shippingImg: UIImageView!
    @IBOutlet weak var pricelbl: UILabel!
    @IBOutlet weak var descriptionLbl: UILabel!
    @IBOutlet weak var ofPricelbl: UILabel!
    @IBOutlet weak var expimg: UIImageView!
    
    func configure(data: Value) {
        pricelbl.text = data.actualPrice
        ofPricelbl.text = data.offerPrice
        descriptionLbl.text = data.name
        
        if let off = data.offer, off > 0 {
            offlbl.isHidden = false
            offlbl.text = "\(off) % off"
        } else {
            offlbl.isHidden = true
        }
        
        if data.actualPrice == data.offerPrice {
            ofPricelbl.isHidden = true
        } else {
            ofPricelbl.isHidden = false
        }
        
        if let exp =  data.isExpress, exp {
            expimg.isHidden = false
        } else {
            expimg.isHidden = true
        }
    }
    
}
