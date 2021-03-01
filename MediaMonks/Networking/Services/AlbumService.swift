//
//  AlbumService.swift
//  MediaMonks
//
//  Created by Karim Cordilia on 01/03/2021.
//

import Moya

enum AlbumService {
    case getAlbums(page: Int)
}

extension AlbumService: TargetType {
    var baseURL: URL {
        return URLs.baseURL
    }

    var path: String {
        switch self{
        case .getAlbums:
            return "/albums"

        }
    }

    var method: Moya.Method {
        switch self {
        case .getAlbums:
            return .get
        }
    }

    var sampleData: Data {
        return Data()
    }

    var task: Task {
        switch self {
        case .getAlbums(let page):
            return .requestParameters(parameters: ["_page" : page], encoding: URLEncoding.default)
        }
    }

    var headers: [String : String]? {
        return nil
    }
}

