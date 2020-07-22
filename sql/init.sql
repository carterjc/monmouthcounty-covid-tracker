DROP DATABASE IF EXISTS mc_covid;

CREATE DATABASE mc_covid;

USE mc_covid;

DROP TABLE IF EXISTS covid_data;
DROP TABLE IF EXISTS towns;

CREATE TABLE towns
(
	town_id			INT				PRIMARY KEY AUTO_INCREMENT,
	mun				VARCHAR(25)		NOT NULL,
    map_index		INT				NOT NULL,
    mun_type		VARCHAR(25)		NOT NULL,
    pop				INT				NOT NULL,
    housing_units	INT				NOT NULL,
    total_area		DECIMAL(5,2)	NOT NULL,
    water_area		DECIMAL(5,2)	NOT NULL,
    land_area		DECIMAL(5,2)	NOT NULL,
    pop_density		DECIMAL(9,2)	NOT NULL,
    housing_density	DECIMAL(9,2)	NOT NULL
);

CREATE TABLE covid_data
(
	case_id			INT				PRIMARY KEY AUTO_INCREMENT,
	town_id			INT				NOT NULL,
    cases			INT				NOT NULL,
    day_date		DATE			NOT NULL,
    date_added		DATETIME		NOT NULL,
    CONSTRAINT towns_town_id
		FOREIGN KEY (town_id)
        REFERENCES towns (town_id)
);

