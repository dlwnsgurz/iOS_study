//
//  UserInfoManager.swift
//  MyMemory
//
//  Created by LEE on 2023/02/15.
//

import UIKit

struct UserInfoKey{
    
    static let loginId = "LOGINID"
    static let account = "ACCOUNT"
    static let name = "NAME"
    static let profile = "PROFILE"
    
}

class UserInfoManager{
    
    var loginId: Int{
        get{
            let ud = UserDefaults.standard
            return ud.integer(forKey: UserInfoKey.loginId)
        }
        set{
            let ud = UserDefaults.standard
            ud.set(newValue, forKey: UserInfoKey.loginId)
            ud.synchronize()
        }
    }
    
    var account: String?{
        get{
            let ud = UserDefaults.standard
            return ud.string(forKey: UserInfoKey.account)
        }
        set{
            let ud = UserDefaults.standard
            ud.set(newValue, forKey: UserInfoKey.account)
            ud.synchronize()
            
        }
    }
    
    var name: String?{
        get{
            let ud = UserDefaults.standard
            return ud.string(forKey: UserInfoKey.name)
        }
        set{
            let ud = UserDefaults.standard
            ud.set(newValue, forKey: UserInfoKey.name)
            ud.synchronize()
        }
    }
    
    var profile: UIImage?{
        get{
            let ud = UserDefaults.standard
            if let _profile = ud.data(forKey: UserInfoKey.profile){
                return UIImage(data: _profile)
            }else{
                return UIImage(named: "account.jpg")
            }
        }set{
            if newValue != nil{
                let ud = UserDefaults.standard
                ud.set(newValue!.pngData, forKey: UserInfoKey.profile)
                ud.synchronize()
            }
        }
    }
    
    var isLogin: Bool{
        if self.loginId == 0 || self.account == nil{
            return false
        }
        return true
    }
    
    func login(account: String, passwd: String) -> Bool{

        
        return true
    }
    
    func logount() -> Bool{
        let ud = UserDefaults.standard
        ud.removeObject(forKey: UserInfoKey.account)
        ud.removeObject(forKey: UserInfoKey.profile)
        ud.removeObject(forKey: UserInfoKey.name)
        ud.removeObject(forKey: UserInfoKey.loginId)
        ud.synchronize()
        return true 
    }
    
    
}
