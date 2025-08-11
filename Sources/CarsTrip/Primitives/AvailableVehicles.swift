enum AvailableVehicles {
    enum Toyota {
        static let Corolla = CarModel(
            brand: .toyota, model: "Corolla", fuelConsumption: 5, tankCapacity: 30
        )
        static let Camry = CarModel(
            brand: .toyota, model: "Camry", fuelConsumption: 7, tankCapacity: 40
        )
    }

    enum Ford {
        static let Mustang = CarModel(
            brand: .ford, model: "Mustang", fuelConsumption: 8, tankCapacity: 50
        )
    }
}
