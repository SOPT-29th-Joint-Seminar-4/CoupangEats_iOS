//
//  HomeViewVC.swift
//  CoupangEats_iOS
//
//  Created by 박익범 on 2021/11/13.
//

import UIKit

import SnapKit
import Then


//MARK: - HomeViewVC
class HomeViewVC: UIViewController {
    
    var categoryList: [CategoryModel] = []
    var eatsList: [inEatsModel] = []
    var selectList: [selectDataModel] = []


//MARK: -DataModel
    func initList() {
        categoryList.append(contentsOf: [
            CategoryModel(imageName: "new", category: "신규 맛집"),
            CategoryModel(imageName: "single", category: "1인분"),
            CategoryModel(imageName: "korean", category: "한식"),
            CategoryModel(imageName: "chicken", category: "치킨"),
            CategoryModel(imageName: "snack", category: "분식"),
            CategoryModel(imageName: "cutlet", category: "돈까스"),
            CategoryModel(imageName: "meat", category: "족발/보쌈"),
            CategoryModel(imageName: "sandwich", category: "샌드위치"),
            CategoryModel(imageName: "coffee", category: "커피"),
            CategoryModel(imageName: "dessert", category: "디저트")
        ])
        
        eatsList.append(contentsOf: [
            inEatsModel(imageName: "img_store1", title: "피자헛", time: "20~25분", star: "4.8(4,805)", lenght: "2.2km", isFree: true),
            inEatsModel(imageName: "img_store2", title: "세인트 버거", time: "15~20분", star: "4.6(1,005)", lenght: "1.5km", isFree: true),
            inEatsModel(imageName: "img_store3", title: "페이브", time: "19~29분", star: "4.9(2,832)", lenght: "1.3km", isFree: true),
            inEatsModel(imageName: "img_store4", title: "리미니", time: "23~33분", star: "4.8(2,126)", lenght: "1.8km", isFree: true),
            inEatsModel(imageName: "img_store1", title: "샐러디", time: "15~25분", star: "4.7(562)", lenght: "1.4km", isFree: true)
        ])
        
        selectList.append(contentsOf: [
            selectDataModel(title: "추천순", isImage: true),
            selectDataModel(title: "치타배달", isImage: false),
            selectDataModel(title: "배달비", isImage: true),
            selectDataModel(title: "최소주문", isImage: true),
            selectDataModel(title: "포장", isImage: false),
            selectDataModel(title: "할인쿠폰", isImage: false)
        ])
        
        
    }
  //MARK: - Components
  let mainScrollView = UIScrollView()
  let mainScrollContainerView = UIView()
  let topNavigationBar = UIView()
  let toppinIcon = UIButton()
  let topaddressLabel = UILabel()
  let topextraIcon = UIButton()
  let topsearchIcon = UIButton()
  let advertiseImage = UIImageView()
  let menutypeCollectionView : UICollectionView = {
    let layout = UICollectionViewFlowLayout()
    layout.scrollDirection = .horizontal
    let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
    collectionView.isScrollEnabled = true
    collectionView.isPagingEnabled = true
    return collectionView
  }()
  let moremenuImage = UIImageView()
  let moremenuView = UIView()
  let moremenuLabel = UILabel()
  let moremenuButton = UIButton()
  let gray1backView = UIView()
  let onlyEatsContainerView = UIView()
  let onlyEatsLabel = UILabel()
  let onlyEatsgopageButton = UIButton()
  let onlyEatsCollectionView : UICollectionView = {
    let layout = UICollectionViewFlowLayout()
    layout.scrollDirection = .horizontal
    let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
    collectionView.isScrollEnabled = true
      collectionView.isPagingEnabled = false
    return collectionView
  }()
  let gray2backView = UIView()
  let choiceEatsContainverView = UIView()
  let choiceEatsLabel = UILabel()
  let choicefilterCollectionView : UICollectionView = {
    let layout = UICollectionViewFlowLayout()
    layout.scrollDirection = .horizontal
    let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
    collectionView.isScrollEnabled = true
    collectionView.isPagingEnabled = false
    return collectionView
  }()
  let choiceEatsImageView1 = UIImageView()
  let choiceEatsImageView2 = UIImageView()
  
  
  //MARK: - LifeCycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    initList()
    view.backgroundColor = .white
    navigationController?.navigationBar.isHidden = true
    self.choicefilterCollectionView.delegate = self
    self.choicefilterCollectionView.dataSource = self
    self.onlyEatsCollectionView.delegate = self
    self.onlyEatsCollectionView.dataSource = self
    self.menutypeCollectionView.delegate = self
    self.menutypeCollectionView.dataSource = self
    registerXib()
    layout()
    let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.moremenuButtonClicked))
    tapGestureRecognizer.isEnabled = true
    tapGestureRecognizer.numberOfTapsRequired = 1
    ///이미지뷰는 터치가 원래 안되니까 터치 가능하도록
    self.moremenuImage.isUserInteractionEnabled = true
    self.moremenuView.addGestureRecognizer(tapGestureRecognizer)

  }
}

