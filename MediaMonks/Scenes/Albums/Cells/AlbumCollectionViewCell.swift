//
//  AlbumCollectionViewCell.swift
//  MediaMonks
//
//  Created by Karim Cordilia on 01/03/2021.
//

import UIKit

class AlbumCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var albumImage: UIImageView!
    @IBOutlet weak var albumTitle: UILabel!
    func configure(album: Album) {
        albumTitle.text = album.title
        albumImage.image = R.image.albumIcon()
    }
}
