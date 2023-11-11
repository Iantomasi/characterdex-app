//
//  RMCharacterDetailsView.swift
//  CharacterDex
//
//  Created by ella iantomasi on 2023-11-11.
//

import SwiftUI

struct RMCharacterDetailsView: View {
    @EnvironmentObject var viewModel: RMCharacterViewModel
    let character: RMCharacterModel
    
    var body: some View {
        Label("Character  Info", systemImage: "info.square")
            .labelStyle(IconLabelStyle())
            .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
            .fontWeight(.heavy)
        
        VStack {
            RMCharacterListView(character: character)
            
            VStack(spacing: 10) {
                RMCharacterListView(character: character)
                
                VStack(spacing: 10) {
                    Text("**ID**: \(viewModel.characterInfo?.id ?? 0)")
                    
                        .customContentView()
                    Text("**Status**: \(viewModel.characterInfo?.status ?? "")")
                    
                        .customContentView()
                    Text("**Species**: \(viewModel.characterInfo?.species ?? "")")
                    
                        .customContentView()
                    Text("**Type**: \(viewModel.characterInfo?.type ?? "")")
                    
                        .customContentView()
                    Text("**Gender**: \(viewModel.characterInfo?.gender ?? "")")
                    
                        .customContentView()
                    
                    
                    
                }
                
                
            }
            .onAppear(){
                viewModel.getDetails(character: character)
            }
        }
    }
    
    struct RMCharacterDetailsView_Previews: PreviewProvider {
        static var previews: some View {
            RMCharacterDetailsView(character: RMCharacterModel.testChar)
                .environmentObject(RMCharacterViewModel())
        }
    }
}
    
