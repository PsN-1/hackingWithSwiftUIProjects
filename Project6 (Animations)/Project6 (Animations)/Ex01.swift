//
//  Ex01.swift
//  Project6 (Animations)
//
//  Created by Pedro Neto on 24/04/21.
//

import SwiftUI

struct Ex01: View {
    @State private var animationAmount: CGFloat = 1
    
    var body: some View {
        
        Button("Tap Me") {
            //            self.animationAmount += 0.25
        }
        .padding(50)
        .background(Color.red)
        .foregroundColor(.white)
        .clipShape(Circle())
        .overlay(
            Circle()
                .stroke(Color.red)
                .scaleEffect(animationAmount)
                .opacity(Double(2 - animationAmount))
                .animation(
                    Animation.easeInOut(duration: 1)
                        .repeatForever(autoreverses: false)
                )
        )
        .onAppear {
            self.animationAmount = 2
        }
        //        .scaleEffect(animationAmount)
        
        //        .blur(radius: (animationAmount - 1) * 3)
        //        .animation(.default)
        
        //        .animation(.easeOut)
        
        //        .animation(.interpolatingSpring(stiffness: 50, damping: 1))
        
        //        .animation(.easeInOut(duration: 2))
        
//        .animation(
//            Animation.easeInOut(duration: 1)
//                //                .delay(1)
//
//                //                .repeatCount(3, autoreverses: true)
//
//                .repeatForever(autoreverses: true)
//        )
    }
}

struct Ex01_Previews: PreviewProvider {
    static var previews: some View {
        Ex01()
    }
}
