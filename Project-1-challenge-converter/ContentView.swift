//
//  ContentView.swift
//  Project-1-challenge-converter
//
//  Created by Kevin Cuadros on 21/09/24.
//

import SwiftUI

struct ContentView: View {
    
    @State private var temperature: Double = 10
    @State private var converterType: String = "Celsius"
    @State private var converterTypeOut: String = "Fahrenheit"
    
    private var types = [
        "Celsius",
        "Fahrenheit",
        "Kelvin"
    ]
    
    private var result: Double {
        
        var result = temperature
        
        if converterType == "Celsius" {
            if converterTypeOut == "Fahrenheit" {
                result = temperature * 9/5 + 32
            }
            if converterTypeOut == "Kelvin" {
                result = temperature + 273.15
            }
        }
        
        if converterType == "Fahrenheit" {
            if converterTypeOut == "Celsius" {
                result = (temperature - 32) * 5 / 9
            }
            if converterTypeOut == "Kelvin" {
                result = (temperature - 32) * 5 / 9 + 273.15
            }
        }
        
        if converterType == "Kelvin" {
            if converterTypeOut == "Celsius" {
                result = temperature  - 273.15
            }
            if converterTypeOut == "Fahrenheit" {
                result = (temperature - 273.15) * 9 / 5 + 32
            }
        }
        return result
    }
    
    
    var body: some View {
        NavigationStack {
            Form {
                Section("Temperature to convert"){
                    TextField("", value: $temperature, format: .number)
                    
                    Picker("Type", selection: $converterType) {
                        ForEach(types, id: \.self){
                            Text("\($0)")
                        }
                    }
                    .pickerStyle(.palette)
                    
                }
                
                Section("Convert to") {
                    Picker("Type", selection: $converterTypeOut) {
                        ForEach(types, id: \.self){
                            Text("\($0)")
                        }
                    }
                    .pickerStyle(.segmented)
                }
                
                Text("\(String(format: "%.2f", result)) \u{00B0}\(converterTypeOut.first!)")
                    .font(.system(size: 55))
                    .frame(maxWidth: .infinity)
                
                
                
                .navigationTitle("Converter")
                .navigationBarTitleDisplayMode(.inline)
            }
        }
    }
}

#Preview {
    ContentView()
}
