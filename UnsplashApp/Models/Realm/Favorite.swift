//
//  Favorite.swift
//  UnsplashApp
//
//  Created by Maksim Skrypka on 31.10.2022.
//

import Foundation
import RealmSwift

class Favorite: Object {
    @objc dynamic var id = ""
    @objc dynamic var name = ""
    @objc dynamic var image = ""
    @objc dynamic var imageProfile = ""
    
    
}

