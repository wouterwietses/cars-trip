@testable import Api
import Testing
import VaporTesting

@Suite("Vehicle api tests")
struct VehicleApiTests {
    private struct Vehicle: Content {
        var id: Int?
        var brand: String
        var model: String
        var engineType: String
        var totalMileage: Int
    }

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

    @Test("should be able to add a vehicle")
    func addVehicle() async throws {
        let addVehicle = Vehicle(
            id: nil,
            brand: "Tesla",
            model: "Model 3",
            engineType: "electric",
            totalMileage: 0
        )

        try await withApp(configure: configure) { app in
            try await app.testing().test(
                .POST,
                "vehicles", beforeRequest: { req in
                    try req.content.encode(addVehicle)
                },
                afterResponse: { res async throws in
                    #expect(res.status == .created)
                    let data: Vehicle = try res.content.decode(Vehicle.self)
                    #expect(data.brand == "Tesla")
                    #expect(data.model == "Model 3")
                    #expect(data.engineType == "electric")
                    #expect(data.totalMileage == 0)
                }
            )
        }
    }
}
