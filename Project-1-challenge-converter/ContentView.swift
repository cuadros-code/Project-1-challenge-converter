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
    
    private var resultValue: String {
        
        var result: Measurement<UnitTemperature>!
        
        if converterType == "Celsius" {
            let celciusMeasure = Measurement(
                value: temperature,
                unit: UnitTemperature.celsius
            )
            if converterTypeOut == "Fahrenheit" {
                result = celciusMeasure.converted(to: .fahrenheit)
            } else if converterTypeOut == "Kelvin" {
                result = celciusMeasure.converted(to: .kelvin)
            } else {
                result = celciusMeasure
            }
        }
        
        if converterType == "Fahrenheit" {
            let fahrenheitMeasure = Measurement(
                value: temperature,
                unit: UnitTemperature.fahrenheit
            )
            if converterTypeOut == "Celsius" {
                result = fahrenheitMeasure.converted(to: .celsius)
            } else if converterTypeOut == "Kelvin" {
                result = fahrenheitMeasure.converted(to: .kelvin)
            } else {
                result = fahrenheitMeasure
            }
        }
        
        if converterType == "Kelvin" {
            let kelvinMeasure = Measurement(
                value: temperature,
                unit: UnitTemperature.kelvin
            )
            if converterTypeOut == "Celsius" {
                result = kelvinMeasure.converted(to: .celsius)
            } else if converterTypeOut == "Fahrenheit" {
                result = kelvinMeasure.converted(to: .fahrenheit)
            } else {
                result = kelvinMeasure
            }
        }
        
        return "\(result!)"
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
                
                Text(resultValue)
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
