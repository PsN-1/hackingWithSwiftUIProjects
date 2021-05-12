//
//  ArchingWithCodable.swift
//  Project7 (iExpense)
//
//  Created by Pedro Neto on 12/05/21.
//

import SwiftUI

struct UserCodable : Codable {
    var firstName: String
    var lastName: String
}

struct ArchivingWithCodable: View {
    @State private var user = UserCodable(firstName: "Taylor", lastName: "Swift")
    var body: some View {
        Button("Save User") {
            let encoder = JSONEncoder()
            
            if let data = try? encoder.encode(self.user) {
                UserDefaults.standard.set(data, forKey: "UserData")
            }
        }
    }
}

struct ArchingWithCodable_Previews: PreviewProvider {
    static var previews: some View {
        ArchivingWithCodable()
    }
}
