s//
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
        case "Monday" :
            return mon
        case "Tuesday","Wednesday","Thursday":
            return tueWedThur
        case "Friday":
            return fri
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
        ("Passing", "10:29", "10:35"),
        ("2", "10:35", "12:35")
    ]
    static let finals2: [(String, String, String)] = [
        ("Period", "Start", "End"),
        ("3", "8:05", "10:05"),
        ("Lunch", "10:05", "10:29"),
        ("Passing", "10:29", "10:35"),
        ("4", "10:35", "12:35")
    ]
    
    static let mon: [(String, String, String)] = [
        ("Period", "Start", "End"),
        ("1", "8:05", "9:25"),
        ("2", "9:35", "10:55"),
        ("Homeroom", "11:05", "11:30"),
        ("Lunch", "11:30", "12:20"),
        ("3", "12:20", "1:40"),
        ("4", "1:50", "3:10"),
        ]
    static let tueWedThur: [(String, String, String)] = [
        ("Period", "Start", "End"),
        ("1", "8:05", "9:25"),
        ("2", "9:35", "10:55"),
        ("Office Hours", "11:05", "11:30"),
        ("Lunch", "11:30", "12:20"),
        ("3", "12:20", "1:40"),
        ("4", "1:50", "3:10"),
        ]
    
    
        static let fri: [(String, String, String)] = [
        ("Period", "Start", "End"),
        ("1", "9:00", "10:20"),
        ("2", "10:30", "11:50"),
        ("Lunch", "11:50", "12:20"),
        ("3", "12:20", "1:40"),
        ("4", "1:50", "3:10"),
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
       /* let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/dd"
        let mmdd = dateFormatter.string(from: self)
        let finals1 = ["10/25", "01/18", "03/29", "06/13"]
        let finals2 = ["10/26", "01/19", "03/30", "06/14"]
        if let _ = finals1.index(of: mmdd) {
            return 1
        }
        else if let _ = finals2.index(of: mmdd) {
            return 2
        }*/
        return -1
    }
}
