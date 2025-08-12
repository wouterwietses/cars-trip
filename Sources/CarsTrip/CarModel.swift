protocol CarModel {
    var brand: Brand { get }
    var model: String { get }
    var engineType: EngineType { get }
}

struct GasolineVehicleModel: CarModel {
    let brand: Brand
    let model: String
    let engineType: EngineType
    let fuelConsumption: Double
    let tankCapacity: Double
}

struct ElectricVehicleModel: CarModel {
    let brand: Brand
    let model: String
    let engineType: EngineType
    let batteryCapacity: Double
    let energyConsumption: Double
}
