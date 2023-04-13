//
//  CharacterRowView.swift
//  Rick-and-Morty-App
//
//  Created by William Santoso on 12/04/23.
//

import SwiftUI

struct CharacterRowView: View {
    var character: Character
    let frameWidth: CGFloat = UIScreen.main.bounds.size.width / 2 - 20 - 11
    
    var backgroundColor: Color {
        if character.species.lowercased() == "human" {
            return Color(uiColor: UIColor(red: 0.929, green: 0.929, blue: 0.929, alpha: 1))
        } else {
            return Color(uiColor: UIColor(red: 0.827, green: 1, blue: 0.133, alpha: 1))
        }
    }
    
    var body: some View {
        VStack(spacing: 0) {
            AsyncImage(url: URL(string: character.image)) { image in
                image
                    .resizable()
            } placeholder: {
                ProgressView()
            }
            .frame(height: 177)
            
            VStack(spacing: 4) {
                Text(character.name)
                    .font(.title3)
                    .bold()
                    .lineLimit(1)
                
                Text(character.species)
                    .font(.subheadline)
                    .lineLimit(1)
            }
            .padding(6)
            .foregroundColor(.black)
        }
        .frame(width: frameWidth)
        .background {
            backgroundColor
        }
        .cornerRadius(10)
    }
}

struct CharacterRowView_Previews: PreviewProvider {
    static var previews: some View {
        let character = Character(id: 1, name: "Rick Sanchez", status: Status.alive, species: "Human", type: "", gender: Gender.male, origin: CharacterLocation(name: "Earth (C-137)", url: "https://rickandmortyapi.com/api/location/1"), location: CharacterLocation(name: "Citadel of Ricks", url: "https://rickandmortyapi.com/api/location/3"), image: "https://rickandmortyapi.com/api/character/avatar/1.jpeg", episode: ["https://rickandmortyapi.com/api/episode/1", "https://rickandmortyapi.com/api/episode/2", "https://rickandmortyapi.com/api/episode/3", "https://rickandmortyapi.com/api/episode/4", "https://rickandmortyapi.com/api/episode/5", "https://rickandmortyapi.com/api/episode/6", "https://rickandmortyapi.com/api/episode/7", "https://rickandmortyapi.com/api/episode/8", "https://rickandmortyapi.com/api/episode/9", "https://rickandmortyapi.com/api/episode/10", "https://rickandmortyapi.com/api/episode/11", "https://rickandmortyapi.com/api/episode/12", "https://rickandmortyapi.com/api/episode/13", "https://rickandmortyapi.com/api/episode/14", "https://rickandmortyapi.com/api/episode/15", "https://rickandmortyapi.com/api/episode/16", "https://rickandmortyapi.com/api/episode/17", "https://rickandmortyapi.com/api/episode/18", "https://rickandmortyapi.com/api/episode/19", "https://rickandmortyapi.com/api/episode/20", "https://rickandmortyapi.com/api/episode/21", "https://rickandmortyapi.com/api/episode/22", "https://rickandmortyapi.com/api/episode/23", "https://rickandmortyapi.com/api/episode/24", "https://rickandmortyapi.com/api/episode/25", "https://rickandmortyapi.com/api/episode/26", "https://rickandmortyapi.com/api/episode/27", "https://rickandmortyapi.com/api/episode/28", "https://rickandmortyapi.com/api/episode/29", "https://rickandmortyapi.com/api/episode/30", "https://rickandmortyapi.com/api/episode/31", "https://rickandmortyapi.com/api/episode/32", "https://rickandmortyapi.com/api/episode/33", "https://rickandmortyapi.com/api/episode/34", "https://rickandmortyapi.com/api/episode/35", "https://rickandmortyapi.com/api/episode/36", "https://rickandmortyapi.com/api/episode/37", "https://rickandmortyapi.com/api/episode/38", "https://rickandmortyapi.com/api/episode/39", "https://rickandmortyapi.com/api/episode/40", "https://rickandmortyapi.com/api/episode/41", "https://rickandmortyapi.com/api/episode/42", "https://rickandmortyapi.com/api/episode/43", "https://rickandmortyapi.com/api/episode/44", "https://rickandmortyapi.com/api/episode/45", "https://rickandmortyapi.com/api/episode/46", "https://rickandmortyapi.com/api/episode/47", "https://rickandmortyapi.com/api/episode/48", "https://rickandmortyapi.com/api/episode/49", "https://rickandmortyapi.com/api/episode/50", "https://rickandmortyapi.com/api/episode/51"], url: "https://rickandmortyapi.com/api/character/1", created: Optional("2017-11-04T18:48:46.250Z"))
        CharacterRowView(character: character)
    }
}
