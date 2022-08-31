//
//  Product+CoreDataProperties.swift
//  ComprasUSA
//
//  Created by User on 26/08/22.
//
//

import Foundation
import CoreData


extension Product {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Product> {
        return NSFetchRequest<Product>(entityName: "Product")
    }

    @NSManaged public var name: String?
    @NSManaged public var value: Double
    @NSManaged public var realValue: Double
    @NSManaged public var image: String
    @NSManaged public var isCardPayment: Bool
    @NSManaged public var place: State?

}

extension Product : Identifiable {

}
