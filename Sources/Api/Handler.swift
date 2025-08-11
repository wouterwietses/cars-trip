import Vapor

struct Handler: APIProtocol {
    func addMileage(_: Operations.AddMileage.Input) async throws -> Operations.AddMileage.Output {
        .ok(.init(body: .json(
            .init(
                id: 0,
                brand: "Jaguar",
                model: "X-Type",
                engineType: .gasoline,
                totalMileage: 0
            )
        )))
    }

    func chargeVehicle(_: Operations.ChargeVehicle.Input) async throws -> Operations.ChargeVehicle.Output {
        .ok(.init(body: .json(
            .init(
                value1: .init(
                    id: 0,
                    brand: "Jaguar",
                    model: "X-Type",
                    engineType: .gasoline,
                    totalMileage: 0
                ),
                value2: .init(
                    energyConsumption: 0,
                    batteryCapacity: 0,
                    currentCharge: 0
                )
            )
        )))
    }

    func refuelVehicle(_: Operations.RefuelVehicle.Input) async throws -> Operations.RefuelVehicle.Output {
        .ok(.init(body: .json(
            .init(
                value1: .init(
                    id: 0,
                    brand: "Jaguar",
                    model: "X-Type",
                    engineType: .gasoline,
                    totalMileage: 0
                ),
                value2: .init(
                    fuelConsumption: 0,
                    tankCapacity: 0,
                    currentFuelLevel: 0
                )
            )
        )))
    }

    func deleteVehicle(_: Operations.DeleteVehicle.Input) async throws -> Operations.DeleteVehicle.Output {
        .noContent(.init())
    }

    func getVehicleById(_: Operations.GetVehicleById.Input) async throws -> Operations.GetVehicleById.Output {
        .ok(.init(body: .json(
            .init(
                id: 0,
                brand: "Jaguar",
                model: "X-Type",
                engineType: .gasoline,
                totalMileage: 0
            )
        )))
    }

    func addVehicle(_: Operations.AddVehicle.Input) async throws -> Operations.AddVehicle.Output {
        .created(.init(body: .json(
            .init(
                id: 0,
                brand: "Jaguar",
                model: "X-Type",
                engineType: .gasoline,
                totalMileage: 0
            )
        )))
    }

    func getAllVehicles(_: Operations.GetAllVehicles.Input) async throws -> Operations.GetAllVehicles.Output {
        .ok(.init(body: .json([])))
    }

    func getHealth(_: Operations.GetHealth.Input) async throws -> Operations.GetHealth.Output {
        .ok(.init(body: .json(.init(status: .active))))
    }
}
