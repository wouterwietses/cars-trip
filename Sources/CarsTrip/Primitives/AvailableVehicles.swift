enum AvailableVehicles {
    enum Toyota {
        static let Corolla = CarModel(
            brand: .toyota,
            model: "Corolla",
            engineType: .gasoline,
            fuelConsumption: 5,
            tankCapacity: 30,
            batteryCapacity: 0
        )
        static let Camry = CarModel(
            brand: .toyota,
            model: "Camry",
            engineType: .gasoline,
            fuelConsumption: 7,
            tankCapacity: 40,
            batteryCapacity: 0
        )
    }

    enum Ford {
        static let Mustang = CarModel(
            brand: .ford,
            model: "Mustang",
            engineType: .gasoline,
            fuelConsumption: 8,
            tankCapacity: 50,
            batteryCapacity: 0
        )
    }

    enum Tesla {
        static let ModelThree = CarModel(
            brand: .tesla,
            model: "Model 3",
            engineType: .electric,
            fuelConsumption: 10,
            tankCapacity: 100,
            batteryCapacity: 80
        )
    }
}
