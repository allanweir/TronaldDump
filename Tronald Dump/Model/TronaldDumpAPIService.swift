//
//  TronaldDumpAPIService.swift
//  Tronald Dump
//
//  Created by Allan Weir on 04/01/2018.
//  Copyright © 2018 Allan Weir. All rights reserved.
//

import UIKit
import Alamofire

class TronaldDumpAPIService: Alamofire.SessionManager {
    
    typealias APIResponse = ((_ data: [String: Any]?, _ error: Error?) -> Void)

    private enum APIEndpointName: String {
        case tags
        case tag
    }
    
    private struct APIEndpoint {
        let endpointName: APIEndpointName
        let extraPathParameters: [String]?
    }
    
    static let BaseURLString: String = "https://api.tronalddump.io/"
    
    static let sharedService: TronaldDumpAPIService = {
        let configuration = URLSessionConfiguration.default // or your configuration
        configuration.httpAdditionalHeaders = SessionManager.defaultHTTPHeaders // or your headers
        configuration.timeoutIntervalForRequest = 20
        configuration.timeoutIntervalForResource = 20
        
        return TronaldDumpAPIService(configuration: configuration, delegate: SessionManager.default.delegate)
    }()
    
    override init(configuration: URLSessionConfiguration, delegate: SessionDelegate, serverTrustPolicyManager: ServerTrustPolicyManager? = nil) {
        super.init(configuration: configuration, delegate: delegate, serverTrustPolicyManager: serverTrustPolicyManager)
    }
    
    private func internalAPIRequest(endpoint: APIEndpoint, method: HTTPMethod = .get, parameters: Parameters?) -> DataRequest {
        var url = URL(string: TronaldDumpAPIService.BaseURLString)!
        url = url.appendingPathComponent(endpoint.endpointName.rawValue, isDirectory: false)
        
        if let extraPathParameters = endpoint.extraPathParameters {
            for path in extraPathParameters {
                url = url.appendingPathComponent(path, isDirectory: false)
            }
        }
        Log.info(url)
        return self.request(url, method: method, parameters: parameters, encoding: URLEncoding.default, headers: nil)
    }
    
    private func startRequest(endpoint: APIEndpoint, method: HTTPMethod = .get, parameters: Parameters? = nil, completion: @escaping APIResponse) {
        let request = self.internalAPIRequest(endpoint: endpoint, parameters: parameters)
        request.responseJSON { (response) in
            switch response.result {
            case .success:
                let JSON = response.result.value
                completion(JSON as? [String: Any], nil)
            case .failure(let error):
                completion(nil, error)
            }
        }
    }
    
    // MARK: - Requests
    
    func getTags(completion: @escaping APIResponse) {
        let endpoint = APIEndpoint(endpointName: .tags, extraPathParameters: nil)
        self.startRequest(endpoint: endpoint, completion: completion)
    }
    
    func getTag(_ name: String, completion: @escaping APIResponse) {
        let endpoint = APIEndpoint(endpointName: .tag, extraPathParameters: [name])
        self.startRequest(endpoint: endpoint, completion: completion)
    }

}
