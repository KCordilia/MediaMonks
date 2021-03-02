//
//  PhotoCollectionViewCell.swift
//  MediaMonks
//
//  Created by Karim Cordilia on 01/03/2021.
//

import UIKit
import Kingfisher

class PhotoCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var imageView: UIImageView!
    private let placeholder = R.image.photo_placeholder()
    func configure(photo: Photo) {
        imageView.kf.setImage(with: URL(string: photo.thumbnailUrl), placeholder: placeholder)
    }
}
