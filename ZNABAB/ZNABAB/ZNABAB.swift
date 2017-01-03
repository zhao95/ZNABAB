//
//  ZNABAB.swift
//  ZNABAB
//
//  Created by 赵恩峰 on 17/1/3.
//  Copyright © 2017年 赵恩峰. All rights reserved.
//

// MARK:目录
/*
 ZNColor_read 随机颜色
 ZNColor_16RGB  16进制颜色
 ZNColor_16RGB_alpha
 printLog    打印
 ZNModel    字典模型
 AFNetworking    网络请求
 */



import UIKit

// MARK:readColor
extension UIColor {
    /// 随机颜色
    class func ZNColor_read () -> UIColor {
        let red = CGFloat(arc4random()) / CGFloat(RAND_MAX)
        let green = CGFloat(arc4random()) / CGFloat(RAND_MAX)
        let blue = CGFloat(arc4random()) / CGFloat(RAND_MAX)
        return UIColor(red: red, green: green, blue: blue, alpha: 1);
    }
    /// 16进制颜色
    class func ZNColor_16RGB (hex:String) -> UIColor {
        var cString:String = hex.trimmingCharacters(in: NSCharacterSet.whitespacesAndNewlines)
        if (cString.hasPrefix("#")) {
            cString = (cString as NSString).substring(from: 1)
        }
        let rString = (cString as NSString).substring(to: 2)
        let gString = ((cString as NSString).substring(from: 2) as NSString).substring(to: 2)
        let bString = ((cString as NSString).substring(from: 4) as NSString).substring(to: 2)
        var r:CUnsignedInt = 0, g:CUnsignedInt = 0, b:CUnsignedInt = 0;
        Scanner(string: rString).scanHexInt32(&r)
        Scanner(string: gString).scanHexInt32(&g)
        Scanner(string: bString).scanHexInt32(&b)
        return UIColor(red: CGFloat(r) / 255.0, green: CGFloat(g) / 255.0, blue: CGFloat(b) / 255.0, alpha: CGFloat(1))
    }
    /// 16进制颜色默认透明度为1.0
    class func ZNColor_16RGB_alpha (hex:String, alpha:CGFloat = 1.0) -> UIColor {
        var cString:String = hex.trimmingCharacters(in: NSCharacterSet.whitespacesAndNewlines)
        if (cString.hasPrefix("#")) {
            cString = (cString as NSString).substring(from: 1)
        }
        let rString = (cString as NSString).substring(to: 2)
        let gString = ((cString as NSString).substring(from: 2) as NSString).substring(to: 2)
        let bString = ((cString as NSString).substring(from: 4) as NSString).substring(to: 2)
        var r:CUnsignedInt = 0, g:CUnsignedInt = 0, b:CUnsignedInt = 0;
        Scanner(string: rString).scanHexInt32(&r)
        Scanner(string: gString).scanHexInt32(&g)
        Scanner(string: bString).scanHexInt32(&b)
        return UIColor(red: CGFloat(r) / 255.0, green: CGFloat(g) / 255.0, blue: CGFloat(b) / 255.0, alpha: alpha)
    }
}

/// 打印-类-行-对象-方法名
func printLog<T>(_ message: T,
              file: String = #file,
              method: String = #function,
              line: Int = #line)
{
    print("[🔔\((file as NSString).lastPathComponent)]  [🎯\(line)]  [🔨\(method)] :     🔍🔍🔍   \(message)")
}


// MARK:ZNModel

/// 模型类
class ZNModel: NSObject {
    init(dict : [String : NSObject]) {
        super.init()
        setValuesForKeys(dict)
    }
    override func setValue(_ value: Any?, forUndefinedKey key: String) {
    }
}


// MARK:AFNetworking
//import AFNetworking
//enum RequestType {
//    case GET
//    case POST
//}
//class NetworkTools: AFHTTPSessionManager {
//    // 将工具类封装成单例对象
//    // let : 1> 防止别人修改 2> 可以防止多线程访问,创建多个对象
//
//    static let shareInstance : NetworkTools = {
//        let tools = NetworkTools()
//
//        tools.responseSerializer.acceptableContentTypes?.insert("text/html")
//
//        return tools
//    }()
//    func reqeustData(type : RequestType, urlString : String, parameters : [String : NSObject], finishedCallback : (_ result : AnyObject?, _ error : NSError?) -> ()) {
//        // 定义成功的闭包
//        let successCallback = { (task : NSURLSessionDataTask, result : AnyObject?) in
//            finishedCallback(result: result, error: nil)
//        }
//
//        // 定义失败的闭包
//        let failureCallback = { (task : NSURLSessionDataTask?, error : NSError) in
//            finishedCallback(result: nil, error: error)
//        }
//
//        // 发送网络请求
//        if type == .GET {
//            GET(urlString, parameters: parameters, progress: nil, success: successCallback, failure: failureCallback)
//        } else {
//            POST(urlString, parameters: parameters, progress: nil, success: successCallback, failure: failureCallback)
//        }
//    }
//}
//

