//
//  PModel.swift
//  NCDP23Presentation
//
//  Created by jasu on 2023/05/14.
//  Copyright (c) 2023 jasu All rights reserved.
//

import SwiftUI

enum DepthType {
    case section
    case subsection
    case hidden
}

class PModel: Identifiable, Equatable {
    
    var id: Int = 0
    var parent: PModel?
    let depth: DepthType
    let title: String
    let subtitle: String
    let view: PWrapperView
    let children: [PModel]
    var pageIndex: Int = 0
    var script: PScriptModel
    
    public init(depth: DepthType = .subsection,
                title: String,
                subtitle: String = "", view: PWrapperView,
                pageIndex: Int = 0,
                script: PScriptModel = .dummy(),
                children: [PModel] = []) {
        self.depth = depth
        self.title = title
        self.subtitle = subtitle
        self.view = view
        self.script = script
        self.children = children
    }
    
    static func dummy() -> PModel {
        let data = PModel(depth: .subsection,
                          title: "타이틀",
                          subtitle: "서브타이틀",
                          view: PWrapperView(Text("Text")),
                          script: PScriptModel.dummy())
        data.id = 0
        return data
    }
    
    static func == (lhs: PModel, rhs: PModel) -> Bool {
        lhs.id == rhs.id
    }
}
