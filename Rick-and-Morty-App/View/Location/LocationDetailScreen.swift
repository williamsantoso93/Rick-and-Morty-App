//
//  LocationDetail.swift
//  Rick-and-Morty-App
//
//  Created by William Santoso on 12/04/23.
//

import SwiftUI

struct LocationDetailScreen: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                Text("Anatomy Park")
                    .font(.title)
                    .bold()
                
                HStack {
                    Spacer()
                    
                    VStack(alignment: .leading, spacing: 0.0) {
                        Text("Created")
                            .font(.subheadline)
                            .bold()
                        
                        Text("13:08, 10 November 2017")
                            .font(.caption)
                    }
                }
                
                Text("Type: Microverse")
                    .font(.title3)
                    .bold()
                
                Text("Dimension:\nDimension C-137")
                    .font(.callout)
                    .bold()
                
                
                VStack(alignment: .leading, spacing: 4) {
                    Text("Residents:")
                        .font(.title3)
                        .bold()
                    
                    VStack(alignment: .leading, spacing: 0.0) {
                        ForEach(0 ..< 5) { item in
                            Text("https://rickandmortyapi.com/api/character/12")
                                .font(.callout)
                        }
                    }
                }
                .padding(.top, 16)
            }
            .padding(.horizontal, 20)
            .padding(.top, 35)
            .padding(.bottom, 20)
        }
        .navigationTitle("Anatomy Park")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct LocationDetailScreen_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            LocationDetailScreen()
        }
    }
}
