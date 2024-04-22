CREATE TABLE Relations (
	relationId SERIAL PRIMARY KEY,
	partner BOOLEAN NOT NULL, 
	dependents BOOLEAN NOT NULL
);

INSERT INTO Relations (partner, dependents)
VALUES (True, True);
INSERT INTO Relations (partner, dependents)
VALUES (False, True);
INSERT INTO Relations (partner, dependents)
VALUES (True, False);

CREATE TABLE Personal (
	personalId SERIAL PRIMARY KEY, 
	gender CHAR(10) NOT NULL, 
	seniorCitizen BOOLEAN NOT NULL
);

INSERT INTO Personal (gender, seniorCitizen) 
VALUES ('Male', True);
INSERT INTO Personal (gender, seniorCitizen) 
VALUES ('Male', False);
INSERT INTO Personal (gender, seniorCitizen) 
VALUES ('Female', True);
INSERT INTO Personal (gender, seniorCitizen) 
VALUES ('Female', False);


CREATE TABLE Phone (
	phoneId SERIAL PRIMARY KEY, 
	phoneService BOOLEAN NOT NULL, 
	multipleLines BOOLEAN NOT NULL
);

INSERT INTO Phone (phoneService, multipleLines)
VALUES(True, True);
INSERT INTO Phone (phoneService, multipleLines)
VALUES(True, False);


CREATE TABLE Internet (
	internetId SERIAL PRIMARY KEY, 
	internetService VARCHAR(15) NOT NULL 
);

INSERT INTO Internet (internetService)
VALUES('DSL');
INSERT INTO Internet (internetService)
VALUES('Fiber Optic');
INSERT INTO Internet (internetService)
VALUES('No');

CREATE TABLE OnlineServices ( 
	oServiceId SERIAL PRIMARY KEY, 
	internetId INT NOT NULL, 
	onlineBackup VARCHAR(20) NOT NULL, 
	onlineSecurity VARCHAR(20) NOT NULL, 
	FOREIGN KEY (internetId) REFERENCES Internet(internetId)
);

INSERT INTO OnlineServices (internetId, onlineBackup, onlineSecurity)
VALUES(1, 'Yes', 'Yes');
INSERT INTO OnlineServices (internetId, onlineBackup, onlineSecurity)
VALUES(1, 'Yes', 'No');
INSERT INTO OnlineServices (internetId, onlineBackup, onlineSecurity)
VALUES(1, 'No', 'Yes');
INSERT INTO OnlineServices (internetId, onlineBackup, onlineSecurity)
VALUES(1, 'No', 'No');
INSERT INTO OnlineServices (internetId, onlineBackup, onlineSecurity)
VALUES(2, 'Yes', 'Yes');
INSERT INTO OnlineServices (internetId, onlineBackup, onlineSecurity)
VALUES(2, 'No', 'Yes');
INSERT INTO OnlineServices (internetId, onlineBackup, onlineSecurity)
VALUES(2, 'Yes', 'No');
INSERT INTO OnlineServices (internetId, onlineBackup, onlineSecurity)
VALUES(2, 'Yes', 'No');
INSERT INTO OnlineServices (internetId, onlineBackup, onlineSecurity)
VALUES(3, 'No internet service', 'No internet service');

CREATE TABLE Streaming (
	streamId SERIAL PRIMARY KEY,
	internetId INT NOT NULL, 
	streamingTv VARCHAR(30) NOT NULL, 
	streamingMovies VARCHAR(30) NOT NULL,
	FOREIGN KEY (internetId) REFERENCES Internet(InternetId)
);

INSERT INTO Streaming (internetId, streamingTv, streamingMovies)
VALUES(1, 'Yes', 'Yes');
INSERT INTO Streaming (internetId, streamingTv, streamingMovies)
VALUES(1, 'Yes', 'No');
INSERT INTO Streaming (internetId, streamingTv, streamingMovies)
VALUES(1, 'No', 'Yes');
INSERT INTO Streaming (internetId, streamingTv, streamingMovies)
VALUES(1, 'No', 'No');
INSERT INTO Streaming (internetId, streamingTv, streamingMovies)
VALUES(2, 'Yes', 'Yes');
INSERT INTO Streaming (internetId, streamingTv, streamingMovies)
VALUES(2, 'Yes', 'No');
INSERT INTO Streaming (internetId, streamingTv, streamingMovies)
VALUES(2, 'No', 'Yes');
INSERT INTO Streaming (internetId, streamingTv, streamingMovies)
VALUES(2, 'No', 'No');
INSERT INTO Streaming (internetId, streamingTv, streamingMovies)
VALUES(3, 'No internet service', 'No internet service');

CREATE TABLE Payment ( 
	paymentId SERIAL PRIMARY KEY, 
	paymentMethod VARCHAR(40) NOT NULL
);

