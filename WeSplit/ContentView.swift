//
//  ContentView.swift
//  WeSplit
//
//  Created by Александра Фонова on 26.03.2023.
//

import SwiftUI

struct ContentView: View {
    @State private var checkAmount = 0.0
    @State private var numberOfPeople = 2
    @State private var tipPercentage = 20
    
    let tipPercentages = [10, 15, 20, 25, 0]
    
   
    
    var total: Double{
        let peopleCnt = Double(numberOfPeople + 2)
        let tipSE = Double(tipPercentage)
        
        let tipValue = checkAmount/100*tipSE
        let Total = checkAmount + tipValue
        let All = Total/peopleCnt
        
        return All
    }
    
    var sum: Double{
        let tipSE = Double(tipPercentage)
        
        let tipValue = checkAmount/100*tipSE
        let Total = checkAmount + tipValue
        
        return Total
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section{
                    TextField("Amount", value: $checkAmount, format: .currency(code: Locale.current.currencyCode ?? "USD"))
                        .keyboardType(.decimalPad)
                    Picker("Number of people", selection: $numberOfPeople){
                        ForEach(2..<100){
                            Text("\($0) peole" )
                        }
                    }
                    
                }
                Section {
                    Picker("PÍercentage", selection: $tipPercentage) {
                        ForEach(0..<101) {
                            Text("\($0) percent")
                        }
                    }
                }

                
            header: {
                Text("How much tip do you want to leave?")
            }
                Section{
                    Text(total, format: .currency(code: Locale.current.currencyCode ?? "USD"))
                }
            header: {
                Text("Money for one people")
            }
                Section{
                    Text(sum, format: .currency(code: Locale.current.currencyCode ?? "USD"))
                }
            header: {
                Text("All money")
            }
            .foregroundColor(tipPercentage == 0 ? .red : .black)
            }
            
            .navigationTitle("WeSplit")
        }
        
        
            
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
