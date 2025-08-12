import Foundation

final class Car: ICarEntity {
    private let _id: UUID = .init()
    private let brand: String
    private let model: String
    private let fuelConsumption: Double // unit is l/100 km
    private let tankCapacity: Double
    private var totalMileage: Double = 0
    private var fuelAvailable: Double
    private let engineType: EngineType
    private var chargeAvailable: Double
    private let batteryCapacity: Double

    init(_ modelInfo: CarModel) {
        brand = modelInfo.brand.rawValue
        model = modelInfo.model
        fuelConsumption = modelInfo.fuelConsumption
        tankCapacity = modelInfo.tankCapacity
        engineType = modelInfo.engineType
        fuelAvailable = 0
        chargeAvailable = 0
        batteryCapacity = modelInfo.batteryCapacity
    }

    func refillGasoline(_ liters: Double) {
        fuelAvailable += liters
        if fuelAvailable > tankCapacity {
            fuelAvailable = tankCapacity
        }
    }

    func charge(kWh: Double) {
        chargeAvailable += kWh
        if chargeAvailable > batteryCapacity {
            chargeAvailable = batteryCapacity
        }
    }

    func travel(_ distance: Double) {
        let tripFuelConsumption = calculateTripFuelConsumption(distance)
        fuelAvailable -= tripFuelConsumption
        totalMileage += distance
    }

    func id() -> UUID {
        _id
    }

    func mileage() -> Double {
        totalMileage
    }

    func fuelAmount() -> Double {
        fuelAvailable
    }

    func currentCharge() -> Double {
        chargeAvailable
    }

    func name() -> String {
        "\(brand) \(model) \(id())"
    }

    func data() -> String {
        if engineType == .gasoline {
            "\(name())\nTotal Mileage: \(mileage()) Km\nFuel Available: \(fuelAmount()) l"
        } else {
            "\(name())\nTotal Mileage: \(mileage()) Km\nCurrent Charge Available: \(currentCharge()) kWh"
        }
    }

    private func calculateTripFuelConsumption(_ distance: Double) -> Double {
        // consumption unit is l/100 km
        fuelConsumption * distance / 100
    }
}
