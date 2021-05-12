//
//  MainMenu.swift
//  Project7 (iExpense)
//
//  Created by Pedro Neto on 11/05/21.
//

import SwiftUI

struct Screen {
    let title: String
    let view: AnyView
    
    init(_ title: String, _ view: AnyView) {
        self.title = title
        self.view = view
    }
}

struct MainMenu: View {
    
    var views = [
        Screen("StateAndObservedObject", AnyView(StateAndObservedObject())),
        Screen("ShowingAndHidindViews", AnyView(ShowingAndHidindViews())),
        Screen("DeletingItemsUsingOnDelete", AnyView(DeletingItemsUsingOnDelete())),
        Screen("StoreAtUserDefaults",AnyView(StoreAtUserDefaults())),
        Screen("ArchingWithCodable", AnyView(ArchivingWithCodable())),
        Screen("iExpense", AnyView(iExpense())),
    ]
    
    
    
    var body: some View {
    
        NavigationView{
            List(0..<views.count) {
                NavigationLink("\(views[$0].title)", destination: views[$0].view)
            }
            .navigationTitle("iExpense")
        }
    }
}


