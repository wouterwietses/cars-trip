# Cars Trip Kata

[![codecov](https://codecov.io/gh/wouterwietses/cars-trip/graph/badge.svg)](https://codecov.io/gh/wouterwietses/cars-trip)

## Gasoline and Electric Cars Kata

### Current Situation

You're working with a car simulation system that currently only supports gasoline-powered vehicles.
The `Car` class and the `ICarEntity` interface model these vehicles with properties like fuel consumption (l/100km), tank capacity,
and the behaviours for refueling and traveling.

## Challenge: Electric Vehicles Implementation

### Current Limitations

Our system currently only supports gasoline-powered vehicles with:

- Fuel consumption (l/100km)
- Tank capacity
- Gasoline refueling
- Mileage tracking

### Your Task

Extend the system to support **Electric Vehicles (EVs)** while maintaining all existing functionality.

#### Requirements

1. **New EV Properties**:
   - `batteryCapacity`: Maximum energy storage (kWh)
   - `energyConsumption`: Energy usage rate (kWh/100km)
   - `currentCharge`: Currently available energy (kWh) => always start from 0

2. **New Methods**:
   - `charge(kWh: number): void` - Add energy to battery
   - `currentCharge(): number` - Show current charge level of the battery

3. **Modified Behavior**:
   - `travel()` should use electric energy calculations
   - `data()` should show charge level instead of fuel

#### TIPS

- Maintain backward compatibility with existing gasoline cars (but you can rename the class name as far as the behaviour is preserved!)
- Strictly Test-Driven: one behaviour at a time, proven by a failing test getting green.
- Consider applying the Mikado Technique if you want to refactor the existing code before writing the new one
- Avoid duplicating code for common car functionality (you may need some abstractions!)
- You may want to split and change the ICarEntity interface as you see fit, in order to segregate the behaviour correctly
- Don't introduce code smells like *refused bequest*, *feature envy*, *inappropriate intimacy*, *shotgun surgery*, *divergent change*, *code repetition*
