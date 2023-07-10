//
//  PGIntroduction2.swift
//  NCDP23Presentation
//
//  Created by jasu on 2023/05/14.
//  Copyright (c) 2023 jasu All rights reserved.
//

import SwiftUI

struct PGIntroduction2: View {
    
    @EnvironmentObject private var store: PContentStore
    var index: Binding<Int> {
        return $store.currentData.pageIndex
    }
    var indexValue: Int {
        return index.wrappedValue
    }
    
    @State private var fileName: String = ""
    
    var body: some View {
        content()
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .pagingOnKeyboardInput(index: index, maxIndex: 12)
    }
    
    private func content() -> some View {
        VStack(alignment: .leading) {
            
            NumberedFocusableTextView(index: index, startIndex: 1, titles: [
                "명령형 프로그래밍 → 무엇을 어떻게 할 것인가",
                "선언형 프로그래밍 → 무엇을 할 것인가"
            ], select: indexValue >= 6 ? .description1 : .title, normal: .description1, prefix: "●")
            
            if indexValue >= 3 {
                aboveIndex3()
                    .padding(.top, 36)
                    .transition(.asymmetric(insertion: .move(edge: .bottom), removal: .opacity).combined(with: .opacity))
                
                ZStack {
                    if indexValue >= 9 {
                        HStack(spacing: 40) {
                            iconTitleView(title: "Jetpark Compose", icon: "JetpackCompose")
                            if indexValue >= 10 {
                                iconTitleView(title: "React Native", icon: "ReactNative")
                                    .transition(.scale.combined(with: .opacity))
                            }
                            if indexValue >= 11 {
                                iconTitleView(title: "Flutter", icon: "Flutter")
                                    .transition(.scale.combined(with: .opacity))
                            }
                            if indexValue >= 12 {
                                iconTitleView(title: "Xamarin.Forms", icon: "Xamarin")
                                    .transition(.scale.combined(with: .opacity))
                            }
                        }
                        .frame(height: 100)
                        .transition(.scale.combined(with: .opacity))
                    }
                }
                .frame(maxWidth: .infinity)
                
            }
        }
    }
    
    private func aboveIndex3() -> some View {
        Rectangle()
            .hidden()
            .overlay {
                if indexValue == 3 {
                    HStack(spacing: 20) {
                        CodeView(fileName: .constant("Code_imperative"), fontSize: 22)
                            .roundedTitleLine("명령형 프로그래밍 (Imperative)", showLine: true, padding: 1, color: Color.red)
                        CodeView(fileName: .constant("Code_declarative"), fontSize: 22)
                            .roundedTitleLine("선언형 프로그래밍 (Declarative)", showLine: true, padding: 1, color: Color.blue)
                            .frame(maxWidth: .infinity)
                    }
                    .transition(.move(edge: .bottom).combined(with: .opacity))
                }
                if indexValue == 4 {
                    HStack(spacing: 20) {
                        CodeView(fileName: .constant("Code_uikit"))
                            .roundedTitleLine("명령형 프로그래밍 (Imperative)", showLine: true, padding: 1, color: Color.red)
                        CodeView(fileName: .constant("Code_swiftui"))
                            .roundedTitleLine("선언형 프로그래밍 (Declarative)", showLine: true, padding: 1, color: Color.blue)
                            .frame(maxWidth: .infinity)
                        SampleListView()
                            .padding(.top, 16)
                            .roundedTitleLine("결과물", showLine: true)
                    }
                    .transition(.asymmetric(insertion: .move(edge: .bottom).combined(with: .opacity), removal: .opacity))
                }
                if indexValue >= 6 {
                    aboveIndex5()
                }
            }
            .frame(height: store.contentSize.height * 0.5)
    }
    
    private func aboveIndex5() -> some View {
        HStack {
            Spacer()
            if indexValue >= 6 {
                FoldedShapeTitleSetView(data: TitleSetData(title: "명령형 - HOW", subtitle: "저기 창가에 두 자리가 비었네요. 저 자리로 걸어가서 앉을게요."), size: CGSize(width: 230, height: 240))
                    .frame(maxWidth: 400)
                    .transition(.move(edge: .trailing).combined(with: .opacity))
            }
            if indexValue >= 8 {
                VStack {
                    Text("명령형: 알고리즘을 구현하고 목표 X\n선언형: 목표를 명시하고 알고리즘은 캡슐화")
                        .setFont(sizeType: .description2, weight: .regular)
                        .foregroundColor(Color.primaryLevel1)
                        .padding(.top, 16)
                        .frame(maxWidth: 550)
                        .roundedTitleLine("명령형 vs. 선언형")
                }
                .transition(.scale.combined(with: .opacity))
            }
            if indexValue >= 7 {
                FoldedShapeTitleSetView(data: TitleSetData(title: "선언형 - WHAT", subtitle: "두 명 앉을 자리 부탁해요."), size: CGSize(width: 230, height: 240))
                    .frame(maxWidth: 400)
                    .transition(.move(edge: .trailing).combined(with: .opacity))
            }
            Spacer()
        }
        .setFont(sizeType: .description2, weight: .semibold)
        .foregroundColor(.level1)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .transition(.scale(scale: 1, anchor: .bottom).combined(with: .opacity))
    }
    
    private func iconTitleView(title: String, icon: String) -> some View {
        HStack {
            Image(icon)
                .resizable()
                .scaledToFit()
                .frame(width: 50, height: 50)
            Text(title)
                .setFont(sizeType: .description3, weight: .semibold)
        }
    }
}

private struct SampleListView: View {
    
    private var habits = ["🏊‍♂️ Swim 5k", "🧘 Meditate", "📖 Read a chapter", "👨‍💻 Complete 2 leetcodes"]
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 8) {
                ForEach(habits, id: \.self) { habit in
                    Text(habit)
                        .setFont(sizeType: .description3, weight: .semibold)
                }
            }
        }
    }
}

struct PGIntroduction2_Previews: PreviewProvider {
    static var previews: some View {
        PGIntroduction2()
            .modifier(PreviewModifier())
    }
}
