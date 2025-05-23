//
//  StatefulPreviewWrapper.swift
//  StateManagement
//
//  Created by Aleksandr on 22.05.2025.
//

import SwiftUI

struct StatefulPreviewWrapper<Value, Content>: View where Content: View {
    @State var value: Value
    var content: (Binding<Value>) -> Content

    var body: some View {
        content($value)
    }

    init(value: Value, content: @escaping (Binding<Value>) -> Content) {
        self._value = State(wrappedValue: value)
        self.content = content
    }
}
