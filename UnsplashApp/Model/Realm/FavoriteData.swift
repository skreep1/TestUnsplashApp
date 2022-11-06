//
//  FavoriteData.swift
//  UnsplashApp
//
//  Created by Maksim Skrypka on 05.11.2022.
//

import Foundation
import RealmSwift

class FavoriteData: Object {
    @objc dynamic var id = 0
    @objc dynamic var name = ""
    @objc dynamic var image = ""
    @objc dynamic var imageProfile = ""
    @objc dynamic var completed = false
}
