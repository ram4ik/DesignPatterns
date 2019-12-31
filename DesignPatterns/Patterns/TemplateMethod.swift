//
//  TemplateMethod.swift
//  DesignPatterns
//
//  Created by Ramill Ibragimov on 31.12.2019.
//  Copyright © 2019 Ramill Ibragimov. All rights reserved.
//

import Foundation

class DataReadingAlgorithm {
    
    func openResource() {
        fatalError("This method must be overriden in subclass")
    }
    func extractData() {
        print("Extracting data...")
    }
    func parseData() {
        print("Parsing data...")
    }
    func processData() {
        print("Process data...")
    }
    func closeResource() {
        fatalError("This method must be overriden in subclass")
    }
    
    final func readData() {
        openResource()
        extractData()
        parseData()
        processData()
        closeResource()
    }
}

class FileReader: DataReadingAlgorithm {
    
    override func openResource() {
        print("Open file")
    }
    
    override func closeResource() {
        print("Close file\n")
    }
}

class BufferReader: DataReadingAlgorithm {
    
    override func openResource() {
        print("Open buffer")
    }
    
    override func closeResource() {
        print("Close buffer\n")
    }
}

class DataBaseReader: DataReadingAlgorithm {
    
    override func openResource() {
        print("Open data base")
    }
    
    override func closeResource() {
        print("Close data base\n")
    }
}

class TemplateMethodExecutor {
    
    func execute() {
        
        let fileReader = FileReader()
        fileReader.readData()
        
        let bufferReader = BufferReader()
        bufferReader.readData()
        
        let dataBaseReader = DataBaseReader()
        dataBaseReader.readData()
    }
}
