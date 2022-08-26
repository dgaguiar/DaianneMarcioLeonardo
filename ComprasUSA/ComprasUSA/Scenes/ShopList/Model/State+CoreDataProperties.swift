//
//  State+CoreDataProperties.swift
//  ComprasUSA
//
//  Created by User on 26/08/22.
//
//

import Foundation
import CoreData


extension State {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<State> {
        return NSFetchRequest<State>(entityName: "State")
    }

    @NSManaged public var name: String?
    @NSManaged public var tax: Double
    @NSManaged public var shop: NSSet?

}

// MARK: Generated accessors for shop
extension State {

    @objc(addShopObject:)
    @NSManaged public func addToShop(_ value: Product)

    @objc(removeShopObject:)
    @NSManaged public func removeFromShop(_ value: Product)

    @objc(addShop:)
    @NSManaged public func addToShop(_ values: NSSet)

    @objc(removeShop:)
    @NSManaged public func removeFromShop(_ values: NSSet)

}

extension State : Identifiable {

}
