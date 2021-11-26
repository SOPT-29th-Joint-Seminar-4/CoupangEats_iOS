//
//  DataModel.swift
//  CoupangEats_iOS
//
//  Created by 김선오 on 2021/11/20.
//

import UIKit

struct ContentData {
    
    let thumbNailName : String
    let store : String
    let menu : String
    let count : String
    let price : String
    let description : String
    
    func thumbnail() -> UIImage? {
        return UIImage(named: thumbNailName)
    }
}
