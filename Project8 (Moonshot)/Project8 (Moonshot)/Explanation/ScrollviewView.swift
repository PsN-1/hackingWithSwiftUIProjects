//
//  ScrollviewView.swift
//  Project8 (Moonshot)
//
//  Created by Pedro Neto on 05/06/21.
//

import SwiftUI

struct CustomText: View {
    var text: String
    
    var body: some View {
        Text(text)
    }
    
    init(_ text: String) {
        print("Creating a CustomText")
        self.text = text
    }
}

struct ScrollviewView: View {
    var body: some View {
        List {
            ForEach(0..<100) {
                CustomText("Item \($0)")
                    .font(.title)
            }
            
        }
    }
}

//struct ContentView: View {
//    var body: some View {
//        ScrollView(.vertical) {
//            VStack(spacing: 10) {
//                ForEach(0..<100) {
//                    CustomText("Item \($0)")
//                        .font(.title)
//                }
//            }
//            .frame(maxWidth: .infinity)
//        }
//    }
//}

struct ScrollviewView_Previews: PreviewProvider {
    static var previews: some View {
        ScrollviewView()
    }
}
