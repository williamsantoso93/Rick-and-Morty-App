//
//  CharacterListViewModel.swift
//  Rick-and-Morty-App
//
//  Created by William Santoso on 13/04/23.
//

import Foundation

class CharacterListViewModel: BaseListViewModel<Character> {
    var filter: CharacterFilter?
    
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
    
    func fetchList(name: String? = nil, status: Status? = nil, species: String? = nil, gender: Gender? = nil, isNewList: Bool = false) async {
        loading(true)
        do {
            let list = try await Fetcher.getCharacterList(name: name, status: status, species: species, gender: gender)
            
            DispatchQueue.main.async {
                self.setNextUrl(list.info?.next)
                
                if isNewList {
                    self.removeList()
                }
                self.setList(list.results)
            }
        } catch {
            print(error.localizedDescription)
        }
        loading(false)
    }
    
    func fetchList(filter: CharacterFilter, isNewList: Bool = false) async {
        self.filter = filter
        loading(true)
        do {
            let list = try await Fetcher.getCharacterList(name: filter.name, status: filter.status, species: filter.species, gender: filter.gender)
            
            DispatchQueue.main.async {
                self.setNextUrl(list.info?.next)
                
                if isNewList {
                    self.removeList()
                }
                self.setList(list.results)
            }
        } catch {
            print(error.localizedDescription)
        }
        loading(false)
    }
    
    func fetchList(name: String? = nil, isNewList: Bool = false) async {
        filter?.name = name
        
        if let filter = filter {
            await fetchList(filter: filter, isNewList: isNewList)
        }
    }
}
