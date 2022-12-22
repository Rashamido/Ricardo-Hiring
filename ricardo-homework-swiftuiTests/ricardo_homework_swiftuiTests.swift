//
//  ricardo_homework_swiftuiTests.swift
//  ricardo-homework-swiftuiTests
//
//  Created by Zsolt Kovacs on 24.09.22.
//

import XCTest
@testable import ricardo_homework_swiftui

class ricardo_homework_swiftuiTests: XCTestCase {

    func testUsernameIsValid() throws {
        let user = UserModel()
        
        user.username = ""
        XCTAssertFalse(user.isUsernameValid)
        
        user.username = "a"
        XCTAssertTrue(user.isUsernameValid)
    }
    
  
    func testPasswordIsValid() throws {
        let user = UserModel()
        
        user.password = ""
        XCTAssertFalse(user.isPasswordValid)
        
        user.password = "a"
        XCTAssertFalse(user.isPasswordValid)
        
        user.password = "12345678"
        XCTAssertFalse(user.isPasswordValid)
        
        user.password = "asdfghjk"
        XCTAssertFalse(user.isPasswordValid)
        
        user.password = "!$%!!!&/"
        XCTAssertFalse(user.isPasswordValid)
        
        user.password = "1234!!&/"
        XCTAssertFalse(user.isPasswordValid)
        
        user.password = "!$%!asdf"
        XCTAssertFalse(user.isPasswordValid)
        
        user.password = "a234567!"
        XCTAssertTrue(user.isPasswordValid)
    }

}
