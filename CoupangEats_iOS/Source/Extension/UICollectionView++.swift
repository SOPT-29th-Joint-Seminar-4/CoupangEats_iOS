import Foundation
import UIKit

extension UICollectionView {
    public func registerCustomXib(xibName: String){
        let xib = UINib(nibName: xibName, bundle: nil)
        self.register(xib, forCellWithReuseIdentifier: xibName)
    }
}
