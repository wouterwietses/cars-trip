struct CarModel {
    let brand: Brand
    let model: String
    let engineType: EngineType
    let fuelConsumption: Double
    let tankCapacity: Double
}

enum EngineType {
    case gasoline
    case electric
}
