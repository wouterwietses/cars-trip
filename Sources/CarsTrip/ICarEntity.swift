import Foundation

protocol ICarEntity {
    func id() -> UUID
    func name() -> String
    func data() -> String
    func travel(_ distance: Double)
    func mileage() -> Double
}

protocol IGasolinePowered {
    func fuelAmount() -> Double
    func refillGasoline(_ liters: Double)
}

protocol IElectricPowered {
    func currentCharge() -> Double
    func charge(kWh: Double)
}