INSERT INTO towns VALUES
	(DEFAULT, 'Aberdeen', 50, 'township', 18636, 7102, 7.77, 2.33, 5.45, 3343.0, 1303.8),
	(DEFAULT, 'Allenhurst', 14, 'borough', 496, 365, 0.28, 0.02, 0.26, 1887.9, 1389.3),
	(DEFAULT, 'Allentown', 38, 'borough', 1828, 735, 0.63, 0.03, 0.6, 3023.9, 1215.8),
	(DEFAULT, 'Asbury Park', 11, 'city', 15511, 8076, 1.6, 0.18, 1.42, 11319.5, 5672.4),
	(DEFAULT, 'Atlantic Highlands', 29, 'borough', 4385, 2002, 4.56, 3.27, 1.29, 3401.2, 1552.9),
	(DEFAULT, 'Avon-by-the-Sea', 8, 'borough', 1901, 1321, 0.54, 0.12, 0.43, 4459.1, 3098.6),
	(DEFAULT, 'Belmar', 7, 'borough', 5587, 3931, 1.65, 0.6, 1.05, 5544.0, 3761.4),
	(DEFAULT, 'Bradley Beach', 10, 'borough', 4298, 3180, 0.63, 0.02, 0.61, 7023.6, 5196.6),
	(DEFAULT, 'Brielle', 1, 'borough', 4774, 2034, 2.37, 0.62, 1.76, 2717.5, 1157.8),
	(DEFAULT, 'Colts Neck', 47, 'township', 9879, 3735, 31.79, 1.06, 30.73, 330.0, 121.5),
	(DEFAULT, 'Deal', 15, 'borough', 750, 926, 1.32, 0.08, 1.24, 604.8, 746.7),
	(DEFAULT, 'Eatontown', 24, 'borough', 12242, 5723, 5.88, 0.05, 5.83, 2181.5, 982.3),
	(DEFAULT, 'Englishtown', 36, 'borough', 1847, 647, 0.59, 0.02, 0.57, 3245.7, 1137.0),
	(DEFAULT, 'Fair Haven', 20, 'borough', 5820, 2065, 2.11, 0.51, 1.6, 3832.5, 1292.9),
	(DEFAULT, 'Farmingdale', 34, 'borough', 1329, 578, 0.52, 0.0, 0.52, 2547.7, 1108.0),
	(DEFAULT, 'Freehold Borough', 35, 'borough', 11767, 4249, 1.95, 0.0, 1.95, 6180.8, 2179.1),
	(DEFAULT, 'Freehold Township', 42, 'township', 34735, 13140, 38.73, 0.22, 38.5, 939.8, 341.3),
	(DEFAULT, 'Hazlet', 53, 'township', 19802, 7417, 5.67, 0.12, 5.56, 3659.4, 1334.8),
	(DEFAULT, 'Highlands', 28, 'borough', 5005, 3146, 1.37, 0.6, 0.77, 6522.8, 4100.1),
	(DEFAULT, 'Holmdel', 51, 'township', 16662, 5792, 18.11, 0.22, 17.9, 937.3, 323.7),
	(DEFAULT, 'Howell', 43, 'township', 52114, 17979, 61.21, 0.65, 60.56, 843.4, 296.9),
	(DEFAULT, 'Interlaken', 13, 'borough', 820, 393, 0.38, 0.05, 0.33, 2482.3, 1189.7),
	(DEFAULT, 'Keansburg', 30, 'borough', 10105, 4318, 16.79, 15.72, 1.07, 9452.3, 4039.1),
	(DEFAULT, 'Keyport', 32, 'borough', 9719, 3272, 1.47, 0.07, 1.4, 5188.4, 2344.8),
	(DEFAULT, 'Lake Como', 6, 'borough', 1759, 1115, 0.27, 0.01, 0.25, 6943.6, 4401.4),
	(DEFAULT, 'Little Silver', 21, 'borough', 5813, 2278, 3.32, 0.61, 2.71, 2197.3, 841.3),
	(DEFAULT, 'Loch Arbour', 12, 'village', 194, 159, 0.14, 0.04, 0.1, 1928.2, 1580.4),
	(DEFAULT, 'Long Branch', 16, 'city', 30406, 14170, 6.28, 1.01, 5.27, 5824.4, 2686.7),
	(DEFAULT, 'Manalapan', 41, 'township', 39596, 13735, 30.84, 0.23, 30.61, 1270.0, 448.8),
	(DEFAULT, 'Manasquan', 2, 'borough', 5846, 3500, 2.53, 1.15, 1.38, 4263.0, 2530.2),
	(DEFAULT, 'Marlboro', 49, 'township', 39874, 13436, 30.47, 0.11, 30.36, 1323.7, 442.5),
	(DEFAULT, 'Matawan', 33, 'borough', 8736, 3606, 2.4, 0.14, 2.26, 3896.6, 1594.9),
	(DEFAULT, 'Middletown', 52, 'township', 65490, 24959, 58.73, 17.75, 40.99, 1622.9, 608.9),
	(DEFAULT, 'Millstone Township', 40, 'township', 10453, 3434, 37.27, 0.68, 36.59, 288.8, 93.9),
	(DEFAULT, 'Monmouth Beach', 17, 'borough', 3279, 1981, 2.07, 0.99, 1.08, 3049.5, 1842.4),
	(DEFAULT, 'Neptune City', 9, 'borough', 4869, 2312, 0.95, 0.0, 0.95, 5105.0, 2424.0),
	(DEFAULT, 'Neptune Township', 45, 'township', 27595, 12991, 8.67, 0.49, 8.18, 3414.3, 1587.8),
	(DEFAULT, 'Ocean', 46, 'township', 26708, 11541, 11.0, 0.12, 10.88, 2509.1, 1061.1),
	(DEFAULT, 'Oceanport', 22, 'borough', 5751, 2390, 3.8, 0.62, 3.18, 1833.7, 751.5),
	(DEFAULT, 'Red Bank', 26, 'borough', 12048, 5381, 2.16, 0.42, 1.74, 7019.1, 3094.4),
	(DEFAULT, 'Roosevelt', 37, 'borough', 882, 327, 1.92, 0.01, 1.91, 461.8, 171.2),
	(DEFAULT, 'Rumson', 19, 'borough', 6776, 2585, 7.12, 2.06, 5.06, 1408.0, 511.0),
	(DEFAULT, 'Sea Bright', 18, 'borough', 1412, 1211, 1.29, 0.56, 0.73, 1935.5, 1659.9),
	(DEFAULT, 'Sea Girt', 3, 'borough', 1828, 1291, 1.45, 0.39, 1.06, 1729.6, 1221.5),
	(DEFAULT, 'Shrewsbury Borough', 25, 'borough', 3809, 1310, 2.2, 0.03, 2.17, 1757.2, 604.4),
	(DEFAULT, 'Shrewsbury Township', 48, 'township', 1141, 648, 0.1, 0.0, 0.1, 10877.7, 6177.7),
	(DEFAULT, 'Spring Lake', 5, 'borough', 2993, 2048, 1.73, 0.4, 1.33, 2250.8, 1540.2),
	(DEFAULT, 'Spring Lake Heights', 4, 'borough', 4713, 2972, 1.31, 0.03, 1.28, 3671.3, 2315.1),
	(DEFAULT, 'Tinton Falls', 27, 'borough', 17563, 8766, 15.62, 0.14, 15.49, 1155.3, 566.0),
	(DEFAULT, 'Union Beach', 31, 'borough', 5485, 2269, 1.89, 0.09, 1.8, 3461.5, 1257.7),
	(DEFAULT, 'Upper Freehold', 39, 'township', 7019, 2458, 47.23, 0.82, 46.42, 148.7, 53.0),
	(DEFAULT, 'Wall', 44, 'township', 25705, 10883, 31.74, 1.06, 30.67, 853.0, 354.8),
	(DEFAULT, 'West Long Branch', 23, 'borough', 7909, 2528, 2.89, 0.04, 2.86, 2832.9, 884.5),
    (DEFAULT, 'Unknown', 0, 'N/A', 0, 0, 0, 0, 0, 0, 0);
