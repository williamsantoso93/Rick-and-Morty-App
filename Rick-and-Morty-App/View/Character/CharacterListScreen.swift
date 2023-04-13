//
//  CharacterListScreen.swift
//  Rick-and-Morty-App
//
//  Created by William Santoso on 12/04/23.
//

import SwiftUI

struct CharacterListScreen: View {
    @StateObject private var viewModel: CharacterListViewModel = CharacterListViewModel()
    @State private var searchText: String = ""
    @State private var showFilter: Bool = false
    
    let columns: [GridItem] = [
        GridItem(.flexible()),
        GridItem(.flexible()),
    ]
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVGrid(columns: columns, spacing: 20) {
                    ForEach(0 ..< 10) { _ in
                        NavigationLink {
                            CharacterDetailScreen()
                        } label: {
                            CharacterRowView()
                        }
                    }
                }
                .padding(20)
            }
            .navigationTitle("Character")
            .searchable(text: $searchText)
            .onSubmit {
                
            }
            .submitLabel(.search)
            .toolbar {
                Button {
                    showFilter = true
                } label: {
                    Image(systemName: "slider.horizontal.3")
                }
            }
            .sheet(isPresented: $showFilter) {
                CharacterFilterScreen()
                    .presentationDetents([.height(500), .large])
                    .presentationDragIndicator(.visible)
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
