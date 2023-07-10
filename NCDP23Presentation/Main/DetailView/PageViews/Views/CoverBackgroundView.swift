//
//  CoverBackgroundView.swift
//  NCDP23Presentation
//
//  Created by jasu on 2023/05/24.
//  Copyright (c) 2023 jasu All rights reserved.
//

import SwiftUI

struct CoverBackgroundView: View {
    
    var body: some View {
        GeometryReader { geo in
            VStack {
                HStack {
                    Spacer()
                    TitleIconEffectView(imageName: "N")
                        .scaleEffect(1.25)
                }
                .offset(x: geo.size.width * 0.1, y: -geo.size.height * 0.1)
                Spacer()
                HStack {
                    TitleIconEffectView(imageName: "C")
                        .scaleEffect(1.25)
                    Spacer()
                }
                .offset(x: -geo.size.width * 0.16, y: geo.size.height * 0.4)
            }
        }
    }
}

struct CoverBackgroundView_Previews: PreviewProvider {
    static var previews: some View {
        CoverBackgroundView()
    }
}
