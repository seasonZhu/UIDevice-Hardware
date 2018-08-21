//
//  UIDevice+Hardware.swift
//  UIDeviceHardware
//
//  Created by season on 2018/8/21.
//  Copyright © 2018年 season. All rights reserved.
//

import UIKit

// MARK: - 设备的型号
extension UIDevice {
    
    /// 具体的设备的型号
    class var deviceType: String {
        
        var systemInfo = utsname()
        uname(&systemInfo)
        let machineMirror = Mirror(reflecting: systemInfo.machine)
        
        let identifier = machineMirror.children.reduce("") { identifier, element in
            guard let value = element.value as? Int8, value != 0 else { return identifier }
            return identifier + String(UnicodeScalar(UInt8(value)))
        }
        
        switch identifier {
            
        case "iPod5,1":                                 return "iPod Touch 5"
        case "iPod7,1":                                 return "iPod Touch 6"
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
        case "iPhone9,1":                               return "iPhone 7"
        case "iPhone9,2":                               return "iPhone 7 Plus"
        case "iPhone10,1", "iPhone10,4":                return "iPhone 8"
        case "iPhone10,2", "iPhone10,5":                return "iPhone 8 Plus"
        case "iPhone10,3", "iPhone10,6":                return "iPhone X"
        case "iPad2,1", "iPad2,2", "iPad2,3", "iPad2,4":return "iPad 2"
        case "iPad3,1", "iPad3,2", "iPad3,3":           return "iPad 3"
        case "iPad3,4", "iPad3,5", "iPad3,6":           return "iPad 4"
        case "iPad4,1", "iPad4,2", "iPad4,3":           return "iPad Air"
        case "iPad5,3", "iPad5,4":                      return "iPad Air 2"
        case "iPad2,5", "iPad2,6", "iPad2,7":           return "iPad Mini"
        case "iPad4,4", "iPad4,5", "iPad4,6":           return "iPad Mini 2"
        case "iPad4,7", "iPad4,8", "iPad4,9":           return "iPad Mini 3"
        case "iPad5,1", "iPad5,2":                      return "iPad Mini 4"
        case "iPad6,7", "iPad6,8":                      return "iPad Pro"
        case "AppleTV5,3":                              return "Apple TV"
        case "i386", "x86_64":                          return "Simulator"
        default:                                        return identifier
            
        }
    }
}

// MARK: - 手机系列判断
extension UIDevice {
    /// 是否是iPhone系列
    class var iPhoneSeries: Bool {
        return current.userInterfaceIdiom == .phone
    }
    
    /// 是否是iPad系列
    class var iPadSeries: Bool {
        return current.userInterfaceIdiom == .pad
    }
    
    /// 是否是iPhone 4.7系列手机
    class  var isPhone4_7Serier: Bool {
        return UIScreen.main.bounds.width == 375.0
    }
    
    /// 是否是iPhone 5.5系列手机
    class var isPhone5_5Series: Bool {
        return UIScreen.main.bounds.width == 414.0
    }
    
    /// 是否是iPhone X手机
    class var isPhoneXSerise: Bool {
        return deviceType == Info.iPhoneX
    }
}

// MARK: - 手机信息
extension UIDevice {
    /// uudi
    class var uuid: String? {
        return current.identifierForVendor?.uuidString
    }
    
    /// 设备系统名称
    class var deviceSystemName: String {
        return current.systemName
    }
    
    /// 设备名称
    class var deviceName: String {
        return current.name
    }
    
    /// 设备版本
    class var deviceSystemVersion: String {
        return current.systemVersion
    }
    
    /// 设备版本的Float类型, 如果等于-1了那么就说明转换失败了
    class var deviceFloatSystemVersion: Float {
        return Float(deviceSystemVersion) ?? -1.0
    }
}

// MARK: - 字符串常量化
extension UIDevice {
    struct Info {
        static let iPodTouch5 = "iPod Touch 5"
        
        static let iPodTouch6 = "iPod Touch 6"
        
        static let iPhone4 = "iPhone 4"
        
        static let iPhone4s = "iPhone 4s"
        
        static let iPhone5 = "iPhone 5"
        
        static let iPhone5c = "iPhone 5c"
        
        static let iPhone5s = "iPhone 5s"
        
        static let iPhone6 = "iPhone 6"
        
        static let iPhone6Plus = "iPhone 6 Plus"
        
        static let iPhone6s = "iPhone 6s"
        
        static let iPhone6sPlus = "iPhone 6s Plus"
        
        static let iPhoneSE = "iPhone SE"
        
        static let iPhone7 = "iPhone 7"
        
        static let iPhone7Plus = "iPhone 7 Plus"
        
        static let iPhone8 = "iPhone 8"
        
        static let iPhone8Plus = "iPhone 8 Plus"
        
        static let iPhoneX = "iPhone X"
        
        static let iPad2 = "iPad 2"
        
        static let iPad3 = "iPad 3"
        
        static let iPad4 = "iPad 4"
        
        static let iPadAir = "iPad Air"
        
        static let iPadAir2 = "iPad Air 2"
        
        static let iPadMini = "iPad Mini"
        
        static let iPadMini2 = "iPad Mini 2"
        
        static let iPadMini3 = "iPad Mini 3"
        
        static let iPadMini4 = "iPad Mini 4"
        
        static let iPadPro = "iPad Pro"
        
        static let AppleTV = "Apple TV"
        
        static let Simulator = "Simulator"
    }
}

// MARK: - iOS版本判断
extension UIDevice {
    
    public enum Versions: Float {
        case five = 5.0
        case six = 6.0
        case seven = 7.0
        case eight = 8.0
        case nine = 9.0
        case ten = 10.0
        case eleven = 11.0
    }
    
    public class func isVersion(_ version: Versions) -> Bool {
        return deviceFloatSystemVersion >= version.rawValue && deviceFloatSystemVersion < (version.rawValue + 1.0)
    }
    
    public class func isVersionOrLater(_ version: Versions) -> Bool {
        return deviceFloatSystemVersion >= version.rawValue
    }
    
    public class func isVersionOrEarlier(_ version: Versions) -> Bool {
        return deviceFloatSystemVersion < (version.rawValue + 1.0)
    }
}

