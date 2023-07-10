//
//  PGIntroduction4.swift
//  NCDP23Presentation
//
//  Created by jasu on 2023/05/14.
//  Copyright (c) 2023 jasu All rights reserved.
//

import SwiftUI
import SDWebImageSwiftUI

struct PGIntroduction4: View {
    
    @EnvironmentObject private var store: PContentStore
    var index: Binding<Int> {
        return $store.currentData.pageIndex
    }
    var indexValue: Int {
        return index.wrappedValue
    }
    
    let items = [
        TitleSetData(title: "선언적 구문",
                     subtitle: "SwiftUI는 선언적인 구문을 사용하여 UI를 설계, 직관적이고 가독성이 좋은 코드를 작성 가능"),
        TitleSetData(title: "크로스 플랫폼 지원",
                     subtitle: "SwiftUI는 iOS, macOS, watchOS, tvOS, visionOS와 같은 다양한 Apple 플랫폼에서 동일한 코드를 사용하여 UI를 구축"),
        TitleSetData(title: "자동화된 상태 관리",
                     subtitle: "SwiftUI는 상태 관리를 자동화하여 UI와 데이터 간의 일관성을 유지"),
        TitleSetData(title: "재사용 가능한 컴포넌트",
                     subtitle: "SwiftUI는 컴포넌트 기반 아키텍처를 지원, 재사용 가능한 UI 컴포넌트를 쉽게 작성하고 조합하여 복잡한 UI를 구축"),
        TitleSetData(title: "프레임워크 통합 지원",
                     subtitle: "기존의 UIKit 및 AppKit과 호환, 기존의 iOS 및 macOS 프로젝트에 SwiftUI를 점진적으로 도입 가능"),
        TitleSetData(title: "애니메이션 및 그래픽 지원",
                     subtitle: "애니메이션 및 그래픽 처리를 위한 강력한 기능을 제공, 애니메이션과 트랜지션 효과를 쉽게 적용 가능"),
        TitleSetData(title: "실시간 미리보기",
                     subtitle: "SwiftUI는 실시간 미리보기 기능을 제공하여 UI의 변경 사항을 즉시 확인, 생산성 향상")]
    
    var body: some View {
        content()
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .pagingOnKeyboardInput(index: index, maxIndex: 8)
    }
    
    private func content() -> some View {
        HStack(spacing: 0) {
            if indexValue >= 1 {
                VScrollFocusableTextView(index: index, startIndex: 2, items: items)
                    .setFont(sizeType: .caption1, weight: .regular)
                    .frame(width: store.contentSize.width * 0.55)
            }
            
            ZStack {
                Color.primaryLevel6.opacity(0.1)
                switch indexValue {
                case 0, 1: imageView("SwiftUI11")
                case 2: imageView("Advantages1")
                case 3: imageView("Advantages2")
                case 4: imageView("Advantages3")
                case 5: imageView("Advantages4")
                case 6: imageView("Advantages5")
                case 7: imageView("Advantages6")
                case 8:
                    VStack(spacing: 16) {
                        AnimatedImage(name: "Preview.gif", isAnimating: .constant(true))
                            .resizable()
                            .scaledToFill()
                            .frame(width: 1440 * 0.45, height: 1080 * 0.55)
                        LinkTextView("https://github.com/Q-Mobile/QGrid", path: "https://github.com/Q-Mobile/QGrid")
                            .setFont(sizeType: .caption1, weight: .regular)
                            .padding(.bottom, 16)
                    }
                    .transition(.opacity)
                default: EmptyView()
                }
            }
            .frame(height: store.contentSize.width * 0.45)
            .frame(maxWidth: indexValue <= 1 ? store.contentSize.width * 0.75 : store.contentSize.width * 0.45)
            .roundedLine(showLine: true, padding: 0, lineWidth: 2)
        }
    }
    
    private func imageView(_ name: String) -> some View {
        Image(name)
            .resizable()
            .scaledToFit()
            .transition(.opacity)
    }
}

struct PGIntroduction4_Previews: PreviewProvider {
    static var previews: some View {
        PGIntroduction4()
            .modifier(PreviewModifier())
    }
}
