//
//  CharacterDetailScreen.swift
//  Rick-and-Morty-App
//
//  Created by William Santoso on 12/04/23.
//

import SwiftUI

struct CharacterDetailScreen: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 19) {
                HStack(spacing: 18) {
                    AsyncImage(url: URL(string: "https://rickandmortyapi.com/api/character/avatar/1.jpeg")) { image in
                        image
                            .resizable()
                    } placeholder: {
                        ProgressView()
                    }
                    .frame(width: 180, height: 320)
                    .cornerRadius(10)
                    
                    VStack(alignment: .leading) {
                        Text("Morty Smith")
                            .font(.title2)
                            .bold()
                        
                        VStack(alignment: .leading, spacing: 16) {
                            TextWithIcon(text: "Status: Alive", icon: "Alive")
                            TextWithIcon(text: "Gender: Male", icon: "Male")
                            
                            Text("Species:Human")
                        }
                        
                        Spacer()
                        
                        VStack(alignment: .leading, spacing: 0) {
                            Text("Created")
                                .font(.footnote)
                                .bold()
                            
                            Text("2017-11-04T18:50:21.651Z")
                                .font(.caption)
                        }
                    }
                    .padding(.vertical)
                    Spacer()
                }
                
                Grid {
                    GridRow {
                        TextWithSubtext(text: "Origin", subtext: "Earth")
                        Spacer()
                        TextWithSubtext(text: "Location", subtext: "Citadel of Ricks")
                        Spacer()
                    }
                }
                
                VStack(alignment: .leading, spacing: 0) {
                    Text("Episode")
                        .font(.title3)
                        .bold()
                    
                    ForEach(0 ..< 5) { item in
                        Text("subtext")
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
        NavigationStack {
            CharacterDetailScreen()
        }
    }
}

//XCTAssertEqual(data.id, 2)
//XCTAssertEqual(data.name, "Morty Smith")
//XCTAssertEqual(data.image, "https://rickandmortyapi.com/api/character/avatar/2.jpeg")
//XCTAssertEqual(data.status, .alive)
//XCTAssertEqual(data.gender, .male)
//XCTAssertEqual(data.species, "Human")
//XCTAssertEqual(data.created, "2017-11-04T18:50:21.651Z")
//XCTAssertEqual(data.origin.name, "unknown")
//XCTAssertEqual(data.location.name, "Citadel of Ricks")
//XCTAssertTrue(!data.episode.isEmpty)