//MARK: - Extension
extension HomeViewVC {
  func registerXib() {
    choicefilterCollectionView.registerCustomXib(xibName: "selectCVC")
    onlyEatsCollectionView.registerCustomXib(xibName: "InEatsCVC")
    menutypeCollectionView.registerCustomXib(xibName: "CategoryCVC")
  }
  
  //MARK: - Layout Helper
  func layout() {
    layoutTopNavigationBar()
    layoutTopInIcon()
    layoutTopAddressLabel()
    layoutTopExtraIcon()
    layoutTopSearchIcon()
    layoutMainScrollView()
    layoutMainScrollContainerView()
    layoutAdvertiseImage()
    layoutMenuTypeCollectionView()
    layoutMoreMenuImage()
    layoutMoreMenuView()
    layoutMoreMenuLabel()
    layoutMoreMenuButton()
    layoutGray1backView()
    layoutOnlyEatsContainerView()
    layoutOnlyEatsLabel()
    layoutOnlyEatsGopageButton()
    layoutOnlyEatsCollectionView()
    layoutGray2BackView()
    layoutChoiceeatsContainerView()
    layoutChoiceEatsLabel()
    layoutChoiceFilterCollectionView()
    layoutChoiceEatsImageView1()
    layoutChoiceEatsImageView2()
  }
  func layoutTopNavigationBar() {
    self.view.add(topNavigationBar) {
      $0.backgroundColor = .white
      $0.snp.makeConstraints {
        $0.top.equalTo(self.view.safeAreaLayoutGuide.snp.top)
        $0.leading.equalToSuperview()
        $0.trailing.equalToSuperview()
        $0.height.equalTo(55)
      }
    }
  }
  func layoutTopInIcon() {
    self.topNavigationBar.add(toppinIcon) {
      $0.setImageByName("ic_GPS")
      $0.snp.makeConstraints {
        $0.centerY.equalTo(self.topNavigationBar)
        $0.leading.equalTo(self.topNavigationBar.snp.leading).offset(101)
        $0.height.equalTo(17)
        $0.width.equalTo(16)
      }
    }
  }
  func layoutTopAddressLabel() {
    self.topNavigationBar.add(topaddressLabel) {
      $0.setupLabel(text: "서울시 서초구 신반포로", color: .black, font: .systemFont(ofSize: 14, weight: .regular))
      $0.snp.makeConstraints {
        $0.centerY.equalTo(self.topNavigationBar)
        $0.leading.equalTo(self.toppinIcon.snp.trailing).offset(9)
      }
    }
  }
  func layoutTopExtraIcon() {
    self.topNavigationBar.add(topextraIcon) {
      $0.setImageByName("BlueUnderbar")
      $0.snp.makeConstraints {
        $0.centerY.equalTo(self.topNavigationBar)
        $0.leading.equalTo(self.topaddressLabel.snp.trailing).offset(9)
        $0.width.equalTo(14)
        $0.height.equalTo(17)
      }
    }
  }
  func layoutTopSearchIcon() {
    self.topNavigationBar.add(topsearchIcon) {
      $0.setImageByName("ic_search")
      $0.snp.makeConstraints {
        $0.centerY.equalTo(self.topNavigationBar)
        $0.trailing.equalTo(self.topNavigationBar.snp.trailing).offset(-18)
        $0.width.equalTo(30)
        $0.height.equalTo(30)
      }
    }
  }
  func layoutMainScrollView() {
    self.view.add(mainScrollView) {
      $0.backgroundColor = .white
      $0.translatesAutoresizingMaskIntoConstraints = false
      $0.showsVerticalScrollIndicator = false
      $0.isScrollEnabled = true
      $0.snp.makeConstraints {
        $0.centerX.leading.trailing.bottom.equalToSuperview()
        $0.top.equalTo(self.topNavigationBar.snp.bottom)
      }
    }
  }
  func layoutMainScrollContainerView() {
    self.mainScrollView.add(mainScrollContainerView) {
      $0.translatesAutoresizingMaskIntoConstraints = false
      $0.backgroundColor = .clear
      $0.contentMode = .scaleToFill
      $0.snp.makeConstraints {
        $0.centerX.top.leading.equalToSuperview()
        $0.bottom.equalTo(self.mainScrollView.snp.bottom)
      }
    }
  }
  func layoutAdvertiseImage() {
    self.mainScrollContainerView.add(advertiseImage) {
      $0.image = UIImage(named: "img_ad")
      $0.snp.makeConstraints {
        $0.top.equalTo(self.mainScrollContainerView.snp.top)
        $0.leading.equalTo(self.mainScrollContainerView.snp.leading)
        $0.trailing.equalTo(self.mainScrollContainerView.snp.trailing)
        $0.height.equalTo(151)
      }
    }
  }
  func layoutMenuTypeCollectionView() {
    self.mainScrollContainerView.add(menutypeCollectionView) {
      $0.backgroundColor = .white
      $0.showsHorizontalScrollIndicator = false
        $0.isPagingEnabled = false
      $0.snp.makeConstraints {
        $0.top.equalTo(self.advertiseImage.snp.bottom)
          $0.leading.equalTo(self.mainScrollContainerView.snp.leading).offset(16)
        $0.trailing.equalTo(self.mainScrollContainerView.snp.trailing)
        $0.height.equalTo(120)
      }
    }
  }
  func layoutMoreMenuImage() {
    self.mainScrollContainerView.add(moremenuImage) {
      $0.image = UIImage(named: "coupangeats_ad2 1")
      $0.snp.makeConstraints {
        $0.top.equalTo(self.menutypeCollectionView.snp.bottom)
        $0.leading.equalTo(self.mainScrollContainerView.snp.leading)
        $0.trailing.equalTo(self.mainScrollContainerView.snp.trailing)
        $0.height.equalTo(104)
      }
    }
  }
  func layoutMoreMenuView() {
    self.moremenuImage.add(moremenuView) {
      $0.isUserInteractionEnabled = true
      $0.backgroundColor = .mainOrange
      $0.setRounded(radius: 8)
      $0.snp.makeConstraints {
        $0.top.equalTo(self.moremenuImage.snp.top).offset(67)
        $0.leading.equalTo(self.moremenuImage.snp.leading).offset(16)
        $0.width.equalTo(96)
        $0.height.equalTo(22)
      }
    }
  }
  func layoutMoreMenuLabel() {
    self.moremenuView.add(moremenuLabel) {
      $0.setupLabel(text: "추천메뉴 보기", color: .white, font: .systemFont(ofSize: 12, weight: .bold))
      $0.snp.makeConstraints {
        $0.centerY.equalTo(self.moremenuView.snp.centerY)
        $0.leading.equalTo(self.moremenuView.snp.leading).offset(7)
      }
    }
  }
  func layoutMoreMenuButton() {
    self.moremenuView.add(moremenuButton) {
      $0.setImageByName("whiteGoButton")
      $0.snp.makeConstraints {
        $0.centerY.equalTo(self.moremenuView.snp.centerY)
        $0.leading.equalTo(self.moremenuLabel.snp.trailing).offset(6)
        $0.height.equalTo(22)
        $0.width.equalTo(10)
      }
    }
  }
  func layoutGray1backView() {
    self.mainScrollContainerView.add(gray1backView) {
      $0.backgroundColor = .backgroundGray
      $0.snp.makeConstraints {
        $0.top.equalTo(self.moremenuImage.snp.bottom)
        $0.leading.trailing.equalToSuperview()
        $0.height.equalTo(10)
      }
    }
  }
  func layoutOnlyEatsContainerView() {
    self.mainScrollContainerView.add(onlyEatsContainerView) {
      $0.snp.makeConstraints {
        $0.top.equalTo(self.gray1backView.snp.bottom)
        $0.leading.trailing.equalToSuperview()
        $0.height.equalTo(50)
      }
    }
  }
  func layoutOnlyEatsLabel() {
    self.onlyEatsContainerView.add(onlyEatsLabel) {
        $0.setupLabel(text: "이츠에만 있는 맛집", color: .black, font: .systemFont(ofSize: 17, weight: .bold))
      $0.snp.makeConstraints {
        $0.top.equalTo(self.onlyEatsContainerView.snp.top).offset(10)
        $0.leading.equalToSuperview().offset(16)
      }
    }
  }
  func layoutOnlyEatsGopageButton() {
    self.onlyEatsContainerView.add(onlyEatsgopageButton) {
      $0.setImageByName("ic_more")
      $0.snp.makeConstraints {
        $0.top.equalTo(self.onlyEatsContainerView.snp.top).offset(3)
        $0.trailing.equalTo(self.onlyEatsContainerView.snp.trailing).offset(-7)
        $0.height.equalTo(40)
        $0.width.equalTo(40)
      }
    }
  }
  func layoutOnlyEatsCollectionView() {
    self.mainScrollContainerView.add(onlyEatsCollectionView) {
      $0.backgroundColor = .white
      $0.showsHorizontalScrollIndicator = false
      $0.snp.makeConstraints {
        $0.top.equalTo(self.onlyEatsContainerView.snp.bottom)
        $0.leading.equalTo(self.mainScrollContainerView.snp.leading).offset(16.5)
        $0.trailing.equalTo(self.mainScrollContainerView.snp.trailing)
        $0.height.equalTo(200)
      }
    }
  }
  func layoutGray2BackView() {
    self.mainScrollContainerView.add(gray2backView) {
      $0.backgroundColor = .backgroundGray
      $0.snp.makeConstraints {
        $0.top.equalTo(self.onlyEatsCollectionView.snp.bottom)
        $0.leading.equalTo(self.mainScrollContainerView.snp.leading)
        $0.trailing.equalTo(self.mainScrollContainerView.snp.trailing)
        $0.height.equalTo(10)
      }
    }
  }
  func layoutChoiceeatsContainerView() {
    self.mainScrollContainerView.add(choiceEatsContainverView) {
      $0.snp.makeConstraints {
        $0.top.equalTo(self.gray2backView.snp.bottom)
        $0.leading.equalTo(self.mainScrollContainerView.snp.leading)
        $0.trailing.equalTo(self.mainScrollContainerView.snp.trailing)
        $0.height.equalTo(39)
      }
    }
  }
  func layoutChoiceEatsLabel() {
    self.choiceEatsContainverView.add(choiceEatsLabel) {
        $0.setupLabel(text: "골라먹는 맛집", color: .black, font: .systemFont(ofSize: 17, weight: .bold))
      $0.snp.makeConstraints {
        $0.top.equalTo(self.choiceEatsContainverView.snp.top).offset(15)
        $0.leading.equalTo(self.choiceEatsContainverView.snp.leading).offset(16)
      }
    }
  }
  func layoutChoiceFilterCollectionView() {
    self.mainScrollContainerView.add(choicefilterCollectionView) {
      $0.backgroundColor = .white
      $0.showsHorizontalScrollIndicator = false
      $0.snp.makeConstraints {
        $0.top.equalTo(self.choiceEatsContainverView.snp.bottom)
        $0.leading.equalTo(self.mainScrollContainerView.snp.leading).offset(16)
        $0.trailing.equalTo(self.mainScrollContainerView.snp.trailing)
        $0.height.equalTo(33)
      }
    }
  }
  func layoutChoiceEatsImageView1() {
    self.mainScrollContainerView.add(choiceEatsImageView1) {
      $0.image = UIImage(named: "onlyEatsImage1")
      $0.snp.makeConstraints {
        $0.top.equalTo(self.choicefilterCollectionView.snp.bottom).offset(16)
        $0.centerX.equalToSuperview()
        $0.height.equalTo(280)
        $0.width.equalTo(375)
      }
    }
  }
  func layoutChoiceEatsImageView2() {
    self.mainScrollContainerView.add(choiceEatsImageView2) {
      $0.image = UIImage(named: "onlyEatsImage2")
      $0.snp.makeConstraints {
        $0.top.equalTo(self.choiceEatsImageView1.snp.bottom)
        $0.centerX.equalToSuperview()
        $0.height.equalTo(280)
        $0.width.equalTo(375)
        $0.bottom.equalTo(self.mainScrollContainerView.snp.bottom)
      }
    }
  }
  @objc func moremenuButtonClicked(_ sender: UITapGestureRecognizer) {
    print("d")
    guard let subVC = UIStoryboard(name: "SubView", bundle: nil).instantiateViewController(withIdentifier: "SubViewVC") as? SubViewVC else {return}
    self.navigationController?.pushViewController(subVC, animated: true)
  }
}

