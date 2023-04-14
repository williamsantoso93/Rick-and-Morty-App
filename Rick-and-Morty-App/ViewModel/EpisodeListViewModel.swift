//
//  EpisodeListViewModel.swift
//  Rick-and-Morty-App
//
//  Created by William Santoso on 13/04/23.
//

import Foundation

class EpisodeListViewModel: BaseListViewModel<Episode> {
    override func fetchList(url: String = "") async {
        var searchText: String? = nil
        if url.isEmpty {
            searchText = self.searchText
        }
        
        loading(true)
        
        do {
            let list = try await Fetcher.getEpisodeList(url: url, name: searchText)
            
            DispatchQueue.main.async {
                self.setNextUrl(list.info?.next)
                if url.isEmpty {
                    self.removeList()
                }
                self.setList(list.results)
            }
        } catch {
            print(error.localizedDescription)
        }
        loading(false)
    }
}
