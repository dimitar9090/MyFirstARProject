//
//  CustomARView.swift
//  MyFirstARProject
//
//  Created by Dimitar Angelov on 22.07.24.
//

import ARKit
import Combine
import RealityKit
import SwiftUI

class CustomARView: ARView {
    required init(frame frameRect: CGRect) {
        super.init(frame: frameRect)
    }
    
    dynamic   required init?(coder decoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    convenience init() {
        self.init(frame: UIScreen.main.bounds)
        
        subscribeToActionStream()
    }
    
    private var cancellables: Set<AnyCancellable> =
    []
    
    func subscribeToActionStream() {
        ARManager.shared
            .actionStream
            .sink { [weak self] action in
                switch action {
                    case .placeBlock(let color):
                        self?.placeBlock(ofColor: color)
                    case .removeAllAnchors:
                        self?.scene.anchors.removeAll()
                }
                
            }
            .store(in: &cancellables)
    }
    
    func placeBlock(ofColor color: Color) {
        let block = MeshResource.generateBox(size: 0.5)
        let material = SimpleMaterial(color: UIColor(color), isMetallic: false)
        let entity = ModelEntity(mesh: block, materials: [material])
        
        let anchor = AnchorEntity(plane: .horizontal)
        anchor.addChild(entity)
        
        scene.addAnchor(anchor)
    }
}
