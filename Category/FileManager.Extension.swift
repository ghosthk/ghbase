//
//  FileManager.Extension.swift
//  QR5
//
//  Created by Ghost on 2023/2/27.
//


import Foundation

extension FileManager {
    
    static public let documentsURL: URL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
    
    static public let libraryURL = FileManager.default.urls(for: .libraryDirectory, in: .userDomainMask).first!
    
    static public let cacheURL = FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask).first!
    
    static public let tempURL = URL(fileURLWithPath: NSTemporaryDirectory())
    
}

extension String {
    public func fileExist(isDirectory: UnsafeMutablePointer<ObjCBool>? = nil) -> Bool {
        if isDirectory != nil {
            return FileManager.default.fileExists(atPath: self, isDirectory: isDirectory)
        }
        return FileManager.default.fileExists(atPath: self)
    }
}
