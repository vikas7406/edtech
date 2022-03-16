//
//  HttpUtility.swift
//  edtechMVVM
//
//  Created by admin on 15/03/22.
//

import Foundation
struct HttpUtility
{
    
    func getApi<T:Decodable>(requestUrl: URL, resultType: T.Type, completionHandler:@escaping(_ Result :T )-> Void)
    {
        URLSession.shared.dataTask(with: requestUrl) { (responseData, httpUrlResponse, error) in
            if(error == nil && responseData != nil && responseData?.count != 0)
            {
                let decoder = JSONDecoder()
                if let data = responseData {
                do {
                    let result = try decoder.decode(resultType, from: data)
                
                    _=completionHandler(result)
                }
                catch let error{
                    debugPrint("error occured while decoding = \(error)")
                }
                }}

        }.resume()
    }
}
