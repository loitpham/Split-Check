//
//  ContentView.swift
//  Split-Check
//
//  Created by Loi Pham on 5/1/21.
//

import SwiftUI

// MARK: TODO
// - Custom percentage



struct ContentView: View {
    @State private var checkAmount = ""
    @State private var numberOfPeople = 2
    @State private var tipPercentage = 2
    
    let tipPercentages = [10, 15, 20, 25, 0]
    
    var totalAmount: Double {
        let tipSelection = Double(tipPercentages[tipPercentage])
        let amount = Double(checkAmount) ?? 0
        return amount * (100 + tipSelection) / 100
    }
    
    var splitAmount: Double {
        let peopleCount = Double(numberOfPeople) + 2
        return totalAmount / peopleCount
    }
    

    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Amount", text: $checkAmount)
                        .keyboardType(.decimalPad)
                    
                    Picker("Number of people", selection: $numberOfPeople) {
                        ForEach(2..<100) {
                            Text("\($0)")
                        }
                    }
                } // SECTION
                
                Section(header: Text("How much tip would you like to give?")) {
                    Picker("Tip percentage", selection: $tipPercentage) {
                        ForEach(0..<tipPercentages.count) {
                            Text("\(tipPercentages[$0])%")
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                } // SECTION
                
                Section(header: Text("Total amount with tip included")) {
                    Text("$\(totalAmount, specifier: "%.2f")")
                } // SECTION
                
                Section(header: Text("Amount per person")) {
                    Text("$\(splitAmount, specifier: "%.2f")")
                } // SECTION
            } // FORM
            .navigationBarTitle("Check Split")
        } // NAVIGATION-VIEW
    } // BODY
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
