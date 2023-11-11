//
//  RMAPIAccessService.swift
//  CharacterDex
//
//  Created by ella iantomasi on 2023-11-11.
//

import Foundation

class RMAPIAccessService {
    
    
    // fetch API Data
    func getCharacters( completion:@escaping ([RMCharacterModel]) -> ()){
        Bundle.main.fetchData(url: "https://rickandmortyapi.com/api/character", model: RMCharacterListModel.self) {
            data in
            completion(data.results)
        } failure: { error in
            print(error) // Helpers error message
        }
    }
    
    // fetch expanded API data
    func getDetailedCharacter(id: Int, _ completion:@escaping (RMCharacterDetailsModel) -> () ) {
        Bundle.main.fetchData(url: "https://rickandmortyapi.com/api/character/\(id)/", model: RMCharacterDetailsModel.self) {
            data in
            completion(data)
        } failure: { error in
            print(error) // Helpers error message
        }
    }
}
