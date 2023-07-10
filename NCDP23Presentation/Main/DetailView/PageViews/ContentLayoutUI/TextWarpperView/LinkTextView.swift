//
//  LinkTextView.swift
//  NCDP23Presentation
//
//  Created by jasu on 2023/06/02.
//  Copyright (c) 2023 jasu All rights reserved.
//

import SwiftUI

struct LinkTextView: View {
    
    let title: String
    let path: String
    
    init (_ title: String, path: String) {
        self.title = title
        self.path = path
    }
    
    var body: some View {
        if let url = URL(string: path) {
            Link(destination: url) {
                Text(title)
                    .underline(true)
            }
        }
    }
}

struct LinkTextView_Previews: PreviewProvider {
    static var previews: some View {
        LinkTextView("애플 사이트", path: "https://www.apple.com")
            .foregroundColor(Color.blue)
            .padding()
    }
}
