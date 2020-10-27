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
    public class var deviceType: String {
        
        var systemInfo = utsname()
        uname(&systemInfo)
        let machineMirror = Mirror(reflecting: systemInfo.machine)
        
        let identifier = machineMirror.children.reduce("") { identifier, element in
            guard let value = element.value as? Int8, value != 0 else { return identifier }
            return identifier + String(UnicodeScalar(UInt8(value)))
        }
        
        switch identifier {
        
        // MARK:- Apple Watch https://www.theiphonewiki.com/wiki/List_of_Apple_Watches

        case "Watch1,1":                        return "Watch S0 (38mm)" // 1st generation - Series Zero
        case "Watch1,2":                        return "Watch S0 (42mm)" // 1st generation - Series Zero
        case "Watch2,6":                        return "Watch S1 (38mm)"
        case "Watch2,7":                        return "Watch S1 (42mm)"
        case "Watch2,3":                        return "Watch S2 (38mm)"
        case "Watch2,4":                        return "Watch S2 (42mm)"
        case "Watch3,1":                        return "Watch S3 (38mm)"
        case "Watch3,2":                        return "Watch S3 (42mm)"
        case "Watch3,3":                        return "Watch S3 Cellular (38mm)"
        case "Watch3,4":                        return "Watch S3 Cellular (42mm)"
        case "Watch4,1":                        return "Watch S4 (40mm)"
        case "Watch4,2":                        return "Watch S4 (44mm)"
        case "Watch4,3":                        return "Watch S4 Cellular (40mm)"
        case "Watch4,4":                        return "Watch S4 Cellular (44mm)"
        case "Watch5,1":                        return "Watch S5 (40mm)"
        case "Watch5,2":                        return "Watch S5 (44mm)"
        case "Watch5,3":                        return "Watch S5 Cellular (40mm)"
        case "Watch5,4":                        return "Watch S5 Cellular (44mm)"
            
        // MARK:- iPod http://theiphonewiki.com/wiki/IPod
            
        case "iPod1,1":                         return "iPod touch 1G"
        case "iPod2,1":                         return "iPod touch 2G"
        case "iPod3,1":                         return "iPod touch 3G"
        case "iPod4,1":                         return "iPod touch 4G"
        case "iPod5,1":                         return "iPod touch 5G"
        case "iPod7,1":                         return "iPod touch 6G" // as 6,1 was never released 7,1 is actually 6th generation
        case "iPod9,1":                         return "iPod touch 7G" // iPod8,1 was rumoured to be with FaceId, never released
            
        // MARK:- Apple Watch https://www.theiphonewiki.com/wiki/List_of_Apple_Watches

        case "iPhone1,1":                       return "iPhone 1G"
        case "iPhone1,2":                       return "iPhone 3G"
        case "iPhone2,1":                       return "iPhone 3GS"
        case "iPhone3,1":                       return "iPhone 4 (GSM)"
        case "iPhone3,2":                       return "iPhone 4 (GSM Rev A)"
        case "iPhone3,3":                       return "iPhone 4 (CDMA)"
        case "iPhone4,1":                       return "iPhone 4S"
        case "iPhone5,1":                       return "iPhone 5 (GSM)"
        case "iPhone5,2":                       return "iPhone 5 (Global)"
        case "iPhone5,3":                       return "iPhone 5c (GSM)"
        case "iPhone5,4":                       return "iPhone 5c (Global)"
        case "iPhone6,1":                       return "iPhone 5s (GSM)"
        case "iPhone6,2":                       return "iPhone 5s (Global)"
        case "iPhone7,1":                       return "iPhone 6 Plus"
        case "iPhone7,2":                       return "iPhone 6"
        case "iPhone8,1":                       return "iPhone 6s"
        case "iPhone8,2":                       return "iPhone 6s Plus"
        case "iPhone8,4":                       return "iPhone SE"
        case "iPhone9,1":                       return "iPhone 7"
        case "iPhone9,2":                       return "iPhone 7 Plus"
        case "iPhone9,3":                       return "iPhone 7"
        case "iPhone9,4":                       return "iPhone 7 Plus"
        case "iPhone10,1", "iPhone10,4":        return "iPhone 8"
        case "iPhone10,2", "iPhone10,5":        return "iPhone 8 Plus"
        case "iPhone10,3", "iPhone10,6":        return "iPhone X"
        case "iPhone11,2":                      return "iPhone Xs"
        case "iPhone11,4", "iPhone11,6":        return "iPhone Xs Max"
        case "iPhone11,8":                      return "iPhone XR"
        case "iPhone12,1":                      return "iPhone 11"
        case "iPhone12,3":                      return "iPhone 11 Pro"
        case "iPhone12,5":                      return "iPhone 11 Pro Max"
        case "iPhone12,8":                      return "iPhone SE (2nd generation)"
        case "iPhone13,1":                      return "iPhone 12 mini"
        case "iPhone13,2":                      return "iPhone 12"
        case "iPhone13,3":                      return "iPhone 12 Pro"
        case "iPhone13,4":                      return "iPhone 12 Pro Max"
                    
        // MARK:- iPad
        /*
         * iPad http://theiphonewiki.com/wiki/IPad
         * iPad Mini http://theiphonewiki.com/wiki/IPad_mini
         * iPad Mini 2 https://support.apple.com/en-us/HT201471#iPad-mini2
         * iPad Pro https://www.theiphonewiki.com/wiki/IPad_Pro
         *
         */
        case "iPad1,1":                         return "iPad 1G"
        case "iPad2,1":                         return "iPad 2 (Wi-Fi)"
        case "iPad2,2":                         return "iPad 2 (GSM)"
        case "iPad2,3":                         return "iPad 2 (CDMA)"
        case "iPad2,4":                         return "iPad 2 (Rev A)"
        case "iPad2,5":                         return "iPad mini 1G (Wi-Fi)"
        case "iPad2,6":                         return "iPad mini 1G (GSM)"
        case "iPad2,7":                         return "iPad mini 1G (Global)"
        case "iPad3,1":                         return "iPad 3 (Wi-Fi)"
        case "iPad3,2":                         return "iPad 3 (GSM)"
        case "iPad3,3":                         return "iPad 3 (Global)"
        case "iPad3,4":                         return "iPad 4 (Wi-Fi)"
        case "iPad3,5":                         return "iPad 4 (GSM)"
        case "iPad3,6":                         return "iPad 4 (Global)"
        case "iPad4,1":                         return "iPad Air (Wi-Fi)"
        case "iPad4,2":                         return "iPad Air (Cellular)"
        case "iPad4,3":                         return "iPad Air"
        case "iPad4,4":                         return "iPad mini 2G (Wi-Fi)"
        case "iPad4,5", "iPad4,6":              return "iPad mini 2G (Cellular)" // TD-LTE model see
        case "iPad4,7":                         return "iPad mini 3G (Wi-Fi)"
        case "iPad4,8", "iPad4,9":              return "iPad mini 3G (Cellular)"
        case "iPad5,1":                         return "iPad mini 4G (Wi-Fi)"
        case "iPad5,2":                         return "iPad mini 4G (Cellular)"
        case "iPad5,3":                         return "iPad Air 2 (Wi-Fi)"
        case "iPad5,4":                         return "iPad Air 2 (Cellular)"
        case "iPad6,3":                         return "iPad Pro (9.7 inch) 1G (Wi-Fi)" // http://pdadb.net/index.php?m=specs&id=9938&c=apple_ipad_pro_9.7-inch_a1673_wifi_32gb_apple_ipad_6,3
        case "iPad6,4":                         return "iPad Pro (9.7 inch) 1G (Cellular)" // http://pdadb.net/index.php?m=specs&id=9981&c=apple_ipad_pro_9.7-inch_a1675_td-lte_32gb_apple_ipad_6,4
        case "iPad6,7":                         return "iPad Pro (12.9 inch) 1G (Wi-Fi)" // http://pdadb.net/index.php?m=specs&id=8960&c=apple_ipad_pro_wifi_a1584_128gb
        case "iPad6,8":                         return "iPad Pro (12.9 inch) 1G (Cellular)" // http://pdadb.net/index.php?m=specs&id=8965&c=apple_ipad_pro_td-lte_a1652_32gb_apple_ipad_6,8
        case "iPad6,11":                        return "iPad (5th gen) (Wi-Fi)"
        case "iPad6,12":                        return "iPad (5th gen) (Cellular)"
        case "iPad7,1":                         return "iPad Pro (12.9 inch) 2G (Wi-Fi)"
        case "iPad7,2":                         return "iPad Pro (12.9 inch) 2G (Cellular)"
        case "iPad7,3":                         return "iPad Pro (10.5 inch) 1G (Wi-Fi)"
        case "iPad7,4":                         return "iPad Pro (10.5 inch) 1G (Cellular)"
        case "iPad7,5":                         return "iPad 6G (WiFi)"
        case "iPad7,6":                         return "iPad 6G (Cellular)"
        case "iPad7,11":                        return "iPad 7G (WiFi)"
        case "iPad7,12":                        return "iPad 7G (Cellular)"
        case "iPad8,1":                         return "iPad Pro (11 inch) (Wi-Fi)"
        case "iPad8,2":                         return "iPad Pro (11 inch) (Wi-Fi)" // 6GB RAM version, up to 1TB disk
        case "iPad8,3":                         return "iPad Pro (11 inch) (Cellular)"
        case "iPad8,4":                         return "iPad Pro (11 inch) (Cellular)" // 6GB RAM version, up to 1TB disk
        case "iPad8,5":                         return "iPad Pro (12.9 inch) 3G (Wi-Fi)"
        case "iPad8,6":                         return "iPad Pro (12.9 inch) 3G (Wi-Fi)"  // 6GB RAM version, up to 1TB disk
        case "iPad8,7":                         return "iPad Pro (12.9 inch) 3G (Cellular)"
        case "iPad8,8":                         return "iPad Pro (12.9 inch) 3G (Cellular)" // 6GB RAM version, up to 1TB disk
        case "iPad8,9":                         return "iPad Pro (11 inch) 2G (Cellular)"
        case "iPad8,10":                        return "iPad Pro (11-inch) 2G (Cellular)"
        case "iPad8,11":                        return "iPad Pro (12.9-inch) 4G (Cellular)"
        case "iPad8,12":                        return "iPad Pro (12.9-inch) 4G (Cellular)"
        case "iPad11,1":                        return "iPad mini 5G (Wi-Fi)"
        case "iPad11,2":                        return "iPad mini 5G (Cellular)"
        case "iPad11,3":                        return "iPad Air 3 (Wi-Fi)"
        case "iPad11,4":                        return "iPad Air 3 (Cellular)"
        case "iPad11,6":                        return "iPad 8G (WiFi)"
        case "iPad11,7":                        return "iPad 8G (Cellular)"

        // MARK:- Apple TV https://www.theiphonewiki.com/wiki/Apple_TV

        case "AppleTV1,1":                      return "Apple TV 1G"
        case "AppleTV2,1":                      return "Apple TV 2G"
        case "AppleTV3,1", "AppleTV3,2":        return "Apple TV 3G"
        case "AppleTV5,3":                      return "Apple TV 4G" // as 4,1 was never released, 5,1 is actually 4th generation
        case "AppleTV6,2":                      return "Apple TV (4K)"
    
        // MARK:- Simulator
        case "i386", "x86_64":                  return "Simulator"
        default:                                return identifier
        }
    }
}


