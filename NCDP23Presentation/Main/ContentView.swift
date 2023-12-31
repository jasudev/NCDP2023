//
//  ContentView.swift
//  NCDP23Presentation
//
//  Created by jasu on 2023/05/14.
//  Copyright (c) 2023 jasu All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject private var store: PContentStore
    
    var body: some View {
        GeometryReader { _ in
            ZStack(alignment: .topLeading) {
                if #available(macOS 13.0, *) {
                    store.backgroundColor
                        .modifier(OpenScriptWindowModifier())
                } else {
                    store.backgroundColor
                }
                
                HStack(spacing: 0) {
                    SideListView()
                        .frame(width: store.isShowSideBar ? LIST_SIDE_BAR_WIDTH : MINI_SIDE_BAR_WIDTH)
                        .zIndex(1)
                    DetailView()
                        .takeFrame(onChange: { rect in
                            store.contentSize = CGSize(width: rect.size.width - PADDING_HORIZONTAL * 2, height: rect.size.height - PADDING_VERTICAL * 2)
                        })
                        .id(store.currentData.id)
                }
                .navigationTitle(Text("NCDP 2023 for SwiftUI"))
            }
        }
        .frame(minWidth: MIN_FULLSCREEN_SIZE.width, minHeight: MIN_FULLSCREEN_SIZE.height)
        .takeFrame(onChange: { rect in
            store.screenSize = rect.size
        })
        .addCustomHotkeys(
            [
                HotkeyCombination(keyBase: [], key: .kVK_ANSI_O) {
                    withAnimation(.easeInOut) {
                        store.isShowSideBar.toggle()
                    }
                },
                HotkeyCombination(keyBase: [], key: .kVK_ANSI_S) {
                    if let id = store.flattenedDatas.first?.id {
                        store.currentId = id
                    }
                },
                HotkeyCombination(keyBase: [], key: .kVK_ANSI_E) {
                    if let id = store.flattenedDatas.last?.id {
                        store.currentId = id
                    }
                }
            ]
        )
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .modifier(PreviewModifier())
    }
}
