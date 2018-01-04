//
//  TagDetailDataAdapterTests.swift
//  Tronald DumpTests
//
//  Created by Allan Weir on 04/01/2018.
//  Copyright © 2018 Allan Weir. All rights reserved.
//

import XCTest

class TagDetailDataAdapterTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testDataAdapterResponds() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        
        let expectation = XCTestExpectation()
        let dataAdapter = TagDetailDataAdapter()
        dataAdapter.load(tagName: "Ted Cruz") { (success, error) in
            XCTAssertTrue(success || error != nil)
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 3.0)
    }
    
}
