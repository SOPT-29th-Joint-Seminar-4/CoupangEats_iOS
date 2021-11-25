//
//  SubViewVC.swift
//  CoupangEats_iOS
//
//  Created by 박익범 on 2021/11/13.
//

import UIKit

class SubViewVC: UIViewController {

    var contentList: [ContentData] = [];
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initContentList()
        // Do any additional setup after loading the view.
    }
    

    func initContentList() {
        contentList.append(contentsOf: [
            ContentData(thumbNailName: <#T##String#>, store: <#T##String#>, menu: <#T##String#>, count: <#T##String#>, price: <#T##String#>)
        ])
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