// MARK: - 手机系列判断
extension UIDevice {
    /// 是否是iPhone系列
    public class var iPhoneSeries: Bool {
        return current.userInterfaceIdiom == .phone
    }
    
    /// 是否是iPad系列
    public class var iPadSeries: Bool {
        return current.userInterfaceIdiom == .pad
    }
    
    /// 是否是iPhone 4.7系列手机
    public class  var isPhone4_7Series: Bool {
        return UIScreen.main.bounds.width == 375.0
    }
    
    /// 是否是iPhone 5.5系列手机
    public class var isPhone5_5Series: Bool {
        return UIScreen.main.bounds.width == 414.0
    }
    
    /// 是否是iPhone X手机
    public class var isPhoneXSeries: Bool {
        return deviceType.contains(Info.iPhoneX)
    }
    
    /// 是否是全屏系列 目前可以通过状态栏的高度为20 或者 44来判断 为后面的新的全屏机做准备
    public class var isFullScreenSeries: Bool {
        return UIApplication.shared.statusBarFrame.height == 44.0
    }
}

// MARK: - 手机信息
extension UIDevice {
    /// uuid 注意其实uuid并不是唯一不变的
    public class var uuid: String? {
        return current.identifierForVendor?.uuidString
    }
    
    /// 设备系统名称
    public class var deviceSystemName: String {
        return current.systemName
    }
    
