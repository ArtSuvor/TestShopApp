//
//  AnalyticEvents.swift
//  TestShopApp
//
//  Created by Art on 07.08.2022.
//

import Foundation

enum AnalyticEvents {
    case signIn(String)
    case logOut(Int)
    case signUp(String)
    case openVC(String)
    case openDetailInfo(String)
    case error(String)
    
    var description: String {
        switch self {
            case .signIn: return "Login"
            case .logOut: return "Logout"
            case .signUp: return "Register"
            case .openVC: return "OpenView"
            case .openDetailInfo: return "OpenDetailProductInfo"
            case .error: return "Error"
        }
    }
}
