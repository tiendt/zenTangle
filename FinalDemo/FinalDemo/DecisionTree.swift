//
//  DecisionTree.swift
//  FinalDemo
//
//  Created by Tien Dao on 4/19/16.
//  Copyright © 2016 Tien Dao. All rights reserved.
//

import Foundation

class DecisionTree: NSObject {
    
    var root: DTNode?
    
    func getZen(mentally: String, physically: String, day: String) -> String {
        
        return (root?.getNode(mentally).getNode(physically).getNode(day).getData())!
    }
}