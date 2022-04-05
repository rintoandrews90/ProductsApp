//
//  CategoryCollectionViewCell.swift
//  Products
//
//  Created by Rinto Andrews on 05/04/22.
//

import UIKit

class CategoryCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var categoryTitle: UILabel!
    @IBOutlet weak var backgroundImage: UIImageView!
    @IBOutlet weak var categoryImage: UIImageView!
    
    func configure(catagory: Value) {
        self.categoryTitle.text = catagory.name
    }
}
