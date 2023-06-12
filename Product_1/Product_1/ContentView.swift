//
//  ContentView.swift
//  WeSplit
//
//  Created by Александра Фонова on 26.03.2023.
//

import SwiftUI

struct ContentView: View {
    @State private var tempOne = 0.0
    
    @State private var tempSelectOne = "Celsius"
    @State private var tempSelectTwo = "Fahrenheit"
    
    
    let masOne = ["Celsius", "Fahrenheit",  "Kelvin"]
    let masTwo = ["Celsius", "Fahrenheit",  "Kelvin"]
    

    
    func tempConverter() -> Double {
            var output: Double
            if tempSelectOne == "Celsius" && tempSelectTwo == "Fahrenheit" {
                output = (tempOne * 9/5)
                return output
            } else if tempSelectOne == "Celsius" && tempSelectTwo == "Kelvin" {
                output = (tempOne + 273.15)
                return output
            } else if tempSelectOne == "Fahrenheit" && tempSelectTwo == "Celsius" {
                output = (tempOne ) * 5/9
                return output
            } else if tempSelectOne == "Fahrenheit" && tempSelectTwo == "Kelvin" {
                output = (tempOne) * 5/9 + 273.15
                return output
            } else if tempSelectOne == "Kelvin" && tempSelectTwo == "Celsius" {
                output = (tempOne - 273.15)
                return output
            } else if tempSelectOne == "Kelvin" && tempSelectTwo == "Fahrenheit" {
                output = (tempOne - 273.15) * 9/5
                return output
            } else {
                return tempOne
            }
        }
    
    var body: some View {
        NavigationView {
            Form {
                Section{
                    Picker("Select temperature one", selection: $tempSelectOne) {
                        ForEach(masOne, id: \.self) {
                            Text($0)
                        }
                    }
                    .pickerStyle(.segmented)
                    
                    TextField("Number", value: $tempOne, format: .currency(code: "°"))
                }
            header: {
                Text("select the desired temperature and enter the number")
            }
                Section{
                    Picker("Select temperature two", selection: $tempSelectTwo) {
                        ForEach(masTwo, id: \.self) {
                            Text($0)
                        }
                    }
                    .pickerStyle(.segmented)
                    
                    Text(tempConverter(), format: .currency(code: "°"))
                }
            header: {
                Text("select the desired temperature and enter the number")
            }
            }
            .navigationTitle("Temperature")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


