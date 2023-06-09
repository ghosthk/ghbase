import Foundation
import UIKit

open class GHBaseCollectionCell: UICollectionViewCell {
    var identifier: String = ""
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        
        config()
        setup()
        constrainitsUI()
    }
    
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    open func config() {
        
    }
    
    open func setup() {
        
    }
    
    open func constrainitsUI() {
        
    }
    
    open func updateUIWithModel() {
            
    }
}

