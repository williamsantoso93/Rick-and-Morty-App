//
//  CharacterRowView.swift
//  Rick-and-Morty-App
//
//  Created by William Santoso on 12/04/23.
//

import SwiftUI

struct CharacterRowView: View {
    let frameWidth: CGFloat = UIScreen.main.bounds.size.width / 2 - 20 - 11
    
    var body: some View {
        VStack(spacing: 0) {
            AsyncImage(url: URL(string: "https://rickandmortyapi.com/api/character/avatar/1.jpeg")) { image in
                image
                    .resizable()
            } placeholder: {
                ProgressView()
            }
            .frame(width: frameWidth, height: 177)
            
            VStack(spacing: 4) {
                Text("Morty Smith")
                    .font(.title3)
                    .bold()
                
                Text("Human")
                    .font(.subheadline)
            }
            .padding(.vertical, 6)
            .foregroundColor(.black)
        }
        .background {
            Color(uiColor: UIColor(red: 0.929, green: 0.929, blue: 0.929, alpha: 1))
        }
        .cornerRadius(10)
    }
}

struct CharacterRowView_Previews: PreviewProvider {
    static var previews: some View {
        CharacterRowView()
    }
}
