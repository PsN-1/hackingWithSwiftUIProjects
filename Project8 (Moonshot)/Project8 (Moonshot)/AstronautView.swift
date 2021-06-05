//
//  AstronautView.swift
//  Project8 (Moonshot)
//
//  Created by Pedro Neto on 05/06/21.
//

import SwiftUI

struct AstronautView: View {
    let astronaut: Astronaut
    
    var AstronautMissions: [String]  {
        let missions: [Mission] = Bundle.main.decode("missions.json")
        var matches = [String]()
        
        for mission in missions {
            for astronauts in mission.crew {
                if astronauts.name == self.astronaut.id {
                    matches.append(mission.displayName)
                }
            }
        }
        
        return matches
    }
    
    var body: some View {
        GeometryReader { geometry in
            ScrollView(.vertical) {
                VStack {
                    Image(self.astronaut.id)
                        .resizable()
                        .scaledToFit()
                        .frame(width: geometry.size.width)
                    
                    Text(self.astronaut.description)
                        .padding()
                        .layoutPriority(1)
                    
                    Text("Missions: ")
                        .font(.headline)
                    
                    ForEach(0..<AstronautMissions.count) {
                        Text("\(AstronautMissions[$0])")
                    }
                    .padding()
                }
            }
        }
        .navigationBarTitle(Text(astronaut.name), displayMode: .inline)
    }
}

struct AstronautView_Previews: PreviewProvider {
    static let astronauts: [Astronaut] = Bundle.main.decode("astronauts.json")
    static var previews: some View {
        AstronautView(astronaut: astronauts[0])
    }
}
