//
//  AlertView.swift
//  secondMojong
//
//  Created by Hyemi on 11/27/23.
//

import SwiftUI

public enum AlertButtonType {
    case CANCEL
    case REMOVE
    case COMPLETED
}

public struct AlertButtonView: View {
    
    public typealias Action = () -> ()
    
    @Binding public var showAlert: Bool
    
    public var btnTitle: String = ""
    
    public var btnColor: Color = Color.clear
    
    public var action: Action
    
    public var type: AlertButtonType
    
    public init(showAlert: Binding<Bool>, action: @escaping Action, type: AlertButtonType) {
        self._showAlert = showAlert
        self.action = action
        self.type = type
        
        switch type {
        case .CANCEL:
            self.btnTitle = "취소"
            self.btnColor = Color.Body2
        case .COMPLETED:
            self.btnTitle = "완료"
            self.btnColor = Color.Secondary01
        case .REMOVE:
            self.btnTitle = "삭제"
            self.btnColor = Color.WarningRed
        }
    }
    
    public var body: some View {
        
        Button {
            self.showAlert = false
            action()
        } label: {
            Text(btnTitle)
                .foregroundColor(self.btnColor)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
    }
}

public struct AlertView: View {
    
    public var title: String = ""
    public var btnIcon: Image
    public let cancleBtn: AlertButtonView?
    public let removeBtn: AlertButtonView?
    public let completedBtn: AlertButtonView?
    
    public init(title: String,
                btnIcon: Image,
                cancleBtn: AlertButtonView? = nil,
                removeBtn: AlertButtonView? = nil,
                completedBtn: AlertButtonView? = nil) {
        self.title = title
        self.btnIcon = btnIcon
        self.cancleBtn = cancleBtn
        self.removeBtn = removeBtn
        self.completedBtn = completedBtn
    }
    
    public var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
                .opacity(0.8)
            VStack(spacing: 0) {
                VStack(alignment: .center, spacing: 14) {
                    self.btnIcon
                    
                    if "" != self.title {
                        Text(self.title)
                            .foregroundColor(Color.Body1)
                    }
                }
                .frame(height: 99)
                HStack {
                    if let cancleBtn = self.cancleBtn {
                        cancleBtn
                    }
                    if let removeBtn = self.removeBtn {
                        removeBtn
                    }
                    if let completedBtn = self.completedBtn {
                        completedBtn
                    }
                }
                .frame(height: 50)
            }
            .frame(width: 300, height: 150)
            .background(Color.white1)
            .cornerRadius(14)
        }
    }
}

public struct AlertModifier: ViewModifier {
    @Binding var showAlert: Bool
    
    let alert: AlertView
    
    public func body(content: Content) -> some View {
        content
            .fullScreenCover(isPresented: $showAlert) {
                alert
            }
            .transaction { transaction in
                transaction.disablesAnimations = true
            }
    }
    
}

extension View {
    public func alert(showAlert: Binding<Bool>, alert: @escaping () -> AlertView) -> some View {
        return modifier(AlertModifier(showAlert: showAlert, alert: alert()))
    }
}

struct AlertView_Previews: PreviewProvider {
    static var previews: some View {
        AlertView(
            title: "작물 추가 완료됩니다.",
            btnIcon: Image(systemName: "checkmark.circle"),
            cancleBtn: AlertButtonView(showAlert: .constant(false), action: {}, type: .CANCEL),
            removeBtn: AlertButtonView(showAlert: .constant(false), action: {}, type: .REMOVE),
            completedBtn: AlertButtonView(showAlert: .constant(false), action: {}, type: .COMPLETED)
        )
    }
}


