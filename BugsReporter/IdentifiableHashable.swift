//
//  IdentifiableHashable.swift
//  Pods
//
//  Created by Reenad gh on 15/04/2024.
//

import Foundation

protocol IdentifiableHashable: Hashable,Identifiable, AnyObject {}

extension IdentifiableHashable {
    // Default 'id' implementation using object identity
    public var id: ObjectIdentifier {
        ObjectIdentifier(self)
    }
    
    // Default Equatable implementation using identity comparison
    public static func == (lhs: Self, rhs: Self) -> Bool {
        lhs === rhs  // Identity comparison
    }
    
    // Default Hashable implementation using object identity
    public func hash(into hasher: inout Hasher) {
        hasher.combine(ObjectIdentifier(self))  // Use object identity for hashing
    }
}
