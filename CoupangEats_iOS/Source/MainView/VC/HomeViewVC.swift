//
//  HomeViewVC.swift
//  CoupangEats_iOS
//
//  Created by 박익범 on 2021/11/13.
//

import UIKit

class HomeViewVC: UIViewController {

    @IBAction func nextButtonClicked(_ sender: Any) {
        guard let subVC = UIStoryboard(name: "SubView", bundle: nil).instantiateViewController(withIdentifier: "SubViewVC") as? SubViewVC else {return}
        
        self.navigationController?.pushViewController(subVC, animated: true)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
