//
//  SubViewVC.swift
//  CoupangEats_iOS
//
//  Created by 박익범 on 2021/11/13.
//

import UIKit

class SubViewVC: UIViewController {
  
  @IBOutlet weak var TableView: UITableView!
  @IBOutlet weak var Separation: UIView!
  @IBOutlet weak var TotalLabel: UILabel!
    @IBOutlet weak var navBarImage: UIImageView!
    @IBOutlet weak var backButton: UIButton!
    
  var contentList: [ContentData] = [];
  override func viewDidLoad() {
    super.viewDidLoad()
    initContentList()
    registerXib()
    TableView.delegate = self
    TableView.dataSource = self
    initialSet()
    
  }
  
  func initialSet() {
    Separation.backgroundColor = UIColor.backgroundGray
    let total : Int = contentList.count
    TotalLabel.text = "총 \(total)개"
  }
  func registerXib() {
    let xibName = UINib(nibName: TableViewCell.identifier, bundle: nil)
    TableView.register(xibName, forCellReuseIdentifier: TableViewCell.identifier)
  }
    
    @IBAction func backButtonClicked(_ sender: Any) {
    self.navigationController?.popViewController(animated: true)
  }
  
  func initContentList() {
    contentList.append(contentsOf: [
      ContentData(thumbNailName: "ChickenImage", store: "둘둘치킨 서현점", menu: "후라이드치킨", count: "46명이 만족한 메뉴", price: "18000원", description: "새 식용유를 매일 사용하여 건강하고 깨끗한 맛, 얇은 튀김옷으로 칼로리를 낮춘 담백한 치킨."),
      ContentData(thumbNailName: "ChickenImage", store: "둘둘치킨 서현점", menu: "후라이드치킨", count: "46명이 만족한 메뉴", price: "18000원", description: "새 식용유를 매일 사용하여 건강하고 깨끗한 맛, 얇은 튀김옷으로 칼로리를 낮춘 담백한 치킨."),
      ContentData(thumbNailName: "ChickenImage", store: "둘둘치킨 서현점", menu: "후라이드치킨", count: "46명이 만족한 메뉴", price: "18000원", description: "새 식용유를 매일 사용하여 건강하고 깨끗한 맛, 얇은 튀김옷으로 칼로리를 낮춘 담백한 치킨."),
      ContentData(thumbNailName: "ChickenImage", store: "둘둘치킨 서현점", menu: "후라이드치킨", count: "46명이 만족한 메뉴", price: "18000원", description: "새 식용유를 매일 사용하여 건강하고 깨끗한 맛, 얇은 튀김옷으로 칼로리를 낮춘 담백한 치킨."),
    ])
  }
}

extension SubViewVC: UITableViewDelegate {
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 174
  }
}

extension SubViewVC: UITableViewDataSource {
  
  
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return contentList.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCell.identifier) as? TableViewCell else { return UITableViewCell() }
    if cell.ThumbnailImageView == nil {
      print("nil이다")
      cell.ThumbnailImageView.image = UIImage(named: "ChickenImage")
    } else {
      cell.ThumbnailImageView.image = UIImage(named: "ChickenImage")}
    cell.setData(appData : contentList[indexPath.row])
    return cell
  }
}
