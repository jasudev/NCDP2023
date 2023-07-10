//
//  KeyboardPagingModifier.swift
//  NCDP23Presentation
//
//  Created by jasu on 2023/05/14.
//  Copyright (c) 2023 jasu All rights reserved.
//

import SwiftUI

struct KeyboardPagingModifier: ViewModifier {
    
    @EnvironmentObject private var store: PContentStore
    @Binding var index: Int
    let maxIndex: Int
    @State private var isShowIndicator: Bool = false
    
    func body(content: Content) -> some View {
        VStack(alignment: .trailing) {
            PageIndicatorView(index: $index, maxIndex: maxIndex)
                .opacity(isShowIndicator ? 1 : 0)
                .animation(.easeInOut, value: isShowIndicator)
            Spacer()
            content
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                self.isShowIndicator = true
            }
        }
        .animation(ANIMATION_CONTENT_LEVEL3, value: index)
        .addCustomHotkeys([
            HotkeyCombination(keyBase: [], key: .kVK_LeftArrow) {
                prev()
            },
            HotkeyCombination(keyBase: [], key: .kVK_RightArrow) {
                next()
            },
            HotkeyCombination(keyBase: [], key: .kVK_Return) {
                next()
            }
        ])
    }
    
    private func prev() {
        guard maxIndex != 0 else {
            store.setPrevID()
            return
        }
        
        if index == 0 {
            store.setPrevID()
        } else {
            if index > 0 {
                index -= 1
            }
        }
    }
    
    private func next() {
        guard maxIndex != 0 else {
            store.setNextID()
            return
        }
        
        if index == maxIndex {
            store.setNextID()
        } else {
            if index < maxIndex {
                index += 1
            }
        }
    }
}

extension View {
    func pagingOnKeyboardInput(index: Binding<Int>, maxIndex: Int) -> some View {
        modifier(KeyboardPagingModifier(index: index, maxIndex: maxIndex))
    }
}
