//
//  FontViewModifier.swift
//  NCDP23Presentation
//
//  Created by jasu on 2023/05/14.
//  Copyright (c) 2023 jasu All rights reserved.
//

import SwiftUI

enum FontSizeType: CGFloat {
    case title = 60
    case subtitle = 42
    case subtitle2 = 36
    case description1 = 32
    case description2 = 26
    case description3 = 22
    case caption1 = 18
    case caption2 = 16
    case caption3 = 14
}

enum FontWeightType: String {
    case bold = "NotoSansKR-Bold"
    case semibold = "NotoSansKR-Medium"
    case regular = "NotoSansKR-Regular"
}

struct FontViewModifier: ViewModifier {
    
    let sizeType: FontSizeType
    let weight: FontWeightType
    
    func body(content: Content) -> some View {
        content
            .font(.custom(weight.rawValue, size: sizeType.rawValue))
            .offset(y: -2)
    }
}

extension View {
    func setFont(sizeType: FontSizeType, weight: FontWeightType) -> some View {
        return self.modifier(FontViewModifier(sizeType: sizeType, weight: weight))
    }
}

struct FontViewModifier_Previews: PreviewProvider {
    static let text: String = "Q&A / 현재와 미래를 엿보다"
    static var previews: some View {
        VStack {
            Text(text)
                .setFont(sizeType: .title, weight: .bold)
            Text(text)
                .setFont(sizeType: .title, weight: .semibold)
            Text(text)
                .setFont(sizeType: .title, weight: .regular)
        }
        .modifier(PreviewModifier())
    }
}
