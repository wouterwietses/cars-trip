import Foundation

final class ElectricCar: ICarEntity, IElectricPowered {
    private let _id: UUID = .init()
    private let brand: String
    private let model: String
    private var chargeAvailable: Double
    private let batteryCapacity: Double
    private let energyConsumption: Double
    private var totalMileage: Double = 0

    init(_ modelInfo: ElectricVehicleModel) {
        brand = modelInfo.brand.rawValue
        model = modelInfo.model
        batteryCapacity = modelInfo.batteryCapacity
        energyConsumption = modelInfo.energyConsumption
        chargeAvailable = 0
    }

    func id() -> UUID {
        _id
    }

    func name() -> String {
        "\(brand) \(model) \(id())"
    }

    func data() -> String {
        "\(name())\nTotal Mileage: \(mileage()) Km\nCurrent Charge Available: \(currentCharge()) kWh"
    }

    func travel(_ distance: Double) {
        chargeAvailable -= distance * energyConsumption / 100
        totalMileage += distance
    }

    func mileage() -> Double {
        totalMileage
    }

    func currentCharge() -> Double {
        chargeAvailable
    }

    func charge(kWh: Double) {
        chargeAvailable += kWh
        if chargeAvailable > batteryCapacity {
            chargeAvailable = batteryCapacity
        }
    }
}
