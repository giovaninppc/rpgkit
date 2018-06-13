//
//  UserDefaultsManager.swift
//  RPG Kit
//
//  Created by Giovani Nascimento Pereira on 13/06/18.
//  Copyright © 2018 Giovani Nascimento Pereira. All rights reserved.
//

import Foundation

enum UserDefaultsKeys: String {
    case numberOfExecution
}

class UserDefaultsManager {
    static let defaults = UserDefaults.standard
    class func updateNumberExecution() {
        let number = getNumberExecution()
        defaults.set(number + 1, forKey: UserDefaultsKeys.numberOfExecution.rawValue)
    }
    
    class func getNumberExecution() -> Int {
        return defaults.integer(forKey: UserDefaultsKeys.numberOfExecution.rawValue)
    }
}
