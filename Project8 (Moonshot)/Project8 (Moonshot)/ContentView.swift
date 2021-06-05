//
//  ContentView.swift
//  Project8 (Moonshot)
//
//  Created by Pedro Neto on 05/06/21.
//

import SwiftUI



struct ContentView: View {
    let astronauts: [Astronaut] = Bundle.main.decode("astronauts.json")
    let missions: [Mission] = Bundle.main.decode("missions.json")
    
    @State private var isShowingDate = true
    
    var body: some View {
        NavigationView {
            List(missions) { mission in
                NavigationLink(destination: MissionView(mission: mission, astronauts: self.astronauts)) {
                    Image(mission.image)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 44, height: 44)
                    
                    VStack(alignment: .leading) {
                        Text(mission.displayName)
                            .font(.headline)
                        
                        if isShowingDate {
                            Text(mission.formattedLaunchDate)
                        } else {
                            HStack {
                                let member = mission.crew
                                Text("\(member[0].name.firstLetterUpper()), \(member[1].name.firstLetterUpper()), \(member[2].name.firstLetterUpper())")
//                                ForEach(0..<mission.crew.count) {
//                                    Text("\(mission.crew[$0].name) ")
//                                }
                            }
                        }
                    }
                }
            }
            .navigationBarTitle("Moonshot")
            .navigationBarItems(leading:
                                    Button(action: {
                                        isShowingDate.toggle()
                                    }, label: {
                                        Text(isShowingDate ? "show crew members" : "Show launch date")
                                    })
            )
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

extension String {
    func firstLetterUpper() -> String {
        return prefix(1).capitalized + dropFirst()
    }

    mutating func capitalizeFirstLetter() {
        self = self.firstLetterUpper()
    }
}
