//
//  ARManager.swift
//  MyFirstARProject
//
//  Created by Dimitar Angelov on 22.07.24.
//

import Combine

class ARManager {
    static let shared = ARManager()
    private init() { }
    
    var actionStream = PassthroughSubject<ARAction, Never>()
}
