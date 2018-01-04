//
//  ControllerFactoryTests.swift
//  Tronald DumpTests
//
//  Created by Allan Weir on 04/01/2018.
//  Copyright © 2018 Allan Weir. All rights reserved.
//

import XCTest

class ControllerFactoryTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testTagsListCollection() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        let controller = ControllerFactory.getController(forType: .tagList)
        XCTAssertNotNil(controller)
        XCTAssertTrue(controller is TronaldCollectionViewController)
    }
    
    func testTagsDetailView() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        let controller = ControllerFactory.getController(forType: .tagDetail(tagName: "test"))
        XCTAssertNotNil(controller)
        XCTAssertTrue(controller is TronaldCollectionViewController)
    }
    
}
