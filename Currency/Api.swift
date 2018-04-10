import UIKit
import Alamofire

class Api {
    
    let mainUrl = "http://phisix-api3.appspot.com/stocks.json";

    func getCurrency(success: @escaping (NSDictionary) -> Void, error: @escaping () -> Void) -> Void {
        
        Alamofire.request(mainUrl, method: .get, parameters: nil, encoding: JSONEncoding.default)
            .responseJSON { response in
                
                do {
                    if let jsonResult = try JSONSerialization.jsonObject(with: response.data!, options: []) as? NSDictionary {
                  
                        if response.response?.statusCode == 200 {
                            success(jsonResult)
                        } else {
                     error()
                    }
                        
                    }
                } catch(let err) {                    
                    error()
                }
        }
    }
}
