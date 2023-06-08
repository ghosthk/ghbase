import Foundation
import UIKit

class GHBaseCollectionCell: UICollectionViewCell {
    var identifier: String = ""
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        config()
        setup()
        constrainitsUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func config() {
        
    }
    
    func setup() {
        
    }
    
    func constrainitsUI() {
        
    }
    
    func updateUIWithModel() {
            
        }
}

