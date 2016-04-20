//
//  DTNode.swift
//  FinalDemo
//
//  Created by Tien Dao on 4/19/16.
//  Copyright © 2016 Tien Dao. All rights reserved.
//

import Foundation


class DTNode: NSObject {
    var pic: String? = nil
    var great: DTNode? = nil
    var good: DTNode? = nil
    var meh: DTNode? = nil
    var rough: DTNode? = nil
    
    
    init(pic: String) {
        super.init()
        self.pic = pic
    }
    
    func getData() -> String {
        return pic!
    }
    
    func getGreat() -> DTNode {
        return great!
    }
    
    func getGood() -> DTNode {
        return good!
    }
    
    func getMeh() -> DTNode {
        return meh!
    }
    
    func getRough() -> DTNode {
        return rough!
    }
    
    func isLeaf(node: DTNode) -> Bool {
        return (node.great==nil && node.good==nil && node.meh==nil && node.rough==nil)
    }
    
    func getNode (nodeType: String) -> DTNode {
        if (nodeType == "great") {
            return getGreat()
        }
        
        else if (nodeType == "good") {
            return getGood()
        }
        
        else if (nodeType == "meh") {
            return getMeh()
        }
        
        else {
            return getRough()
        }
    }
    
    
}

