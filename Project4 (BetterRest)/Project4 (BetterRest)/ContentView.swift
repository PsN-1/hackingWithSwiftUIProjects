//
//  ContentView.swift
//  Project4 (BetterRest)
//
//  Created by Pedro Neto on 09/04/21.
//

import SwiftUI

struct ContentView: View {
    
    @State private var wakeUp = defaultWakeTime
    @State private var sleepAmount = 8.0
    @State private var coffeeAmount = 1
    
    @State private var alertTitle = "Your ideal bedtime is:"
    @State private var alertMessage = "10:38 PM"
    @State private var showingAlert = false
    
    var body: some View {
        NavigationView{
            Form{
                Section(header: Text("Recommended bedtime").font(.headline)) {
                    HStack {
                        Text(alertTitle)
                        Text(alertMessage)
                         .font(.headline)
                    }
                   
                }
                Section(header: Text("When do you want to wake up?").font(.headline)){
                    DatePicker("Please enter a time", selection: $wakeUp, displayedComponents: .hourAndMinute)
                        .labelsHidden()
                        .datePickerStyle(WheelDatePickerStyle())
                        .onChange(of: wakeUp, perform: { value in
                            calculateBedtime()
                        })
                        
                }
                
                Section(header: Text("Desired amount of sleep").font(.headline)){
                    Stepper(value: $sleepAmount, in: 4...12, step: 0.25) {
                        Text("\(sleepAmount, specifier: "%g") hours")
                    }
                    .onChange(of: sleepAmount, perform: { value in
                        calculateBedtime()
                    })
                }

                Section(header: Text("Daily coffee intake").font(.headline)) {
                    Picker("Cups of coffee", selection: $coffeeAmount) {
                        ForEach(0..<9) {i in
                            if i == 0 {
                            } else if i == 1 {
                                Text("1 cup")
                            } else {
                                Text("\(i) cups")
                            }
                        }
                    }
                    .onChange(of: coffeeAmount, perform: { value in
                        calculateBedtime()
                    })
                }
            }
            .navigationBarTitle("BetterRest")
        }
    }
    
    static var defaultWakeTime: Date {
        var components = DateComponents()
        components.hour = 7
        components.minute = 0
        return Calendar.current.date(from: components) ?? Date()
    }
    
    func calculateBedtime() {
        let model = SleepCalculator()
        
        let components = Calendar.current.dateComponents([.hour, .minute], from: wakeUp)
        let hour = (components.hour ?? 0) * 60 * 60
        let minute = (components.minute ?? 0) * 60
        
        do {
            let prediction = try model.prediction(wake: Double(hour + minute), estimatedSleep: sleepAmount, coffee: Double(coffeeAmount))
            
            let sleepTime = wakeUp - prediction.actualSleep
            
            let formatter = DateFormatter()
            formatter.timeStyle = .short
            
            alertMessage = formatter.string(from: sleepTime)
            
        } catch {
            alertTitle = "Error"
            alertMessage = "Sorry, there was a problem calculating your bedtime."
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
