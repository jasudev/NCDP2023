//
//  PGEndOfDocument.swift
//  NCDP23Presentation
//
//  Created by jasu on 2023/05/14.
//  Copyright (c) 2023 jasu All rights reserved.
//

import SwiftUI

struct PGEndOfDocument: View {
    
    @EnvironmentObject private var store: PContentStore
    var index: Binding<Int> {
        return $store.currentData.pageIndex
    }
    var indexValue: Int {
        return index.wrappedValue
    }
    
    @State private var step1: Bool = false
    
    var data: PModel {
        store.getDataByView(self)
    }
    
    var body: some View {
        content()
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .pagingOnKeyboardInput(index: index, maxIndex: 0)
            .onAppear {
                DispatchQueue.main.async {
                    step1 = true
                }
            }
            .onDisappear {
                step1 = false
            }
    }
    
    func content() -> some View {
        ZStack {
            VStack(spacing: 0) {
                Image("NC")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 150, height: 150)
                Text(data.title)
                    .setFont(sizeType: .description3, weight: .regular)
                    .foregroundColor(.level3)
                    .padding(.top, -10)
            }
            .opacity(step1 ? 1 : 0)
            .animation(.easeInOut(duration: 0.8), value: step1)
        }
    }
}

struct PGEndOfDocument_Previews: PreviewProvider {
    static var previews: some View {
        PGEndOfDocument()
            .modifier(PreviewModifier())
    }
}
