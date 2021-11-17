//
//  TabBarViewController.swift
//  CoupangEats_iOS
//
//  Created by 김지수 on 2021/11/17.
//

import UIKit

// MARK : TabBarViewController
class TabBarViewController: UITabBarController {
  
  override func viewDidLoad() {
    super.viewDidLoad()
    self.view.backgroundColor = .white
    setTabBar()
    tabBarUI()
  }
}

extension TabBarViewController {
  func tabBarUI() {
    UITabBar.appearance().tintColor = UIColor.black
    UITabBar.appearance().backgroundColor = UIColor.white
  }
  
  func setTabBar() {
    let firstVC = HomeViewVC()
    firstVC.tabBarItem = UITabBarItem(title: "홈", image: UIImage(named: ""), selectedImage: UIImage(named: ""))
    
    let secondVC = SecondTabViewController()
    secondVC.tabBarItem = UITabBarItem(title: "검색", image: UIImage(named: ""), selectedImage: UIImage(named: ""))
    
    let thirdVC = ThirdTabViewController()
    thirdVC.tabBarItem = UITabBarItem(title: "즐겨찾기", image: UIImage(named: ""), selectedImage: UIImage(named: ""))
    
    let fourthVC = FourthTabViewController()
    fourthVC.tabBarItem = UITabBarItem(title: "주문내역", image: UIImage(named: ""), selectedImage: UIImage(named: ""))
    
    let fifthVC = FifthTabViewController()
    fifthVC.tabBarItem = UITabBarItem(title: "MY 이츠", image: UIImage(named: ""), selectedImage: UIImage(named: ""))
    
    let TabVC = [firstVC, secondVC, thirdVC, fourthVC, fifthVC]
    self.setViewControllers(TabVC, animated: false)
    self.selectedViewController = firstVC
  }
}
