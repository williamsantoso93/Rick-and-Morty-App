//
//  LocationListScreen.swift
//  Rick-and-Morty-App
//
//  Created by William Santoso on 12/04/23.
//

import SwiftUI

struct LocationListScreen: View {
    @StateObject private var viewModel: BaseListViewModel = LocationListViewModel()
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVStack(spacing: 14) {
                    ForEach(viewModel.list) { item in
                        NavigationLink {
                            LocationDetailScreen(location: item)
                        } label: {
                            LocationRowView(location: item)
                        }
                    }
                }
                .padding(.horizontal, 20)
                .padding(.vertical)
            }
            .navigationTitle("Location")
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
            .submitLabel(.search)
            .loading(viewModel.isLoading)
            .task {
                guard viewModel.list.isEmpty else { return }
                
                await viewModel.fetchList()
            }
        }
    }
}

struct LocationListScreen_Previews: PreviewProvider {
    static var previews: some View {
        LocationListScreen()
    }
}
