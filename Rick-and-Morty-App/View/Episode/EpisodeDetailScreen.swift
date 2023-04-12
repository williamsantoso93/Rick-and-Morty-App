//
//  EpisodeDetail.swift
//  Rick-and-Morty-App
//
//  Created by William Santoso on 12/04/23.
//

import SwiftUI

struct EpisodeDetailScreen: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                Text("Pilot")
                    .font(.title)
                    .bold()
                
                HStack {
                    Spacer()
                    
                    VStack(alignment: .leading, spacing: 0.0) {
                        Text("Created")
                            .font(.subheadline)
                            .bold()
                        
                        Text("12:56, 11 November 2017")
                            .font(.caption)
                    }
                }
                
                VStack(alignment: .leading, spacing: 0) {
                    HStack(spacing: 0) {
                        Text("Air Date: ")
                            .bold()
                        
                        Text("2 Desember 2013")
                    }
                    .font(.title3)
                    
                    HStack(spacing: 0) {
                        Text("Season: ")
                            .bold()
                        
                        Text("1")
                    }
                    .font(.callout)
                    
                    HStack(spacing: 0) {
                        Text("Episode: ")
                            .bold()
                        
                        Text("1")
                    }
                    .font(.callout)
                }
                
                VStack(alignment: .leading, spacing: 8) {
                    Text("Characters:")
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
        .navigationTitle("Pilot")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct EpisodeDetailScreen_Previews: PreviewProvider {
    static var previews: some View {
        EpisodeDetailScreen()
    }
}
