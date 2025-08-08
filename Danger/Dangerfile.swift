import Danger
import Foundation

// Importar las reglas modulares (igual que cualquier archivo Swift en el mismo target)
import SwiftLintRules
import ArchitectureRules
import CommitMessageRules

let danger = Danger()

let modifiedSwiftFiles = danger.git.modifiedFiles.filter { $0.hasSuffix(".swift") }
let createdSwiftFiles = danger.git.createdFiles.filter { $0.hasSuffix(".swift") }
let swiftFilesToCheck = modifiedSwiftFiles + createdSwiftFiles

if swiftFilesToCheck.isEmpty {
    markdown("✅ No hay cambios en archivos Swift para analizar.")
} else {
    runSwiftLintRules(files: swiftFilesToCheck)
    runArchitectureRules(on: swiftFilesToCheck, danger: danger)
}

runPRTemplateRules(danger)
runCommitMessageRules(danger)

