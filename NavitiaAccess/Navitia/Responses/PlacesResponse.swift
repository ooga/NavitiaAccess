//
//  PlacesResponse.swift
//
//  Created by Johan Rouve on 24/03/2017
//  Copyright (c) Kisio. All rights reserved.
//

import Foundation
import ObjectMapper

public struct PlacesResponse: Mappable {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let disruptions = "disruptions"
    static let links = "links"
    static let feedPublishers = "feed_publishers"
    static let places = "places"
  }

  // MARK: Properties
  public var disruptions: [Any]?
  public var links: [Links]?
  public var feedPublishers: [FeedPublishers]?
  public var places: [Places]?

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
    disruptions <- map[SerializationKeys.disruptions]
    links <- map[SerializationKeys.links]
    feedPublishers <- map[SerializationKeys.feedPublishers]
    places <- map[SerializationKeys.places]
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = disruptions { dictionary[SerializationKeys.disruptions] = value }
    if let value = links { dictionary[SerializationKeys.links] = value.map { $0.dictionaryRepresentation() } }
    if let value = feedPublishers { dictionary[SerializationKeys.feedPublishers] = value.map { $0.dictionaryRepresentation() } }
    if let value = places { dictionary[SerializationKeys.places] = value.map { $0.dictionaryRepresentation() } }
    return dictionary
  }

}
