//
//  MyStack.swift
//  Lifo
//
//  Created by Mark Meretzky on 3/22/19.
//  Copyright © 2019 New York University School of Professional Studies. All rights reserved.
//

import Foundation;


//Version 1: a struct hardwired to store and retrieve Strings.
/*
struct MyStackOfStrings {
    var items: [String] = [String]();
    
    var count: Int {   //computed property
        return items.count;
    }
    
    // MARK: - Mutating methods
    
    mutating func push(_ item: String) {
        items.append(item);
    }

    //@discardableResult
    mutating func pop() -> String {
        guard !items.isEmpty else {
            fatalError("can't take blood from a stone");
        }
        return items.removeLast();
    }
}

extension MyStackOfStrings {   //to make it easy to display the MyStackOfInts in a UITableView
    // Item 0 is the first one pushed.
    // Item count - 1 is the most recently pushed.
    
    func get(_ i: Int) -> String {
        guard (0 ..< count).contains(i) else {
            fatalError("can't get item \(i) of \(count)");
        }
        return items[i];
    }
}
*/

/*
//Version 2: a struct hardwired to store and retrieve Ints.
//Change the original String to Int in 5 places.

struct MyStackOfInts {
    var items: [Int] = [Int]();
    
    var count: Int {   //computed property
        return items.count;
    }

    // MARK: - Mutating methods
    
    mutating func push(_ item: Int) {
        items.append(item);
    }
 
    mutating func pop() -> Int {
        guard !items.isEmpty else {
            fatalError("can't take blood from a stone");
        }
        return items.removeLast();
    }
}

extension MyStackOfInts {   //to make it easy to display the MyStackOfInts in a UITableView
    // Item 0 is the first one pushed.
    // Item count - 1 is the most recently pushed.
    
    func get(_ i: Int) -> Int {
        guard (0 ..< count).contains(i) else {
            fatalError("can't get item \(i) of \(count)");
        }
        return items[i];
    }
}
*/

/*
//Version 3: a struct with typealias.
//Change the original String to Element in 5 places.
typealias Element = Int;

struct MyStack {
    var items: [Element] = [Element]();
    
    var count: Int {   //computed property
        return items.count;
    }
    
    // MARK: - Mutating methods
    
    mutating func push(_ item: Element) {
        items.append(item);
    }
 
    mutating func pop() -> Element {
        guard !items.isEmpty else {
            fatalError("can't take blood from a stone");
        }
        return items.removeLast();
    }
}

extension MyStack {   //to make it easy to display the MyStack in a UITableView
    // Item 0 is the first one pushed.
    // Item count - 1 is the most recently pushed.
    
    func get(_ i: Int) -> Element {
        guard (0 ..< count).contains(i) else {
            fatalError("can't get item \(i) of \(count)");
        }
        return items[i];
    }
}
*/


//Version 4: a generic struct.

struct MyStack<Element> {
    var items: [Element] = [Element]();
    
    var count: Int {   //computed property
        return items.count;
    }
    
    // MARK: - Mutating methods

    mutating func push(_ item: Element) {
        items.append(item);
    }

    mutating func pop() -> Element {
        guard !items.isEmpty else {
            fatalError("can't take blood from a stone");
        }
        return items.removeLast();
    }
}

extension MyStack {   //to make it easy to display the MyStack in a UITableView
    // Item 0 is the first one pushed.
    // Item count - 1 is the most recently pushed.

    subscript(i: Int) -> Element {
        guard (0 ..< count).contains(i) else {
            fatalError("can't get item \(i) of \(count)");
        }
        return items[i];
    }
}

struct MyQueueOfStrings<Element> {
    var items: [Element] = [Element]();
    
    var count: Int {   //computed property
        return items.count;
    }
    
    // MARK: - Mutating methods
    
    mutating func enqueue(_ item: Element) {
        items.append(item);
    }
    
    mutating func dequeue() -> Element {
        guard !items.isEmpty else {
            fatalError("can't take blood from a stone");
        }
        return items.removeFirst();
    }
}

extension MyQueueOfStrings {   //to make it easy to display the MyQueueOfStrings in a UITableView
    // Item 0 is the first one enqueued.
    // Item count - 1 is the most recently enqueued.
    
    subscript(i: Int) -> Element {
        guard (0 ..< count).contains(i) else {
            fatalError("can't get item \(i) of \(count)");
        }
        return items[i];
    }
}
