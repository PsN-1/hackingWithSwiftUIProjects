//
//  StoreAtUserDefaults.swift
//  Project7 (iExpense)
//
//  Created by Pedro Neto on 12/05/21.
//

import SwiftUI

struct StoreAtUserDefaults: View {
    @State private var tapCount = UserDefaults.standard.integer(forKey: "Tap")
    

    var body: some View {
        Button("Tap count: \(tapCount)"){
            self.tapCount += 1
            UserDefaults.standard.set(self.tapCount, forKey: "Tap")
        }
    }
}


struct StoreAtUserDefaults_Previews: PreviewProvider {
    static var previews: some View {
        StoreAtUserDefaults()
    }
}
