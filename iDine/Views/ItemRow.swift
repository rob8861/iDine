//
//  ItemRow.swift
//  iDine
//
//  Created by Rob Fazio on 10/24/19.
//  Copyright © 2019 Rob Fazio. All rights reserved.
//

import SwiftUI

struct ItemRow: View {
    
    @EnvironmentObject var favorite: Favorite
    
    var item: MenuItem
    var isNavigationLinkDisabled: Bool
    
    var body: some View {
        
        Group {
            if isNavigationLinkDisabled {
                ItemRowContent(item: item)
            } else {
                NavigationLink(destination: ItemDetail(isFavorite: favorite.isItemFavorite(item: item), item: item)) {
                    ItemRowContent(item: item)
                }
            }
        }
    }
}

struct ItemRow_Previews: PreviewProvider {
    
    static let favorite = Favorite()
    
    static var previews: some View {
        ItemRow(item: MenuItem.example, isNavigationLinkDisabled: false).environmentObject(favorite)
    }
}

struct ItemRowContent: View {
    static let colors: [String:Color] = ["D": .purple, "G": .black, "N": .red, "S": .blue, "V": .green]
    var item: MenuItem
    
    var body: some View {
        HStack {
            Image(item.thumbnailImage)
                .clipShape(Circle())
                .overlay(Circle().stroke(Color.gray, lineWidth: 2))
            VStack(alignment: .leading) {
                Text(item.name)
                    .font(.headline)
                Text("$\(item.price)")
            }
            Spacer()
            ForEach(item.restrictions, id: \.self) { restriction in
                Text(restriction)
                    .font(.caption)
                    .fontWeight(.black)
                    .padding(5)
                    .background(Self.colors[restriction, default: .black])
                    .clipShape(Circle())
                    .foregroundColor(.white)
            }
        }
    }
}
