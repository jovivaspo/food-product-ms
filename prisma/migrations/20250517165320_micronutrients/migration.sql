/*
  Warnings:

  - You are about to drop the column `properties` on the `micronutrients` table. All the data in the column will be lost.
  - Added the required column `bioactiveType` to the `micronutrients` table without a default value. This is not possible if the table is not empty.
  - Added the required column `essentiality` to the `micronutrients` table without a default value. This is not possible if the table is not empty.
  - Added the required column `solubility` to the `micronutrients` table without a default value. This is not possible if the table is not empty.
  - Added the required column `source` to the `micronutrients` table without a default value. This is not possible if the table is not empty.

*/
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

-- AlterTable
ALTER TABLE "micronutrients" DROP COLUMN "properties",
ADD COLUMN     "bioactiveType" "BioactiveType" NOT NULL,
ADD COLUMN     "essentiality" "EssentialityType" NOT NULL,
ADD COLUMN     "function" "FunctionType"[],
ADD COLUMN     "solubility" "SolubilityType" NOT NULL,
ADD COLUMN     "source" "SourceType" NOT NULL,
ADD COLUMN     "tolerableLimit" TEXT,
ALTER COLUMN "dailyRecommendation" SET DATA TYPE TEXT;
