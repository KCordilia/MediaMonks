//
//  PhotoService.swift
//  MediaMonks
//
//  Created by Karim Cordilia on 01/03/2021.
//

import Moya

enum PhotoService {
    case getPhotos(albumId: Int, page: Int)
}

extension PhotoService: TargetType {
    var baseURL: URL {
        switch self {
        case .getPhotos:
            return URLs.baseURL
        }
    }

    var path: String {
        switch self{
        case .getPhotos:
            return "/photos"
        }
    }

    var method: Moya.Method {
        switch self {
        case .getPhotos:
            return .get
        }
    }

    var sampleData: Data {
        return Data()
    }

    var task: Task {
        switch self {
        case .getPhotos(let albumId, let page):
            return .requestParameters(parameters: ["albumId" :albumId, "_page": page, "_limit": 15 ], encoding: URLEncoding.default)
        }
    }

    var headers: [String : String]? {
        return nil
    }
}

