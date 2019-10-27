//
//  FavoriteView.swift
//  iDine
//
//  Created by Rob Fazio on 10/26/19.
//  Copyright © 2019 Rob Fazio. All rights reserved.
//

import SwiftUI

struct FavoriteView: View {
    
    @EnvironmentObject var favorite: Favorite
    
    private var favorites: [MenuItem]
    
    init(favorites: [MenuItem]) {
        self.favorites = favorites
    }
    
    var body: some View {
        NavigationView {
            List {
                ForEach(favorites) { menuItem in
                    ItemRow(item: menuItem, isNavigationLinkDisabled: true)
                }
            }
            .navigationBarTitle(Text("Favorites"))
        }
    }
}

struct FavoriteView_Previews: PreviewProvider {
    
    static let favorite = Favorite()
    static let favorites = [MenuItem]()
    
    static var previews: some View {
        FavoriteView(favorites: favorites).environmentObject(favorite)
    }
}
