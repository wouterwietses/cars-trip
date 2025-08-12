import Testing

@testable import CarsTrip

@Suite("Electric Vehicle")
struct ElectricVehicleTests {
    @Test("should be instantiated with zero mileage")
    func shouldBeInstantiatedWithZerMileage() async throws {
        let car = Car(AvailableVehicles.Tesla.ModelThree)
        let mileage = car.mileage()
        let amountOfFuelAvailable = car.currentCharge()

        #expect(mileage == 0)
        #expect(amountOfFuelAvailable == 0)
        #expect(car.name().contains("Tesla"))
        #expect(car.name().contains("Model 3"))
        #expect(car.data().contains("Total Mileage: 0.0 Km"))
        #expect(car.data().contains("Current Charge Available: 0.0 kWh"))
    }

    @Test("should be charged")
    func shouldBeCharged() async throws {
        let car = Car(AvailableVehicles.Tesla.ModelThree)
        car.charge(kWh: 15)
        let currentCharge = car.currentCharge()
        #expect(currentCharge == 15)
    }

    @Test("should be charged not more than battery capacity")
    func shouldBeFilledWithGasolineNotMoreThanTankCapacity() async throws {
        let car = Car(AvailableVehicles.Tesla.ModelThree)
        car.charge(kWh: 100)
        let currentCharge = car.currentCharge()
        #expect(currentCharge == 80)
    }
}
