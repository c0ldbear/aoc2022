//
//  ReadInput.swift
//  aoc20221201
//
//  Created by Teddy Juhlin-Henricson on 2022-12-01.
//

import Foundation

class ReadInput {
    
    static var shared = ReadInput()
    
    private let home = FileManager.default.homeDirectoryForCurrentUser
    private let projectFolder = "dev/aoc2022/02"
    private lazy var projectUrl = home.appendingPathComponent(projectFolder)
    private lazy var inputFile = projectUrl.appendingPathComponent("input").path
    private lazy var fileHandle: FileHandle? = FileHandle(forReadingAtPath: inputFile)
    
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
