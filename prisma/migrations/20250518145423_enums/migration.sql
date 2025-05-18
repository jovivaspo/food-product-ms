/*
  Warnings:

  - The values [No es aditivo,Edulcorante,Conservante,Colorante,Emulsionante,Potenciador del sabor,Estabilizador,Espesante,Acidulantes,Agentes de carga,Agentes de recubrimiento,Antiaglomerantes,Antiespumantes,Antioxidantes,Clarificantes,Coagulantes,Fijadores de color,Gases,Gasificantes,Gelificantes,Humectantes,Reguladores de acidez,Saborizantes,Sales de fundido,Secuestrantes,Tratamiento de harinas,Varios] on the enum `AdditiveType` will be removed. If these variants are still used in the database, this will fail.
  - The values [Ninguno,Gluten,Lactosa,Frutos secos,Cacahuetes,Soja,Huevos,Pescado,Marisco,Apio,Mostaza,Sésamo,Sulfitos,Altramuces,Moluscos] on the enum `AllergenType` will be removed. If these variants are still used in the database, this will fail.
  - The values [Retinoide,Carotenoide,Tocoferol,Tocotrienol,Naftoquinona,Secosteroide,Flavina,Nicotinamida,Piridoxina,Cobalamina,Ascorbato,Tiamina,Folato,Pantotenato,Biotina,Colina,Mineral esencial,Oligoelemento,Bioflavonoide,Polifenol,Organoazufrado,Xantofila,Quinona,Betaína,Fosfolípido,Derivado de aminoácido,Terpenoide,Alcaloide,Glucosinolato,Fitoesterol,Cepa probiótica,Prebiótico] on the enum `BioactiveType` will be removed. If these variants are still used in the database, this will fail.
  - The values [Esencial,Condicionalmente esencial,No esencial,Beneficioso pero no esencial,Esencialidad no determinada] on the enum `EssentialityType` will be removed. If these variants are still used in the database, this will fail.
  - The values [Salud visual,Soporte inmunológico,Metabolismo energético,Salud ósea,Salud sanguínea,Antioxidante,Síntesis de neurotransmisores,Crecimiento y reparación celular,Transporte de oxígeno,Cofactor enzimático,Balance de electrolitos,Regulación hormonal,Regulación de la glucosa,Antiinflamatorio,Cardioprotector,Neuroprotector,Ácido graso esencial,Formación de colágeno,Crecimiento muscular,Integridad de la barrera intestinal,Absorción de nutrientes,Precursor hormonal,Salud de la piel,Anticancerígeno,Modulador inmunológico,Función estructural,Desintoxicación,Modulación de microbioma intestinal,Síntesis de ADN,Filtración de luz] on the enum `FunctionType` will be removed. If these variants are still used in the database, this will fail.
  - The values [Animal,Vegetal,Sintético,Mineral,Microbial] on the enum `OriginType` will be removed. If these variants are still used in the database, this will fail.
  - The values [Ninguno,Bajo,Medio,Alto] on the enum `RiskLevel` will be removed. If these variants are still used in the database, this will fail.
  - The values [Carcinogénico,Alergénico,Inflamatorio,Disruptor endocrino,Neurotóxico,Mutagénico,Hepatotóxico,Cardiotóxico,Obesogénico,Alto índice glucémico,Adictivo,Contaminantes,Antinutrientes] on the enum `RiskType` will be removed. If these variants are still used in the database, this will fail.
  - The values [Soluble en grasa,Soluble en agua,Inorgánico / Iónico,Requiere conversión metabólica,Anfipático (hidrofílico y lipofílico),Requiere transportador/cofactor,No aplica] on the enum `SolubilityType` will be removed. If these variants are still used in the database, this will fail.
  - The values [Exógeno (solo fuentes externas),Endógeno (sintetizado internamente),Síntesis parcial (precursor requerido),Sintetizado por microbiota intestinal,Fuente dual (sintetizado y dietético),Síntesis condicional (limitada por factores),Dependiente de reservas corporales,Sintético (suplementos)] on the enum `SourceType` will be removed. If these variants are still used in the database, this will fail.
  - The values [Vitamina,Mineral,Ácido graso,Aminoácido,Antioxidante,Probiótico,Fitonutriente] on the enum `TypeMicronutrient` will be removed. If these variants are still used in the database, this will fail.

*/
-- AlterEnum
BEGIN;
CREATE TYPE "AdditiveType_new" AS ENUM ('NONE', 'SWEETENER', 'PRESERVATIVE', 'COLORANT', 'EMULSIFIER', 'FLAVOR_ENHANCER', 'STABILIZER', 'THICKENER', 'ACIDULANT', 'BULKING_AGENT', 'COATING_AGENT', 'ANTI_CAKING_AGENT', 'ANTI_FOAMING_AGENT', 'ANTIOXIDANT', 'CLARIFYING_AGENT', 'COAGULANT', 'COLOR_FIXATIVE', 'GASES', 'RAISING_AGENT', 'GELLING_AGENT', 'HUMECTANT', 'ACIDITY_REGULATOR', 'FLAVORING', 'MELTING_SALT', 'SEQUESTRANT', 'FLOUR_TREATMENT_AGENT', 'VARIOUS');
ALTER TABLE "ingredients" ALTER COLUMN "additiveType" DROP DEFAULT;
ALTER TABLE "ingredients" ALTER COLUMN "additiveType" TYPE "AdditiveType_new" USING ("additiveType"::text::"AdditiveType_new");
ALTER TYPE "AdditiveType" RENAME TO "AdditiveType_old";
ALTER TYPE "AdditiveType_new" RENAME TO "AdditiveType";
DROP TYPE "AdditiveType_old";
ALTER TABLE "ingredients" ALTER COLUMN "additiveType" SET DEFAULT 'NONE';
COMMIT;

