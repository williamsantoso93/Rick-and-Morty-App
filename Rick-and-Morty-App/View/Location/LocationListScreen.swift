//
//  LocationListScreen.swift
//  Rick-and-Morty-App
//
//  Created by William Santoso on 12/04/23.
//

import SwiftUI

struct LocationListScreen: View {
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
                            LocationDetailScreen()
                        } label: {
                            LocationRowView()
                        }
                    }
                }
                .padding(.horizontal, 20)
                .padding(.vertical)
            }
            .navigationTitle("Location")
            .searchable(text: $searchText)
            .onSubmit {
                
            }
            .submitLabel(.search)
        }
    }
}

struct LocationListScreen_Previews: PreviewProvider {
    static var previews: some View {
        LocationListScreen()
    }
}
