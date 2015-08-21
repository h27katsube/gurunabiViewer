//
//  itemJSON.swift
//  internTest
//
//  Created by intern on 2015/08/18.
//  Copyright (c) 2015年 intern. All rights reserved.
//

import UIKit

import Mantle

public class ItemsJSON: MTLModel, MTLJSONSerializing {
    public var rests = [ItemJSON]()
    
    public class func JSONKeyPathsByPropertyKey() -> [NSObject : AnyObject]! {
        return [
            "rests": "rest",
        ]
    }
    
    public class func restsJSONTransformer() ->NSValueTransformer {
        return MTLJSONAdapter.arrayTransformerWithModelClass(ItemJSON.self)
    }
}

public class ItemJSON: MTLModel, MTLJSONSerializing {
    
    public var title: String?
    public var itemURL: NSURL?
    public var content: String?
    public var largeImage: NSURL?
    public var opentime: String?

    
    public class func JSONKeyPathsByPropertyKey() -> [NSObject : AnyObject]! {
        return [
            "title": "name",
            "itemURL": "url_mobile",
            "content": "address",
            "largeImage": "image_url.shop_image1",
            "opentime": "opentime",
        ]
    }
    
    public class func itemURLJSONTransformer() -> NSValueTransformer {
        return NSValueTransformer(forName: MTLURLValueTransformerName)!
    }
    
    public class func largeImageJSONTransformer() -> NSValueTransformer {
        return NSValueTransformer(forName: MTLURLValueTransformerName)!
    }
}