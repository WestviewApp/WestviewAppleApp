//
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
        case "Monday", "Friday":
            return monfri
        case "Tuesday", "Thursday":
            return tueThu
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
    
    static let monfri: [(String, String, String)] = [
        ("Period", "Start", "End"),
        ("1", "8:05", "9:33"),
        ("Homeroom", "9:39", "9:54"),
        ("2", "10:00", "11:28"),
        ("Lunch", "11:28", "12:02"),
        ("3", "12:08", "1:36"),
        ("4", "1:42", "3:10"),
        ]
    static let tueThu: [(String, String, String)] = [
        ("Period", "Start", "End"),
        ("1", "8:05", "9:26"),
        ("Wolverine Time", "9:26", "9:54"),
        ("2", "10:00", "11:21"),
        ("Lunch", "11:21", "11:56"),
        ("SSR", "12:02", "12:22"),
        ("3", "12:22", "1:43"),
        ("4", "1:49", "3:10"),
        ]
    static let wed: [(String, String, String)] = [
        ("Period", "Start", "End"),
        ("1", "9:15", "10:25"),
        ("Homeroom", "10:31", "10:46"),
        ("2", "10:52", "12:02"),
        ("Lunch", "12:02", "12:38"),
        ("3", "12:44", "1:54"),
        ("4", "2:00", "3:10"),
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
        
        return 2
    }
}
