//
//  HomeSceneBuilder.swift
//  ComplexViewDemo
//
//  Created by Kemal Ekren on 6.11.2022.
//

import Foundation

final class HomeSceneBuilder {
    static func createController() -> HomeScene {
        let vc = HomeScene()
        vc.vm = HomeViewModel()
        return vc
    }
}
