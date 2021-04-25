//
//  Ex04.swift
//  Project6 (Animations)
//
//  Created by Pedro Neto on 24/04/21.
//

import SwiftUI

struct Ex04: View {
    @State private var enabled = true
    
    var body: some View {
        Button("Tap Me") {
            self.enabled.toggle()
        }
        .frame(width: 200, height: 200)
        .background(enabled ? Color.blue : Color.red)
        .animation(nil)
        .foregroundColor(.white)
        .clipShape(RoundedRectangle(cornerRadius: enabled ? 60 : 0))
        .animation(.interpolatingSpring(stiffness: 10, damping: 1))
        
    }
}

struct Ex04_Previews: PreviewProvider {
    static var previews: some View {
        Ex04()
    }
}
