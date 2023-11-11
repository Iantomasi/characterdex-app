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
    
    
    //search bar logic
    var searchFilterCharacters: [RMCharacterModel] {
        return searchParams == "" ? characterList : characterList.filter {
            $0.name.contains(searchParams)
        }
    }
    
    // char list variable
    @Published var characterList = [RMCharacterModel]()
    
    
    
    // initializer
    init() {
        fetchCharacter()
    }
    
    //get characters
    func fetchCharacter() {
        apiCharService.getCharacters() { characters in
            DispatchQueue.main.async {
                self.characterList = characters
            }
        }
    }
    
    //get by id
    func getCharacterById(character: RMCharacterModel) -> Int {
        if let index = characterList.firstIndex(of: character) {
            return index + 1
        }
        return 0
    }
    
    
    //get details
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
   
