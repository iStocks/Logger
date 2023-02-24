import XCTest
@testable import Logger

class LoggerTests: XCTestCase {
    
    private let testMessage = "test message"
    
    /// Tests logger's output for some `testMessage` without context.
    func testWithoutContext() throws {
        let createdLog = Logger.createLog(logType: .error, message: testMessage, shouldLogContext: false)
        
        XCTAssertEqual(
            createdLog,
            """
            \(Logger.LogType.error.rawValue): \(Date())
            "\(testMessage)"
            """
        )
    }
    
    /// Tests logger's output for some `testMessage` with context.
    func testWithContext() throws {
        let testFile = "test file"
        let testFunction = "test function"
        let testLine = 10
        let testContext = Context(file: testFile, function: testFunction, line: testLine)
        
        let createdLog = Logger.createLog(
            logType: .info,
            message: testMessage,
            shouldLogContext: true,
            context: testContext
        )
        
        XCTAssertEqual(
            createdLog,
            """
            \(Logger.LogType.info.rawValue): \(Date())
            "\(testMessage)"
            \(testContext.description)
            """
        )
    }
}
