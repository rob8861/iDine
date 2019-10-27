//
//  ItemDetail.swift
//  iDine
//
//  Created by Rob Fazio on 10/24/19.
//  Copyright © 2019 Rob Fazio. All rights reserved.
//

import SwiftUI

struct ItemDetail: View {
    
    @EnvironmentObject var order: Order
    @EnvironmentObject var favorite: Favorite
    @State private var isFavorite: Bool
    
    var item: MenuItem
    
    init(isFavorite: Bool = false, item: MenuItem) {
        _isFavorite = State(initialValue: isFavorite)
        self.item = item
    }
    
    var body: some View {
        VStack(spacing: 10) {
            ZStack(alignment: .bottomTrailing) {
                Image(item.mainImage)
                Text("Photo: \(item.photoCredit)")
                    .padding(4)
                    .background(Color.black)
                    .font(.caption)
                    .foregroundColor(.white)
                    .offset(x: -25, y: -5)
            }
            Text(item.description)
                .font(.callout)
                .padding(30)
            
            Button(action: { self.order.add(item: self.item) }) {
                Text("Order This")
                    .font(.headline)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
            }
            .frame(width: 100, height: 30)
            .padding(1)
            .background(Color("order-button"))
            .cornerRadius(25)
            .shadow(radius: 3)
            
            
            Spacer()
        }
        .navigationBarTitle(Text(item.name), displayMode: .inline)
        .navigationBarItems(
            trailing: Button(action: {
                self.isFavorite.toggle()
                self.addToFavorite()
            }) {
                Image(systemName: isFavorite ? "heart.fill" : "heart")
            }
        )
    }
    
    func addToFavorite() {
        if !self.favorite.isItemFavorite(item: self.item) {
            self.favorite.addToFavorites(item: self.item)
        } else {
            self.favorite.removeFromFavorites(item: self.item)
        }
    }
}

struct ItemDetail_Previews: PreviewProvider {
    
    static let order = Order()
    
    static var previews: some View {
        NavigationView {
            ItemDetail(item: MenuItem.example).environmentObject(order)
        }
    }
}
