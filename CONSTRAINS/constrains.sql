CREATE DATABASE "customers"
GRANT ALL PRIVILEGES ON DATABASE "customers" TO postgres

CREATE TABLE "states" (
    "id" SERIAL PRIMARY KEY,
    "name" TEXT UNIQUE NOT NULL
)

CREATE TABLE "cities" (
    "id" SERIAL PRIMARY KEY,
    "name" TEXT NOT NULL,
    "stateId" INTEGER NOT NULL REFERENCES "states"("id")
)

CREATE TABLE "customers" (
    "id" SERIAL PRIMARY KEY,
    "fullName" TEXT NOT NULL,
    "cpf" VARCHAR(11) UNIQUE NOT NULL,
    "email" TEXT UNIQUE NOT NULL,
    "password" TEXT NOT NULL
)

CREATE TABLE "customerPhones" (
    "id" SERIAL PRIMARY KEY,
    "customerId" INTEGER NOT NULL REFERENCES "customers"("id"),
    "number" VARCHAR(11) UNIQUE NOT NULL,
    "type" TEXT NOT NULL DEFAULT "cellphone"
)

CREATE TABLE "customerAddresses" (
    "id" SERIAL PRIMARY KEY,
    "customerId" INTEGER NOT NULL REFERENCES "customers"("id"),
    "street" TEXT NOT NULL,
    "number" TEXT NOT NULL,
    "complement" TEXT,
    "postalCode" VARCHAR(8) NOT NULL,
    "cityId" INTEGER NOT NULL REFERENCES "cities"("id"),
)

CREATE TABLE "bankAccount" (
    "id" SERIAL PRIMARY KEY,
    "customerId" INTEGER NOT NULL REFERENCES "customers"("id"),
    "accountNumber" INTEGER UNIQUE NOT NULL,
    "agency" INTEGER NOT NULL,
    "openDate" TIMESTAMP WITHOUT TIMEZONE DEFAULT NOW(),
    "closeDate" TIMESTAMP WITHOUT TIMEZONE DEFAULT NULL
)

CREATE TABLE "transactions" (
    "id" SERIAL PRIMARY KEY,
    "bankAccountId" INTEGER NOT NULL REFERENCES "bankAccount"("id"),
    "amount" BIGINT NOT NULL,
    "type" TEXT NOT NULL,
    "time" TIMESTAMP WITHOUT TIMEZONE DEFAULT NOW(),
    "description" TEXT NOT NULL,
    "cancelled" BOOLEAN NOT NULL DEFAULT FALSE
)

CREATE TABLE "customers" (
    "id" SERIAL PRIMARY KEY,
    "bankAccountId" INTEGER NOT NULL REFERENCES "bankAccount"("id"),
    "name" TEXT NOT NULL,
    "number" TEXT UNIQUE NOT NULL,
    "securityCode" TEXT NOT NULL,
    "expirationMonth" INTEGER NOT NULL,
    "expirationYear" INTEGER NOT NULL,
    "password" TEXT NOT NULL,
    "limit" BIGINT NOT NULL DEFAULT 0,
)