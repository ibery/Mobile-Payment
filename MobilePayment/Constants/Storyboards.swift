//
//  Storyboards.swift
//  MobilePayment
//
//  Created by Narkoz on 10.08.2022.
//

import Foundation
import UIKit

enum Storyboard : Int {
    case home
    case splash
    case customerPage
    case cashierPage
    
    var name : String{
        switch self {
        case .home :
            return "Home"
        case .splash :
            return "Splash"
        case .customerPage :
            return "CustomerPage"
        case.cashierPage :
            return "CashierPage"
        }
        
    }
    
    var storyboard : UIStoryboard {
        return UIStoryboard(name: "\(name)Screen", bundle: nil)
    }
    
    var viewController : UIViewController? {
        return self.storyboard.instantiateInitialViewController()
    }
    
    
}
