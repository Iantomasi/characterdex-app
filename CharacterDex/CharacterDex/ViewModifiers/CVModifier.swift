//
//  CVModifier.swift
//  CharacterDex
//
//  Created by ella iantomasi on 2023-11-11.
//

import SwiftUI
struct CustomContentView: ViewModifier {
    func body(content: Content) -> some View {
        content
            .foregroundColor(Color.blue)
            .font(.title3)
            .cornerRadius(10)
    }
}

extension View {
    func customContentView() -> some View {
        self.modifier(CustomContentView())
    }
}

