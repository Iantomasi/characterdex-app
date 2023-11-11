//
//  ContentView.swift
//  CharacterDex
//
//  Created by ella iantomasi on 2023-11-11.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = RMCharacterViewModel()
    
    private let adaptiveColumns = [
        GridItem(.adaptive(minimum: 150))
    ]
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVGrid(columns: adaptiveColumns, spacing: 10) {
                    ForEach(viewModel.searchFilterCharacters) { character in
                        NavigationLink(destination: RMCharacterDetailsView(character: character)) {
                            RMCharacterListView(character: character)
                        }
                        
                    }
                }
                .animation(.easeIn(duration: 0.3), value: viewModel.searchFilterCharacters.count)
                .navigationTitle("Iantomasi's  Rick & Morty Character Dex")
                .navigationBarTitleDisplayMode(.inline)
            }
            .searchable(text: $viewModel.searchParams)
         
        }
        .environmentObject(viewModel)
      
  
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
