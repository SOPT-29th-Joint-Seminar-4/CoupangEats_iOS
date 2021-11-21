//
//  CategoryCVC.swift
//  CoupangEats_iOS
//
//  Created by 박익범 on 2021/11/21.
//

import UIKit

class CategoryCVC: UICollectionViewCell {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var categoryLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    
    func setData(image: String, category: String){
        imageView.image = UIImage(named: image)
        categoryLabel.text = category
    }

}
