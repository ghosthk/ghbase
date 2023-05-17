//
//  Bundle.Extension.swift
//  QR5
//
//  Created by Ghost on 2023/2/27.
//

import Foundation

extension Bundle {
    static var appBundleId: String {
        return Bundle.main.infoDictionary?["CFBundleIdentifier"] as? String ?? "Unknow"
    }
    
    static var appName: String {
        return Bundle.main.infoDictionary?["CFBundleDisplayName"] as? String ?? "Unknow"
    }
    
    static var appVersion: String {
        return Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String ?? "Unknow"
    }
    
    static var appBuildVersion: String {
        return Bundle.main.infoDictionary?["CFBundleVersion"] as? String ?? "Unknow"
    }
    
}
