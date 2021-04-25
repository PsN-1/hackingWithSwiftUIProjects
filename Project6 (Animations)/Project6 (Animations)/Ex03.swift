//
//  Ex03.swift
//  Project6 (Animations)
//
//  Created by Pedro Neto on 24/04/21.
//

import SwiftUI

struct Ex03: View {
    @State private var animationAmount = 0.0
    
    var body: some View {
        Button("Tap Me") {
            withAnimation(.interpolatingSpring(stiffness: 5, damping: 1)) {
                self.animationAmount += 360
            }
        }
        .padding(50)
        .background(Color.red)
        .foregroundColor(.white)
        .clipShape(Circle())
        .rotation3DEffect(.degrees(animationAmount), axis: (x: 0, y: 1, z: 0))
    }
}

struct Ex03_Previews: PreviewProvider {
    static var previews: some View {
        Ex03()
    }
}
