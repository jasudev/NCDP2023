//
//  RadioItem.swift
//  NCDP23Presentation
//
//  Created by jasu on 2023/05/14.
//  Copyright (c) 2023 jasu All rights reserved.
//

import SwiftUI

struct RadioItem<T: Hashable>: View {
    
    @EnvironmentObject private var value: RadioValue<T>
    private var tag: T?
    
    private var fillColor: Color
    private var strokeColor: Color
    private var selectedColor: Color
    
    private let size: CGFloat = 12
    
    var body: some View {
        ZStack(alignment: .center) {
            Circle()
                .fill(fillColor)
            Circle()
                .stroke()
                .fill(strokeColor)
            if tag == value.selection {
                Circle()
                    .fill(selectedColor)
                    .frame(width: size, height: size)
                    .transition(.scale)
            }
        }
        .frame(width: size * 2, height: size * 2)
        .animation(.easeInOut(duration: 0.2), value: value.selection)
    }
}

extension RadioItem where T: Hashable {
    init(tag: T, fillColor: Color = Color.white.opacity(0.1), strokeColor: Color = .primaryLevel2, selectedColor: Color = Color.pointYellow) {
        self.tag = tag
        self.fillColor = fillColor
        self.strokeColor = strokeColor
        self.selectedColor = selectedColor
    }
}
