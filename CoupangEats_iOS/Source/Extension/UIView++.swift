//
//  UIView++.swift
//  CoupangEats_iOS
//
//  Created by 김지수 on 2021/11/17.
//

import UIKit

import SnapKit

extension UIView {
  
  @discardableResult
  func add<T: UIView>(_ subview: T,
                      then closure: ((T) -> Void)? = nil) -> T {
    addSubview(subview)
    closure?(subview)
    return subview
  }
  
  @discardableResult
  func adds<T: UIView>(_ subviews: [T],
                       then closure: (([T]) -> Void)? = nil) -> [T] {
    subviews.forEach { addSubview($0) }
    closure?(subviews)
    return subviews
  }
  func setRounded(radius: CGFloat?){
    // UIView 의 모서리가 둥근 정도를 설정
    if let cornerRadius_ = radius {
      self.layer.cornerRadius = cornerRadius_
    }  else {
      // cornerRadius 가 nil 일 경우의 default
      self.layer.cornerRadius = self.layer.frame.height / 2
    }
    
    self.layer.masksToBounds = true
  }
  
  
  func setBorder(borderColor : UIColor?,
                 borderWidth : CGFloat?) {
    
    /// UIView 의 테두리 색상 설정
    if let borderColor_ = borderColor {
      self.layer.borderColor = borderColor_.cgColor
    } else {
      /// borderColor 변수가 nil 일 경우의 default
      self.layer.borderColor = UIColor(red: 205/255,
                                       green: 209/255,
                                       blue: 208/255,
                                       alpha: 1.0).cgColor
    }
    
    /// UIView 의 테두리 두께 설정
    if let borderWidth_ = borderWidth {
      self.layer.borderWidth = borderWidth_
    } else {
      /// borderWidth 변수가 nil 일 경우의 default
      self.layer.borderWidth = 1.0
    }
    
  }
  
  func addBorder(_ edge: UIRectEdge,
                 color: UIColor,
                 thickness: CGFloat) {
    let subview = UIView()
    subview.translatesAutoresizingMaskIntoConstraints = false
    subview.backgroundColor = color
    self.addSubview(subview)
    switch edge {
    case .top,
         .bottom:
      subview.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 0).isActive = true
      subview.rightAnchor.constraint(equalTo: self.rightAnchor, constant: 0).isActive = true
      subview.heightAnchor.constraint(equalToConstant: thickness).isActive = true
      if edge == .top {
        subview.topAnchor.constraint(equalTo: self.topAnchor, constant: 0).isActive = true
      } else {
        subview.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0).isActive = true
      }
    case .left, .right:
      subview.topAnchor.constraint(equalTo: self.topAnchor, constant: 0).isActive = true
      subview.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0).isActive = true
      subview.widthAnchor.constraint(equalToConstant: thickness).isActive = true
      if edge == .left {
        subview.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 0).isActive = true
      } else {
        subview.rightAnchor.constraint(equalTo: self.rightAnchor, constant: 0).isActive = true
      }
    default:
      break
    }
  }
  
  @IBInspectable
  var borderWidth: CGFloat {
    set {
      layer.borderWidth = newValue
    }
    get {
      return layer.borderWidth
    }
  }
  
  @IBInspectable
  var cornerRadius: CGFloat {
    set {
      layer.cornerRadius = newValue
    }
    get {
      return layer.cornerRadius
    }
  }
  
  @IBInspectable
  var borderColor: UIColor? {
    set {
      guard let uiColor = newValue else { return }
      layer.borderColor = uiColor.cgColor
    }
    get {
      guard let color = layer.borderColor else { return nil }
      return UIColor(cgColor: color)
    }
  }
  // render the view within the view's bounds, then capture it as image
  func asImage() -> UIImage {
    let renderer = UIGraphicsImageRenderer(bounds: bounds)
    return renderer.image(actions: { rendererContext in
      layer.render(in: rendererContext.cgContext)
    })
  }
  func setGradient() {
    let gradient: CAGradientLayer = CAGradientLayer()
    gradient.colors = [UIColor.black.withAlphaComponent(0.5).cgColor, UIColor.clear.cgColor]
    gradient.locations = [0.0 , 1.0]
    gradient.startPoint = CGPoint(x: 0.5, y: 0)
    gradient.endPoint = CGPoint(x: 0.5, y: 0.5)
    gradient.frame = bounds
    layer.insertSublayer(gradient, at: 0)
  }
  
  /// 부모뷰 찾기
  var parentViewController: UIViewController? {
      var parentResponder: UIResponder? = self
      while parentResponder != nil {
          parentResponder = parentResponder!.next
          if let viewController = parentResponder as? UIViewController {
              return viewController
          }
      }
      return nil
  }
}
