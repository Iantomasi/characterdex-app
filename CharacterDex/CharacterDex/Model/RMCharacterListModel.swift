//
//  RMCharacterListModel.swift
//  CharacterDex
//
//  Created by ella iantomasi on 2023-11-11.
//

import Foundation
struct Info: Codable {
    let count: Int
    let next: String
}

struct RMCharacterListModel: Codable {
    let info: Info
    let results: [RMCharacterModel] //results = array of RMCharacterModels
}

