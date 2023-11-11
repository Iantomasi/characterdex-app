//
//  RMCharacterDetailsModel.swift
//  CharacterDex
//
//  Created by ella iantomasi on 2023-11-11.
//

import Foundation
struct RMCharacterDetailsModel: Codable{
    //all value datatypes specified in the API
    let id: Int
    let name: String
    let status: String
    let species: String
    let type: String
    let gender: String
}
