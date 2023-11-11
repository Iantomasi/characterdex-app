//
//  CustomStyling.swift
//  CharacterDex
//
//  Created by ella iantomasi on 2023-11-11.
//

//shared style 
import SwiftUI
struct IconLabelStyle: LabelStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.title
        configuration.icon
     
    }
}
