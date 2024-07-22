//
//  ContentView.swift
//  MyFirstARProject
//
//  Created by Dimitar Angelov on 22.07.24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        CustomARViewRepresentable()
            .ignoresSafeArea()
    }
}

#Preview {
    ContentView()
}
