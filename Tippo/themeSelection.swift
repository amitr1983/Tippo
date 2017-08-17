//
//  themeSelection.swift
//  Tippo
//
//  Created by amit kumar on 8/16/17.
//
//

import Foundation

import UIKit

extension UIColor {
    
    //Select color for theme
    enum Theme:String {
        case light, dark
    
        var textColor: UIColor {
            switch self {
            case .light:
                return UIColor(red: 94.0/255.0, green: 94.0/255.0, blue: 94.0/255.0, alpha: 1.0)
            case .dark:
                return .white
            }
        }
        
        var switchColor: UIColor {
            switch self {
            case .light:
                return UIColor(red: 0.0/255.0, green: 230.0/255.0, blue: 100.0/255.0, alpha: 1.0)
            case .dark:
                return .brown
            }
        }
        
    
        var tintColor: UIColor {
            switch self {
            case .light:
                return UIColor(red: 84.0/255.0, green: 199/255.0, blue: 253/255.0, alpha: 1.0)
            case .dark:
                return UIColor(red: 211.0/255.0, green: 171/255.0, blue: 122/255.0, alpha: 1.0)
            }
        }
    
        var backgroundColor: UIColor {
            switch self {
            case .light:
                return .white
            case .dark:
                return .brown
            }
        }
    
        var sliderColor: UIColor {
            switch self {
            case .light:
                return UIColor(red: 94.0/255.0, green: 94.0/255.0, blue: 94.0/255.0, alpha: 1.0)
            case .dark:
                return .brown
            }
        }
    }
}

