//
//  EpisodeRowView.swift
//  Rick-and-Morty-App
//
//  Created by William Santoso on 12/04/23.
//

import SwiftUI

struct EpisodeRowView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("Pilot")
                .font(.title2)
                .bold()
            
            Grid {
                GridRow {
                    Text("season: \("1")\nepisode:\("3")")
                        .font(.title3)
                        .multilineTextAlignment(.leading)
                    
                    Spacer()
                    
                    Text("Air Date:\n\("2 December 2013")")
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
        EpisodeRowView()
            .padding()
    }
}
