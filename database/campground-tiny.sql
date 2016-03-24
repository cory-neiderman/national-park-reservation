DROP TABLE IF EXISTS reservation;
DROP TABLE IF EXISTS site;
DROP TABLE IF EXISTS campground;
DROP TABLE IF EXISTS park;

DROP SEQUENCE reservation_reservation_id_seq;
DROP SEQUENCE site_site_id_seq;
DROP SEQUENCE campground_campground_id_seq;
DROP SEQUENCE park_park_id_seq;

CREATE SEQUENCE park_park_id_seq
  INCREMENT BY 1
  NO MAXVALUE
  NO MINVALUE
  CACHE 1;

CREATE TABLE park (
  park_id integer DEFAULT nextval('park_park_id_seq'::regclass) NOT NULL,
  name varchar(80) NOT NULL,          -- Name of the park
  location varchar(50) NOT NULL,      -- State name(s) where park is located
  establish_date date NOT NULL,       -- Date park was established
  area integer NOT NULL,              -- Area in acres
  visitors integer NOT NULL,          -- Latest recorded number of annual visitors
  description varchar(500) NOT NULL,  --
  CONSTRAINT pk_park_park_id PRIMARY KEY (park_id)
);

CREATE SEQUENCE campground_campground_id_seq
  INCREMENT BY 1
  NO MAXVALUE
  NO MINVALUE
  CACHE 1;

CREATE TABLE campground (
  campground_id integer DEFAULT nextval('campground_campground_id_seq'::regclass) NOT NULL,
  park_id integer NOT NULL,            -- Parent park
  name varchar(80) NOT NULL,           -- Name of the campground
  open_from_mm integer NOT NULL,       -- Campground is open from month: 01=January, 02=February, ... 12=December
  open_to_mm integer NOT NULL,         -- Campground is open to month: 01=January, 02=February, ... 12=December
  daily_fee money NOT NULL,
  CONSTRAINT pk_campground_campground_id PRIMARY KEY (campground_id)
);

CREATE SEQUENCE site_site_id_seq
  INCREMENT BY 1
  NO MAXVALUE
  NO MINVALUE
  CACHE 1;

CREATE TABLE site (
  site_id integer DEFAULT nextval('site_site_id_seq'::regclass) NOT NULL,
  campground_id integer NOT NULL,
  site_number integer NOT NULL,                   -- Site numbers are
  max_occupancy integer NOT NULL DEFAULT 6,       -- Sites are limited to 6 people, however some sites are "doubled" (12 people)
  accessible boolean NOT NULL DEFAULT FALSE,      -- Accessible site, reserved for campers with disabilities
  max_rv_length integer NOT NULL DEFAULT 0,       -- RVs/Trailers not permitted if length is 0
  utilities boolean NOT NULL DEFAULT FALSE,       -- Electricity, running water available.
  CONSTRAINT pk_site_site_number_campground_id PRIMARY KEY (site_id)
);

CREATE SEQUENCE reservation_reservation_id_seq
  INCREMENT BY 1
  NO MAXVALUE
  NO MINVALUE
  CACHE 1;

CREATE TABLE reservation (
  reservation_id integer DEFAULT nextval('reservation_reservation_id_seq'::regclass) NOT NULL,
  site_id integer NOT NULL,
  name varChar(80) NOT NULL,
  from_date date NOT NULL,
  to_date date NOT NULL,
  create_date date NOT NULL DEFAULT now(),
  CONSTRAINT pk_reservation_reservation_id PRIMARY KEY (reservation_id)
);


-- Acadia
INSERT INTO park (name, location, establish_date, area, visitors, description)
VALUES ('Acadia', 'Maine', '1919-02-26', 47389, 2563129, 'Covering most of Mount Desert Island and other coastal islands, Acadia features the tallest mountain on the Atlantic coast of the United States, granite peaks, ocean shoreline, woodlands, and lakes. There are freshwater, estuary, forest, and intertidal habitats.');

-- Arches
INSERT INTO park (name, location, establish_date, area, visitors, description)
VALUES ('Arches',	'Utah', '1929-04-12', 76518,	1284767, 'This site features more than 2,000 natural sandstone arches, including the famous Delicate Arch. In a desert climate, millions of years of erosion have led to these structures, and the arid ground has life-sustaining soil crust and potholes, which serve as natural water-collecting basins. Other geologic formations are stone columns, spires, fins, and towers.');

