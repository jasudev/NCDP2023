//
//  NCDP23Presentation.swift
//  NCDP23Presentation
//
//  Created by jasu on 2023/05/14.
//  Copyright (c) 2023 jasu All rights reserved.
//

import SwiftUI

@main
struct NCDP23Presentation: App {
    
    @StateObject var store = PContentStore.shared
    
    var body: some Scene {
        WindowGroup("NCDP23 for SwiftUI") {
            ContentView()
                .environmentObject(store)
        }
        WindowGroup("NCDP23 for SwiftUI Script", id: "Script") {
            if store.contentSize != .zero {
                ScriptView()
                    .environmentObject(store)
            }
        }
    }
}
