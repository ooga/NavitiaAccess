//
//  WeekPattern.swift
//
//  Created by Johan Rouve on 29/03/2017
//  Copyright (c) . All rights reserved.
//

import Foundation
import ObjectMapper

public struct WeekPattern: Mappable {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let wednesday = "wednesday"
    static let saturday = "saturday"
    static let thursday = "thursday"
    static let monday = "monday"
    static let friday = "friday"
    static let sunday = "sunday"
    static let tuesday = "tuesday"
  }

  // MARK: Properties
  public var wednesday: Bool? = false
  public var saturday: Bool? = false
  public var thursday: Bool? = false
  public var monday: Bool? = false
  public var friday: Bool? = false
  public var sunday: Bool? = false
  public var tuesday: Bool? = false

  // MARK: ObjectMapper Initializers
  /// Map a JSON object to this class using ObjectMapper.
  ///
  /// - parameter map: A mapping from ObjectMapper.
  public init?(map: Map){

  }

  /// Map a JSON object to this class using ObjectMapper.
  ///
  /// - parameter map: A mapping from ObjectMapper.
  public mutating func mapping(map: Map) {
    wednesday <- map[SerializationKeys.wednesday]
    saturday <- map[SerializationKeys.saturday]
    thursday <- map[SerializationKeys.thursday]
    monday <- map[SerializationKeys.monday]
    friday <- map[SerializationKeys.friday]
    sunday <- map[SerializationKeys.sunday]
    tuesday <- map[SerializationKeys.tuesday]
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    dictionary[SerializationKeys.wednesday] = wednesday
    dictionary[SerializationKeys.saturday] = saturday
    dictionary[SerializationKeys.thursday] = thursday
    dictionary[SerializationKeys.monday] = monday
    dictionary[SerializationKeys.friday] = friday
    dictionary[SerializationKeys.sunday] = sunday
    dictionary[SerializationKeys.tuesday] = tuesday
    return dictionary
  }

}
