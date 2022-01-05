//
//  MonsterEntity.swift
//  UhooiPicBook
//
//  Created by uhooi on 2020/02/28.
//

import Foundation
import Shared

struct MonsterEntity: Equatable {
    let name: String
    let description: String
    let baseColorCode: String
    let iconUrl: URL
    let dancingUrl: URL
}

extension MonsterEntity: Codable {}

extension MonsterEntity: Sendable {}
