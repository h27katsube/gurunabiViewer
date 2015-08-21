//
//  EndPoints.swift
//  internTest
//
//  Created by intern on 2015/08/18.
//  Copyright (c) 2015年 intern. All rights reserved.
//

import UIKit

import Alamofire
import Result
import Mantle

enum Error: Int {
    static let Domain: String = "APIClientErrorDomain"
    case NoResponse = -1
    case NoUser = -401
    func error(_ userInfo: [NSObject : AnyObject]? = nil) -> NSError {
        return NSError(domain: Error.Domain, code: rawValue, userInfo: userInfo)
    }
}

private func parse<T: MTLModel>(response: AnyObject?) -> Result<T, NSError> {
    if let JSON = response as? [NSObject: AnyObject] {
        return try({ MTLJSONAdapter.modelOfClass(T.self, fromJSONDictionary: JSON, error: $0) as? T })
    } else {
        return Result.failure(Error.NoResponse.error())
    }
}

private func parse<T: MTLModel>(response: AnyObject?) -> Result<[T], NSError> {
    if let JSON = response as? [AnyObject] {
        return try({ MTLJSONAdapter.modelsOfClass(T.self, fromJSONArray: JSON, error: $0) as? [T] })
    } else {
        return Result.failure(Error.NoResponse.error())
    }
}

public protocol Endpoint {
    var path: String { get }
    var method: Alamofire.Method { get }
    var parameters: [String : AnyObject] { get }
    var parser: AnyObject? -> Result<Response, NSError> { get }
    
    typealias Response
}

public struct SearchEndpoint: Endpoint {
    public var path = "/RestSearchAPI/20150630/"
    public var method = Method.GET
    public var parameters: [String : AnyObject]
    public typealias Response = ItemsJSON
    public var parser: AnyObject? -> Result<Response, NSError> = parse
    
    public init(name: String) {
        // keyidを自分のものに変えてください
        parameters = [ "name": name, "format": "json", "keyid": "72847290835367264872" ]
    }
}