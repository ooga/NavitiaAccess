//
//  Calendars.swift
//
//  Created by Johan Rouve on 29/03/2017
//  Copyright (c) . All rights reserved.
//

import Foundation
import ObjectMapper

public struct Calendars: Mappable {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let activePeriods = "active_periods"
    static let weekPattern = "week_pattern"
  }

  // MARK: Properties
  public var activePeriods: [ActivePeriods]?
  public var weekPattern: WeekPattern?

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
    activePeriods <- map[SerializationKeys.activePeriods]
    weekPattern <- map[SerializationKeys.weekPattern]
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = activePeriods { dictionary[SerializationKeys.activePeriods] = value.map { $0.dictionaryRepresentation() } }
    if let value = weekPattern { dictionary[SerializationKeys.weekPattern] = value.dictionaryRepresentation() }
    return dictionary
  }

}
