//
//  Utils.swift
//  Tronald Dump
//
//  Created by Allan Weir on 04/01/2018.
//  Copyright © 2018 Allan Weir. All rights reserved.
//
// swiftlint:disable identifier_name
//

import Log

public var Log: Logger = {
    let instance: Logger = Logger()
    #if DEBUG
        instance.enabled = true
        instance.minLevel = .trace
        instance.formatter = Formatter("[%@] %@.%@:%@ %@: %@", [
            .date("HH:mm:ss.SSS"),
            .file(fullPath: false, fileExtension: false),
            .function,
            .line,
            .level,
            .message
            ])
        //                instance.theme = Theme(trace: "#C5C8C6", debug: "#81A2BE", info: "#B5BD68", warning: "#F0C674", error: "#CC6666")
    #else
        instance.enabled = false
    #endif
    return instance
}()
