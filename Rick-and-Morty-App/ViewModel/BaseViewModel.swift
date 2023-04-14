//
//  BaseViewModel.swift
//  Rick-and-Morty-App
//
//  Created by William Santoso on 13/04/23.
//

import Foundation

class BaseViewModel: ObservableObject {
    @Published private var _isLoading: Bool = false
    var isLoading: Bool {
        get {
            return _isLoading
        }
    }
    
    func loading(_ isLoading: Bool) {
        DispatchQueue.main.async {
            self._isLoading = isLoading
        }
    }
}


class BaseListViewModel<T: BaseModel>: BaseViewModel {
    @Published private var _list: [T] = []
    var list: [T] {
        get {
            return _list
        }
    }
    
    @Published var searchText: String = ""
    
    private var nextUrl: String? = nil
    
    func removeList() {
        _list.removeAll()
    }
    
    func setList(_ list: [T]) {
        if _list.isEmpty {
            _list = list
        } else {
            _list.append(contentsOf: list)
        }
    }
    
    func setNextUrl(_ nextUrl: String?) {
        self.nextUrl = nextUrl
    }
    
    func fetchNewList(url: String = "") async {
        DispatchQueue.main.async {
            self._list = []
        }
        await fetchList(url: url)
    }
    
    func fetchList(url: String = "") async {
        
    }
    
    func getMore(id: Int) async {
        guard let nextUrl = nextUrl else { return }
        
        guard !_list.isEmpty else { return }
        
        let lastData = _list[_list.count - 1]
        
        if id == lastData.id {
            await fetchList(url: nextUrl)
        }
    }
}
