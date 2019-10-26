//
//  OrderView.swift
//  iDine
//
//  Created by Rob Fazio on 10/24/19.
//  Copyright © 2019 Rob Fazio. All rights reserved.
//

import SwiftUI

struct OrderView: View {
    
    @EnvironmentObject var order: Order
    
    var body: some View {
        NavigationView {
            List {
                Section {
                    ForEach(order.items) { item in
                        HStack {
                            Text(item.name)
                            Spacer()
                            Text("$\(item.price)")
                        }
                    }
                }
                
                Section {
                    NavigationLink(destination: CheckoutView()) {
                        Text("Place Order")
                    }
                }
            }
            .navigationBarTitle("Orders")
            .listStyle(GroupedListStyle())
        }
    }
}

struct OrderView_Previews: PreviewProvider {
    
    static let order = Order()
    
    static var previews: some View {
        OrderView().environmentObject(order)
    }
}
