//
//  NegativeModule.swift
//  luna
//
//  Created by Cynara Costa on 29/09/23.
//

func mod(_ a: Int, _ n: Int) -> Int {
    precondition(n > 0, "modulus must be positive")
    let r = a % n
    return r >= 0 ? r : r + n
}
