//
//  CheckoutView.swift
//  iDine
//
//  Created by Rob Fazio on 10/24/19.
//  Copyright © 2019 Rob Fazio. All rights reserved.
//

import SwiftUI

struct CheckoutView: View {
    
    @EnvironmentObject var order: Order
    static let paymentTypes = ["Cash", "Credit Card", "iDine Points"]
    static let tipAmounts = [10, 15, 20, 25, 0]
    
    @State private var paymentType = 0
    @State private var addLoyaltyDeails = false
    @State private var loyaltyNumber = ""
    @State private var tipAmountIndex = 0
    @State private var showAlert = false
    
    var totalPrice: Double {
        let total = Double(order.total)
        let tipValue = total / 100 * Double(Self.tipAmounts[tipAmountIndex])
        return total + tipValue
    }
    
    var body: some View {
        Form {
            Section {
                Picker(selection: $paymentType, label: Text("How do you want to pay?")) {
                    ForEach(0 ..< Self.paymentTypes.count) {
                        Text(Self.paymentTypes[$0])
                    }
                }
            }
            
            Toggle(isOn: $addLoyaltyDeails.animation()) {
                Text("Add iDine loyalty card")
            }
            
            if addLoyaltyDeails {
                TextField("Enter your iDine ID", text: $loyaltyNumber)
            }
            
            Section(header: Text("Add a tip?")) {
                Picker(selection: $tipAmountIndex, label: Text("Percentage:")) {
                    ForEach(0 ..< Self.tipAmounts.count) {
                        Text("\(Self.tipAmounts[$0])%")
                    }
                }.pickerStyle(SegmentedPickerStyle())
            }
            
            Section(header: Text("TOTAL: $\(totalPrice, specifier: "%.2f")")) {
                HStack {
                    Spacer()
                    Button("Confirm order") {
                        self.showAlert.toggle()
                    }
                    Spacer()
                }
            }
        }
        .navigationBarTitle("Payment", displayMode: .inline)
        .alert(isPresented: $showAlert) {
            Alert(title: Text("Order confirmed"), message: Text("Your total was $\(totalPrice, specifier: "%.2f")"), dismissButton: .default(Text("Okay")))
        }
    }
}

struct CheckoutView_Previews: PreviewProvider {
    static let order = Order()
    
    static var previews: some View {
        CheckoutView().environmentObject(order)
    }
}
