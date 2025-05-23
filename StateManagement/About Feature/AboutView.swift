//
//  AboutView.swift
//  StateManagement
//
//  Created by Aleksandr on 22.05.2025.
//

import SwiftUI

struct AboutView: View {
    
    @State var isPresented: Bool = false
    
    var body: some View {
        VStack {
            Text("This App was made during\na SwiftUI course")
                .font(.headline)
                .multilineTextAlignment(.center)
                .padding()
            Button("More Info?") {
                isPresented = true
            }
        }
        .sheet(isPresented: $isPresented) {
            MoreInfoView()
                .presentationDetents([.medium, .fraction(0.8)])
        }
    }
}

#Preview {
    AboutView()
}
