-- FUNCTION: total km driven for a car by VIN
CREATE OR REPLACE FUNCTION total_km_by_vin(p_vin TEXT)
RETURNS INT
LANGUAGE plpgsql
AS $$
DECLARE
    v_total INT;
BEGIN
    SELECT COALESCE(SUM(r.km_driven), 0)
        INTO v_total
    FROM rentals r
    JOIN cars c ON c.id = r.car_id
    WHERE c.vin = p_vin;

    RETURN v_total;
END;
$$;

-- PROCEDURE: mark cars as SERVICE if mileage exceeds threshold
CREATE OR REPLACE PROCEDURE mark_service_cars(p_threshold_km INT)
LANGUAGE plpgsql
AS $$
BEGIN
    UPDATE cars
    SET status = 'SERVICE'
    WHERE mileage_km >= p_threshold_km
    AND status <> 'SERVICE';
END;
$$;
