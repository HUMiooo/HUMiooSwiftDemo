//
//  MyTool.swift
//  AIJIAIJIASwift
//
//  Created by 赵春生 on 2017/6/26.
//  Copyright © 2017年 zcs. All rights reserved.
//

import UIKit
//MARK:-UserDefaults
extension UserDefaults {
    enum LoginInfoKeys: String {
        case password
        case phone
        case userid
        case city
        case themeType
    }
    static func set(value: String, forKey key: LoginInfoKeys) {
        let key = key.rawValue
        UserDefaults.standard.set(value, forKey: key)
    }
    static func string(forKey key: LoginInfoKeys) -> String? {
        let key = key.rawValue
        return UserDefaults.standard.string(forKey: key)
    }
}
//MARK:-UIColor
extension UIColor {
    class func colorWithRGB(_ r:CGFloat, g:CGFloat, b:CGFloat)->UIColor {
        return UIColor(red: r/255.0, green: g/255.0, blue: b/255.0, alpha: 1)
    }
    class func colorWithRGBA(_ r:CGFloat, g:CGFloat, b:CGFloat, alapa:CGFloat)->UIColor {
        return UIColor(red: r/255.0, green: g/255.0, blue: b/255.0, alpha: alapa)
    }
    /**
     随机色
     - returns: RGBA
     */
    class func RandomColor()->UIColor {
        let red = CGFloat(arc4random()%256)/255.0
        let green = CGFloat(arc4random()%256)/255.0
        let blue = CGFloat(arc4random()%256)/255.0
       
