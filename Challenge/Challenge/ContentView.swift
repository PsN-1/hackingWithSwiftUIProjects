//
//  ContentView.swift
//  Challenge
//
//  Created by Pedro Neto on 25/03/21.
//

import SwiftUI

struct ContentView: View {
    
    @State private var tempInput = ""
    @State private var selectedUnitFrom = 0
    @State private var selectedUnitTo = 1
    
    let sizeInputLimit = 6
    var result: Double {
        
        var value = Double(tempInput) ?? 1
        
        if selectedUnitFrom == selectedUnitTo { return value }
        
        else if selectedUnitFrom == 0 && selectedUnitTo == 1 {
            // Kelvin to Celsius
            value -= 273.15
        }
        else if selectedUnitFrom == 0 && selectedUnitTo == 2 {
            // Kelvin to Fahrenheit
            value = 9 / 5 * (value - 273.15) + 32
        }
        else if selectedUnitFrom == 1 && selectedUnitTo == 0 {
            // Celsius to Kelvin
            value += 273.15
        }
        else if selectedUnitFrom == 1 && selectedUnitTo == 2 {
            // Celsius to Fahrenheit
            value = 9 / 5 * value + 32
        }
        else if selectedUnitFrom == 2 && selectedUnitTo == 0 {
            // Fahrenheit to Kelvin
            value = 5 / 9 * (value - 32) + 273.15
        }
        else if selectedUnitFrom == 2 && selectedUnitTo == 1 {
            // Fahrenheit to Celsius
            value = (value - 32) / 1.8
        }
        
        return value
    }
    
    let tempUnits = ["Kelvin", "Celsius", "Fahrenheit"]
    
    var body: some View {
        NavigationView {
            Form {
                Section(
                    header: Text("Enter the value to convert"),
                    footer: Button("Clear input") { tempInput = "" }
                ){
                    HStack {
                        Text("Input: ")
                        TextField("\(tempUnits[selectedUnitFrom])", text: $tempInput)
                            .keyboardType(.decimalPad)
                            .disabled(tempInput.count >= sizeInputLimit)
                        Text("Result: \(result, specifier: "%.2f")°")
                            .multilineTextAlignment(.leading)
                    }
                }
                
                Section(header: Text("From")) {
                    Picker("Units", selection: $selectedUnitFrom) {
                        ForEach(0..<tempUnits.count) {
                            Text("\(tempUnits[$0])")
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                
                Section(header: Text("To")) {
                    Picker("Units", selection: $selectedUnitTo) {
                        ForEach(0..<tempUnits.count) {
                            Text("\(tempUnits[$0])")
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
            }
            .navigationBarTitle("Conversion App")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
