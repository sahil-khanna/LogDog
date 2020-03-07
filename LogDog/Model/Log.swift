//
//  Log.swift
//  LogDog
//
//  Created by sahil.khanna on 3/3/20.
//  Copyright © 2020 sahil.khanna. All rights reserved.
//

import Foundation

internal struct Log: Codable {
    var tag: String;
    var text: String;
    var type: String;
    var timestamp: Int64;
}
