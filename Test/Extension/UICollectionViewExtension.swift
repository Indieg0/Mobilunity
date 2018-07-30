//
//  UICollectionViewExtension.swift
//  Test
//
//  Created by Kirill Konovalov on 30.07.2018.
//  Copyright © 2018 Mobilunity. All rights reserved.
//

import UIKit

extension UICollectionView {
    var centerPoint : CGPoint {
        return CGPoint(x: self.center.x + self.contentOffset.x,
                       y: self.center.y + self.contentOffset.y)
    }
    
    var centerCellIndexPath: IndexPath? {
        if let centerIndexPath = self.indexPathForItem(at: self.centerPoint) {
            return centerIndexPath
        }
        return nil
    }
}
