//
//  Extension.swift
//  Shortcut-List
//
//  Created by Takumi Sakai on 2022/05/27.
//

import Foundation

extension Identifiable where Self: Hashable {
    typealias ID = Self
    var id: Self { self }
}
