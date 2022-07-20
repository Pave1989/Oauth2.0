//
//  User.swift
//  TZ
//
//  Created by Павел Галкин on 13.07.2022.
//

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let user = try? newJSONDecoder().decode(User.self, from: jsonData)

import Foundation
import UIKit

// MARK: - User
struct User: Codable {
    var accessToken, tokenType, refreshToken: String //optional?
    let expiresIn: Int?
    let scope, nickname: String?
    let avatar: Avatar?
    let clientID: String?
    let authorities: [String]?
    let username, jti: String

    enum CodingKeys: String, CodingKey {
        case accessToken = "access_token"
        case tokenType = "token_type"
        case refreshToken = "refresh_token"
        case expiresIn = "expires_in"
        case scope, nickname, avatar
        case clientID = "client_id"
        case authorities, username, jti
    }
}

// MARK: - Avatar
struct Avatar: Codable {
    let thumb, full: String?
}
