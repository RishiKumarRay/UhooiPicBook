//
//  MonsterDetailInteractor.swift
//  UhooiPicBook
//
//  Created by uhooi on 04/03/2020.
//  Copyright © 2020 THE Uhooi. All rights reserved.
//

/// @mockable
protocol MonsterDetailInteractorInput: AnyObject {
}

final class MonsterDetailInteractor {

    // MARK: Stored Instance Properties

    private weak var presenter: MonsterDetailInteractorOutput!

    // MARK: Initializer

    init() {
    }

    // MARK: Other Internal Methods

    func inject(presenter: MonsterDetailInteractorOutput) {
        self.presenter = presenter
    }
}

extension MonsterDetailInteractor: MonsterDetailInteractorInput {
}