        return UIColor(red: red, green: green, blue: blue, alpha: 1)
    }
    /**
     Make color with hex string
     - parameter hex: 16进制字符串
     - returns: RGB
     */
    static func colorWithHexString (hex: String) -> UIColor {
        var cString: String = hex.trimmingCharacters(in: .whitespaces)
        
        if (cString.hasPrefix("#")) {
            cString = (cString as NSString).substring(from: 1)
        }
        
        if (cString.count != 6) {
            return .gray
        }
        
        let rString = (cString as NSString).substring(to: 2)
        let gString = ((cString as NSString).substring(from: 2) as NSString).substring(to: 2)
        let bString = ((cString as NSString).substring(from: 4) as NSString).substring(to: 2)
        
        var r:CUnsignedInt = 0, g:CUnsignedInt = 0, b:CUnsignedInt = 0;
        Scanner(string: rString).scanHexInt32(&r)
        Scanner(string: gString).scanHexInt32(&g)
        Scanner(string: bString).scanHexInt32(&b)
        return UIColor.colorWithRGBA(CGFloat(r), g: CGFloat(g), b: CGFloat(b), alapa: CGFloat(1))
    }
}
//MARK:-UIFont
extension UIFont {
    class func autoLayoutToSizeFont(_ num:CGFloat)->UIFont {
        var newnum = CGFloat()
        if SCREEN_WIDTH <= 480 {
            newnum = num + 2
        }else if SCREEN_WIDTH <= 568 {
            newnum = num + 3
        }else if SCREEN_WIDTH <= 667 {
            newnum = num + 4
        }else {
            newnum = num + 5
        }
        return UIFont.systemFont(ofSize:newnum)
    }
}
//MARK:-UIDevice
extension UIDevice {
    //获取设备具体详细的型号
    var modelName: String {
        var systemInfo = utsname()
        uname(&systemInfo)
        let machineMirror = Mirror(reflecting: systemInfo.machine)
        let identifier = machineMirror.children.reduce("") { identifier, element in
            guard let value = element.value as? Int8, value != 0 else { return identifier }
            return identifier + String(UnicodeScalar(UInt8(value)))
        }
        
        switch identifier {
        // iPod
        case "iPod1,1":                                 return "iPod touch"
        case "iPod2,1":                                 return "iPod touch 2"
        case "iPod3,1":                                 return "iPod touch 3"
        case "iPod4,1":                                 return "iPod touch 4"
        case "iPod5,1":                                 return "iPod Touch 5"
        case "iPod7,1":                                 return "iPod Touch 6"
        // iPhone
        case "iPhone1,1":                               return "iPhone"
        case "iPhone1,2":                               return "iPhone 3G"
        case "iPhone2,1":                               return "iPhone 3GS"
        case "iPhone3,1", "iPhone3,2", "iPhone3,3":     return "iPhone 4"
        case "iPhone4,1":                               return "iPhone 4s"
        case "iPhone5,1", "iPhone5,2":                  return "iPhone 5"
        case "iPhone5,3", "iPhone5,4":                  return "iPhone 5c"
        case "iPhone6,1", "iPhone6,2":                  return "iPhone 5s"
        case "iPhone7,2":                               return "iPhone 6"
        case "iPhone7,1":                               return "iPhone 6 Plus"
        case "iPhone8,1":                               return "iPhone 6s"
        case "iPhone8,2":                               return "iPhone 6s Plus"
        case "iPhone8,4":                               return "iPhone SE"
        case "iPhone9,1", "iPhone9,3":                  return "iPhone 7"
        case "iPhone9,2", "iPhone9,4":                  return "iPhone 7 Plus"
        case "iPhone10,1", "iPhone10,4":                return "iPhone 8"
        case "iPhone10,2", "iPhone10,5":                return "iPhone 8 Plus"
        case "iPhone10,3", "iPhone10,6":                return "iPhone X"
        // iPad
        case "iPad1,1":                                 return "iPad"
        case "iPad2,1", "iPad2,2", "iPad2,3", "iPad2,4":return "iPad 2"
        case "iPad3,1", "iPad3,2", "iPad3,3":           return "iPad 3"
        case "iPad3,4", "iPad3,5", "iPad3,6":           return "iPad 4"
        case "iPad4,1", "iPad4,2", "iPad4,3":           return "iPad Air"
        case "iPad5,3", "iPad5,4":                      return "iPad Air 2"
        case "iPad2,5", "iPad2,6", "iPad2,7":           return "iPad Mini"
        case "iPad4,4", "iPad4,5", "iPad4,6":           return "iPad Mini 2"
        case "iPad4,7", "iPad4,8", "iPad4,9":           return "iPad Mini 3"
        case "iPad5,1", "iPad5,2":                      return "iPad Mini 4"
        case "iPad6,7", "iPad6,8":                      return "iPad Pro (12.9-inch)"
        case "iPad6,3", "iPad6,4":                      return "iPad Pro (9.7-inch)"
        case "iPad6,11", "iPad6,12":                    return "iPad 5"
        case "iPad7,1", "iPad7,2":                      return "iPad Pro (12.9-inch) 2"
        case "iPad7,3", "iPad7,4":                      return "iPad Pro (10.5-inch)"
        case "iPad7,5", "iPad7,6":                      return "iPad 6"
        // AppleTV
        case "AppleTV5,3":                              return "Apple TV"
        // Other
        case "i386", "x86_64":                          return "Simulator"
        default:                                        return identifier
        }
    }
    //判断iPhoneX
    public func isX() -> Bool {
        if UIDevice.current.modelName == "iPhone X"{
            return true
        }
        if UIScreen.main.bounds.height == 812 {
            return true
        }
        return false
    }
}
//MARK:-UIImage
extension UIImage {
    class func imageFromColor(color: UIColor) -> UIImage {
        UIGraphicsBeginImageContext(SCREEN_BOUNDS.size)
        let context: CGContext = UIGraphicsGetCurrentContext()!
        context.setFillColor(color.cgColor)
        context.fill(SCREEN_BOUNDS)
        
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsGetCurrentContext()
        return image!
    }
    class func image_SHADOW_IMAGE_FromColor(color: UIColor) -> UIImage {
        let rect = CGRect(x: 0, y: 0, width: SCREEN_WIDTH, height: 0.5)
        UIGraphicsBeginImageContextWithOptions(rect.size, false, 0)
        let context: CGContext = UIGraphicsGetCurrentContext()!
        context.setFillColor(color.cgColor)
        context.fill(rect)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsGetCurrentContext()
        return image!
    }
}
//MARK:-UIView
extension UIView {
    var x:CGFloat {
        return self.bounds.origin.x
    }
    var y:CGFloat {
        return self.bounds.origin.y
    }
    var width:CGFloat {
        return self.bounds.size.width
    }
    var height:CGFloat {
        return self.bounds.size.height
    }
    var size: CGSize {
        return self.bounds.size
    }
    var point:CGPoint {
        return self.frame.origin
    }
}

//MARK:-COLOR
///当前的主题色 ThemeColor
public let currentThemeType = (UserDefaults.string(forKey: .themeType) == nil) || (UserDefaults.string(forKey: .themeType)?.count == 0) ? 0 : Int.init(UserDefaults.string(forKey: .themeType)!)
///纯白 HTML#FFFFFF
public let MYCOLOR_FFFFFF = UIColor.colorWithRGB(255, g: 255, b: 255)
///虚化黑色背景 HTML#000000
public let MYCOLOR_000000_8 = UIColor.colorWithRGBA(0, g: 0, b: 0, alapa: 0.5)
//MARK:-FRAME
public let SCREEN_WIDTH:CGFloat = UIScreen.main.bounds.size.width
public let SCREEN_HEIGHT:CGFloat = UIScreen.main.bounds.size.height
public let SCREEN_BOUNDS:CGRect = UIScreen.main.bounds
public let STABAR_Height:CGFloat = (UIDevice.current.isX() ? 44 : 20)//状态栏高度
public let NAVBAR_Height:CGFloat = 44//导航栏高度
public let STA_NAV_Height:CGFloat = (STABAR_Height+NAVBAR_Height)//状态栏+导航栏高度
public let TABBAR_Height:CGFloat = (UIDevice.current.isX() ? 83 : 49)
//MARK:-NOTIFICATION
public let MyGuideViewControllerDidFinish = "MyGuideViewControllerDidFinish"
