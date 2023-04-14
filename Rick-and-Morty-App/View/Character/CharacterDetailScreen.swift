//
//  CharacterDetailScreen.swift
//  Rick-and-Morty-App
//
//  Created by William Santoso on 12/04/23.
//

import SwiftUI

struct CharacterDetailScreen: View {
    var character: Character
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 19) {
                HStack(spacing: 18) {
                    AsyncImage(url: URL(string: character.image)) { image in
                        image
                            .resizable()
                    } placeholder: {
                        ProgressView()
                    }
                    .frame(width: 180, height: 320)
                    .cornerRadius(10)
                    
                    VStack(alignment: .leading) {
                        Text(character.name)
                            .font(.title2)
                            .bold()
                        
                        VStack(alignment: .leading, spacing: 16) {
                            TextWithIcon(text: "Status: \(character.status.rawValue)", icon: character.status.rawValue)
                            TextWithIcon(text: "Gender: \(character.gender.rawValue)", icon: character.gender.rawValue)
                            
                            Text("Species: \(character.species)")
                        }
                        
                        Spacer()
                        
                        VStack(alignment: .leading, spacing: 0) {
                            Text("Created")
                                .font(.footnote)
                                .bold()
                            
                            Text(character.createdFormatted)
                                .font(.caption)
                        }
                    }
                    .padding(.vertical)
                    Spacer()
                }
                
                Grid {
                    GridRow {
                        TextWithSubtext(text: "Origin", subtext: character.origin.name)
                        Spacer()
                        TextWithSubtext(text: "Location", subtext: character.location.name)
                        Spacer()
                    }
                }
                
                VStack(alignment: .leading, spacing: 0) {
                    Text("Episode")
                        .font(.title3)
                        .bold()
                    
                    ForEach(character.episode, id:\.self) { item in
                        Text(item)
                    }
                }
            }
            .padding(.horizontal, 20)
            .padding(.vertical, 40)
        }
        .navigationTitle("Morty Smith")
        .navigationBarTitleDisplayMode(.inline)
    }
    
    struct TextWithIcon: View {
        var text: String
        var icon: String
        
        var body: some View {
            HStack {
                Text(text)
                
                Image(icon)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 30, height: 30)
            }
        }
    }
    
    struct TextWithSubtext: View {
        var text: String
        var subtext: String
        
        var body: some View {
            VStack(alignment: .leading, spacing: 0) {
                Text(text)
                    .font(.title3)
                    .bold()
                
                Text(subtext)
            }
        }
    }
}

struct CharacterDetail_Previews: PreviewProvider {
    static var previews: some View {
        let character = Character(id: 1, name: "Rick Sanchez", status: Status.alive, species: "Human", type: "", gender: Gender.male, origin: CharacterLocation(name: "Earth (C-137)", url: "https://rickandmortyapi.com/api/location/1"), location: CharacterLocation(name: "Citadel of Ricks", url: "https://rickandmortyapi.com/api/location/3"), image: "https://rickandmortyapi.com/api/character/avatar/1.jpeg", episode: ["https://rickandmortyapi.com/api/episode/1", "https://rickandmortyapi.com/api/episode/2", "https://rickandmortyapi.com/api/episode/3", "https://rickandmortyapi.com/api/episode/4", "https://rickandmortyapi.com/api/episode/5", "https://rickandmortyapi.com/api/episode/6", "https://rickandmortyapi.com/api/episode/7", "https://rickandmortyapi.com/api/episode/8", "https://rickandmortyapi.com/api/episode/9", "https://rickandmortyapi.com/api/episode/10", "https://rickandmortyapi.com/api/episode/11", "https://rickandmortyapi.com/api/episode/12", "https://rickandmortyapi.com/api/episode/13", "https://rickandmortyapi.com/api/episode/14", "https://rickandmortyapi.com/api/episode/15", "https://rickandmortyapi.com/api/episode/16", "https://rickandmortyapi.com/api/episode/17", "https://rickandmortyapi.com/api/episode/18", "https://rickandmortyapi.com/api/episode/19", "https://rickandmortyapi.com/api/episode/20", "https://rickandmortyapi.com/api/episode/21", "https://rickandmortyapi.com/api/episode/22", "https://rickandmortyapi.com/api/episode/23", "https://rickandmortyapi.com/api/episode/24", "https://rickandmortyapi.com/api/episode/25", "https://rickandmortyapi.com/api/episode/26", "https://rickandmortyapi.com/api/episode/27", "https://rickandmortyapi.com/api/episode/28", "https://rickandmortyapi.com/api/episode/29", "https://rickandmortyapi.com/api/episode/30", "https://rickandmortyapi.com/api/episode/31", "https://rickandmortyapi.com/api/episode/32", "https://rickandmortyapi.com/api/episode/33", "https://rickandmortyapi.com/api/episode/34", "https://rickandmortyapi.com/api/episode/35", "https://rickandmortyapi.com/api/episode/36", "https://rickandmortyapi.com/api/episode/37", "https://rickandmortyapi.com/api/episode/38", "https://rickandmortyapi.com/api/episode/39", "https://rickandmortyapi.com/api/episode/40", "https://rickandmortyapi.com/api/episode/41", "https://rickandmortyapi.com/api/episode/42", "https://rickandmortyapi.com/api/episode/43", "https://rickandmortyapi.com/api/episode/44", "https://rickandmortyapi.com/api/episode/45", "https://rickandmortyapi.com/api/episode/46", "https://rickandmortyapi.com/api/episode/47", "https://rickandmortyapi.com/api/episode/48", "https://rickandmortyapi.com/api/episode/49", "https://rickandmortyapi.com/api/episode/50", "https://rickandmortyapi.com/api/episode/51"], url: "https://rickandmortyapi.com/api/character/1", created: Optional("2017-11-04T18:48:46.250Z"))
        NavigationStack {
            CharacterDetailScreen(character: character)
        }
    }
}