INSERT INTO Payment(paymentMethod)
VALUES('Electronic Check');
INSERT INTO Payment(paymentMethod)
VALUES('Mailed Check');
INSERT INTO Payment(paymentMethod)
VALUES('Bank Transfer (automatic)');
INSERT INTO Payment(paymentMethod)
VALUES('Credit Card (automatic)');

CREATE TABLE Contract ( 
	contractId SERIAL PRIMARY KEY, 
	contract VARCHAR(40) NOT NULL, 
	paperless BOOLEAN NOT NULL 
);

INSERT INTO Contract(contract, paperless)
VALUES ('Month-to-Month', True);
INSERT INTO Contract(contract, paperless)
VALUES ('Month-to-Month', False);
INSERT INTO Contract(contract, paperless)
VALUES ('One year', True);
INSERT INTO Contract(contract, paperless)
VALUES ('One year', False);
INSERT INTO Contract(contract, paperless)
VALUES ('Two year', True);
INSERT INTO Contract(contract, paperless)
VALUES ('Two year', False);



CREATE TABLE TechSupport ( 
	tSupportId SERIAL PRIMARY KEY, 
	internetId INT NOT NULL, 
	techSupport VARCHAR(40) NOT NULL, 
	deviceProtection VARCHAR(40) NOT NULL, 
	FOREIGN KEY (internetId) REFERENCES Internet(internetId)
);

INSERT INTO TechSupport (internetId, techSupport, deviceProtection)
VALUES(1, 'Yes', 'Yes');
INSERT INTO TechSupport (internetId, techSupport, deviceProtection)
VALUES(1, 'Yes', 'No');
INSERT INTO TechSupport (internetId, techSupport, deviceProtection)
VALUES(1, 'No', 'Yes');
INSERT INTO TechSupport (internetId, techSupport, deviceProtection)
VALUES(1, 'No', 'No');
INSERT INTO TechSupport (internetId, techSupport, deviceProtection)
VALUES(2, 'Yes', 'Yes');
INSERT INTO TechSupport (internetId, techSupport, deviceProtection)
VALUES(2, 'Yes', 'No');
INSERT INTO TechSupport (internetId, techSupport, deviceProtection)
VALUES(2, 'No', 'Yes');
INSERT INTO TechSupport (internetId, techSupport, deviceProtection)
VALUES(2, 'No', 'No');
INSERT INTO TechSupport (internetId, techSupport, deviceProtection)
VALUES(3, 'No internet service', 'No internet service');

CREATE TABLE Customer ( 
	customerId VARCHAR(10) NOT NULL, 
	relationId INT, 
	personalId INT NOT NULL, 
	phoneId INT, 
	streamId INT NOT NULL, 
	paymentId INT NOT NULL, 
	oServiceId INT NOT NULL, 
	contractId INT NOT NULL, 
	internetId INT NOT NULL, 
	tSupportId INT NOT NULL, 
	PRIMARY KEY(customerId),
	FOREIGN KEY(relationId) REFERENCES Relations(relationId),
	FOREIGN KEY(personalId) REFERENCES Personal(personalId),
	FOREIGN KEY(phoneId) REFERENCES Phone(phoneId),
	FOREIGN KEY(streamId) REFERENCES Streaming(streamId),
	FOREIGN KEY(paymentId) REFERENCES Payment(paymentId),
	FOREIGN KEY(oServiceId) REFERENCES OnlineServices(oServiceId),
	FOREIGN KEY(contractId) REFERENCES Contract(contractId),
	FOREIGN KEY(internetId) REFERENCES Internet(internetId),
	FOREIGN KEY(tSupportId) REFERENCES TechSupport(tSupportId)
);

INSERT INTO Customer(customerId, relationId, personalId, streamId, paymentId, oServiceId, contractId, internetId, tSupportId)
VALUES ("7590-VHVEG", 3, 4, 4, 1, 3, 1, 1, 4)

CREATE TABLE Work (
	customerId  VARCHAR(10) NOT NULL, 
	tenure INT NOT NULL, 
	churn BOOLEAN NOT NULL,
	PRIMARY KEY (customerId),
	FOREIGN KEY (customerId) REFERENCES Customer(customerId)
);

INSERT INTO Work (customerId, tenure, churn)
VALUES('7590-VHVEG', 1, FALSE);


CREATE TABLE Charges ( 
	customerId VARCHAR(10) NOT NULL,
	monthlyCharges Numeric(10,2) NOT NULL, 
	totalCharges Numeric(20,2) NOT NULL, 
	PRIMARY KEY (customerId), 
	FOREIGN KEY (customerId) REFERENCES Customer(customerId)
); 


INSERT INTO Charges (customerId, monthlyCharges, totalCharges)
VALUES('7590-VHVEG', 29.85, 29.85);