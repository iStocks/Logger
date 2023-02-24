import Foundation

/// A utility for writing string messages in debug mode.
public enum Logger {
    
    /// Types of logs.
    public enum LogType: String {
        /// The informative log level.
        case info = "ℹ️ INFO"
        /// The warning log level.
        case warning = "⚠️ WARNING"
        /// The error log level.
        case error = "❗️ERROR"
    }
    
    /// Writes a message to the log using the specified log type.
    ///
    /// - Parameters:
    ///   - message: log message.
    ///   - logType: log type.
    ///   - shouldLogContext: defines whether to log `Context` or not.
    ///   - file: The name of the file and module in which it appears.
    ///   - function: The name of the declaration in which it appears.
    ///   - line: The line number on which it appears.
    ///
    /// - Note: `message` is a closure in order to add the ability to create a string to log inside method's calling.
    public static func log(
        _ message: @autoclosure () -> String,
        logType: LogType,
        shouldLogContext: Bool = true,
        file: String = #fileID,
        function: String = #function,
        line: Int = #line
    ) {
        let log = createLog(
            logType: logType,
            message: message(),
            shouldLogContext: shouldLogContext,
            context: Context(file: file, function: function, line: line)
        )
        debugPrint(log)
    }
    
    /// Creates log with provided information.
    ///
    /// - Parameters:
    ///   - message: log message.
    ///   - logType: log type.
    ///   - shouldLogContext: defines whether to log `Context` or not.
    ///   - context: contains details about log's calling.
    ///
    /// - Returns: string with all info.
    ///
    /// - Note: has `internal` access-level in order to call it inside unit-tests.
    static func createLog(
        logType: LogType,
        message: @autoclosure () -> String,
        shouldLogContext: Bool,
        context: Context = Context()
    ) -> String {
        var logs: [String] = ["\(logType.rawValue): \(Date())", "\"\(message())\""]
        
        if shouldLogContext {
            logs.append(context.description)
        }
        return logs.joined(separator: "\n")
    }
    
    /// Prints message when debug mode is active.
    ///
    /// - Parameter message: string to print.
    private static func debugPrint(_ message: String) {
        #if DEBUG
        print(message)
        #endif
    }
}
