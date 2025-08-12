import Testing

@testable import CarsTrip

@Suite("Gasoline car")
struct GasolineCarTests {
    @Test("should be instantiated with zero mileage")
    func shouldBeInstantiatedWithZeroMileage() async throws {
        let car = GasolineCar(AvailableVehicles.Toyota.Corolla)
        let mileage = car.mileage()
        let amountOfFuelAvailable = car.fuelAmount()

        #expect(mileage == 0)
        #expect(amountOfFuelAvailable == 0)
        #expect(car.name().contains("Toyota"))
        #expect(car.name().contains("Corolla"))
        #expect(car.data().contains("Total Mileage: 0.0 Km"))
        #expect(car.data().contains("Fuel Available: 0.0 l"))
    }

    @Test("should be filled with gasoline")
    func shouldBeFilledWithGasoline() async throws {
        let car = GasolineCar(AvailableVehicles.Toyota.Corolla)
        car.refillGasoline(15)
        let amountOfFuelAvailable = car.fuelAmount()
        #expect(amountOfFuelAvailable == 15)
    }

    @Test("should be filled with gasoline not more than tank capacity")
    func shouldBeFilledWithGasolineNotMoreThanTankCapacity() async throws {
        let car = GasolineCar(AvailableVehicles.Toyota.Camry)
        car.refillGasoline(75)
        let amountOfFuelAvailable = car.fuelAmount()
        #expect(amountOfFuelAvailable == 40)
    }

    @Test("should be able to travel using the fuel")
    func shouldBeAbleToTravelUsingTheFuel() async throws {
        let car = GasolineCar(AvailableVehicles.Toyota.Camry)
        car.refillGasoline(15)
        car.travel(100)
        let amountOfFuelAvailable = car.fuelAmount()
        #expect(amountOfFuelAvailable == 8)
        #expect(car.data().contains("Fuel Available: 8.0 l"))
    }

    @Test("should add up mileage after every trip")
    func shouldAddUpMileageAfterEveryTrip() async throws {
        let car = GasolineCar(AvailableVehicles.Toyota.Camry)
        car.refillGasoline(15)
        car.travel(100)
        #expect(car.mileage() == 100)
    }

    @Test("should be able to travel using the fuel")
    func shouldBeAbleToTravelUsingTheFuel_1() async throws {
        let car = GasolineCar(AvailableVehicles.Toyota.Camry)
        car.refillGasoline(14)
        car.travel(50)
        let amountOfFuelAvailable = car.fuelAmount()
        #expect(amountOfFuelAvailable == 10.5)
        #expect(car.data().contains("Fuel Available: 10.5 l"))
    }
}
