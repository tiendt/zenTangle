//
//  LLNode.swift
//  FinalDemo
//
//  Created by Tien Dao on 4/19/16.
//  Copyright © 2016 Tien Dao. All rights reserved.
//

import Foundation

class LLNode<T:NSObject> {
    var data: T? = nil
    var next: LLNode<T>? = nil
    var prev: LLNode<T>? = nil
    
    init() {
    }
    
    init(data: T) {
        self.data = data
    }
}
