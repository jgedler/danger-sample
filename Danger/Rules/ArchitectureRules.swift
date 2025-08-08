import Danger
import Harmonize

public func runArchitectureRules(on files: [String], danger: Danger) {
    let harmonizeResult = Harmonize.code(fromFiles: files)

    let viewModels = harmonizeResult.classes().withNameEndingWith("ViewModel")
    viewModels.assertTrue(message: "Todos los ViewModels deben heredar de BaseViewModel") {
        $0.inherits(from: "BaseViewModel")
    }

    let coordinators = harmonizeResult.classes().withNameEndingWith("Coordinator")
    coordinators.assertTrue(message: "Todos los Coordinators deben implementar protocolo Coordinator") {
        $0.conforms(to: "Coordinator")
    }

    for violation in Harmonize.violations {
        danger.fail(violation.message, file: violation.filePath, line: violation.line)
    }
}