-- AlterEnum
BEGIN;
CREATE TYPE "AllergenType_new" AS ENUM ('NONE', 'GLUTEN', 'LACTOSE', 'NUTS', 'PEANUTS', 'SOY', 'EGGS', 'FISH', 'SHELLFISH', 'CELERY', 'MUSTARD', 'SESAME', 'SULFITES', 'LUPIN', 'MOLLUSCS');
ALTER TABLE "ingredients" ALTER COLUMN "allergenType" DROP DEFAULT;
ALTER TABLE "ingredients" ALTER COLUMN "allergenType" TYPE "AllergenType_new" USING ("allergenType"::text::"AllergenType_new");
ALTER TYPE "AllergenType" RENAME TO "AllergenType_old";
ALTER TYPE "AllergenType_new" RENAME TO "AllergenType";
DROP TYPE "AllergenType_old";
ALTER TABLE "ingredients" ALTER COLUMN "allergenType" SET DEFAULT 'NONE';
COMMIT;

-- AlterEnum
BEGIN;
CREATE TYPE "BioactiveType_new" AS ENUM ('RETINOID', 'CAROTENOID', 'TOCOPHEROL', 'TOCOTRIENOL', 'NAPHTHOQUINONE', 'SECOSTEROID', 'FLAVIN', 'NICOTINAMIDE', 'PYRIDOXINE', 'COBALAMIN', 'ASCORBATE', 'THIAMINE', 'FOLATE', 'PANTOTHENATE', 'BIOTIN', 'CHOLINE', 'ESSENTIAL_MINERAL', 'TRACE_ELEMENT', 'BIOFLAVONOID', 'POLYPHENOL', 'ORGANOSULFUR', 'XANTHOPHYLL', 'QUINONE', 'BETAINE', 'PHOSPHOLIPID', 'AMINO_ACID_DERIVATIVE', 'TERPENOID', 'ALKALOID', 'GLUCOSINOLATE', 'PHYTOSTEROL', 'PROBIOTIC_STRAIN', 'PREBIOTIC');
ALTER TABLE "micronutrients" ALTER COLUMN "bioactiveType" TYPE "BioactiveType_new" USING ("bioactiveType"::text::"BioactiveType_new");
ALTER TYPE "BioactiveType" RENAME TO "BioactiveType_old";
ALTER TYPE "BioactiveType_new" RENAME TO "BioactiveType";
DROP TYPE "BioactiveType_old";
COMMIT;

-- AlterEnum
BEGIN;
CREATE TYPE "EssentialityType_new" AS ENUM ('ESSENTIAL', 'CONDITIONALLY_ESSENTIAL', 'NON_ESSENTIAL', 'BENEFICIAL', 'UNCLEAR');
ALTER TABLE "micronutrients" ALTER COLUMN "essentiality" TYPE "EssentialityType_new" USING ("essentiality"::text::"EssentialityType_new");
ALTER TYPE "EssentialityType" RENAME TO "EssentialityType_old";
ALTER TYPE "EssentialityType_new" RENAME TO "EssentialityType";
DROP TYPE "EssentialityType_old";
COMMIT;

-- AlterEnum
BEGIN;
CREATE TYPE "FunctionType_new" AS ENUM ('VISION', 'IMMUNE_SUPPORT', 'ENERGY_METABOLISM', 'BONE_HEALTH', 'BLOOD_HEALTH', 'ANTIOXIDANT', 'NEUROTRANSMITTER', 'CELL_GROWTH', 'OXYGEN_TRANSPORT', 'ENZYMATIC', 'ELECTROLYTE', 'HORMONE_REGULATION', 'GLUCOSE_REGULATION', 'ANTI_INFLAMMATORY', 'CARDIOPROTECTIVE', 'NEUROPROTECTIVE', 'ESSENTIAL_FATTY_ACID', 'COLLAGEN', 'MUSCLE_GROWTH', 'GUT_BARRIER', 'NUTRIENT_ABSORPTION', 'HORMONE_PRECURSOR', 'SKIN_HEALTH', 'ANTI_CANCER', 'IMMUNE_MODULATOR', 'STRUCTURAL', 'DETOXIFICATION', 'GUT_MICROBIOME', 'DNA_SYNTHESIS', 'LIGHT_FILTER');
ALTER TABLE "micronutrients" ALTER COLUMN "function" TYPE "FunctionType_new"[] USING ("function"::text::"FunctionType_new"[]);
ALTER TYPE "FunctionType" RENAME TO "FunctionType_old";
ALTER TYPE "FunctionType_new" RENAME TO "FunctionType";
DROP TYPE "FunctionType_old";
COMMIT;

