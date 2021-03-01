//
//  PhotosDataSource.swift
//  MediaMonks
//
//  Created by Karim Cordilia on 01/03/2021.
//

import UIKit

class PhotosDataSource: NSObject, UICollectionViewDataSource {
    var photos: [Photo] = []

    func set(photos: [Photo]) {
        self.photos.append(contentsOf: photos)
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        photos.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: R.nib.photoCollectionViewCell, for: indexPath) else {
            assertionFailure("PhotoCollectionViewCell not initialized")
            return .init()
        }
        cell.configure(photo: photos[indexPath.row])
        cell.layer.borderWidth = 1
        cell.layer.borderColor = UIColor.white.cgColor
        return cell
    }
}

