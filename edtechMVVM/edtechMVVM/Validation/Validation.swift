//
//  Validation.swift
//  edtechMVVM
//
//  Created by admin on 15/03/22.
//

import Foundation
import SystemConfiguration

struct Validation {
    
    func Validate() -> ValidationResult
    {
        let reach = Reachability1()
        if(reach.isConnectedToNetwork())
        {
            return ValidationResult(success: true, error: nil)
           
        }
        else{
            return ValidationResult(success: false, error: "No internet Connection ")
        }
//
//
       
    }
}


 class Reachability1 {
    public func isConnectedToNetwork() -> Bool {
        var zeroAddress = sockaddr_in()
        zeroAddress.sin_len = UInt8(MemoryLayout<sockaddr_in>.size)
        zeroAddress.sin_family = sa_family_t(AF_INET)

        guard let defaultRouteReachability = withUnsafePointer(to: &zeroAddress, {
            $0.withMemoryRebound(to: sockaddr.self, capacity: 1) {
                SCNetworkReachabilityCreateWithAddress(nil, $0)
            }
        }) else {
            return false
        }

        var flags: SCNetworkReachabilityFlags = []
        if !SCNetworkReachabilityGetFlags(defaultRouteReachability, &flags) {
            return false
        }
        if flags.isEmpty {
            return false
        }

        let isReachable = flags.contains(.reachable)
        let needsConnection = flags.contains(.connectionRequired)

        return (isReachable && !needsConnection)
    }
}
