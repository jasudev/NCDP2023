//
//  PGChallenge2.swift
//  NCDP23Presentation
//
//  Created by jasu on 2023/05/14.
//  Copyright (c) 2023 jasu All rights reserved.
//

import SwiftUI

struct PGChallenge2: View {
    
    @Namespace var animation
    @EnvironmentObject private var store: PContentStore
    var index: Binding<Int> {
        return $store.currentData.pageIndex
    }
    var indexValue: Int {
        return index.wrappedValue
    }
    
    let imageNames = [["UINC1", "UINC2", "UINC3", "UINC4"],
                      ["UINC5", "UINC6", "UINC7", "UINC8"],
                      ["UINC9", "UINC10", "UINC11", "UINC12"],
                      ["UINC13", "UINC14", "UINC15", "UINC16"],
                      ["FlickrSearcher1", "FlickrSearcher2", "FlickrSearcher3", "FlickrSearcher4"]]
    
    var flattenedImageNames: [String] {
        imageNames.flatMap { $0 }
    }
    
    @State private var currentImageName: String?
    
    var body: some View {
        content()
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .pagingOnKeyboardInput(index: index, maxIndex: 27)
    }
    
    @ViewBuilder
    private func content() -> some View {
        ZStack {
            HStack {
                if indexValue == 0 || indexValue == 21 || indexValue >= 24 {
                    gridThumbnail()
                        .padding(.trailing, 36)
                        .zIndex(1)
                        .transition(.opacity)
                } else {
                    if let currentImageName = currentImageName {
                        imageView(currentImageName)
                    }
                }
                if indexValue >= 25 {
                    Image(systemName: "arrow.right")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 40)
                        .foregroundColor(Color.primaryLevel3)
                        .padding(.trailing, 36)
                        .transition(.move(edge: .leading).combined(with: .opacity))
                    imageView("Cyword\(indexValue - 24)", width: 950, isApplyEffect: false)
                        .id(UUID())
                        .transition(.move(edge: .trailing).combined(with: .opacity))
                }
            }
        }
        .onChange(of: indexValue) { idx in
            if idx > 0 && idx <= flattenedImageNames.count {
                currentImageName = flattenedImageNames[idx - 1]
            } else {
                currentImageName = nil
            }
            
            if idx == 22 {
                store.videoFileName = "FlashVideo1"
            } else if idx == 23 {
                store.videoFileName = "FlashVideo2"
            } else {
                store.videoFileName = nil
            }
        }
        .onDisappear {
            store.videoFileName = nil
        }
    }
    
    @ViewBuilder
    private func gridThumbnail() -> some View {
        let spacing: CGFloat = 8
        VStack(spacing: spacing) {
            ForEach(0..<imageNames.count, id: \.self) { i in
                HStack(spacing: spacing) {
                    ForEach(0..<imageNames[i].count, id: \.self) { j in
                        ZStack {
                            if currentImageName == imageNames[i][j] {
                                Rectangle()
                                    .fill(Color.clear)
                                    .frame(width: 100, height: 65)
                            } else {
                                imageView(imageNames[i][j], width: 100)
                            }
                        }
                    }
                }
            }
        }
    }
    
    @ViewBuilder
    private func imageView(_ name: String, width: CGFloat? = nil, isApplyEffect: Bool = true) -> some View {
        if isApplyEffect {
            Image(name)
                .resizable()
                .scaledToFit()
                .matchedGeometryEffect(id: name, in: animation)
                .frame(maxWidth: width ?? .infinity)
        } else {
            Image(name)
                .resizable()
                .scaledToFit()
                .frame(maxWidth: width ?? .infinity)
        }
    }
}

struct PGChallenge2_Previews: PreviewProvider {
    static var previews: some View {
        PGChallenge2()
            .modifier(PreviewModifier())
    }
}
