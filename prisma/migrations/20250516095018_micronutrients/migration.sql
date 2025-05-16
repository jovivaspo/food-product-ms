-- CreateEnum
CREATE TYPE "TypeMicronutrient" AS ENUM ('Vitamina', 'Mineral', 'Ácido graso', 'Aminoácido', 'Antioxidante', 'Probiótico', 'Fitonutriente');

-- CreateEnum
CREATE TYPE "SolubilityType" AS ENUM ('Soluble en grasa', 'Soluble en agua', 'Inorgánico / Iónico', 'Requiere conversión metabólica', 'Anfipático (hidrofílico y lipofílico)', 'Requiere transportador/cofactor', 'No aplica');

-- CreateEnum
CREATE TYPE "FunctionType" AS ENUM ('Salud visual', 'Soporte inmunológico', 'Metabolismo energético', 'Salud ósea', 'Salud sanguínea', 'Antioxidante', 'Síntesis de neurotransmisores', 'Crecimiento y reparación celular', 'Transporte de oxígeno', 'Cofactor enzimático', 'Balance de electrolitos', 'Regulación hormonal', 'Regulación de la glucosa', 'Antiinflamatorio', 'Cardioprotector', 'Neuroprotector', 'Ácido graso esencial', 'Formación de colágeno', 'Crecimiento muscular', 'Integridad de la barrera intestinal', 'Absorción de nutrientes', 'Precursor hormonal', 'Salud de la piel', 'Anticancerígeno', 'Modulador inmunológico', 'Función estructural', 'Desintoxicación', 'Modulación de microbioma intestinal', 'Síntesis de ADN', 'Filtración de luz');

-- CreateEnum
CREATE TYPE "EssentialityType" AS ENUM ('Esencial', 'Condicionalmente esencial', 'No esencial', 'Beneficioso pero no esencial', 'Esencialidad no determinada');

-- CreateEnum
CREATE TYPE "SourceType" AS ENUM ('Exógeno (solo fuentes externas)', 'Endógeno (sintetizado internamente)', 'Síntesis parcial (precursor requerido)', 'Sintetizado por microbiota intestinal', 'Fuente dual (sintetizado y dietético)', 'Síntesis condicional (limitada por factores)', 'Dependiente de reservas corporales', 'Sintético (suplementos)');

-- CreateEnum
CREATE TYPE "BioactiveType" AS ENUM ('Retinoide', 'Carotenoide', 'Tocoferol', 'Tocotrienol', 'Naftoquinona', 'Secosteroide', 'Flavina', 'Nicotinamida', 'Piridoxina', 'Cobalamina', 'Ascorbato', 'Tiamina', 'Folato', 'Pantotenato', 'Biotina', 'Colina', 'Mineral esencial', 'Oligoelemento', 'Bioflavonoide', 'Polifenol', 'Organoazufrado', 'Xantofila', 'Quinona', 'Betaína', 'Fosfolípido', 'Derivado de aminoácido', 'Terpenoide', 'Alcaloide', 'Glucosinolato', 'Fitoesterol', 'Cepa probiótica', 'Prebiótico');

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
CREATE TABLE "Micronutrient" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "description" TEXT,
    "type" "TypeMicronutrient" NOT NULL,
    "unit" TEXT NOT NULL,
    "dailyRecommendation" TEXT,
    "tolerableLimit" TEXT,
    "solubility" "SolubilityType" NOT NULL,
    "function" "FunctionType"[],
    "essentiality" "EssentialityType" NOT NULL,
    "source" "SourceType" NOT NULL,
    "bioactiveType" "BioactiveType" NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Micronutrient_pkey" PRIMARY KEY ("id")
);

-- AddForeignKey
ALTER TABLE "Subcategory" ADD CONSTRAINT "Subcategory_categoryId_fkey" FOREIGN KEY ("categoryId") REFERENCES "Category"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
