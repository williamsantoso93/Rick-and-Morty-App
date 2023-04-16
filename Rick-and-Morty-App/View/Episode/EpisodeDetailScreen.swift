//
//  EpisodeDetail.swift
//  Rick-and-Morty-App
//
//  Created by William Santoso on 12/04/23.
//

import SwiftUI

struct EpisodeDetailScreen: View {
    var episode: Episode
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                Text(episode.name)
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
                        
                        Text(episode.airDate)
                    }
                    .font(.title3)
                    
                    HStack(spacing: 0) {
                        Text("Season: ")
                            .bold()
                        
                        Text(episode.season)
                    }
                    .font(.callout)
                    
                    HStack(spacing: 0) {
                        Text("Episode: ")
                            .bold()
                        
                        Text(episode.episode)
                    }
                    .font(.callout)
                }
                
                VStack(alignment: .leading, spacing: 8) {
                    Text("Characters:")
                        .font(.title3)
                        .bold()
                    
                    VStack(alignment: .leading, spacing: 0.0) {
                        ForEach(episode.characters, id:\.self) { item in
                            Text(item)
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
        .navigationTitle(episode.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct EpisodeDetailScreen_Previews: PreviewProvider {
    static var previews: some View {
        let episode = Episode(id: 1, name: "Pilot", airDate: "December 2, 2013", episodeSeason: "S01E01", characters: ["https://rickandmortyapi.com/api/character/1", "https://rickandmortyapi.com/api/character/2", "https://rickandmortyapi.com/api/character/35", "https://rickandmortyapi.com/api/character/38", "https://rickandmortyapi.com/api/character/62", "https://rickandmortyapi.com/api/character/92", "https://rickandmortyapi.com/api/character/127", "https://rickandmortyapi.com/api/character/144", "https://rickandmortyapi.com/api/character/158", "https://rickandmortyapi.com/api/character/175", "https://rickandmortyapi.com/api/character/179", "https://rickandmortyapi.com/api/character/181", "https://rickandmortyapi.com/api/character/239", "https://rickandmortyapi.com/api/character/249", "https://rickandmortyapi.com/api/character/271", "https://rickandmortyapi.com/api/character/338", "https://rickandmortyapi.com/api/character/394", "https://rickandmortyapi.com/api/character/395", "https://rickandmortyapi.com/api/character/435"], url: "https://rickandmortyapi.com/api/episode/1", created: "2017-11-10T12:56:33.798Z")
        
        EpisodeDetailScreen(episode: episode)
    }
}
