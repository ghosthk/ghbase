//
//  Bundle.Extension.swift
//  QR5
//
//  Created by Ghost on 2023/2/27.
//

import Foundation

extension Bundle {
    static public var appBundleId: String {
        return Bundle.main.infoDictionary?["CFBundleIdentifier"] as? String ?? "Unknow"
    }
    
    static public var appName: String {
        return Bundle.main.infoDictionary?["CFBundleDisplayName"] as? String ?? "Unknow"
    }
    
    static public var appVersion: String {
        return Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String ?? "Unknow"
    }
    
    static public var appBuildVersion: String {
        return Bundle.main.infoDictionary?["CFBundleVersion"] as? String ?? "Unknow"
    }
    
}
