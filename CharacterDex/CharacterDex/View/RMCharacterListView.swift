//
//  RMCharacterView.swift
//  CharacterDex
//
//  Created by ella iantomasi on 2023-11-11.
//

import SwiftUI

struct RMCharacterListView: View {
    @EnvironmentObject var viewModel: RMCharacterViewModel
    let character: RMCharacterModel
    let dimensions: Double = 140
    
    var body: some View {
        VStack {
            AsyncImage(url: URL(string: "https://rickandmortyapi.com/api/character/avatar//\(viewModel.getCharacterById(character: character)).jpeg")) { image in
                image
                    .resizable()
                    .scaledToFit()
                    .frame(width: dimensions, height: dimensions)
            } placeholder: {
                ProgressView()
                    .frame(width: dimensions, height: dimensions)
            }
            .background(.thinMaterial)
            .clipShape(Rectangle())
            
            Text("\(character.name.capitalized)")
                .font(.system(size: 16, weight: .regular, design: .monospaced))
                .padding(.bottom, 20)
                 .customContentView()
        }
        
    }
}



#Preview {
    RMCharacterListView(character: RMCharacterModel.testChar)
        .environmentObject(RMCharacterViewModel())
}
