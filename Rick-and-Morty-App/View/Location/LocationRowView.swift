//
//  LocationRowView.swift
//  Rick-and-Morty-App
//
//  Created by William Santoso on 12/04/23.
//

import SwiftUI

struct LocationRowView: View {
    var location: Location
    
    
    let columns: [GridItem] = [
        GridItem(.flexible()),
        GridItem(.flexible()),
    ]
    
    var body: some View {
        VStack {
            LazyVGrid(columns: columns, alignment: .leading, spacing: 20) {
                VStack(alignment: .leading, spacing: 12.0) {
                    Text(location.name)
                        .lineLimit(1)
                        .font(.title3)
                    
                    Text(location.type)
                        .font(.callout)
                }
                
                Text("Dimension:\n\(location.dimension)")
                    .lineLimit(2)
                    .font(.callout)
                    .multilineTextAlignment(.leading)
                    .bold()
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

struct LocationRowView_Previews: PreviewProvider {
    static var previews: some View {
        let location = Location(id: 1, name: "Earth (C-137)", type: "Planet", dimension: "Dimension C-137", residents: ["https://rickandmortyapi.com/api/character/38", "https://rickandmortyapi.com/api/character/45", "https://rickandmortyapi.com/api/character/71", "https://rickandmortyapi.com/api/character/82", "https://rickandmortyapi.com/api/character/83", "https://rickandmortyapi.com/api/character/92", "https://rickandmortyapi.com/api/character/112", "https://rickandmortyapi.com/api/character/114", "https://rickandmortyapi.com/api/character/116", "https://rickandmortyapi.com/api/character/117", "https://rickandmortyapi.com/api/character/120", "https://rickandmortyapi.com/api/character/127", "https://rickandmortyapi.com/api/character/155", "https://rickandmortyapi.com/api/character/169", "https://rickandmortyapi.com/api/character/175", "https://rickandmortyapi.com/api/character/179", "https://rickandmortyapi.com/api/character/186", "https://rickandmortyapi.com/api/character/201", "https://rickandmortyapi.com/api/character/216", "https://rickandmortyapi.com/api/character/239", "https://rickandmortyapi.com/api/character/271", "https://rickandmortyapi.com/api/character/302", "https://rickandmortyapi.com/api/character/303", "https://rickandmortyapi.com/api/character/338", "https://rickandmortyapi.com/api/character/343", "https://rickandmortyapi.com/api/character/356", "https://rickandmortyapi.com/api/character/394"], url: "https://rickandmortyapi.com/api/location/1", created: "2017-11-10T12:42:04.162Z")
        
        LocationRowView(location: location)
            .padding()
    }
}
