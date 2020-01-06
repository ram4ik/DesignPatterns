//
//  FactoryMethod.swift
//  DesignPatterns
//
//  Created by ramil on 06.01.2020.
//  Copyright © 2020 Ramill Ibragimov. All rights reserved.
//

import Foundation

protocol Serializable {
    func serialize()
}

class JSONSerializer: Serializable {
    func serialize() {
        print("JSONSerializer \(#function)")
    }
}

class PropertyListSerializer: Serializable {
    func serialize() {
        print("PropertyListSerializer \(#function)")
    }
}

class XMLSerializer: Serializable {
    func serialize() {
        print("XMLSerializer \(#function)")
    }
}

enum Serializers {
    case json
    case plist
    case xml
}

func makeSerializer(_ type: Serializers) -> Serializable? {
    let result: Serializable?
    switch type {
    case .json: result = JSONSerializer()
    case .plist: result = PropertyListSerializer()
    case .xml: result = XMLSerializer()
    }
    return result
}

class FactoryExecutor {
    func execute() {
        let jsonSerializer = makeSerializer(.json)
        jsonSerializer?.serialize()

        let xmlSerializer = makeSerializer(.xml)
        xmlSerializer?.serialize()

        struct SerializerFactory {
            static func makeSerializer(_ type: Serializers) -> Serializable? {
                let result: Serializable?
                switch type {
                case .json: result = JSONSerializer()
                case .plist: result = PropertyListSerializer()
                case .xml: result = XMLSerializer()
                }
                return result
            }
        }

        let plistSerializer = SerializerFactory.makeSerializer(.plist)
        plistSerializer?.serialize()
    }
}


