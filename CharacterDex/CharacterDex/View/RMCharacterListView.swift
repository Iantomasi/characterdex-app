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
    
    
    // formatting the view of all the characters retrieved from the api to be shown as a list of rounded rectangle images with their name at the bottom
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
            .clipShape(RoundedRectangle(cornerRadius: 10))
            
            Text("\(character.name.capitalized)")
                .font(.system(size: 16, weight: .regular, design: .monospaced))
                .padding(.bottom, 20)
                 .customContentView()
        }
        
    }
}

//preview w test Rick Sanchez char
struct  RMCharacterListView_Previews: PreviewProvider {
    static var previews: some View {
        RMCharacterListView(character: RMCharacterModel.testChar)
            .environmentObject(RMCharacterViewModel())
    }
}
