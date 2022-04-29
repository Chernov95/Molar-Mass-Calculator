//
//  Extensions.swift
//  molecular wedth
//
//  Created by Filip Cernov on 29/04/2022.
//  Copyright © 2022 Filip Cernov. All rights reserved.
//

import Foundation


extension String {
    func equalityScore(with string: String) -> Double {
        if self == string {
            return 2     // the greatest equality score this method can give
        } else if self.contains(string) {
            return 1 + 1 / Double(self.count - string.count)   // contains our term, so the score will be between 1 and 2, depending on number of letters.
        } else {
            // you could of course have other criteria, like string.contains(self)
            return 1 / Double(abs(self.count - string.count))
        }
    }
}



