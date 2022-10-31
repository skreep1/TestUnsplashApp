//
//  Photo.swift
//  UnsplashApp
//
//  Created by Maksim Skrypka on 26.10.2022.
//

import Foundation

struct Photos: Codable {
    let photos: [Photo]
}
struct Photo: Codable {
    let id: String
    let created_at: String
    let width: Int
    let height: Int
    let likes: Int
    let urls: URLs
    let user: Users
}
struct URLs: Codable {
    let raw: String
    let full: String
    let thumb: String
}

struct Users: Codable {
    let profile_image: ProfileImage
    let name: String
}
struct ProfileImage: Codable {
    let large: String
}