-- AlterEnum
BEGIN;
CREATE TYPE "OriginType_new" AS ENUM ('ANIMAL', 'VEGETAL', 'SYNTHETIC', 'MINERAL', 'MICROBIAL');
ALTER TABLE "ingredients" ALTER COLUMN "origin" TYPE "OriginType_new" USING ("origin"::text::"OriginType_new");
ALTER TYPE "OriginType" RENAME TO "OriginType_old";
ALTER TYPE "OriginType_new" RENAME TO "OriginType";
DROP TYPE "OriginType_old";
COMMIT;

-- AlterEnum
BEGIN;
CREATE TYPE "RiskLevel_new" AS ENUM ('NONE', 'LOW', 'MEDIUM', 'HIGH');
ALTER TABLE "ingredient_risks" ALTER COLUMN "level" DROP DEFAULT;
ALTER TABLE "ingredient_risks" ALTER COLUMN "level" TYPE "RiskLevel_new" USING ("level"::text::"RiskLevel_new");
ALTER TYPE "RiskLevel" RENAME TO "RiskLevel_old";
ALTER TYPE "RiskLevel_new" RENAME TO "RiskLevel";
DROP TYPE "RiskLevel_old";
ALTER TABLE "ingredient_risks" ALTER COLUMN "level" SET DEFAULT 'NONE';
COMMIT;

-- AlterEnum
BEGIN;
CREATE TYPE "RiskType_new" AS ENUM ('CARCINOGENIC', 'ALLERGENIC', 'INFLAMMATORY', 'ENDOCRINE_DISRUPTOR', 'NEUROTOXIC', 'MUTAGENIC', 'HEPATOTOXIC', 'CARDIOTOXIC', 'OBESOGENIC', 'HIGH_GI', 'ADDICTIVE', 'CONTAMINANTS', 'ANTINUTRIENTS');
ALTER TABLE "ingredient_risks" ALTER COLUMN "riskType" TYPE "RiskType_new" USING ("riskType"::text::"RiskType_new");
ALTER TYPE "RiskType" RENAME TO "RiskType_old";
ALTER TYPE "RiskType_new" RENAME TO "RiskType";
DROP TYPE "RiskType_old";
COMMIT;

-- AlterEnum
BEGIN;
CREATE TYPE "SolubilityType_new" AS ENUM ('FAT_SOLUBLE', 'WATER_SOLUBLE', 'INORGANIC', 'BIOCONVERTIBLE', 'AMPHIPHILIC', 'TRANSPORT_DEPENDENT', 'N_A');
ALTER TABLE "micronutrients" ALTER COLUMN "solubility" TYPE "SolubilityType_new" USING ("solubility"::text::"SolubilityType_new");
ALTER TYPE "SolubilityType" RENAME TO "SolubilityType_old";
ALTER TYPE "SolubilityType_new" RENAME TO "SolubilityType";
DROP TYPE "SolubilityType_old";
COMMIT;

-- AlterEnum
BEGIN;
CREATE TYPE "SourceType_new" AS ENUM ('EXOGENOUS', 'ENDOGENOUS', 'PARTIAL_SYNTHESIS', 'MICROBIOTA', 'DUAL_SOURCE', 'CONDITIONAL_SYNTHESIS', 'STORAGE_DEPENDENT', 'SYNTHETIC');
ALTER TABLE "micronutrients" ALTER COLUMN "source" TYPE "SourceType_new" USING ("source"::text::"SourceType_new");
ALTER TYPE "SourceType" RENAME TO "SourceType_old";
ALTER TYPE "SourceType_new" RENAME TO "SourceType";
DROP TYPE "SourceType_old";
COMMIT;

-- AlterEnum
BEGIN;
CREATE TYPE "TypeMicronutrient_new" AS ENUM ('VITAMIN', 'MINERAL', 'FATTY_ACID', 'AMINO_ACID', 'ANTIOXIDANT_COMPOUND', 'PROBIOTIC', 'PHYTONUTRIENT');
ALTER TABLE "micronutrients" ALTER COLUMN "type" TYPE "TypeMicronutrient_new" USING ("type"::text::"TypeMicronutrient_new");
ALTER TYPE "TypeMicronutrient" RENAME TO "TypeMicronutrient_old";
ALTER TYPE "TypeMicronutrient_new" RENAME TO "TypeMicronutrient";
DROP TYPE "TypeMicronutrient_old";
COMMIT;

-- AlterTable
ALTER TABLE "ingredient_risks" ALTER COLUMN "level" SET DEFAULT 'NONE';

-- AlterTable
ALTER TABLE "ingredients" ALTER COLUMN "allergenType" SET DEFAULT 'NONE',
ALTER COLUMN "additiveType" SET DEFAULT 'NONE';
