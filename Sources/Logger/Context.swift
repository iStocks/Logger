/// An object that defines details about log's calling.
struct Context {
    
    // MARK: - Private Properties
    
    /// The name of the file and module in which it appears.
    private let file: String
    /// The name of the declaration in which it appears.
    private let function: String
    /// The line number on which it appears.
    private let line: Int
    
    // MARK: - Init
    
    /// Creates instance of this structure.
    init(file: String = #fileID,
         function: String = #function,
         line: Int = #line) {
        self.file = file
        self.function = function
        self.line = line
    }
    
    /// Description of the log context.
    var description: String {
        return "In \(file): \(function) method on line \(line)"
    }
}
