//
//  AlbumsDataSource.swift
//  MediaMonks
//
//  Created by Karim Cordilia on 01/03/2021.
//

import UIKit

class AlbumsDataSource: NSObject, UICollectionViewDataSource {
    var albums: [Album] = []

    func set(albums: [Album]) {
        self.albums.append(contentsOf: albums)
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        albums.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: R.nib.albumCollectionViewCell, for: indexPath) else {
            assertionFailure("AlbumCollectionViewCell not initialized")
            return .init()
        }
        cell.configure(album: albums[indexPath.row])
        return cell
    }


}
