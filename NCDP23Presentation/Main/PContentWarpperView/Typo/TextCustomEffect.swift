//
//  TextCustomEffect.swift
//  NCDP23Presentation
//
//  Created by jasu on 2023/05/14.
//  Copyright (c) 2023 jasu All rights reserved.
//

import SwiftUI
import AnimateText

public struct TextCustomEffect: ATTextAnimateEffect {
    
    public var data: ATElementData
    public var userInfo: Any?
    
    public init(_ data: ATElementData, _ userInfo: Any?) {
        self.data = data
        self.userInfo = userInfo
    }
    
    public func body(content: Content) -> some View {
        content
            .modifier(ATRandomTypoAnimationCustom(data, randomTextColor: Color.primaryLevel2.opacity(0.6)))
            .offset(x: 4 * data.invValue, y: 0)
            .animation(.spring(response: 0.32, dampingFraction: 0.7, blendDuration: 0.5).delay(Double(data.index) * 0.02), value: data.value)
    }
}

struct TextCustomEffect_Previews: PreviewProvider {
    static var previews: some View {
        ATAnimateTextPreview<ATRandomTypoEffect>()
            .modifier(PreviewModifier())
    }
}
