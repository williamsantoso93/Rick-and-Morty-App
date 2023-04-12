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
                LazyVGrid(columns: columns, spacing: 23) {
                    ForEach(0 ..< 200) { _ in
                        NavigationLink {
                            LocationDetailScreen()
                        } label: {
                            LocationRowView()
                        }
                    }
                }
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
