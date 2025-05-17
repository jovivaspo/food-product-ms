-- CreateEnum
CREATE TYPE "TypeMicronutrient" AS ENUM ('Vitamina', 'Mineral', 'Ácido graso', 'Aminoácido', 'Antioxidante', 'Probiótico', 'Fitonutriente');

-- CreateEnum
CREATE TYPE "AllergenType" AS ENUM ('Ninguno', 'Gluten', 'Lactosa', 'Frutos secos', 'Cacahuetes', 'Soja', 'Huevos', 'Pescado', 'Marisco', 'Apio', 'Mostaza', 'Sésamo', 'Sulfitos', 'Altramuces', 'Moluscos');

-- CreateEnum
CREATE TYPE "OriginType" AS ENUM ('Animal', 'Vegetal', 'Sintético', 'Mineral', 'Microbial');

-- CreateEnum
CREATE TYPE "AdditiveType" AS ENUM ('No es aditivo', 'Edulcorante', 'Conservante', 'Colorante', 'Emulsionante', 'Potenciador del sabor', 'Estabilizador', 'Espesante');

-- CreateEnum
CREATE TYPE "RiskLevel" AS ENUM ('Ninguno', 'Bajo', 'Medio', 'Alto');

-- CreateEnum
CREATE TYPE "RiskType" AS ENUM ('Carcinogénico', 'Alergénico', 'Inflamatorio', 'Disruptor endocrino', 'Neurotóxico', 'Mutagénico', 'Hepatotóxico', 'Cardiotóxico', 'Obesogénico', 'Alto índice glucémico', 'Adictivo', 'Contaminantes', 'Antinutrientes');

-- CreateTable
CREATE TABLE "Category" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "description" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Category_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Subcategory" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "description" TEXT,
    "categoryId" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Subcategory_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Brand" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Brand_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "ingredients" (
    "id" SERIAL NOT NULL,
    "name" VARCHAR(100) NOT NULL,
    "scientificName" VARCHAR(100),
    "isBasicFood" BOOLEAN NOT NULL DEFAULT false,
    "description" TEXT,
    "allergenType" "AllergenType" NOT NULL DEFAULT 'Ninguno',
    "origin" "OriginType" NOT NULL,
    "additiveType" "AdditiveType" NOT NULL DEFAULT 'No es aditivo',
    "servingSize" DECIMAL(10,2),
    "servingMeasurement" VARCHAR(20),
    "calories" DECIMAL(10,2) NOT NULL,
    "proteins" DECIMAL(10,2),
    "carbohydrates" DECIMAL(10,2),
    "sugars" DECIMAL(10,2),
    "fats" DECIMAL(10,2),
    "saturatedFats" DECIMAL(10,2),
    "fiber" DECIMAL(10,2),
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "ingredients_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "ingredient_risks" (
    "id" TEXT NOT NULL,
    "ingredientId" INTEGER NOT NULL,
    "riskType" "RiskType" NOT NULL,
    "level" "RiskLevel" NOT NULL DEFAULT 'Ninguno',
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "ingredient_risks_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "micronutrients" (
    "id" TEXT NOT NULL,
    "name" VARCHAR(100) NOT NULL,
    "description" TEXT,
    "type" "TypeMicronutrient" NOT NULL,
    "properties" VARCHAR(100),
    "unit" VARCHAR(20) NOT NULL,
    "dailyRecommendation" DECIMAL(10,2),
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "micronutrients_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "ingredient_micronutrients" (
    "ingredientId" INTEGER NOT NULL,
    "micronutrientId" TEXT NOT NULL,
    "amount" DECIMAL(10,2) NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "ingredient_micronutrients_pkey" PRIMARY KEY ("ingredientId","micronutrientId")
);

-- CreateIndex
CREATE UNIQUE INDEX "ingredient_risks_ingredientId_riskType_key" ON "ingredient_risks"("ingredientId", "riskType");

-- AddForeignKey
ALTER TABLE "Subcategory" ADD CONSTRAINT "Subcategory_categoryId_fkey" FOREIGN KEY ("categoryId") REFERENCES "Category"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ingredient_risks" ADD CONSTRAINT "ingredient_risks_ingredientId_fkey" FOREIGN KEY ("ingredientId") REFERENCES "ingredients"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ingredient_micronutrients" ADD CONSTRAINT "ingredient_micronutrients_ingredientId_fkey" FOREIGN KEY ("ingredientId") REFERENCES "ingredients"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ingredient_micronutrients" ADD CONSTRAINT "ingredient_micronutrients_micronutrientId_fkey" FOREIGN KEY ("micronutrientId") REFERENCES "micronutrients"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
