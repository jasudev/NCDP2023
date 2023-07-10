//
//  PG_End.swift
//  NCDP23Presentation
//
//  Created by jasu on 2023/06/21.
//  Copyright (c) 2023 jasu All rights reserved.
//

import SwiftUI
import AnimateText

struct PGEnd: View {
    
    @EnvironmentObject private var store: PContentStore
    var index: Binding<Int> {
        return $store.currentData.pageIndex
    }
    var indexValue: Int {
        return index.wrappedValue
    }
    
    @State private var text: String = ""

    var body: some View {
        content()
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(
                CoverBackgroundView()
            )
            .pagingOnKeyboardInput(index: index, maxIndex: 0)
    }
    
    func content() -> some View {
        ZStack {
            HStack(spacing: 0) {
                AnimateText<TextCustomEffect>($text, type: .letters)
                    .setFont(sizeType: .title, weight: .semibold)
                    .foregroundColor(.level1)
                    .padding(.leading, PADDING_HORIZONTAL)
                Spacer()
            }
        }
        .onAppear {
            DispatchQueue.main.async {
                text = "시간을 내주셔서 감사합니다. 😊"
            }
        }
    }
}

struct PGEnd_Previews: PreviewProvider {
    static var previews: some View {
        PGEnd()
            .modifier(PreviewModifier())
    }
}
