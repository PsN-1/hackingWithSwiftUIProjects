//
//  Ex06.swift
//  Project6 (Animations)
//
//  Created by Pedro Neto on 25/04/21.
//

import SwiftUI

struct Ex06: View {
    let letters = Array("Hello SwiftUI")
    @State private var enabled = false
    @State private var dragAmount = CGSize.zero
    
    var body: some View {
        HStack(spacing: 0) {
            ForEach(0..<letters.count) { num in
                Text(String(self.letters[num]))
                    .padding(5)
                    .font(.title)
                    .background(self.enabled ? Color.blue : Color.red)
                    .offset(self.dragAmount)
                    .animation(Animation.default.delay(Double(num) / 20))
            }
        }
        .gesture(
        DragGesture()
            .onChanged { self.dragAmount = $0.translation }
            .onEnded { _ in
                self.dragAmount = .zero
                self.enabled.toggle()
            }
        )
    }
}

struct Ex06_Previews: PreviewProvider {
    static var previews: some View {
        Ex06()
    }
}
