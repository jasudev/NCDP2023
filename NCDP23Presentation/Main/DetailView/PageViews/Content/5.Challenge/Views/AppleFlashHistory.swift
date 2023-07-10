//
//  AppleFlashHistory.swift
//  NCDP23Presentation
//
//  Created by jasu on 2023/05/31.
//  Copyright (c) 2023 jasu All rights reserved.
//

import SwiftUI

struct AppleFlashHistory: View {
    
    var animation: Namespace.ID
    @Binding var index: Int
    let startIndex: Int
    var localIndex: Int {
        index - startIndex
    }
    
    private let datas = [
        AFHistoryData(year: "1993",
                      flashText: "FutureWave Software", eventText: "SmartSketch 출시"),
        AFHistoryData(year: "1995",
                      flashIcon: "Future_Splash_Animator_icon",
                      flashText: "FutureSplash Animator"),
        AFHistoryData(year: "1996",
                      flashIcon: "Macromedia_Flash_MX_icon",
                      flashText: "Macromedia Flash 1", eventText: "Macromedia에서 FutureSplash 인수"),
        AFHistoryData(year: "1997",                 // macromedia 웹페이지
                      flashIcon: "Macromedia_Flash_MX_icon",
                      flashText: "Macromedia Flash 2"),
        AFHistoryData(year: "1998",
                      flashIcon: "Macromedia_Flash_MX_icon",
                      flashText: "Macromedia Flash 3"),
        AFHistoryData(year: "1999",
                      flashIcon: "Macromedia_Flash_MX_icon",
                      flashText: "Macromedia Flash 4"),
        AFHistoryData(year: "2000",                                 // ActionScript 프로그래밍 언어 도입,
                      flashIcon: "Macromedia_Flash_MX_icon",
                      flashText: "Macromedia Flash 5", eventText: "ActionScript 프로그래밍 언어 도입"),
        AFHistoryData(year: "2002",
                      flashIcon: "Macromedia_Flash_6_icon",
                      flashText: "Macromedia Flash MX"),
        AFHistoryData(year: "2003",
                      flashIcon: "Macromedia_Flash_6_icon",
                      flashText: "Macromedia Flash MX 2004"),
        AFHistoryData(year: "2005",
                      flashIcon: "Macromedia_Flash_8_icon",         // Adobe는 Macromedia를 34억 달러에 인수
                      flashText: "Macromedia Flash 8", eventText: "Adobe에서 Macromedia 인수"),
        AFHistoryData(year: "2007",                                 // iPhone 출시
                      flashIcon: "Adobe_Flash_Professional_CS3_icon",
                      flashText: "Adobe Flash CS3", eventText: "iPhone 출시\n애플을 상대로 소송을 제기"),
        AFHistoryData(year: "2008",                                 // Apple은 2008년 3월에 App Store의 도입과 함께 첫 번째 iPhone SDK를 출시하여
                      flashIcon: "Adobe_Flash_Professional_CS4_icon",
                      flashText: "Adobe Flash CS4", eventText: "Apple App Store 도입"),
        AFHistoryData(year: "2010",
                      flashIcon: "Adobe_Flash_Professional_CS5_icon",
                      flashText: "Adobe Flash CS5", eventText: "플래시 사용 차단\nThoughts on Flash"), // 애플은 앱 개발자들이 플래시 CS5나 다른 제3자 프레임워크를 사용하는 것을 차단
        // Adobe는 Apple의 독점 금지 위반 가능성에 대해 Apple을 조사하기 시작한 새로운 규칙에 대해 미국 연방 무역 위원회에 불만을 제기
        // Adobe와 Apple 간의 싸움은 2010년 4월 29일 Apple CEO Steve Jobs가 "Thoughts on Flash"라는 제목의 공개 서한을 발표하면서 절정
        // 아마도 FTC의 법적 조치로 인해 Apple은 2010년 9월에 개발자 계약을 다시 변경
        
        AFHistoryData(year: "2012",
                      flashIcon: "Adobe_Flash_Professional_CS6_icon",
                      flashText: "Adobe Flash CS6"),
        AFHistoryData(year: "2013",
                      flashIcon: "Adobe_Flash_Professional_icon",
                      flashText: "Adobe Flash Professional CC"),
        AFHistoryData(year: "2016",
                      flashIcon: "Adobe_Animate_CC_2015_icon",
                      flashText: "Adobe Animate CC"),
        AFHistoryData(year: "2020",
                      flashIcon: "Adobe-Animate-2020-logo",
                      flashText: "Adobe Animate", eventText: "애니메이션 툴로 진화")
    ]
    
    private var eventYears = [String]()
    
    init(animation: Namespace.ID, index: Binding<Int>, startIndex: Int) {
        self.animation = animation
        _index = index
        self.startIndex = startIndex
        
        eventYears = datas.compactMap { data -> String? in
            if data.eventText != nil {
                return data.year
            }
            return nil
        }
    }
    
    var body: some View {
        ScrollViewReader { proxy in
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: -150) {
                    ForEach(datas) { data in
                        AFHistoryDataView(animation: animation, data: data, isSelected: isSelected(data.year))
                            .id(data.year)
                    }
                }
                .overlay(alignment: .topLeading) {
                    Image("Flashplayer1")
                        .resizable()
                        .matchedGeometryEffect(id: "Flashplayer1", in: animation)
                        .scaledToFit()
                        .frame(height: 60)
                        .padding([.top, .leading], 16)
                        .transition(.opacity)
                }
            }
            .onChange(of: index) { newValue in
                let index = newValue - startIndex
                guard index < eventYears.count && index >= 0 else { return }
                let year = eventYears[index]
                if isSelected(year) {
                    DispatchQueue.main.async {
                        withAnimation(.easeInOut(duration: 1.0)) {
                            proxy.scrollTo(year, anchor: .center)
                        }
                    }
                }
            }
        }
        .padding(.bottom, 16)
        .roundedLine(padding: 0)
    }
    
    private func isSelected(_ year: String) -> Bool {
        let index = localIndex
        guard index < eventYears.count && index >= 0 else { return false }
        return eventYears[index] == year
    }
}

struct AppleFlashHistory_Previews: PreviewProvider {
    @Namespace static var animation
    static var previews: some View {
        AppleFlashHistory(animation: animation, index: .constant(0), startIndex: 0)
    }
}
