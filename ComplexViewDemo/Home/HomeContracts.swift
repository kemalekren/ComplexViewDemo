//
//  HomeContracts.swift
//  ComplexViewDemo
//
//  Created by Kemal Ekren on 6.11.2022.
//

import Foundation

protocol HomeVMProtocol: AnyObject {
    var delegate: HomeVMOutputDelegate? { get set}
    var homeData: [HomePresentation] { get set }
    
    func loadData()
}

protocol HomeVMOutputDelegate: AnyObject {
    func refreshUI()
}

