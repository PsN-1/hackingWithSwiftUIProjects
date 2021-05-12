//
//  ContentView.swift
//  Project7 (iExpense)
//
//  Created by Pedro Neto on 11/05/21.
//

import SwiftUI

class User: ObservableObject {
    @Published var firstName = "Bilbo"
    @Published var lastName = "Baggins"
}

struct StateAndObservedObject: View {
//    @State private var user = User()
    @ObservedObject private var user = User()
    
    var body: some View {
        VStack {
            Text("Your name is \(user.firstName) \(user.lastName).")
            TextField("First name", text:$user.firstName)
            TextField("Last name" , text:$user.lastName)
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        StateAndObservedObject()
    }
}
