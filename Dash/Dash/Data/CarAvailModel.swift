//
//  CarAvailModel.swift
//  Assignment 9
//
//  Created by LMNTrix on 4/11/21.
//

import Foundation
// MARK: - Welcome
struct CarAvailModel: Codable {
    let status: Status
    let transaction: Transaction
    let product: Product
    let vehicles: [Vehicle]
    let reservation: Reservation
}

// MARK: - Product
struct Product: Codable {
    let brand: String
}

// MARK: - Reservation
struct Reservation: Codable {
    let pickupLocation, dropoffLocation: Location
    let terms: [Term]

    enum CodingKeys: String, CodingKey {
        case pickupLocation = "pickup_location"
        case dropoffLocation = "dropoff_location"
        case terms
    }
}

struct Location: Codable {
    let location: LocationClass
    let address: Address
}

struct Address: Codable {
    let addressLine1, addressLine2, city, stateName: String
    let postalCode, countryCode: String

    enum CodingKeys: String, CodingKey {
        case addressLine1 = "address_line_1"
        case addressLine2 = "address_line_2"
        case city
        case stateName = "state_name"
        case postalCode = "postal_code"
        case countryCode = "country_code"
    }
}
struct LocationClass: Codable {
    let code, name, telephone, hours: String
    let airportLocation: Bool

    enum CodingKeys: String, CodingKey {
        case code, name, telephone, hours
        case airportLocation = "airport_location"
    }
}

struct Term: Codable {
    let type, method: String
    let endpoint: String
}


struct Status: Codable {
    let requestTime: String
    let success: [Success]

    enum CodingKeys: String, CodingKey {
        case requestTime = "request_time"
        case success
    }
}

// MARK: - Success
struct Success: Codable {
    let code, message, details: String
}

// MARK: - Transaction
struct Transaction: Codable {
    let transactionID: String

    enum CodingKeys: String, CodingKey {
        case transactionID = "transaction_id"
    }
}

// MARK: - Vehicle
struct Vehicle: Codable {
    let category: Category
    let features: Features
    let capacity: Capacity
    let rateTotals: RateTotals

    enum CodingKeys: String, CodingKey {
        case category, features, capacity
        case rateTotals = "rate_totals"
    }
}

// MARK: - Capacity
struct Capacity: Codable {
    let doors, seats: String
    let luggageCapacity: LuggageCapacity

    enum CodingKeys: String, CodingKey {
        case doors, seats
        case luggageCapacity = "luggage_capacity"
    }
}

// MARK: - LuggageCapacity
struct LuggageCapacity: Codable {
    let largeSuitcase: String

    enum CodingKeys: String, CodingKey {
        case largeSuitcase = "large_suitcase"
    }
}

// MARK: - Category
struct Category: Codable {
    let name, make, model, sippCode: String
    let vehicleClassCode, vehicleClassName: String
    let vehicleTransmission: VehicleTransmission
    let mpg: String
    let imageURL: String

    enum CodingKeys: String, CodingKey {
        case name, make, model
        case sippCode = "sipp_code"
        case vehicleClassCode = "vehicle_class_code"
        case vehicleClassName = "vehicle_class_name"
        case vehicleTransmission = "vehicle_transmission"
        case mpg
        case imageURL = "image_url"
    }
}

enum VehicleTransmission: String, Codable {
    case automatic = "Automatic"
}

// MARK: - Features
struct Features: Codable {
    let bluetoothEquipped: Bool
    let smokeFree: Bool?
    let airConditioned, connectedCar: Bool

    enum CodingKeys: String, CodingKey {
        case bluetoothEquipped = "bluetooth_equipped"
        case smokeFree = "smoke_free"
        case airConditioned = "air_conditioned"
        case connectedCar = "connected_car"
    }
}

// MARK: - RateTotals
struct RateTotals: Codable {
    let rate: Rate
    let payLater: PayLater

    enum CodingKeys: String, CodingKey {
        case rate
        case payLater = "pay_later"
    }
}

// MARK: - PayLater
struct PayLater: Codable {
    let vehicleTotal, reservationTotal: Double

    enum CodingKeys: String, CodingKey {
        case vehicleTotal = "vehicle_total"
        case reservationTotal = "reservation_total"
    }
}

// MARK: - Rate
struct Rate: Codable {
    let currency: Currency
    let rateCode: RateCode
    let couponApplied, underAgeFeeApplied: Bool
    let couponDiscountAmount: Int

    enum CodingKeys: String, CodingKey {
        case currency
        case rateCode = "rate_code"
        case couponApplied = "coupon_applied"
        case underAgeFeeApplied = "under_age_fee_applied"
        case couponDiscountAmount = "coupon_discount_amount"
    }
}

enum Currency: String, Codable {
    case usd = "USD"
}

enum RateCode: String, Codable {
    case the2A = "2A"
    case the2E = "2E"
}
