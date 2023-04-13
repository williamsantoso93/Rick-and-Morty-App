//
//  CharacterListViewModel.swift
//  Rick-and-Morty-App
//
//  Created by William Santoso on 13/04/23.
//

import Foundation

class CharacterListViewModel: BaseListViewModel<Character> {
    override func fetchList(url: String = "") async {
        loading(true)
        do {
            let list = try await Fetcher.getCharacterList(url: url)
            
            DispatchQueue.main.async {
                self.setNextUrl(list.info?.next)
                self.setList(list.results)
            }
        } catch {
            print(error.localizedDescription)
        }
        loading(false)
    }
    
    func fetchList(name: String? = nil, status: Status? = nil, species: String? = nil, gender: Gender? = nil) async {
        loading(true)
        do {
            let list = try await Fetcher.getCharacterList(name: name, status: status, species: species, gender: gender)
            
            DispatchQueue.main.async {
                self.setNextUrl(list.info?.next)
                self.setList(list.results)
            }
        } catch {
            print(error.localizedDescription)
        }
        loading(false)
    }
}
