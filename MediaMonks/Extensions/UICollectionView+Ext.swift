//
//  UICollectionView+Ext.swift
//  MediaMonks
//
//  Created by Karim Cordilia on 01/03/2021.
//

import UIKit

extension UICollectionView {

    func reloadWithAnimation() {
        self.reloadData()
        let collectionViewHeight = self.bounds.size.height
        let cells = self.visibleCells
        var delayCounter = 0
        for cell in cells {
            cell.transform = CGAffineTransform(translationX: 0, y: collectionViewHeight)
        }
        for cell in cells {
            UIView.animate(withDuration: 10, delay: 0.08 * Double(delayCounter),usingSpringWithDamping: 0.6, initialSpringVelocity: 0, options: .curveEaseInOut, animations: {
                cell.transform = CGAffineTransform.identity
            }, completion: nil)
            delayCounter += 1
        }
    }
}
