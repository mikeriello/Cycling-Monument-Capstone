CREATE TABLE routes (
    id SERIAL PRIMARY KEY,
    route_id TEXT,
    station_code TEXT,
    date DATE,
    departure_time TEXT,
    executor_capacity INTEGER,
    observed_sequence TEXT,
    route_score TEXT
);

CREATE TABLE stops (
    id SERIAL PRIMARY KEY,
    route_id TEXT,
    stop_id TEXT,
    latitude DOUBLE PRECISION,
    longitude DOUBLE PRECISION,
    type TEXT,
    zone_id TEXT,
    transit_time INTEGER
);

CREATE TABLE packages (
    id SERIAL PRIMARY KEY,
    route_id TEXT,
    stop_id TEXT,
    package_id TEXT,
    status TEXT,
    time_window_start TEXT,
    time_window_end TEXT,
    planned_service_time INTEGER,
    dimensions_length INTEGER,
    dimensions_width INTEGER,
    dimensions_height INTEGER
);

select *
from routes

select * 
from stops