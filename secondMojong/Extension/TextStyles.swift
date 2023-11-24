//
//  TextStyles.swift
//  Mojong
//
//  Created by Hyemi on 11/16/23.
//

import SwiftUI

extension Font {
    enum CustomFont {
        static let H1: Font = Font.custom("NPS-font-Bold", size: 30)
        static let H2: Font = Font.custom("NPS-font-Bold", size: 24)
        static let H3: Font = Font.custom("NPS-font-Bold", size: 20)
        static let H4: Font = Font.custom("NPS-font-Regular", size: 17)
        static let K1: Font = Font.custom("HiraMaruProN-W4", size: 14)
        static let K2: Font = Font.custom("HiraMaruProN-W4", size: 12)
        static let K3: Font = Font.custom("HiraMaruProN-W4", size: 10)
        static let B1: Font = Font.custom("NPS-font-Regular", size: 14)
        static let B2: Font = Font.custom("NPS-font-Regular", size: 12)
        static let B3: Font = Font.custom("NPS-font-Regular", size: 10)
        static let B4: Font = Font.custom("NPS-font-Regular", size: 6)
    }
}

//struct FontFamilyView : View {
//    var body: some View {
//        Text("dd")
//    }
//    init() {
//        for familyName in UIFont.familyNames {
//            print(familyName)
//            
//            for fontName in UIFont.fontNames(forFamilyName: familyName) {
//                
//                print("-- \(fontName)")
//            }
//        }
//    }
//}
// NPS font
// -- NPS-font-Regular
// -- NPS-font-Bold
// -- NPS-font-ExtraBold
// -- HiraMaruProN-W4
