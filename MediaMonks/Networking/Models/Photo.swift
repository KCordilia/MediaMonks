//
//  Photo.swift
//  MediaMonks
//
//  Created by Karim Cordilia on 01/03/2021.
//

import Foundation

struct Photo: Codable {
    let albumId: Int
    let id: Int
    let title: String
    let url: String
    let thumbnailUrl: String
}
