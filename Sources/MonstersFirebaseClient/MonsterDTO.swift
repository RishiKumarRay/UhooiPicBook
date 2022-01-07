//
//  MonsterDTO.swift
//  UhooiPicBook
//
//  Created by uhooi on 2020/02/28.
//

public struct MonsterDTO {
    public let name: String
    public let description: String
    public let baseColorCode: String
    public let iconUrlString: String
    public let dancingUrlString: String
    public let order: Int

    public init(
        name: String,
        description: String,
        baseColorCode: String,
        iconUrlString: String,
        dancingUrlString: String,
        order: Int
    ) {
        self.name = name
        self.description = description
        self.baseColorCode = baseColorCode
        self.iconUrlString = iconUrlString
        self.dancingUrlString = dancingUrlString
        self.order = order
    }
}

extension MonsterDTO: Equatable { }
