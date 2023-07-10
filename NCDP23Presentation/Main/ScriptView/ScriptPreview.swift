//
//  ScriptPreview.swift
//  NCDP23Presentation
//
//  Created by jasu on 2023/06/19.
//  Copyright (c) 2023 jasu All rights reserved.
//

import SwiftUI

struct ScriptPreview: View {
    
    @EnvironmentObject private var store: PContentStore
    
    @Binding var scale: Double
    @Binding var size: CGSize
    @Binding var enableAnimation: Bool
    
    var body: some View {
        GeometryReader { geo in
            ZStack(alignment: .topLeading) {
                store.backgroundColor
                HStack(spacing: 0) {
                    SideListView()
                        .frame(width: store.isShowSideBar ? LIST_SIDE_BAR_WIDTH : MINI_SIDE_BAR_WIDTH)
                        .zIndex(1)
                    DetailView()
                }
            }
            .onChange(of: geo.size, perform: { newSize in
                size = newSize
                scale = newSize.width / store.screenSize.width
            })
            .frame(width: store.screenSize.width, height: store.screenSize.height)
            .scaleEffect(scale, anchor: .topLeading)
        }
        .frame(height: store.screenSize.height * scale, alignment: .topLeading)
        .animationsDisabled(!enableAnimation)
    }
}

struct ScriptPreview_Previews: PreviewProvider {
    static var previews: some View {
        ScriptPreview(scale: .constant(0.5), size: .constant(CGSize(width: 300, height: 260)), enableAnimation: .constant(true))
    }
}
