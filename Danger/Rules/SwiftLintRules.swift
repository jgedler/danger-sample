import Danger
import DangerSwiftLint

public func runSwiftLintRules(strict: Bool = true, files: [String]) {
    SwiftLint.lint(files: files, strict: strict)
}
