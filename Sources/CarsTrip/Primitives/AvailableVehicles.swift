enum AvailableVehicles {
    enum Toyota {
        static let Corolla = GasolineVehicleModel(
            brand: .toyota,
            model: "Corolla",
            engineType: .gasoline,
            fuelConsumption: 5,
            tankCapacity: 30
        )
        static let Camry = GasolineVehicleModel(
            brand: .toyota,
            model: "Camry",
            engineType: .gasoline,
            fuelConsumption: 7,
            tankCapacity: 40
        )
    }

    enum Ford {
        static let Mustang = GasolineVehicleModel(
            brand: .ford,
            model: "Mustang",
            engineType: .gasoline,
            fuelConsumption: 8,
            tankCapacity: 50
        )
    }

    enum Tesla {
        static let ModelThree = ElectricVehicleModel(
            brand: .tesla,
            model: "Model 3",
            engineType: .electric,
            batteryCapacity: 75,
            energyConsumption: 18.5
        )
    }
}
