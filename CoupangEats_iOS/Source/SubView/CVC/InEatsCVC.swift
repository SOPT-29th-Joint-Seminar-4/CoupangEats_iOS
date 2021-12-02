//
//  InEatsCVC.swift
//  CoupangEats_iOS
//
//  Created by 박익범 on 2021/11/20.
//

import UIKit
import SnapKit
import Then
import Kingfisher

protocol likeClcikedDelegate {
    func isLikeClicked()
}


class InEatsCVC: UICollectionViewCell {
  static let identifier = "InEatsCVC"

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var heartButton: UIButton!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var starLabel: UILabel!
    @IBOutlet weak var distanceLabel: UILabel!
    @IBOutlet weak var freeRideView: UIView!
    
    var isLike: Bool = false
    var isFreeRide: Bool = true
    var postId: Int = 0
    
        
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
    
    func getData(image: String, title: String, time: String, star: String, distance: String, freeRide:Bool, id: Int){
        guard let url = URL(string: image) else { return }
        imageView.kf.indicatorType = .activity
        imageView.kf.setImage(with: url)
        titleLabel.text = title
        timeLabel.text = time
        starLabel.text = star
        distanceLabel.text = distance
        isFreeRide = freeRide
        postId = id
        putLikeData()
    }
    
    func putLikeData(){
        Constants.likeURL = Constants.shopURL
        Constants.likeURL = Constants.likeURL + "/" + String(self.postId)
        PutLikeService.liekData.getShopInfo{ (response) in
            switch response
            {
            case .success(let data) :
                if let response = data as? LikeDataModel {
                    DispatchQueue.global().sync {
                        if(response.data.isLike == true){
                            print("트루")
                            self.heartButton.setImage(UIImage(named: "ic_heart_selected"), for: .normal)
                            self.reloadInputViews()
                        }
                        else{
                            print("폴스")
                            self.heartButton.setImage(UIImage(named: "ic_heart_unselected"), for: .normal)
                            self.reloadInputViews()
                        }
                    }
                    
                }
            case .requestErr(let message):
                print("requestERR")
            case .pathErr:
                print("pathERR")
            case .serverErr:
                print("serverERR")
            case .networkFail:
                print("networkFail")
            }
            
        }
    }
    
    
    
    func isFreeRideViewHidden(){
        if isFreeRide == false{
            freeRideView.isHidden = true
        }
    }
    
    @IBAction func isClickedHeartButton(_ sender: Any) {
        putLikeData()
        
//        if isLike == false{
//            heartButton.setImage(UIImage(named: "ic_heart_selected"), for: .normal)
//        }
//        else if isLike == true{
//            heartButton.setImage(UIImage(named: "ic_heart_unselected"), for: .normal)
//        }
        
    }
    
}
