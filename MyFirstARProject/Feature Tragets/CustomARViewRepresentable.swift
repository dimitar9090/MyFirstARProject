//
//  CustomARViewRepresentable.swift
//  MyFirstARProject
//
//  Created by Dimitar Angelov on 22.07.24.
//

import SwiftUI

struct CustomARViewRepresentable: UIViewRepresentable {
    func makeUIView(context: Context) -> CustomARView {
        return CustomARView()
    }
    func updateUIView(_ uiView: CustomARView, context: Context) {}
}
