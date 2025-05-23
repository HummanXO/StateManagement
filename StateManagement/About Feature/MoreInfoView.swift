//
//  MoreInfoView.swift
//  StateManagement
//
//  Created by Aleksandr on 22.05.2025.
//

import SwiftUI

struct MoreInfoView: View {
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack {
            Text("Hello, World!")
                .padding()
            Button("Dismiss") {
                dismiss()
            }
        }
    }
}

#Preview {
    MoreInfoView()
}
