//
//  PGQuestionAnswer.swift
//  NCDP23Presentation
//
//  Created by jasu on 2023/05/24.
//  Copyright (c) 2023 jasu All rights reserved.
//

import SwiftUI
import AnimateText

struct PGQuestionAnswer: View {
    
    @EnvironmentObject private var store: PContentStore
    var index: Binding<Int> {
        return $store.currentData.pageIndex
    }
    var indexValue: Int {
        return index.wrappedValue
    }

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
                Text("Q&A")
                    .setFont(sizeType: .title, weight: .semibold)
                    .foregroundColor(.level1)
                    .padding(.leading, PADDING_HORIZONTAL)
                Spacer()
            }
        }
    }
}

struct PGQuestionAnswer_Previews: PreviewProvider {
    static var previews: some View {
        PGQuestionAnswer()
            .modifier(PreviewModifier())
    }
}
