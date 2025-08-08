import Danger
import Foundation

let danger = Danger()
let editedFiles = danger.git.modifiedFiles + danger.git.createdFiles

if editedFiles.count - danger.git.deletedFiles.count > 300 {
    warn("Big PR, try to keep changes smaller if you can")
}

// Encourage writing up some reasoning about the PR, rather than just leaving a title.
let body = danger.github.pullRequest.body?.count ?? 0
let linesOfCode = danger.github.pullRequest.additions ?? 0
if body < 3 && linesOfCode > 10 {
    warn("Please provide a summary in the Pull Request description")
}

// Support running via `danger local`
if danger.github != nil {
    // These checks only happen on a PR
    if danger.github.pullRequest.title.contains("WIP") {
        warn("PR is classed as Work in Progress")
    }
}

warn(message: "Estamos seguros que no utilizamos este import?", file: "App/Application/DIContainer/AppDIContainer.swift", line: 9)

warn(message: "Estamos usando esto?. Veo que esta declarado pero no veo que se este utilizando", file: "DevPods/MoviesSearch/MoviesSearch/Module/Presentation/MoviesScene/MoviesList/View/MoviesListViewController.swift", line: 41)

//print("Running Swiftlint on changed files...")
//SwiftLint.lint(inline: true, quiet: false)
