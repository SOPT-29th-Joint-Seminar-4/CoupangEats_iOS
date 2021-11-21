//
//  selectCVC.swift
//  CoupangEats_iOS
//
//  Created by 박익범 on 2021/11/21.
//


import UIKit

class selectCVC: UICollectionViewCell {
    
    @IBOutlet weak var backGroundView: UIView!
    @IBOutlet weak var selectLabel: UILabel!
    @IBOutlet weak var selectImageView: UIImageView!
    @IBOutlet weak var notImageLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setLayout()
        // Initialization code
    }
    
    func setData(title: String, isImage: Bool){
        selectLabel.text = title

        if isImage == false{
            selectImageView.isHidden = true
            selectLabel.text = ""
            notImageLabel.textAlignment = .center
            notImageLabel.text = title
        }
    }
    
    func setLayout(){
        backGroundView.layer.borderColor = CGColor.init(red: 224.0/250.0, green: 227.0/250.0, blue: 231.0/255.0, alpha: 1.0)
        backGroundView.clipsToBounds = true
        backGroundView.layer.borderWidth = 1
        backGroundView.layer.cornerRadius = 20
    }


}
