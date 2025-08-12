@testable import Api
import Testing
import VaporTesting

@Suite("App Tests")
struct CarsTripApiTests {
    @Test("Test health check Route")
    func healthCheck() async throws {
        try await withApp(configure: configure) { app in
            try await app.testing().test(.GET, "health", afterResponse: { res async throws in
                #expect(res.status == .ok)
                let status: String = try res.content.get(at: "status")
                #expect(status == "ACTIVE")
            })
        }
    }
}

@Suite("Vehicle api tests")
struct VehicleApiTests {
    @Test("should be able to get all vehicles")
    func getAllVehicles() async throws {
        try await withApp(configure: configure) { app in
            try await app.testing().test(.GET, "vehicles", afterResponse: { res async throws in
                #expect(res.status == .ok)
                let data: Operations.GetAllVehicles.Output.Ok.Body.JsonPayload = try res.content.decode(Operations.GetAllVehicles.Output.Ok.Body.JsonPayload.self)
                #expect(data.count == 0)
            })
        }
    }
}

/**
 [
 {
 id: 1,
 brand: "Toyota",
 model: "Camry",
 engineType: "gasoline",
 totalMileage: 15000.5,
 fuelConsumption: 7.5,
 tankCapacity: 60,
 currentFuelLevel: 45
 },
 {
 id: 2,
 brand: "Tesla",
 model: "Model 3",
 engineType: "electric",
 totalMileage: 8500,
 energyConsumption: 18.5,
 batteryCapacity: 75,
 currentCharge: 0
 }
 ]
 */
