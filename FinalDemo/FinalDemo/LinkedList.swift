//
//  LinkedList.swift
//  FinalDemo
//
//  Created by Tien Dao on 4/19/16.
//  Copyright © 2016 Tien Dao. All rights reserved.
//

import Foundation

class LinkedList<T:NSObject> {
    var count: Int = 0
    var head: LLNode<T> = LLNode<T>()
    var tail: LLNode<T> = LLNode<T>()
    
    init() {
    }
    
    func isEmpty() -> Bool {
        return self.count == 0
    }
    
    func addItem(data: T) {
        var node = LLNode<T>(data: data)
        if self.isEmpty() {
            self.head = node
            self.tail = node
        } else {
            node.prev = self.tail
            self.tail.next = node
            self.tail = node
        }
        self.count++
    }
    
    func insertItem(data: T, position: Int){
        let node = LLNode<T>(data: data)
        if (self.count > position) {            // -if position exists
            if (position == 0){                 // --if position is head
                node.next = self.head
                self.head.prev = node
                self.head = node
            } else {                            // --if position is not head
                var currentNode = self.head
                for _ in 0...position-1 {
                    currentNode = currentNode.next!
                }
                node.next = currentNode
                node.prev = currentNode.prev
                currentNode.prev!.next = node
                currentNode.prev = node
            }
            self.count++
        }
    }
    
    func removeItem(position: Int) {
        if (self.count > position){                             // -if position exists
            if (self.count != 1){
                if (position == 0){                             // --if position is head
                    self.head.next!.prev = head.prev
                    self.head = head.next!
                }
                if (position == self.count-1){                  // --if position is tail
                    self.tail.prev!.next = tail.next
                    self.tail = tail.prev!
                }
                if (position > 0 && position < count-1){        // --if position at middle
                    var currentNode = self.head
                    for _ in 0...position-1 {
                        currentNode = currentNode.next!
                    }
                    currentNode.next!.prev = currentNode.prev
                    currentNode.prev!.next = currentNode.next
                }
            } else {                                            // -if last node
                head = LLNode<T>()
                tail = LLNode<T>()
            }
            self.count--
        }
    }
    
    func replaceItem(itemToReplace: T, position: Int) {
        if (self.count > position){                         // -if position exists
            var currentNode = self.head
            if (position == 0){                             // --if position is head
                currentNode.data = itemToReplace
            } else {                                        // --if position is not head
                for _ in 0...position-1{
                    currentNode = currentNode.next!
                }
                currentNode.data = itemToReplace
            }
        }
    }
    
    func getItemAt(position: Int) -> T? {
        if (self.count > position){                         // -if position exists
            var currentNode = self.head
            if (position == 0){                             // --if position is head
                return currentNode.data
            } else {                                        // --if posisiton is not head
                for _ in 0...position-1{
                    currentNode = currentNode.next!
                }
                return currentNode.data
            }
        } else {
            return nil                                      // -- if position doesn't exist
        }
        
    }
    
    func printList() {
        var output: String = "["
        var currentNode: LLNode? = self.head
        while (currentNode != nil) {
            output += String(currentNode!.data)
            currentNode = currentNode!.next
            if (currentNode != nil){                // If statement is for avoid "," sign at the end.
                output += ", "
            }
        }
        output += "]"
        print(output)
    }
    
    func printInverse() {
        var output: String = "["
        var currentNode: LLNode? = self.tail
        while (currentNode != nil) {
            output += String(currentNode!.data)
            currentNode = currentNode!.prev
            if (currentNode != nil){                // If statement is for avoid "," sign at the end.
                output += ", "
            }
        }
        output += "]"
        print(output)
    }
    
}