-- Cuyahoga
INSERT INTO park (name, location, establish_date, area, visitors, description)
VALUES ('Cuyahoga Valley', 'Ohio', '2000-10-11',32860,	2189849, 'This park along the Cuyahoga River has waterfalls, hills, trails, and exhibits on early rural living. The Ohio and Erie Canal Towpath Trail follows the Ohio and Erie Canal, where mules towed canal boats. The park has numerous historic homes, bridges, and structures, and also offers a scenic train ride.');

-- Acadia Campgrounds
INSERT INTO campground (park_id, name, open_from_mm, open_to_mm, daily_fee) VALUES (1, 'Blackwoods', 1, 12, 35.00);
INSERT INTO campground (park_id, name, open_from_mm, open_to_mm, daily_fee) VALUES (1, 'Seawall', 5, 9, 30.00);
INSERT INTO campground (park_id, name, open_from_mm, open_to_mm, daily_fee) VALUES (1, 'Schoodic Woods', 5, 10, 30.00);

-- Arches Campgrounds
INSERT INTO campground (park_id, name, open_from_mm, open_to_mm, daily_fee) VALUES (2, 'Devil''s Garden', 1, 12, 25.00);
INSERT INTO campground (park_id, name, open_from_mm, open_to_mm, daily_fee) VALUES (2, 'Canyon Wren Group Site', 1, 12, 160.00);
INSERT INTO campground (park_id, name, open_from_mm, open_to_mm, daily_fee) VALUES (2, 'Juniper Group Site', 1, 12, 250.00);

-- Cuyahoga Campgrounds
INSERT INTO campground (park_id, name, open_from_mm, open_to_mm, daily_fee) VALUES (3, 'The Unnamed Primitive Campsites', 5, 11, 20.00);

-- Acadia Blackwoods Sites (Tent, Camper)
INSERT INTO site (site_number, campground_id) VALUES (1, 1);
INSERT INTO site (site_number, campground_id) VALUES (2, 1);
INSERT INTO site (site_number, campground_id) VALUES (3, 1);
INSERT INTO site (site_number, campground_id, utilities) VALUES (4, 1, TRUE);
INSERT INTO site (site_number, campground_id, accessible) VALUES (5, 1, TRUE);
INSERT INTO site (site_number, campground_id, accessible, utilities) VALUES (6, 1, TRUE, TRUE);
-- Acadia Blackwoods Sites (RV/Trainler 20ft)
INSERT INTO site (site_number, campground_id, max_rv_length) VALUES (7, 1, 20);
INSERT INTO site (site_number, campground_id, max_rv_length, utilities) VALUES (8, 1, 20, TRUE);
INSERT INTO site (site_number, campground_id, max_rv_length, accessible, utilities) VALUES (9, 1, 20, TRUE, TRUE);
-- Acadia Blackwoods Sites (RV/Trainler 35ft)
INSERT INTO site (site_number, campground_id, max_rv_length) VALUES (10, 1, 35);
INSERT INTO site (site_number, campground_id, max_rv_length, utilities) VALUES (11, 1, 35, TRUE);
INSERT INTO site (site_number, campground_id, max_rv_length, accessible, utilities) VALUES (12, 1, 35, TRUE, TRUE);

-- Acadia Seawall Sites (Tent)
INSERT INTO site (site_number, campground_id) VALUES (1, 2);
INSERT INTO site (site_number, campground_id) VALUES (2, 2);
INSERT INTO site (site_number, campground_id, utilities) VALUES (3, 2, TRUE);
INSERT INTO site (site_number, campground_id, accessible) VALUES (4, 2, TRUE);
INSERT INTO site (site_number, campground_id, accessible) VALUES (5, 2, TRUE);
INSERT INTO site (site_number, campground_id, accessible, utilities) VALUES (6, 2, TRUE, TRUE);
-- Acadia Seawall Sites (RV/Trailer 20ft)
INSERT INTO site (site_number, campground_id, max_rv_length) VALUES (7, 2, 20);
INSERT INTO site (site_number, campground_id, max_rv_length, utilities) VALUES (8, 2, 20, TRUE);
INSERT INTO site (site_number, campground_id, max_rv_length, accessible, utilities) VALUES (9, 2, 20, TRUE, TRUE);
INSERT INTO site (site_number, campground_id, max_rv_length, accessible, utilities) VALUES (10, 2, 20, TRUE, TRUE);
-- Acadia Seawall Sites (RV/Trailer 35ft)
INSERT INTO site (site_number, campground_id, max_rv_length, utilities) VALUES (11, 2, 35, TRUE);
INSERT INTO site (site_number, campground_id, max_rv_length, accessible, utilities) VALUES (12, 2, 35, TRUE, TRUE);

