//
//  Ex02.swift
//  Project6 (Animations)
//
//  Created by Pedro Neto on 24/04/21.
//

import SwiftUI

struct Ex02: View {
    @State var animationAmount: CGFloat = 1
    
    var body: some View {
        print(animationAmount)
        
        return VStack {
            Stepper("Scale amount", value: $animationAmount.animation(
                Animation.easeInOut(duration: 1)
                    .repeatCount(3, autoreverses: true)
            ), in: 1...10)
            
            Spacer()
            
            Button("Tap Me") {
                self.animationAmount += 1
            }
            .padding(40)
            .background(Color.red)
            .foregroundColor(.white)
            .clipShape(Circle())
            .scaleEffect(animationAmount)
        }
    }
}

struct Ex02_Previews: PreviewProvider {
    static var previews: some View {
        Ex02()
    }
}
