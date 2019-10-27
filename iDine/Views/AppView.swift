//
//  AppView.swift
//  iDine
//
//  Created by Rob Fazio on 10/24/19.
//  Copyright © 2019 Rob Fazio. All rights reserved.
//

import SwiftUI

struct AppView: View {
    
    @EnvironmentObject var favorite: Favorite
    
    var body: some View {
        TabView {
            ContentView()
                .tabItem {
                    Image(systemName: "list.dash")
                    Text("Menu")
            }
            
            OrderView()
                .tabItem {
                    Image(systemName: "square.and.pencil")
                    Text("Order")
            }
            
            FavoriteView(favorites: favorite.getAllFavorites())
                .tabItem {
                    Image(systemName: "heart.circle")
                    Text("Favorites")
            }
        }
    }
}

struct AppView_Previews: PreviewProvider {
    
    static let order = Order()
    static let favorite = Favorite()
    
    static var previews: some View {
        AppView().environmentObject(order).environmentObject(favorite)
    }
}
