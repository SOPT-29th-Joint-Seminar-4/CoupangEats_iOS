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
  static let identifier = "InEatsCVC"

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var heartButton: UIButton!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var starLabel: UILabel!
    @IBOutlet weak var distanceLabel: UILabel!
    @IBOutlet weak var freeRideView: UIView!
    
    var isLike: Bool = false;
    var isFreeRide: Bool = true;
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setLayout()
        isFreeRideViewHidden()
    }
    
    func setLayout(){
        freeRideView.layer.cornerRadius = 5
        freeRideView.clipsToBounds = true
    }
    
    func getData(image: String, heart: Bool, title: String, time: String, star: String, distance: String, freeRide:Bool ){
        if let imageURL = URL(string: image) {
                    //킹피셔 써야겟다
                }
        isLike = heart
        titleLabel.text = title
        timeLabel.text = time
        starLabel.text = star
        distanceLabel.text = distance
        isFreeRide = freeRide
        
    }
    
    func isFreeRideViewHidden(){
        if isFreeRide == false{
            freeRideView.isHidden = true
        }
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
