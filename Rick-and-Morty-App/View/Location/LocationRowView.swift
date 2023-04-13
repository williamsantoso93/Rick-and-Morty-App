//
//  LocationRowView.swift
//  Rick-and-Morty-App
//
//  Created by William Santoso on 12/04/23.
//

import SwiftUI

struct LocationRowView: View {
    var body: some View {
        VStack {
            Grid {
                GridRow {
                    VStack(alignment: .leading, spacing: 12.0) {
                        Text("Earth (D-99)")
                            .font(.title3)
                        
                        Text("Planet")
                            .font(.callout)
                    }
                    .bold()
                    
                    Spacer()
                    
                    Text("Dimension:\n\("dimension D-99")")
                        .font(.callout)
                        .multilineTextAlignment(.leading)
                        .bold()
                    
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

struct LocationRowView_Previews: PreviewProvider {
    static var previews: some View {
        LocationRowView()
            .padding()
    }
}
