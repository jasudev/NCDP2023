//
//  RadioItemCheck.swift
//  NCDP23Presentation
//
//  Created by jasu on 2023/05/14.
//  Copyright (c) 2023 jasu All rights reserved.
//

import SwiftUI

struct RadioItemCheck<T: Hashable>: View {
    
    @EnvironmentObject private var value: RadioValue<T>
    private var tag: T?
    
    private var fillColor: Color
    private var strokeColor: Color
    private var selectedColor: Color
    
    private let size: CGFloat = 11
    
    var body: some View {
        ZStack(alignment: .center) {
            if tag == value.selection {
                Image(systemName: "checkmark.circle.fill")
                    .foregroundColor(selectedColor)
                    .frame(width: size, height: size)
                    .transition(.scale)
            } else {
                ZStack {
                    Circle()
                        .fill(fillColor)
                    Circle()
                        .stroke()
                        .fill(strokeColor)
                }
                .transition(.opacity)
            }
        }
        .frame(width: size * 2, height: size * 2)
        .animation(.easeInOut(duration: 0.2), value: value.selection)
    }
}

extension RadioItemCheck where T: Hashable {
    init(tag: T, fillColor: Color = Color.white.opacity(0.1), strokeColor: Color = .primaryLevel2, selectedColor: Color = Color.pointYellow) {
        self.tag = tag
        self.fillColor = fillColor
        self.strokeColor = strokeColor
        self.selectedColor = selectedColor
    }
}
