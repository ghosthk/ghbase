//
//  FileManager.Extension.swift
//  QR5
//
//  Created by Ghost on 2023/2/27.
//


import Foundation

extension FileManager {
    
    static let documentsURL: URL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
    
    static let libraryURL = FileManager.default.urls(for: .libraryDirectory, in: .userDomainMask).first!
    
    static let cacheURL = FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask).first!
    
    static let tempURL = URL(fileURLWithPath: NSTemporaryDirectory())
    
}

extension String {
    func fileExist(isDirectory: UnsafeMutablePointer<ObjCBool>? = nil) -> Bool {
        if isDirectory != nil {
            return FileManager.default.fileExists(atPath: self, isDirectory: isDirectory)
        }
        return FileManager.default.fileExists(atPath: self)
    }
}
