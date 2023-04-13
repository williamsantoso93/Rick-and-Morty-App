//
//  EpisodeList.swift
//  Rick-and-Morty-App
//
//  Created by William Santoso on 12/04/23.
//

import SwiftUI

struct EpisodeListScreen: View {
    @State private var searchText: String = ""
    
    let columns: [GridItem] = [
        GridItem(.flexible()),
        GridItem(.flexible()),
    ]
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVStack(spacing: 14) {
                    ForEach(0 ..< 20) { _ in
                        NavigationLink {
                            EpisodeDetailScreen()
                        } label: {
                            EpisodeRowView()
                        }
                    }
                }
                .padding(.horizontal, 16)
                .padding(.bottom, 24)
            }
            .navigationTitle("Episode")
            .searchable(text: $searchText)
            .onSubmit {
                
            }
            .submitLabel(.search)
        }
    }
}

struct EpisodeListScreen_Previews: PreviewProvider {
    static var previews: some View {
        EpisodeListScreen()
    }
}
