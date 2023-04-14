//
//  LocationListViewModel.swift
//  Rick-and-Morty-App
//
//  Created by William Santoso on 13/04/23.
//

import Foundation

class LocationListViewModel: BaseListViewModel<Location> {
    override func fetchList(url: String = "") async {
        var searchText: String? = nil
        if url.isEmpty {
            searchText = self.searchText
        }
        
        loading(true)
        
        do {
            let list = try await Fetcher.getLocationList(url: url, name: searchText)
            
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
