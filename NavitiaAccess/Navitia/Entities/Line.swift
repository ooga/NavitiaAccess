//
//  Line.swift
//
//  Created by Johan Rouve on 23/03/2017
//  Copyright (c) Kisio. All rights reserved.
//

import Foundation
import ObjectMapper

public struct Line: Mappable {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let geojson = "geojson"
    static let name = "name"
    static let openingTime = "opening_time"
    static let textColor = "text_color"
    static let id = "id"
    static let code = "code"
    static let links = "links"
    static let closingTime = "closing_time"
    static let codes = "codes"
    static let color = "color"
  }

  // MARK: Properties
  public var geojson: Geojson?
  public var name: String?
  public var openingTime: String?
  public var textColor: String?
  public var id: String?
  public var code: String?
  public var links: [Any]?
  public var closingTime: String?
  public var codes: [Codes]?
  public var color: String?

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
    geojson <- map[SerializationKeys.geojson]
    name <- map[SerializationKeys.name]
    openingTime <- map[SerializationKeys.openingTime]
    textColor <- map[SerializationKeys.textColor]
    id <- map[SerializationKeys.id]
    code <- map[SerializationKeys.code]
    links <- map[SerializationKeys.links]
    closingTime <- map[SerializationKeys.closingTime]
    codes <- map[SerializationKeys.codes]
    color <- map[SerializationKeys.color]
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = geojson { dictionary[SerializationKeys.geojson] = value.dictionaryRepresentation() }
    if let value = name { dictionary[SerializationKeys.name] = value }
    if let value = openingTime { dictionary[SerializationKeys.openingTime] = value }
    if let value = textColor { dictionary[SerializationKeys.textColor] = value }
    if let value = id { dictionary[SerializationKeys.id] = value }
    if let value = code { dictionary[SerializationKeys.code] = value }
    if let value = links { dictionary[SerializationKeys.links] = value }
    if let value = closingTime { dictionary[SerializationKeys.closingTime] = value }
    if let value = codes { dictionary[SerializationKeys.codes] = value.map { $0.dictionaryRepresentation() } }
    if let value = color { dictionary[SerializationKeys.color] = value }
    return dictionary
  }

}
