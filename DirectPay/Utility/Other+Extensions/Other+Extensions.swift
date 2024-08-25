//
//  Other+Extension.swift
//  Pocket
//
//  Created by BS00484 on 18/8/24.
//

import Foundation
import UIKit

public extension Double {
    func withCommas() -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.locale = Locale.current
        numberFormatter.numberStyle = NumberFormatter.Style.decimal
        numberFormatter.minimumFractionDigits = 2
        numberFormatter.maximumFractionDigits = 2
        return numberFormatter.string(from: NSNumber(value: self))!
    }

    func getString() -> String {
        return (String(format: "%.2f", self))
    }
}

public extension Int {
    var scale: CGFloat { return (UIScreen.main.bounds.height / 856) * CGFloat(self) }
}

public extension CGFloat {
    var scale: CGFloat { return (UIScreen.main.bounds.height / 856) * CGFloat(self) }
}

public extension Double {
    var sscale: CGFloat { return (UIScreen.main.bounds.height / 856) * CGFloat(self) }
}

public extension URL {
  var sanitise: URL {
    if var components = URLComponents(url: self, resolvingAgainstBaseURL: false) {
      if components.scheme == nil {
        components.scheme = "http"
      }

      return components.url ?? self
    }

    return self
  }
}