-- Acadia Schoodic Sites (Tent and Camper)
INSERT INTO site (site_number, campground_id) VALUES (1, 3);
INSERT INTO site (site_number, campground_id) VALUES (2, 3);
INSERT INTO site (site_number, campground_id, utilities) VALUES (3, 3, TRUE); -- 31 - 35
INSERT INTO site (site_number, campground_id, accessible, utilities) VALUES (4, 3, TRUE, TRUE);
-- Acadia Schoodic Sites (RV/Trailer 20ft)
INSERT INTO site (site_number, campground_id, max_rv_length) VALUES (5, 3, 20);
INSERT INTO site (site_number, campground_id, max_rv_length, utilities) VALUES (6, 3, 20, TRUE);
INSERT INTO site (site_number, campground_id, max_rv_length, utilities) VALUES (7, 3, 20, TRUE);
INSERT INTO site (site_number, campground_id, max_rv_length, accessible, utilities) VALUES (8, 3, 20, TRUE, TRUE); -- 21 - 22
-- Acadia Schoodic Sites (RV/Trailer 35ft)
INSERT INTO site (site_number, campground_id, max_rv_length) VALUES (9, 3, 35); -- 1 - 10
INSERT INTO site (site_number, campground_id, max_rv_length, utilities) VALUES (10, 3, 35, TRUE);
INSERT INTO site (site_number, campground_id, max_rv_length, accessible) VALUES (11, 3, 35, TRUE);
INSERT INTO site (site_number, campground_id, max_rv_length, accessible, utilities) VALUES (12, 3, 35, TRUE, TRUE);

-- Arches Devil's Garden Sites (Tent)
INSERT INTO site (site_number, campground_id, max_occupancy) VALUES (1, 4, 10);
INSERT INTO site (site_number, campground_id, max_occupancy) VALUES (2, 4, 10);
INSERT INTO site (site_number, campground_id, max_occupancy, utilities) VALUES (3, 4, 10, TRUE);
INSERT INTO site (site_number, campground_id, max_occupancy, utilities) VALUES (4, 4, 10, TRUE);
INSERT INTO site (site_number, campground_id, max_occupancy, accessible, utilities) VALUES (5, 4, 10, TRUE, TRUE);
INSERT INTO site (site_number, campground_id, max_occupancy, accessible, utilities) VALUES (6, 4, 10, TRUE, TRUE);
-- Arches Devil's Garden Sites (RV/Trailer 20ft)
INSERT INTO site (site_number, campground_id, max_occupancy, max_rv_length, utilities) VALUES (7, 4, 7, 20, TRUE);
INSERT INTO site (site_number, campground_id, max_occupancy, max_rv_length, utilities) VALUES (8, 4, 7, 20, TRUE);
 -- Arches Canyon Wren Group Site (Tent)
INSERT INTO site (site_number, campground_id, max_occupancy, accessible) VALUES (1, 5, 35, TRUE);
-- Arches Juniper Group Site (Tent)
INSERT INTO site (site_number, campground_id, max_occupancy, accessible) VALUES (1, 6, 55, TRUE);

-- Cuyahoga Unnamed Primitive Campsites Sites (Tent)
INSERT INTO site (site_number, campground_id) VALUES (1, 7);
INSERT INTO site (site_number, campground_id) VALUES (2, 7);
INSERT INTO site (site_number, campground_id) VALUES (3, 7);
INSERT INTO site (site_number, campground_id) VALUES (4, 7);
INSERT INTO site (site_number, campground_id) VALUES (5, 7);

ALTER TABLE campground ADD FOREIGN KEY (park_id) REFERENCES park(park_id);
ALTER TABLE site ADD FOREIGN KEY (campground_id) REFERENCES campground(campground_id);
ALTER TABLE reservation ADD FOREIGN KEY (site_id) REFERENCES site(site_id);
