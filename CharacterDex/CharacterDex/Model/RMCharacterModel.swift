//
//  RMCharacterModel.swift
//  CharacterDex
//
//  Created by ella iantomasi on 2023-11-11.
//

import Foundation

// populates our CharacterList array
struct RMCharacterModel: Codable, Identifiable, Equatable{
    let id = UUID()
    let name: String
    let url: String
    
    enum CodingKeys:  String, CodingKey {
        case name
        case url
    }
    
    //test Charcter form the API (Spiky haired scientist)
    static var testChar = RMCharacterModel(name: "Rick Sanchez", url: "https://rickandmortyapi.com/api/character/1")
}

