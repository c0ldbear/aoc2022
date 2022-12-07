//
//  ReadInput.swift
//  aoc20221201
//
//  Created by Teddy Juhlin-Henricson on 2022-12-01.
//

import Foundation

class ReadInput {
    
    var inputFolder: String
    
    static var shared = ReadInput(inputFolder: "01")
    
    private let home = FileManager.default.homeDirectoryForCurrentUser
    private var projectFolder: String {
        return "dev/aoc2022/\(self.inputFolder)"
    }
    private lazy var projectUrl = home.appendingPathComponent(projectFolder)
    private lazy var inputFile = projectUrl.appendingPathComponent("input").path
    private lazy var fileHandle: FileHandle? = FileHandle(forReadingAtPath: inputFile)
    
    init(inputFolder: String) {
        self.inputFolder = inputFolder
    }
    
    func read() -> String {
        guard let fileHandle = fileHandle else { return "Something went wrong." }
        
        return readingInputFile(from: fileHandle)
        
    }
    
    private func readingInputFile(from fileHandle: FileHandle) -> String {
        do {
            let data = try fileHandle.readToEnd()
            try fileHandle.close()
            
            return String(data: data!, encoding: .utf8) as String? ?? "Something is right!"
        } catch {
            return "Something went wrong when reading data."
        }
    }
    
}
