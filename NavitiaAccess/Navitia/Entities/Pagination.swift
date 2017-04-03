//
//  Pagination.swift
//
//  Created by Johan Rouve on 23/03/2017
//  Copyright (c) Kisio. All rights reserved.
//

import Foundation
import ObjectMapper

public struct Pagination: Mappable {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let itemsPerPage = "items_per_page"
    static let itemsOnPage = "items_on_page"
    static let startPage = "start_page"
    static let totalResult = "total_result"
  }

  // MARK: Properties
  public var itemsPerPage: Int?
  public var itemsOnPage: Int?
  public var startPage: Int?
  public var totalResult: Int?

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
    itemsPerPage <- map[SerializationKeys.itemsPerPage]
    itemsOnPage <- map[SerializationKeys.itemsOnPage]
    startPage <- map[SerializationKeys.startPage]
    totalResult <- map[SerializationKeys.totalResult]
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = itemsPerPage { dictionary[SerializationKeys.itemsPerPage] = value }
    if let value = itemsOnPage { dictionary[SerializationKeys.itemsOnPage] = value }
    if let value = startPage { dictionary[SerializationKeys.startPage] = value }
    if let value = totalResult { dictionary[SerializationKeys.totalResult] = value }
    return dictionary
  }

}
