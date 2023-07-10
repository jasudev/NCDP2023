//
//  RadioComponent.swift
//  NCDP23Presentation
//
//  Created by jasu on 2023/05/14.
//  Copyright (c) 2023 jasu All rights reserved.
//

import SwiftUI

struct RadioComponent<T: Hashable, Content: View>: View {
    
    private let value: RadioValue<T>
    private let content: () -> Content
    
    var body: some View {
        content()
            .environmentObject(value)
    }
}

extension RadioComponent where T: Hashable, Content: View {
    init(selection: Binding<T?>, @ViewBuilder _ content: @escaping () -> Content) {
        self.value = RadioValue(selection: selection)
        self.content = content
    }
    
    init(selection: Binding<T?>, @ViewBuilder _ content: @escaping () -> Content, onTapReceive: ((T?) -> Void)?) {
        self.value = RadioValue(selection: selection, onTapReceive: onTapReceive)
        self.content = content
    }
}
