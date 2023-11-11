//
//  RMCharacterViewModel.swift
//  CharacterDex
//
//  Created by ella iantomasi on 2023-11-11.
//

import Foundation

final class RMCharacterViewModel: ObservableObject{
    
    private let apiCharService = RMAPIAccessService()
    @Published var characterInfo: RMCharacterDetailsModel?
    @Published var searchParams = ""
    
    
    var searchFilterCharacters: [RMCharacterModel] {
        return searchParams == "" ? characterList : characterList.filter {
            $0.name.contains(searchParams)
        }
    }
    
    @Published var characterList = [RMCharacterModel]()
    
    init() {
        fetchCharacter()
    }
    
    func fetchCharacter() {
        apiCharService.getCharacters() { characters in
            DispatchQueue.main.async {
                self.characterList = characters
            }
        }
    }
    
    func getCharacterById(character: RMCharacterModel) -> Int {
        if let index = characterList.firstIndex(of: character) {
            return index + 1
        }
        return 0
    }
    
    
    func getDetails(character: RMCharacterModel) {
        let id = getCharacterById(character: character)
        
        characterInfo = RMCharacterDetailsModel(id: 0,name: "", status: "", species: "", type: "", gender: "" )
        apiCharService.getDetailedCharacter(id: id) { data in
            DispatchQueue.main.async {
                self.characterInfo = data
            }
        }
    }
    
}
   
