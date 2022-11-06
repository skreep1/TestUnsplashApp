//
//  Users.swift
//  UnsplashApp
//
//  Created by Maksim Skrypka on 31.10.2022.
//

import Foundation

struct Users: Codable {
    let profile_image: ProfileImage
    let name: String
}

struct ProfileImage: Codable {
    let large: String
}
