//
//  GeometryReader.swift
//  Project8 (Moonshot)
//
//  Created by Pedro Neto on 05/06/21.
//

import SwiftUI

struct GeometryReaderView: View {
    var body: some View {
        VStack {
            GeometryReader { geo in
                Image("Example")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: geo.size.width)
            }
        }
    }
}

struct GeometryReaderView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
