//
//  extra.swift
//  Test- lektion 5
//
//  Created by Oskar Hultman on 2022-09-15.
//

import Foundation



class Player {
    
    var name: String
    var marker: String
    
    init(name: String, marker: String) {
        self.name = name
        self.marker = marker
    }
    
    var board: Array = [0,0,0,0,0,0,0,0,0]
}
