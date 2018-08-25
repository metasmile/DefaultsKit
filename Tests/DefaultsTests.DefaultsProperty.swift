//
//  DefaultsTests + property.swift
//  DefaultsKit iOS
//
//  Created by BLACKGENE on 8/25/18.
//  Copyright © 2018 Nuno Dias. All rights reserved.
//

import Foundation

/*
 testAutoPropertyExtension
 */
struct CustomValueType: Codable{
    var key:String = "value"
}

extension Defaults: DefaultsProperty {
    static var testValue_autoStringPropertyWithDefaultValue_defaultValue:String{
        return "default string value"
    }
    static var testValue_autoStringPropertyWithDefaultValue_newValue:String{
        return "new string value"
    }
    
    var autoStringProperty: String? {
        set(newValue){ set(newValue) } get{ return get() }
    }
    var autoDateProperty: Date? {
        set(newValue){ set(newValue) } get{ return get() }
    }
    
    // default value with 'or'
    var autoStringPropertyWithDefaultValue: String? {
        set(newValue){ set(newValue) } get{ return get(or:"default string value") }
    }
    // non-optional - must define lazily default value with the keyword 'or'
    var autoCustomNonOptionalProperty: CustomValueType {
        set(newValue){ set(newValue) } get{ return get(or: CustomValueType()) }
    }
    // optional - there are 4 ways with/without default value
    var autoCustomOptionalProperty: CustomValueType? {
        set(newValue){ set(newValue) } get{ return get() }
    }
    var autoCustomOptionalPropertySetterDefaultValue: CustomValueType? {
        set(newValue){ set(newValue, or: CustomValueType()) } get{ return get() }
    }
    var autoCustomOptionalPropertyGetterDefaultValue: CustomValueType? {
        set(newValue){ set(newValue) } get{ return get(or:CustomValueType()) }
    }
    var autoCustomOptionalPropertySetterGetterDefaultValue: CustomValueType? {
        set(newValue){ set(newValue, or: CustomValueType()) } get{ return get(or: CustomValueType()) }
    }
}
