//
//  LogDog.swift
//  LogDog
//
//  Created by sahil.khanna on 2/28/20.
//  Copyright © 2020 sahil.khanna. All rights reserved.
//

import Foundation

public struct LogDog {
    
    private static let VERBOSE = "verbose";
    private static let DEBUG = "debug";
    private static let ERROR = "error";
    private static let INFORMATION = "information";
    private static let WARNING = "warning";
    
    private static let logKey = "AppLogs";
    
    public static var loggingEnabled = true;
    
    private init() { }
    
    private static func capture(tag: String, text: String, type: String) {
        if (!loggingEnabled) {
            return;
        }
        
        let userDefaults = UserDefaults.standard;
        
        var logs: [Log] = [];
        if let oldJsonString = userDefaults.string(forKey: logKey) {
            logs = try! JSONDecoder().decode([Log].self, from: Data(oldJsonString.utf8));
        }
        
        logs.append(Log(tag: tag, text: text, type: type, timestamp: Int64(NSDate().timeIntervalSince1970)));
        
        let jsonData = try! JSONEncoder().encode(logs);
        let jsonString = String(data: jsonData, encoding: .utf8);
        
        userDefaults.setValue(jsonString, forKey: logKey);
        userDefaults.synchronize();
    }
    
    public static func d(tag: String, text: String) {
        capture(tag: tag, text: text, type: DEBUG);
    }
    
    public static func v(tag: String, text: String) {
        capture(tag: tag, text: text, type: VERBOSE);
    }
    
    public static func e(tag: String, text: String) {
        capture(tag: tag, text: text, type: ERROR);
    }
    
    public static func i(tag: String, text: String) {
        capture(tag: tag, text: text, type: INFORMATION);
    }
    
    public static func w(tag: String, text: String) {
        capture(tag: tag, text: text, type: WARNING);
    }
    
    public static func logs() -> String {
        return UserDefaults.standard.string(forKey: logKey) ?? "[]";
    }
    
    public static func clear() {
        UserDefaults.standard.removeObject(forKey: logKey);
    }
}
