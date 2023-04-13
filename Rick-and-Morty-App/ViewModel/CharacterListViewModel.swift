//
//  CharacterListViewModel.swift
//  Rick-and-Morty-App
//
//  Created by William Santoso on 13/04/23.
//

import Foundation

class CharacterListViewModel: BaseListViewModel<Character> {
    override func fetchList(url: String = "") async {
        do {
            let list = try await Fetcher.getCharacterList(url: url)
            
            setNextUrl(list.info?.next)
            setList(list.results)
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func fetchList(name: String? = nil, status: Status? = nil, species: String? = nil, gender: Gender? = nil) async {
        do {
            let list = try await Fetcher.getCharacterList(name: name, status: status, species: species, gender: gender)
            
            setNextUrl(list.info?.next)
            setList(list.results)
        } catch {
            print(error.localizedDescription)
        }
    }
}
