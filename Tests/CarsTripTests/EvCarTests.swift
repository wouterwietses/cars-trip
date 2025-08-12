import Testing

@testable import CarsTrip

@Suite("Electric Vehicle")
struct ElectricVehicleTests {
    @Test("should be instantiated with zero mileage")
    func shouldBeInstantiatedWithZerMileage() async throws {
        let car = ElectricCar(AvailableVehicles.Tesla.ModelThree)
        let mileage = car.mileage()
        let currentChargeAvailable = car.currentCharge()

        #expect(mileage == 0)
        #expect(currentChargeAvailable == 0)
        #expect(car.name().contains("Tesla"))
        #expect(car.name().contains("Model 3"))
        #expect(car.data().contains("Total Mileage: 0.0 Km"))
        #expect(car.data().contains("Current Charge Available: 0.0 kWh"))
    }

    @Test("should be charged")
    func shouldBeCharged() async throws {
        let car = ElectricCar(AvailableVehicles.Tesla.ModelThree)
        car.charge(kWh: 15)
        let currentCharge = car.currentCharge()
        #expect(currentCharge == 15)
    }

    @Test("should be charged not more than battery capacity")
    func shouldBeFilledWithGasolineNotMoreThanTankCapacity() async throws {
        let car = ElectricCar(AvailableVehicles.Tesla.ModelThree)
        car.charge(kWh: 100)
        let currentCharge = car.currentCharge()
        #expect(currentCharge == 75)
    }

    @Test("should be able to travel using the battery")
    func shouldBeAbleToTravelUsingTheFuel() async throws {
        let car = ElectricCar(AvailableVehicles.Tesla.ModelThree)
        car.charge(kWh: 25)
        car.travel(100)
        let availableCharge = car.currentCharge()
        #expect(availableCharge == 6.5)
        #expect(car.data().contains("Current Charge Available: 6.5 kWh"))
    }

    @Test("should add up mileage after every trip")
    func shouldAddUpMileageAfterEveryTrip() async throws {
        let car = ElectricCar(AvailableVehicles.Tesla.ModelThree)
        car.charge(kWh: 25)
        car.travel(100)
        #expect(car.mileage() == 100)
    }
}
