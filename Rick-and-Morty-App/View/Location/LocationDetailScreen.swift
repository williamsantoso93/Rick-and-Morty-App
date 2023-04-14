//
//  LocationDetail.swift
//  Rick-and-Morty-App
//
//  Created by William Santoso on 12/04/23.
//

import SwiftUI

struct LocationDetailScreen: View {
    var location: Location
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                Text(location.name)
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
                
                Text("Type: \(location.type)")
                    .font(.title3)
                    .bold()
                
                Text("Dimension:\n\(location.dimension)")
                    .font(.callout)
                    .bold()
                
                
                VStack(alignment: .leading, spacing: 4) {
                    Text("Residents:")
                        .font(.title3)
                        .bold()
                    
                    VStack(alignment: .leading, spacing: 0.0) {
                        ForEach(location.residents, id:\.self) { item in
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
        .navigationTitle(location.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct LocationDetailScreen_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            let location = Location(id: 1, name: "Earth (C-137)", type: "Planet", dimension: "Dimension C-137", residents: ["https://rickandmortyapi.com/api/character/38", "https://rickandmortyapi.com/api/character/45", "https://rickandmortyapi.com/api/character/71", "https://rickandmortyapi.com/api/character/82", "https://rickandmortyapi.com/api/character/83", "https://rickandmortyapi.com/api/character/92", "https://rickandmortyapi.com/api/character/112", "https://rickandmortyapi.com/api/character/114", "https://rickandmortyapi.com/api/character/116", "https://rickandmortyapi.com/api/character/117", "https://rickandmortyapi.com/api/character/120", "https://rickandmortyapi.com/api/character/127", "https://rickandmortyapi.com/api/character/155", "https://rickandmortyapi.com/api/character/169", "https://rickandmortyapi.com/api/character/175", "https://rickandmortyapi.com/api/character/179", "https://rickandmortyapi.com/api/character/186", "https://rickandmortyapi.com/api/character/201", "https://rickandmortyapi.com/api/character/216", "https://rickandmortyapi.com/api/character/239", "https://rickandmortyapi.com/api/character/271", "https://rickandmortyapi.com/api/character/302", "https://rickandmortyapi.com/api/character/303", "https://rickandmortyapi.com/api/character/338", "https://rickandmortyapi.com/api/character/343", "https://rickandmortyapi.com/api/character/356", "https://rickandmortyapi.com/api/character/394"], url: "https://rickandmortyapi.com/api/location/1", created: "2017-11-10T12:42:04.162Z")
            
            LocationDetailScreen(location: location)
        }
    }
}
