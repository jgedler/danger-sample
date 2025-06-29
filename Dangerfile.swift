import Danger 
import DangerSwiftLint

let danger = Danger()

SwiftLint.lint(inline: true)

let editedFiles = danger.git.modifiedFiles + danger.git.createdFiles
message("These files have changed: \(editedFiles.joined(separator: ", "))")
