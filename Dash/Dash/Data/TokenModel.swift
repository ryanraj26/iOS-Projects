//
//  TokenModel.swift
//  Assignment 9
//
//  Created by LMNTrix on 4/10/21.
//

import Foundation

struct TokenModel: Codable {
    let accessToken, tokenType: String
    let expiresIn: Int

    enum CodingKeys: String, CodingKey {
        case accessToken = "access_token"
        case tokenType = "token_type"
        case expiresIn = "expires_in"
    }
}



