//
//  DepartureResponse.swift
//
//  Created by Johan Rouve on 23/03/2017
//  Copyright (c) Kisio. All rights reserved.
//

import Foundation
import ObjectMapper

public struct DepartureResponse: Mappable {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let pagination = "pagination"
    static let feedPublishers = "feed_publishers"
    static let departures = "departures"
    static let disruptions = "disruptions"
    static let links = "links"
    static let exceptions = "exceptions"
    static let notes = "notes"
  }

  // MARK: Properties
  public var pagination: Pagination?
  public var feedPublishers: [FeedPublishers]?
  public var departures: [Departures]?
  public var disruptions: [Any]?
  public var links: [Links]?
  public var exceptions: [Any]?
  public var notes: [Any]?

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
    pagination <- map[SerializationKeys.pagination]
    feedPublishers <- map[SerializationKeys.feedPublishers]
    departures <- map[SerializationKeys.departures]
    disruptions <- map[SerializationKeys.disruptions]
    links <- map[SerializationKeys.links]
    exceptions <- map[SerializationKeys.exceptions]
    notes <- map[SerializationKeys.notes]
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = pagination { dictionary[SerializationKeys.pagination] = value.dictionaryRepresentation() }
    if let value = feedPublishers { dictionary[SerializationKeys.feedPublishers] = value.map { $0.dictionaryRepresentation() } }
    if let value = departures { dictionary[SerializationKeys.departures] = value.map { $0.dictionaryRepresentation() } }
    if let value = disruptions { dictionary[SerializationKeys.disruptions] = value }
    if let value = links { dictionary[SerializationKeys.links] = value.map { $0.dictionaryRepresentation() } }
    if let value = exceptions { dictionary[SerializationKeys.exceptions] = value }
    if let value = notes { dictionary[SerializationKeys.notes] = value }
    return dictionary
  }

}
