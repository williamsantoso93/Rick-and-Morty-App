//
//  EpisodeRowView.swift
//  Rick-and-Morty-App
//
//  Created by William Santoso on 12/04/23.
//

import SwiftUI

struct EpisodeRowView: View {
    var episode: Episode
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(episode.name)
                .lineLimit(1)
                .font(.title2)
                .bold()
            
            Grid {
                GridRow {
                    Text("season: \(episode.season)\nepisode: \(episode.episode)")
                        .font(.title3)
                        .multilineTextAlignment(.leading)
                    
                    Spacer()
                    
                    Text("Air Date:\n\(episode.airDate)")
                        .font(.title3)
                        .multilineTextAlignment(.leading)
                    
                    Spacer()
                }
            }
        }
        .padding(.vertical, 10)
        .padding(.horizontal, 15)
        .background {
            RoundedRectangle(cornerRadius: 10)
                .stroke(.primary, lineWidth: 1)
        }
        .foregroundColor(.primary)
    }
}

struct EpisodeRowView_Previews: PreviewProvider {
    static var previews: some View {
        let episode = Episode(id: 1, name: "Pilot", airDate: "December 2, 2013", episodeSeason: "S01E01", characters: ["https://rickandmortyapi.com/api/character/1", "https://rickandmortyapi.com/api/character/2", "https://rickandmortyapi.com/api/character/35", "https://rickandmortyapi.com/api/character/38", "https://rickandmortyapi.com/api/character/62", "https://rickandmortyapi.com/api/character/92", "https://rickandmortyapi.com/api/character/127", "https://rickandmortyapi.com/api/character/144", "https://rickandmortyapi.com/api/character/158", "https://rickandmortyapi.com/api/character/175", "https://rickandmortyapi.com/api/character/179", "https://rickandmortyapi.com/api/character/181", "https://rickandmortyapi.com/api/character/239", "https://rickandmortyapi.com/api/character/249", "https://rickandmortyapi.com/api/character/271", "https://rickandmortyapi.com/api/character/338", "https://rickandmortyapi.com/api/character/394", "https://rickandmortyapi.com/api/character/395", "https://rickandmortyapi.com/api/character/435"], url: "https://rickandmortyapi.com/api/episode/1", created: "2017-11-10T12:56:33.798Z")
        
        EpisodeRowView(episode: episode)
            .padding()
    }
}
