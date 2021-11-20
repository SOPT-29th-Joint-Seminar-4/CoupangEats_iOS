//
//  InEatsCVC.swift
//  CoupangEats_iOS
//
//  Created by 박익범 on 2021/11/20.
//

import UIKit
import SnapKit
import Then

class InEatsCVC: UICollectionViewCell {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var heartButton: UIButton!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var starLabel: UILabel!
    @IBOutlet weak var distanceLabel: UILabel!
    @IBOutlet weak var freeRideView: UIView!
    
    var isLike: Bool = false;
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setLayout()
    }
    
    func setLayout(){
        freeRideView.layer.cornerRadius = 15
        freeRideView.clipsToBounds = true
    }
    
    @IBAction func isClickedHeartButton(_ sender: Any) {
        if isLike == false{
            isLike = true;
            heartButton.setImage(UIImage(named: "ic_heart_selected"), for: .normal)
        }
        else if isLike == true{
            isLike = false;
            heartButton.setImage(UIImage(named: "ic_heart_unselected"), for: .normal)
        }
        
    }
    
}
