//
//  Favorite.swift
//  iDine
//
//  Created by Rob Fazio on 10/26/19.
//  Copyright © 2019 Rob Fazio. All rights reserved.
//

import SwiftUI

class Favorite: ObservableObject {

    @Published var favoriteItems = [MenuItem:Bool]()
    
    func addToFavorites(item: MenuItem) {
        favoriteItems[item] = true
    }
    
    func removeFromFavorites(item: MenuItem) {
        favoriteItems.removeValue(forKey: item)
    }
    
    func getAllFavorites() -> [MenuItem] {
        var menuItems = [MenuItem]()
        for menuItem in favoriteItems.keys {
            menuItems.append(menuItem)
        }
        return menuItems
    }
    
    func isItemFavorite(item: MenuItem) -> Bool {
        return favoriteItems[item] != nil
    }
}
