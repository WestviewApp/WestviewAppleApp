
//  Extensions.swift
//  Westview
//
//  Created by Ronak Shah on 8/15/17.
//  Copyright © 2017 Ronak Shah. All rights reserved.
//

import UIKit

class LightVC: UIViewController {
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
}

struct commonColors {
    static let coolBlack:    UIColor = UIColor(hexString: "#030304")
    static let lightBlack:   UIColor = UIColor(hexString: "#282B36")
    static let gold:         UIColor = UIColor(hexString: "#CDA817")
    static let darkGold:     UIColor = UIColor(hexString: "#CDA817")
}

struct schedules {
    static func getSchedule(for day: String) -> [(String, String, String)] {
        switch day {
        case "Monday", "Friday" :
            return monFri
        case "Tuesday","Thursday":
            return tuesThurs
        case "Wednesday":
            return wed
        case "finals 1":
            return finals1
        case "finals 2":
            return finals2
        default:
            return []
        }
    }
    static let finals1: [(String, String, String)] = [
        ("Period", "Start", "End"),
        ("1", "8:05", "10:05"),
        ("Lunch", "10:05", "10:29"),
        ("2", "10:35", "12:35")
    ]
    static let finals2: [(String, String, String)] = [
        ("Period", "Start", "End"),
        ("3", "8:05", "10:05"),
        ("Lunch", "10:05", "10:29"),
        ("4", "10:35", "12:35")
    ]
    
    static let monFri: [(String, String, String)] = [
        ("Period", "Start", "End"),
        ("1", "8:35", "10:04"),
        ("Homeroom", "10:10", "10:25"),
        ("2", "10:31", "12:00"),
        ("Lunch", "12:00", "12:35"),
        ("3", "12:41", "2:10"),
        ("4", "2:16", "3:45"),
        ]
    static let tuesThurs: [(String, String, String)] = [
        ("Period", "Start", "End"),
        ("1", "8:35", "9:58"),
        ("Wolverine Time", "9:58", "10:28"),
        ("2", "10:34", "11:57"),
        ("Lunch", "11:57", "12:32"),
        ("SSH", "12:38", "12:53"),
        ("3", "12:53", "2:16"),
        ("4", "2:22", "3:45"),
        ]
    
    
        static let wed: [(String, String, String)] = [
        ("Period", "Start", "End"),
        ("1", "9:55", "11:02"),
        ("2", "11:08", "12:15"),
        ("Lunch", "12:15", "12:49"),
        ("3", "12:55", "2:02"),
        ("Wolverine Time", "2:02", "2:32"),
        ("4", "2:38", "3:45"),
        ]
}
extension UIColor {
    
    convenience init(hexString: String) {
        let hex = hexString.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int = UInt32()
        Scanner(string: hex).scanHexInt32(&int)
        let a, r, g, b: UInt32
        switch hex.characters.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (255, 0, 0, 0)
        }
        self.init(red: CGFloat(r) / 255, green: CGFloat(g) / 255, blue: CGFloat(b) / 255, alpha: CGFloat(a) / 255)
    }
}

extension Date {
    func dayOfWeek() -> String? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE"
        return dateFormatter.string(from: self).capitalized
        // or use capitalized(with: locale) if you want
    }
    
    // returns 1 for finals day type 1-2, 2 for finals day type 3-4, or -1 for no finals
    func isFinals() -> Int {
       let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/dd"
        let mmdd = dateFormatter.string(from: self)
        let finals1 = ["10/21", "01/13", "03/24", "06/08"]
        let finals2 = ["10/22", "01/14", "03/25", "06/09"]
        if let _ = finals1.index(of: mmdd) {
            return 1
        }
        else if let _ = finals2.index(of: mmdd) {
            return 2
        }
        return -1
    }
}
