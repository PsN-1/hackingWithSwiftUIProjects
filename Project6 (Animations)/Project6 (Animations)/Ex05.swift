//
//  Ex05.swift
//  Project6 (Animations)
//
//  Created by Pedro Neto on 24/04/21.
//

import SwiftUI

struct Ex05: View {
    @State private var dragAmount = CGSize.zero
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.yellow, .red]), startPoint: .topLeading, endPoint: .bottomTrailing)
                .frame(width: 300, height: 200)
                .clipShape(RoundedRectangle(cornerRadius: 10))
            
            Text("Drag Me")
                .font(.title)
                .foregroundColor(.white)
        }
        
        .offset(dragAmount)
        .gesture(
            DragGesture()
                .onChanged { self.dragAmount = $0.translation }
                .onEnded { _ in
                    withAnimation(.spring()) {
                        self.dragAmount = .zero
                    }
                }
        )
    }
}

struct Ex05_Previews: PreviewProvider {
    static var previews: some View {
        Ex05()
    }
}
