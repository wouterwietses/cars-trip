import Foundation

protocol ICarEntity {
    func id() -> UUID
    func name() -> String
    func data() -> String
    func refillGasoline(_ liters: Double)
    func travel(_ distance: Double)
    func mileage() -> Double
}
