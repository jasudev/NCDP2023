//
//  PGStartCover.swift
//  NCDP23Presentation
//
//  Created by jasu on 2023/05/14.
//  Copyright (c) 2023 jasu All rights reserved.
//

import SwiftUI

struct PGStartCover: View {
    
    @EnvironmentObject private var store: PContentStore
    var index: Binding<Int> {
        return $store.currentData.pageIndex
    }
    var indexValue: Int {
        return index.wrappedValue
    }
    
    var data: PModel {
        store.getDataByView(self)
    }
    
    var body: some View {
        ZStack {
            Color.clear
                .overlay {
                    CoverBackgroundView()
                }
            content()
                .padding(.vertical, 50)
                .padding(.horizontal, 30)
        }
        .pagingOnKeyboardInput(index: index, maxIndex: 0)
    }
    
    func content() -> some View {
        VStack(alignment: .leading) {
            HStack {
                Image("NCDPGLogo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 160)
                    .foregroundColor(Color.white)
                Spacer()
            }
            Spacer()
            HStack {
                VStack(alignment: .leading, spacing: 8) {
                    Spacer()
                    Spacer()
                    VStack(alignment: .leading, spacing: 0) {
                        Text(data.title)
                            .setFont(sizeType: .title, weight: .bold)
                            .foregroundColor(.pointYellow)
                        Text("\(data.subtitle)") { string in
                            string.foregroundColor = .level1
                            if let range = string.range(of: "SwiftUI") { /// here!
                                string[range].foregroundColor = .pointYellow
                            }
                        }
                        .setFont(sizeType: .subtitle, weight: .semibold)
                    }
                    Text("- C&E Center/nano개발실/모바일 개발팀 - 노경섭")
                        .setFont(sizeType: .description2, weight: .regular)
                        .foregroundColor(.level3)
                        .padding(.top, 30)
                    Spacer()
                    Spacer()
                    Spacer()
                }
                Spacer()
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
    
    @ViewBuilder
    private func prefixView() -> some View {
        let size: CGFloat =  3
        HStack(spacing: 0) {
            Rectangle()
                .frame(width: size)
            VStack(spacing: 0) {
                Rectangle()
                    .frame(height: size)
                Spacer()
                Rectangle()
                    .frame(height: size)
            }
        }
        .frame(width: 30, height: 130)
        .padding(.leading, 4)
    }
}

struct PGStartCover_Previews: PreviewProvider {
    static var previews: some View {
        PGStartCover()
            .modifier(PreviewModifier())
    }
}
