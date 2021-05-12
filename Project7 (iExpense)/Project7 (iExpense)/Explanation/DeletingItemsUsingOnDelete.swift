//
//  DeletingItemsUsingOnDelete.swift
//  Project7 (iExpense)
//
//  Created by Pedro Neto on 12/05/21.
//

import SwiftUI

struct DeletingItemsUsingOnDelete: View {
    @State private var numbers = [Int]()
    @State private var currentNumber = 1
    
    var body: some View {
        NavigationView{
            VStack {
                List{
                    ForEach(numbers, id: \.self){
                        Text("\($0)")
                    }
                    .onDelete(perform: removeRows)
                }
                
                Button("Add Number") {
                    self.numbers.append(self.currentNumber)
                    self.currentNumber += 1
                }
            }
            .navigationBarItems(leading: EditButton())
        }
        
    }
    
    func removeRows(at offsets: IndexSet) {
        numbers.remove(atOffsets: offsets)
    }
}

struct DeletingItemsUsingOnDelete_Previews: PreviewProvider {
    static var previews: some View {
        DeletingItemsUsingOnDelete()
    }
}
