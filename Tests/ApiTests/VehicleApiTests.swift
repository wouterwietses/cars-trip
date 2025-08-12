@testable import Api
import Testing
import VaporTesting

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
