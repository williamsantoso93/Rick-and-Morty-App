//
//  CharacterListViewModel.swift
//  Rick-and-Morty-App
//
//  Created by William Santoso on 13/04/23.
//

import Foundation

class CharacterListViewModel: BaseListViewModel<Character> {
    @Published var filter: CharacterFilter = CharacterFilter()
    
    override func fetchList(url: String = "") async {
        loading(true)
        
        guard !url.isEmpty else {
            await fetchList(filter: self.filter)
            return
        }
        
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
    
    func fetchList(filter: CharacterFilter?) async {
        var filter = filter
        filter?.name = searchText
        
        guard let filter = filter else { return }
        
        DispatchQueue.main.async {
            self.filter = filter
        }
        
        loading(true)
        do {
            let list = try await Fetcher.getCharacterList(name: filter.name, status: filter.status, species: filter.species, gender: filter.gender)
            
            DispatchQueue.main.async {
                self.setNextUrl(list.info?.next)
                
                self.removeList()
                self.setList(list.results)
            }
        } catch {
            print(error.localizedDescription)
        }
        loading(false)
    }
}
