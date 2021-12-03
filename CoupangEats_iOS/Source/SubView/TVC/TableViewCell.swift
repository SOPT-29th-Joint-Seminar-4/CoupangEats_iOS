//
//  TableViewCell.swift
//  CoupangEats_iOS
//
//  Created by 김선오 on 2021/11/20.
//

import UIKit

import SnapKit
import Then

class TableViewCell: UITableViewCell {
  
  static let identifier = "TableViewCell"
  
  let ThumbnailImageView = UIImageView()
  let HeartIcon = UIButton()
  let StoreLabel = UILabel()
  let MenuLabel = UILabel()
  let CountLabel = UILabel()
  let PriceLabel = UILabel()
  let DescriptionLabel = UILabel()
  let OrderNowButton = UIButton()
  let SeeStoreButton = UIButton()
  
  override func awakeFromNib() {
    super.awakeFromNib()
    contentView.backgroundColor = .white
    layout()
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
    
    func setLayout() {
        StoreLabel.font = UIFont.boldSystemFont(ofSize: 13)
        CountLabel.font = UIFont.boldSystemFont(ofSize: 13)
        CountLabel.textColor = UIColor.mainOrange
        PriceLabel.font = UIFont.boldSystemFont(ofSize: 13)
        DescriptionLabel.textColor = UIColor.subtitleGray
    }
}

extension TableViewCell {
  func layout() {
    layoutThumNailImageView()
    layoutHeartIcon()
    layoutStoreLabel()
    layoutMenuLabel()
    layoutCountLabel()
    layoutPriceLabel()
    layoutDescriptionLabel()
    layoutOrderNowButton()
    layoutSeeStoreButton()
  }
  func layoutThumNailImageView() {
    self.contentView.add(ThumbnailImageView) {
      $0.image = UIImage(named: "ChickenImage")
      $0.snp.makeConstraints {
        $0.top.equalTo(self.contentView.snp.top).offset(15)
        $0.leading.equalTo(self.contentView.snp.leading).offset(20)
        $0.height.equalTo(100)
        $0.width.equalTo(100)
      }
    }
  }
  func layoutHeartIcon() {
    self.ThumbnailImageView.add(HeartIcon) {
      $0.setImageByName("ic_heart_unselected")
      $0.snp.makeConstraints {
        $0.trailing.equalTo(self.ThumbnailImageView.snp.trailing).offset(-11)
        $0.bottom.equalTo(self.ThumbnailImageView.snp.bottom).offset(-10)
      }
    }
  }
  func layoutStoreLabel() {
    self.contentView.add(StoreLabel) {
      $0.setupLabel(text: "둘둘치킨 서현점", color: .black, font: .systemFont(ofSize: 13, weight: .regular))
      $0.snp.makeConstraints {
        $0.top.greaterThanOrEqualTo(self.ThumbnailImageView.snp.top)
        $0.leading.equalTo(self.ThumbnailImageView.snp.trailing).offset(12)
      }
    }
  }
  func layoutMenuLabel() {
    self.contentView.add(MenuLabel) {
      $0.setupLabel(text: "후라이드치킨", color: .black, font: .systemFont(ofSize: 12, weight: .regular))
      $0.snp.makeConstraints {
        $0.top.greaterThanOrEqualTo(self.StoreLabel.snp.bottom)
        $0.leading.equalTo(self.ThumbnailImageView.snp.trailing).offset(12)
      }
    }
  }
  func layoutCountLabel() {
    self.contentView.add(CountLabel) {
      $0.setupLabel(text: "46명이 만족한 메뉴", color: .black, font: .systemFont(ofSize: 13, weight: .regular))
      $0.snp.makeConstraints {
        $0.top.greaterThanOrEqualTo(self.MenuLabel.snp.bottom).offset(5)
        $0.leading.equalTo(self.ThumbnailImageView.snp.trailing).offset(12)
      }
    }
  }
  func layoutPriceLabel() {
    self.contentView.add(PriceLabel) {
      $0.setupLabel(text: "18000원", color: .black, font: .systemFont(ofSize: 13, weight: .regular))
      $0.snp.makeConstraints {
        $0.top.greaterThanOrEqualTo(self.CountLabel.snp.bottom)
        $0.leading.equalTo(self.ThumbnailImageView.snp.trailing).offset(12)
      }
    }
  }
  func layoutDescriptionLabel() {
    self.contentView.add(DescriptionLabel) {
      $0.setupLabel(text: "새 식용유를 매일 사용하여 건강하고 깨끗한 맛,\n얇은 튀김옷으로 칼로리를 낮춘 담백한 치킨.", color: .tagGray, font: .systemFont(ofSize: 13, weight: .regular))
      $0.numberOfLines = 2
      $0.textAlignment = .center
      $0.snp.makeConstraints {
        $0.top.greaterThanOrEqualTo(self.PriceLabel.snp.bottom).offset(5)
        $0.leading.equalTo(self.ThumbnailImageView.snp.trailing).offset(12)
          $0.width.equalTo(232)

      }
    }
  }
  func layoutSeeStoreButton() {
    self.contentView.add(SeeStoreButton) {
      $0.setupButton(title: "가게 둘러보기", color: .white, font: .systemFont(ofSize: 13, weight: .bold), backgroundColor: .mainOrange, state: .normal, radius: 10)
      $0.snp.makeConstraints {
        $0.top.greaterThanOrEqualTo(self.DescriptionLabel.snp.bottom).offset(10)
        $0.trailing.equalTo(self.contentView.snp.trailing).offset(-20)
        $0.width.equalTo(110)
        $0.height.equalTo(30)
      }
    }
  }
  func layoutOrderNowButton() {
    self.contentView.add(OrderNowButton) {
      $0.setupButton(title: "바로 주문", color: .white, font: .systemFont(ofSize: 13, weight: .bold), backgroundColor: .mainOrange, state: .normal, radius: 10)
      $0.snp.makeConstraints {
        $0.top.greaterThanOrEqualTo(self.DescriptionLabel.snp.bottom).offset(10)
        $0.leading.equalTo(self.contentView.snp.leading).offset(129)
        $0.width.equalTo(110)
        $0.height.equalTo(30)
      }
    }
  }
  
}