    /// 设备名称
    public class var deviceName: String {
        return current.name
    }
    
    /// 设备版本
    public class var deviceSystemVersion: String {
        return current.systemVersion
    }
    
    /// 设备版本的Float类型, 如果等于-1了那么就说明转换失败了
    public class var deviceFloatSystemVersion: Float {
        return Float(deviceSystemVersion) ?? -1.0
    }
}

// MARK: - 字符串常量化
extension UIDevice {
    public struct Info {
        public static let iPodTouch5 = "iPod Touch 5"
        
        public static let iPodTouch6 = "iPod Touch 6"
        
        public static let iPhone4 = "iPhone 4"
        
        public static let iPhone4s = "iPhone 4s"
        
        public static let iPhone5 = "iPhone 5"
        
        public static let iPhone5c = "iPhone 5c"
        
        public static let iPhone5s = "iPhone 5s"
        
        public static let iPhone6 = "iPhone 6"
        
        public static let iPhone6Plus = "iPhone 6 Plus"
        
        public static let iPhone6s = "iPhone 6s"
        
        public static let iPhone6sPlus = "iPhone 6s Plus"
        
        public static let iPhoneSE = "iPhone SE"
        
        public static let iPhone7 = "iPhone 7"
        
        public static let iPhone7Plus = "iPhone 7 Plus"
        
        public static let iPhone8 = "iPhone 8"
        
        public static let iPhone8Plus = "iPhone 8 Plus"
        
        public static let iPhoneX = "iPhone X"
        
        public static let iPhoneXs = "iPhone Xs"
        
        public static let iPhoneXsMax = "iPhone Xs Max"
        
        public static let iPhoneXR = "iPhone XR"

        public static let iPhone11 = "iPhone 11"
        
        public static let iPhone12 = "iPhone 12"

        public static let iPad2 = "iPad 2"
        
        public static let iPad3 = "iPad 3"
        
        public static let iPad4 = "iPad 4"
        
        public static let iPadAir = "iPad Air"
        
        public static let iPadAir2 = "iPad Air 2"
        
        public static let iPadMini = "iPad Mini"
        
        public static let iPadMini2 = "iPad Mini 2"
        
        public static let iPadMini3 = "iPad Mini 3"
        
        public static let iPadMini4 = "iPad Mini 4"
        
        public static let iPadPro = "iPad Pro"
        
        public static let AppleTV = "Apple TV"
        
        public static let Simulator = "Simulator"
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
        case twelve = 12.0
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
