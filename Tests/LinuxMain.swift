import XCTest

import ignoreTests

var tests = [XCTestCaseEntry]()
tests += ignoreTests.allTests()
XCTMain(tests)