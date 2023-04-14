//
//  CharacterListScreen.swift
//  Rick-and-Morty-App
//
//  Created by William Santoso on 12/04/23.
//

import SwiftUI

struct CharacterListScreen: View {
    @StateObject private var viewModel: CharacterListViewModel = CharacterListViewModel()
    @State private var showFilter: Bool = false
    
    let columns: [GridItem] = [
        GridItem(.flexible()),
        GridItem(.flexible()),
    ]
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVGrid(columns: columns, spacing: 20) {
                    ForEach(viewModel.list) { item in
                        NavigationLink {
                            CharacterDetailScreen(character: item)
                        } label: {
                            CharacterRowView(character: item)
                                .task {
                                    await viewModel.getMore(id: item.id)
                                }
                        }
                    }
                }
                .padding(20)
            }
            .navigationTitle("Character")
            .searchable(text: $viewModel.searchText)
            .refreshable {
                Task {
                    await viewModel.fetchNewList()
                }
            }
            .onSubmit(of: .search) {
                Task {
                    await viewModel.fetchList()
                }
            }
            .onChange(of: viewModel.searchText) { newValue in
                if newValue.isEmpty {
                    Task {
                        await viewModel.fetchNewList()
                    }
                }
            }
            .submitLabel(.search)
            .loading(viewModel.isLoading)
            .toolbar {
                Button {
                    showFilter = true
                } label: {
                    Image(systemName: "slider.horizontal.3")
                }
            }
            .sheet(isPresented: $showFilter) {
                CharacterFilterScreen(filter: viewModel.filter) { filter in
                    Task {
                        await viewModel.fetchList(filter: filter)
                    }
                }
                .presentationDetents([.height(500), .large])
                .presentationDragIndicator(.visible)
            }
            .task {
                guard viewModel.list.isEmpty else { return }
                
                await viewModel.fetchList()
            }
        }
    }
}

struct CharacterListScreen_Previews: PreviewProvider {
    static var previews: some View {
        TabView {
            CharacterListScreen()
        }
    }
}
