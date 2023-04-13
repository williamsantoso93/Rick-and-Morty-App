//
//  CharacterFilterScreen.swift
//  Rick-and-Morty-App
//
//  Created by William Santoso on 12/04/23.
//

import SwiftUI

struct CharacterFilterScreen: View {
    @Environment(\.dismiss) var dismiss
    
    private let statusTypes: [String] = Status.allCasesRawValue()
    @State private var selectedStatusType: Int = 0
    
    private let speciesTypes: [String] = [
        "Alien",
        "Animal",
        "Mythological Creature",
        "Human"
    ]
    @State private var selectedSpeciesType: Int = 0
    
    private let genderTypes: [String] = Gender.allCasesRawValue()
    @State private var selectedGenderType: Int = 0
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading) {
                VStack(alignment: .leading, spacing: 20.0) {
                    FilterType(title: "Status", types: statusTypes, selectedIndex: $selectedStatusType)
                    
                    FilterType(title: "Species", types: speciesTypes, selectedIndex: $selectedSpeciesType)
                    
                    FilterType(title: "Gender", types: genderTypes, selectedIndex: $selectedGenderType)
                }
                .padding(.horizontal)
                
                Spacer()
                
                Button {
                    dismiss()
                } label: {
                    Text("Apply")
                        .font(.title3)
                        .bold()
                        .frame(minWidth: 100, maxWidth: .infinity, minHeight: 50)
                        .foregroundColor(.white)
                        .background {
                            Color.accentColor
                        }
                        .cornerRadius(10)
                }
                .padding(.horizontal, 32)
                .padding(.vertical, 12)
            }
            .navigationTitle("Filter")
            .navigationBarTitleDisplayMode(.large)
        }
    }
    
    
    struct FilterType: View {
        var title: String
        var types: [String]
        @Binding var selectedIndex: Int
        
        var body: some View {
            VStack(alignment: .leading, spacing: 10.0) {
                Text(title)
                    .font(.title3)
                    .bold()
                
                TagLayout(alignment: .leading) {
                    ForEach(types.indices, id:\.self) { index in
                        ButtonType(text: types[index], index: index, selectedIndex: $selectedIndex)
                    }
                }
            }
        }
        
        struct ButtonType: View {
            var text: String
            var index: Int
            @Binding var selectedIndex: Int
            
            var isSelected: Bool {
                selectedIndex == index
            }
            var color: Color {
                isSelected ? .accentColor : .secondary
            }
            
            var body: some View {
                Button {
                    selectedIndex = index
                } label: {
                    Text(text)
                        .bold()
                        .font(.footnote)
                        .frame(height: 35)
                        .padding(.horizontal)
                        .background {
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(color, lineWidth: 1)
                        }
                        .foregroundColor(color)
                }
            }
        }
    }
}

struct CharacterFilterScreen_Previews: PreviewProvider {
    static var previews: some View {
        CharacterFilterScreen()
    }
}
