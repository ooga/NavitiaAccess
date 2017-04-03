//
//  DisplayInformations.swift
//
//  Created by Johan Rouve on 23/03/2017
//  Copyright (c) Kisio. All rights reserved.
//

import Foundation
import ObjectMapper

public struct DisplayInformations: Mappable {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let label = "label"
    static let headsign = "headsign"
    static let textColor = "text_color"
    static let commercialMode = "commercial_mode"
    static let code = "code"
    static let descriptionValue = "description"
    static let physicalMode = "physical_mode"
    static let links = "links"
    static let network = "network"
    static let equipments = "equipments"
    static let direction = "direction"
    static let color = "color"
  }

  // MARK: Properties
  public var label: String?
  public var headsign: String?
  public var textColor: String?
  public var commercialMode: String?
  public var code: String?
  public var descriptionValue: String?
  public var physicalMode: String?
  public var links: [Any]?
  public var network: String?
  public var equipments: [Any]?
  public var direction: String?
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
    label <- map[SerializationKeys.label]
    headsign <- map[SerializationKeys.headsign]
    textColor <- map[SerializationKeys.textColor]
    commercialMode <- map[SerializationKeys.commercialMode]
    code <- map[SerializationKeys.code]
    descriptionValue <- map[SerializationKeys.descriptionValue]
    physicalMode <- map[SerializationKeys.physicalMode]
    links <- map[SerializationKeys.links]
    network <- map[SerializationKeys.network]
    equipments <- map[SerializationKeys.equipments]
    direction <- map[SerializationKeys.direction]
    color <- map[SerializationKeys.color]
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = label { dictionary[SerializationKeys.label] = value }
    if let value = headsign { dictionary[SerializationKeys.headsign] = value }
    if let value = textColor { dictionary[SerializationKeys.textColor] = value }
    if let value = commercialMode { dictionary[SerializationKeys.commercialMode] = value }
    if let value = code { dictionary[SerializationKeys.code] = value }
    if let value = descriptionValue { dictionary[SerializationKeys.descriptionValue] = value }
    if let value = physicalMode { dictionary[SerializationKeys.physicalMode] = value }
    if let value = links { dictionary[SerializationKeys.links] = value }
    if let value = network { dictionary[SerializationKeys.network] = value }
    if let value = equipments { dictionary[SerializationKeys.equipments] = value }
    if let value = direction { dictionary[SerializationKeys.direction] = value }
    if let value = color { dictionary[SerializationKeys.color] = value }
    return dictionary
  }

}
