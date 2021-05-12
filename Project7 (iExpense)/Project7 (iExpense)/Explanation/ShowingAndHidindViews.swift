//
//  ShowingAndHidindViews.swift
//  Project7 (iExpense)
//
//  Created by Pedro Neto on 12/05/21.
//

import SwiftUI

struct SecondView: View {
    @Environment(\.presentationMode) var presentationMode
    var name: String
    var body: some View {
        Button("Dismiss") {
            self.presentationMode.wrappedValue.dismiss()
        }
    }
}

struct ShowingAndHidindViews: View {
    @State private var showingSheet = false
    
    var body: some View {
        Button("Show Sheet") {
            self.showingSheet.toggle()
        }
        .sheet(isPresented: $showingSheet) {

            SecondView(name: "there")
        }
    }
}

struct ShowingAndHidindViews_Previews: PreviewProvider {
    static var previews: some View {
        ShowingAndHidindViews()
    }
}
