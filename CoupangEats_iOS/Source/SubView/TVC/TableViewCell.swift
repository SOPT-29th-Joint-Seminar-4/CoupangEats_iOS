//
//  TableViewCell.swift
//  CoupangEats_iOS
//
//  Created by 김선오 on 2021/11/20.
//

import UIKit

class TableViewCell: UITableViewCell {

    static let identifier = "TableViewCell"

    @IBOutlet weak var ThumbnailImageView: UIImageView!
    
    @IBOutlet weak var StoreLabel: UILabel!
    @IBOutlet weak var MenuLabel: UILabel!
    
    @IBOutlet weak var CountLabel: UILabel!
    @IBOutlet weak var PriceLabel: UILabel!
    @IBOutlet weak var DescriptionLabel: UILabel!
    
    @IBOutlet weak var OrderNowButton: UIButton!
    @IBOutlet weak var SeeStoreButton: UIButton!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setLayout() {
        StoreLabel.font = UIFont.boldSystemFont(ofSize: 13)
        CountLabel.font = UIFont.boldSystemFont(ofSize: 13)
        CountLabel.textColor = UIColor.mainOrange
        PriceLabel.font = UIFont.boldSystemFont(ofSize: 13)
        DescriptionLabel.textColor = UIColor.subtitleGray
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setData(appData : ContentData) {
        ThumbnailImageView.image = appData.thumbnail()
        StoreLabel.text = appData.store
        MenuLabel.text = appData.menu
        CountLabel.text = appData.count
        PriceLabel.text = appData.price
        DescriptionLabel.text = appData.description
    }
}
