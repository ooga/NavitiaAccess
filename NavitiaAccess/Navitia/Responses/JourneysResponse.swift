//
//  JourneysResponse.swift
//
//  Created by Johan Rouve on 29/03/2017
//  Copyright (c) . All rights reserved.
//

import Foundation
import ObjectMapper

public struct JourneysResponse: Mappable {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let feedPublishers = "feed_publishers"
    static let journeys = "journeys"
    static let tickets = "tickets"
    static let disruptions = "disruptions"
    static let links = "links"
    static let context = "context"
    static let exceptions = "exceptions"
    static let notes = "notes"
  }

  // MARK: Properties
  public var feedPublishers: [FeedPublishers]?
  public var journeys: [Journeys]?
  public var tickets: [Any]?
  public var disruptions: [Any]?
  public var links: [Links]?
  public var context: Context?
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
    feedPublishers <- map[SerializationKeys.feedPublishers]
    journeys <- map[SerializationKeys.journeys]
    tickets <- map[SerializationKeys.tickets]
    disruptions <- map[SerializationKeys.disruptions]
    links <- map[SerializationKeys.links]
    context <- map[SerializationKeys.context]
    exceptions <- map[SerializationKeys.exceptions]
    notes <- map[SerializationKeys.notes]
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = feedPublishers { dictionary[SerializationKeys.feedPublishers] = value.map { $0.dictionaryRepresentation() } }
    if let value = journeys { dictionary[SerializationKeys.journeys] = value.map { $0.dictionaryRepresentation() } }
    if let value = tickets { dictionary[SerializationKeys.tickets] = value }
    if let value = disruptions { dictionary[SerializationKeys.disruptions] = value }
    if let value = links { dictionary[SerializationKeys.links] = value.map { $0.dictionaryRepresentation() } }
    if let value = context { dictionary[SerializationKeys.context] = value.dictionaryRepresentation() }
    if let value = exceptions { dictionary[SerializationKeys.exceptions] = value }
    if let value = notes { dictionary[SerializationKeys.notes] = value }
    return dictionary
  }

}
