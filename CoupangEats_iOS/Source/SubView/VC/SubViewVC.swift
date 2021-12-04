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
    
    
    
    //server
    var menuData : Array<Dictionary<String,Any>>?
    var total : Int = 0
    
    func getMenu() {
       let task = URLSession.shared.dataTask(with: URL(string: "https://asia-northeast3-wesopt29-e30ad.cloudfunctions.net/api/menu/")!) { (data, response, error) in
           
           if let dataJson = data {
               
                //json parsing
                do {
                    let json = try JSONSerialization.jsonObject(with: dataJson, options: []) as! Dictionary<String, Any>
                    
                    //Dictionary
                    let data = json["data"] as! Array<Dictionary<String,Any>>
                    self.menuData = data
                    
                    DispatchQueue.main.async {
                        self.TableView.reloadData()
                    }
               }
                catch {}
            }
        }
        task.resume()
    }
    
    
    
    //viesDidLoad
  override func viewDidLoad() {
    super.viewDidLoad()
//    initContentList()
      getMenu()
    registerXib()
    TableView.delegate = self
    TableView.dataSource = self
    initialSet()
  }
  
  func initialSet() {
    Separation.backgroundColor = UIColor.backgroundGray
//    let total : Int = contentList.count
      let total : Int = total
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
      
      if let menu = menuData {
          return menu.count
      }
      else {
          return contentList.count
      }
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      
    guard let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCell.identifier) as? TableViewCell else { return UITableViewCell() }
      
      total += 1
      initialSet()
      
      let idx = indexPath.row
      if let menu = menuData {
          
          let row = menu[idx]
          if let r = row as? Dictionary <String, Any> {
              if let name  = r["name"] as? String {
                  cell.StoreLabel.text = name
              }
              if let menu  = r["menu"] as? String {
                  cell.MenuLabel.text = menu
              }
              if let likes  = r["likes"] as? Int {
                  cell.CountLabel.text = "\(likes)명이 만족한 메뉴"
              }
              if let price  = r["price"] as? Int {
                  cell.PriceLabel.text = "\(price)원"
              }
              if let description  = r["description"] as? String {
                  cell.DescriptionLabel.text = description
              }
              if let thumbnail = r["image"] as? String {
                  let url = URL(string: thumbnail)
//                  DispatchQueue.global().async {
//                      let data = try? Data(contentsOf: url!)
//                      DispatchQueue.main.async {
//                          cell.ThumbnailImageView.image = UIImage(data: data!)
//                      }
//                  }
                  cell.ThumbnailImageView.kf.indicatorType = .activity
                  cell.ThumbnailImageView.kf.setImage(with: url)
              }
          }
      }
      
      return cell
          
//    if cell.ThumbnailImageView == nil {
//      print("nil이다")
//      cell.ThumbnailImageView.image = UIImage(named: "ChickenImage")
//    } else {
//      cell.ThumbnailImageView.image = UIImage(named: "ChickenImage")}
//      cell.setData(appData : contentList[indexPath.row])
//      cell.setLayout()
//
//      return cell
//  }
  }
}

