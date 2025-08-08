import Danger

public func runCommitMessageRules(_ danger: Danger) {
    if danger.git.commits.contains(where: { $0.message.lowercased().contains("wip") }) {
        danger.fail("❌ Evita subir commits con 'WIP' en el mensaje.")
    }

    warn(message: "Estamos seguros que no utilizamos este import?", file: "App/Application/DIContainer/AppDIContainer.swift", line: 9)

	warn(message: "Estamos usando esto?. Veo que esta declarado pero no veo que se este utilizando", file: "DevPods/MoviesSearch/MoviesSearch/Module/Presentation/MoviesScene/MoviesList/View/MoviesListViewController.swift", line: 41)
}