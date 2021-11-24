//
//  UIButton++.swift
//  CoupangEats_iOS
//
//  Created by 김지수 on 2021/11/17.
//

import Foundation
import UIKit

import SnapKit
import Then

extension UIButton {
  public typealias UIButtonTargetClosure = (UIButton) -> ()
  private class UIButtonClosureWrapper: NSObject {
    let closure: UIButtonTargetClosure
    init(_ closure: @escaping UIButtonTargetClosure) {
      self.closure = closure
    }
  }
  
  /** 매번 setimage할때 귀찮아서 만듦 (normal 상태)
   - Parameter name: UIImage 이름을 적어주세요
   - Returns: 없음
   */
  func setImageByName(_ name: String){
    self.setImage(UIImage(named: name), for: .normal)
  }
  
  /** 매번 setimage할때 귀찮아서 만듦 (selected상태)
   - Parameter name: UIImage 이름을 적어주세요
   - parameter selected: selected일 때 이름을 적어주세요
   - Returns: 없음
   */
  func setImageByName(_ name: String, _ selected: String){
    self.setImage(UIImage(named: name), for: .normal)
    self.setImage(UIImage(named: name), for: .selected)
  }
  
  func setupButton(title: String,
                   color: UIColor,
                   font: UIFont,
                   backgroundColor: UIColor,
                   state: UIControl.State,
                   radius: CGFloat) {
    self.setTitle(title, for: state)
    self.setTitleColor(color, for: state)
    self.titleLabel?.font = font
    self.backgroundColor = backgroundColor
    self.setRounded(radius: radius)
  }
}
