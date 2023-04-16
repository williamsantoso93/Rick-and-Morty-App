//
//  LoadingView.swift
//  Rick-and-Morty-App
//
//  Created by William Santoso on 13/04/23.
//

import SwiftUI

struct LoadingViewModifier: ViewModifier {
    var isLoading: Bool
    
    func body(content: Content) -> some View {
        content
            .disabled(isLoading)
            .overlay {
                if isLoading {
                    ZStack {
                        Color.primary
                            .opacity(0.02)
                            .frame(width: 100, height: 100)
                            .cornerRadius(12)
                        ProgressView()
                    }
                }
            }
    }
}

extension View {
    func loading(_ isLoading: Bool) -> some View {
        self.modifier(LoadingViewModifier(isLoading: isLoading))
    }
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        Color.white
            .loading(true)
            .previewDisplayName("Loading")
    }
}
