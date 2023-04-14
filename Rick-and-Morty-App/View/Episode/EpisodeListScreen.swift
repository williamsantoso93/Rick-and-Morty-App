//
//  EpisodeList.swift
//  Rick-and-Morty-App
//
//  Created by William Santoso on 12/04/23.
//

import SwiftUI

struct EpisodeListScreen: View {
    @StateObject private var viewModel: BaseListViewModel = EpisodeListViewModel()
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVStack(spacing: 14) {
                    ForEach(viewModel.list) { item in
                        NavigationLink {
                            EpisodeDetailScreen(episode: item)
                        } label: {
                            EpisodeRowView(episode: item)
                                .task {
                                    await viewModel.getMore(id: item.id)
                                }
                        }
                    }
                }
                .padding(.horizontal, 16)
                .padding(.bottom, 24)
            }
            .navigationTitle("Episode")
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
            .task {
                guard viewModel.list.isEmpty else { return }
                
                await viewModel.fetchList()
            }
        }
    }
}

struct EpisodeListScreen_Previews: PreviewProvider {
    static var previews: some View {
        EpisodeListScreen()
    }
}
