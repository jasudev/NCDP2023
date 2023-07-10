//
//  RadioValue.swift
//  NCDP23Presentation
//
//  Created by jasu on 2023/05/14.
//  Copyright (c) 2023 jasu All rights reserved.
//

import SwiftUI

class RadioValue<T: Hashable>: ObservableObject {
    typealias TapReceiveAction = (T?) -> Void
    
    @Binding var selection: T?
    var onTapReceive: (TapReceiveAction)?
    
    init(selection: Binding<T?>, onTapReceive: (TapReceiveAction)? = nil) {
        _selection = selection
        self.onTapReceive = onTapReceive
    }
}
