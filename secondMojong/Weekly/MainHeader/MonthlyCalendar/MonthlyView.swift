//
//  NoteHistoryCal.swift
//  secondMojong
//
//  Created by Hyemi on 11/20/23.
//

import SwiftUI

struct MonthlyCalView: View {
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        MonthlyCalHeaderView()
    }
}

#Preview {
    MonthlyCalView()
}
