//
//  TronaldBaseDataSourceTests.swift
//  Tronald DumpTests
//
//  Created by Allan Weir on 04/01/2018.
//  Copyright © 2018 Allan Weir. All rights reserved.
//

import XCTest

class TronaldBaseDataSourceTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testParser() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        
        let data: [String: Any] = ["StringTest": "", "IntTest": 1, "DateTest": "2016-11-20T01:32:07.085780"]
        
        let dataSource = TronaldBaseDataSource<String>()
        XCTAssertNotNil(dataSource.parseString(from: data, key: "StringTest"))
        XCTAssertNotNil(dataSource.parseInt(from: data, key: "IntTest"))
        XCTAssertNotNil(dataSource.parseDate(from: data, key: "DateTest"))
        
    }
    
}
