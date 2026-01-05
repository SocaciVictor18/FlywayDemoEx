INSERT INTO cars (vin, make, model, year, mileage_km, status) VALUES
('VIN001', 'Toyota', 'Corolla', 2018, 120000, 'AVAILABLE'),
('VIN002', 'VW',     'Golf',    2019,  90000, 'AVAILABLE'),
('VIN003', 'Dacia',  'Duster',  2021,  45000, 'SERVICE')
ON CONFLICT (vin) DO NOTHING;

INSERT INTO rentals (car_id, renter_name, start_date, end_date, km_driven)
SELECT c.id, 'Ana', DATE '2024-06-01', DATE '2024-06-05', 350
FROM cars c
WHERE c.vin = 'VIN002'
AND NOT EXISTS (SELECT 1 FROM rentals r WHERE r.car_id = c.id AND r.start_date = DATE '2024-06-01');
