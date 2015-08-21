//
//  SeachManager.swift
//  internTest
//
//  Created by intern on 2015/08/18.
//  Copyright (c) 2015年 intern. All rights reserved.
//

import UIKit

import Result

public class SearchManager: NSObject {
    
    lazy var client: APIClient = APIClient()
    
    public func searchItems(name: String,handler: Result<ItemsJSON, NSError> -> ()) {
        client.request(SearchEndpoint(name: name),handler:handler)
    }
}
