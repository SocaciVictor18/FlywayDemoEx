CREATE TABLE IF NOT EXISTS cars(
    id SERIAL PRIMARY KEY,
    vin TEXT UNIQUE NOT NULL,
    make TEXT NOT NULL,
    model TEXT NOT NULL,
    year INT NOT NULL,
    mileage_km INT NOT NULL DEFAULT 0,
    status TEXT NOT NULL DEFAULT 'AVAILABLE'
);

CREATE TABLE IF NOT EXISTS rentals(
    id SERIAL PRIMARY KEY,
    car_id INT NOT NULL REFERENCES cars(id),
    renter_name TEXT NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE,
    km_driven INT NOT NULL DEFAULT 0
)