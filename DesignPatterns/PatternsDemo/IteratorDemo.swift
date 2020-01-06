//
//  IteratorDemo.swift
//  DesignPatterns
//
//  Created by ramil on 06.01.2020.
//  Copyright © 2020 Ramill Ibragimov. All rights reserved.
//

import Foundation

// Custom queue implementation

private final class Node<T> {
    var key: T?
    var next: Node?
    
    init(_ value: T? = nil) {
        key = value
    }
}

final class Queue<T> {
    fileprivate var head: Node<T>?
    private var tail: Node<T>?
    
    func enqueue(_ value: T) {
        let newNode = Node<T>(value)
        // First element's value has not been set?
        guard head != nil else {
            head = newNode
            tail = head
            return
        }

        // append new element
        tail?.next = newNode
        tail = newNode
    }
    
    func dequeue() -> T? {
        guard let headItem = head?.key else {
            return nil
        }
        
        if let nextNode = head?.next {
            head = nextNode
        } else {
            head = nil
            tail = nil
        }
        return headItem
    }
    
    func isEmpty() -> Bool {
        return head == nil
    }
    
    func peek() -> T? {
        return head?.key
    }
}


struct QueueIterator<T>: IteratorProtocol {
    private let queue: Queue<T>
    private var currentNode: Node<T>?
    
    init(_ queue: Queue<T>) {
        self.queue = queue
        currentNode = queue.head
    }
    
    mutating func next() -> T? {
        guard let node = currentNode else {
            return nil
        }
        
        let nextKey = currentNode?.key
        currentNode = node.next
        return nextKey
    }
}

extension Queue: Sequence {
    func makeIterator() -> QueueIterator<T> {
        return QueueIterator(self)
    }
}

class IteratorDemoExecutor {
    func execute() {
        let queue = Queue<Int>()
        queue.enqueue(1)
        queue.enqueue(2)

        for item in queue {
            print(item)
        }

        var queryIterator = queue.makeIterator()
        while let item = queryIterator.next() {
            print(item)
        }
    }
}
