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
    var item: MenuItem
    
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
            }.font(.headline)
            
            Spacer()
        }
        .navigationBarTitle(Text(item.name), displayMode: .inline)
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