// MARK: - UICollectionViewDelegate
extension HomeViewVC : UICollectionViewDelegateFlowLayout {
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    if collectionView == menutypeCollectionView {
      let cellWidth = 58
      let cellHeight = 127
      return CGSize(width: cellWidth, height: cellHeight)
    }
    if collectionView == onlyEatsCollectionView {
      let cellWidth = 120
      let cellHeight = 200
      return CGSize(width: cellWidth, height: cellHeight)
    }
    if collectionView == choicefilterCollectionView {
        var cellHeight = 28
      var cellWidth = selectList[indexPath.row].title.count * 20
        if(selectList[indexPath.row].isImage == true){
            cellWidth = cellWidth + 15
        }
      
      return CGSize(width: cellWidth, height: cellHeight)
    }
      return CGSize(width: 50, height: 50)
  }
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
    return UIEdgeInsets.zero
  }
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
    if collectionView == menutypeCollectionView {
      return 13
    }
    if collectionView == onlyEatsCollectionView {
      return 21
    }
    if collectionView == choicefilterCollectionView {
      return 10
    }
    return 20
  }
}

// MARK: - UICollectionViewDataSource
extension HomeViewVC : UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    
    if collectionView == menutypeCollectionView {
      return 10
    }
    if collectionView == onlyEatsCollectionView {
      return 5
    }
    if collectionView == choicefilterCollectionView {
      return 6
    }
    else {
      return 0
    }
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    if collectionView == menutypeCollectionView {
      guard let CategoryCVC = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryCVC.identifier, for: indexPath) as? CategoryCVC else {return UICollectionViewCell() }
        CategoryCVC.setData(image: categoryList[indexPath.row].imageName, category: categoryList[indexPath.row].category)
      CategoryCVC.awakeFromNib()
      return CategoryCVC
    }
    if collectionView == onlyEatsCollectionView  {
      guard let InEatsCVC = collectionView.dequeueReusableCell(withReuseIdentifier: InEatsCVC.identifier, for: indexPath) as? InEatsCVC else {return UICollectionViewCell() }
        InEatsCVC.getData(image: eatsList[indexPath.row].imageName, heart: true, title: eatsList[indexPath.row].title, time: eatsList[indexPath.row].time, star: eatsList[indexPath.row].star, distance: eatsList[indexPath.row].lenght, freeRide: eatsList[indexPath.row].isFree)
      InEatsCVC.awakeFromNib()
      return InEatsCVC
    }
    if collectionView == choicefilterCollectionView {
      guard let selectCVC = collectionView.dequeueReusableCell(withReuseIdentifier: selectCVC.identifier, for: indexPath) as? selectCVC else {return UICollectionViewCell() }
        selectCVC.setData(title: selectList[indexPath.row].title, isImage: selectList[indexPath.row].isImage)
      selectCVC.awakeFromNib()
      return selectCVC
    }
    return UICollectionViewCell()
  }
}
