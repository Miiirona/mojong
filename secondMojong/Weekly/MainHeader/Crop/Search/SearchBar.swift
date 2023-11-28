//
//  SearchBar.swift
//  secondMojong
//
//  Created by Hyemi on 11/27/23.
//

import Foundation
import SwiftUI

struct SearchBar: UIViewRepresentable {
    @Binding var text: String

    func makeUIView(context: Context) -> UISearchBar {
        let searchBar = UISearchBar(frame: .zero)
        searchBar.delegate = context.coordinator
        searchBar.searchBarStyle = .minimal
        searchBar.placeholder = "추가할 작물을 입력하세요"
        return searchBar
    }

    func updateUIView(_ uiView: UISearchBar, context: Context) {
        uiView.text = text
    }

    func makeCoordinator() -> Coordinator {
        return Coordinator(text: $text)
    }

    class Coordinator: NSObject, UISearchBarDelegate {
        @Binding var text: String

        init(text: Binding<String>) {
            _text = text
        }

        func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
            text = searchText
        }
    }
}

class HangulUtil {
    private static let HANGUL_BASE: UInt32 = 0xAC00
    private static let CHOSUNG_BASE: UInt32 = 0x1100
    private static let JUNGSUNG_BASE: UInt32 = 0x1161
    private static let JONGSUNG_BASE: UInt32 = 0x11A7
    private static let CHOSUNG_LIST: [Character] = ["ㄱ", "ㄲ", "ㄴ", "ㄷ", "ㄸ", "ㄹ", "ㅁ", "ㅂ", "ㅃ", "ㅅ", "ㅆ", "ㅇ", "ㅈ", "ㅉ", "ㅊ", "ㅋ", "ㅌ", "ㅍ", "ㅎ"]
    private static let JUNGSUNG_LIST: [Character] = ["ㅏ", "ㅐ", "ㅑ", "ㅒ", "ㅓ", "ㅔ", "ㅕ", "ㅖ", "ㅗ", "ㅘ", "ㅙ", "ㅚ", "ㅛ", "ㅜ", "ㅝ", "ㅞ", "ㅟ", "ㅠ", "ㅡ", "ㅢ", "ㅣ"]
    private static let JONGSUNG_LIST: [String] = ["", "ㄱ", "ㄲ", "ㄳ", "ㄴ", "ㄵ", "ㄶ", "ㄷ", "ㄹ", "ㄺ", "ㄻ", "ㄼ", "ㄽ", "ㄾ", "ㄿ", "ㅀ", "ㅁ", "ㅂ", "ㅄ", "ㅅ", "ㅆ", "ㅇ", "ㅈ", "ㅊ", "ㅋ", "ㅌ", "ㅍ", "ㅎ"]

    // 초성/중성/종성을 분리하는 함수
    static func decomposeHangul(_ s: String) -> [Character] {
        return s.unicodeScalars.map { scalar in
            let value = scalar.value
            if (value >= HANGUL_BASE) && (value <= 0xD7A3) {
                let relativeValue = value - HANGUL_BASE
                let chosungIndex = relativeValue / 21 / 28
                let jungsungIndex = relativeValue % (21 * 28) / 28
                let jongsungIndex = relativeValue % 28
                return [CHOSUNG_LIST[Int(chosungIndex)], JUNGSUNG_LIST[Int(jungsungIndex)]] + (JONGSUNG_LIST[Int(jongsungIndex)].isEmpty ? [] : [Character(JONGSUNG_LIST[Int(jongsungIndex)])])

            } else {
                return [Character(UnicodeScalar(value)!)]
            }
        }.flatMap { $0 }
    }

    // 초성/중성을 합치는 함수
    static func composeHangulChosungJungsung(_ s: String) -> [Character] {
        var result: [Character] = []
        var buffer: [Character] = []
        for c in s {
            switch buffer.count {
            case 0:
                buffer.append(c)
            case 1:
                if JUNGSUNG_LIST.contains(c) {
                    buffer.append(c)
                    let composed = UnicodeScalar((CHOSUNG_LIST.firstIndex(of: buffer[0])! * 21 + JUNGSUNG_LIST.firstIndex(of: buffer[1])!) * 28 + Int(JONGSUNG_BASE))!
                    result.append(Character(composed))
                    buffer = []
                } else {
                    result.append(buffer[0])
                    buffer = [c]
                }
            default:
                break
            }
        }
        if !buffer.isEmpty {
            result.append(contentsOf: buffer)
        }
        return result
    }
    
    static func matchesPattern(_ s: String, _ pattern: String) -> Bool {
        let decomposedPattern = decomposeHangul(pattern)
        let decomposedString = decomposeHangul(s)
        if decomposedPattern.count > decomposedString.count {
            return false
        }
        for (index, patternChar) in decomposedPattern.enumerated() {
            if patternChar != decomposedString[index] {
                return false
            }
        }
        return true
    }

}
