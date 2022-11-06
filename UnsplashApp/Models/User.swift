//
//  User.swift
//  UnsplashApp
//
//  Created by Maksim Skrypka on 26.10.2022.
//

import Foundation

struct User: Codable {
    let id, name: String
    let profile_image: ProfileImage
}
struct ProfileImage: Codable {
    let profile_image: String
}
