-- CreateEnum
CREATE TYPE "TypeMicronutrient" AS ENUM ('VITAMIN', 'MINERAL', 'FATTY_ACID', 'AMINO_ACID', 'ANTIOXIDANT_COMPOUND', 'PROBIOTIC', 'PHYTONUTRIENT');

-- CreateEnum
CREATE TYPE "AllergenType" AS ENUM ('NONE', 'GLUTEN', 'LACTOSE', 'NUTS', 'PEANUTS', 'SOY', 'EGGS', 'FISH', 'SHELLFISH', 'CELERY', 'MUSTARD', 'SESAME', 'SULFITES', 'LUPIN', 'MOLLUSCS');

-- CreateEnum
CREATE TYPE "OriginType" AS ENUM ('ANIMAL', 'VEGETAL', 'SYNTHETIC', 'MINERAL', 'MICROBIAL');

-- CreateEnum
CREATE TYPE "AdditiveType" AS ENUM ('SWEETENER', 'PRESERVATIVE', 'COLORANT', 'EMULSIFIER', 'FLAVOR_ENHANCER', 'STABILIZER', 'THICKENER', 'ACIDULANT', 'BULKING_AGENT', 'COATING_AGENT', 'ANTI_CAKING_AGENT', 'ANTI_FOAMING_AGENT', 'ANTIOXIDANT', 'CLARIFYING_AGENT', 'COAGULANT', 'COLOR_FIXATIVE', 'GASES', 'RAISING_AGENT', 'GELLING_AGENT', 'HUMECTANT', 'ACIDITY_REGULATOR', 'FLAVORING', 'MELTING_SALT', 'SEQUESTRANT', 'FLOUR_TREATMENT_AGENT', 'VARIOUS');

-- CreateEnum
CREATE TYPE "HealthConcernType" AS ENUM ('CARCINOGENIC', 'ALLERGENIC', 'INFLAMMATORY', 'ENDOCRINE_DISRUPTOR', 'NEUROTOXIC', 'MUTAGENIC', 'HEPATOTOXIC', 'CARDIOTOXIC', 'OBESOGENIC', 'HIGH_GI', 'ADDICTIVE', 'CONTAMINAT', 'ANTINUTRIENT', 'RESPIRATORY_PROBLEMS', 'DIGESTIVE_PROBLEMS', 'BEHAVIORAL_DISORDERS');

-- CreateEnum
CREATE TYPE "AdditiveRating" AS ENUM ('AVOID', 'CAUTION', 'SAFE', 'SAFE_IN_MODERATION', 'CUT_BACK');

-- CreateEnum
CREATE TYPE "SolubilityType" AS ENUM ('FAT_SOLUBLE', 'WATER_SOLUBLE', 'INORGANIC', 'BIOCONVERTIBLE', 'AMPHIPHILIC', 'TRANSPORT_DEPENDENT', 'N_A');

-- CreateEnum
CREATE TYPE "FunctionType" AS ENUM ('VISION', 'IMMUNE_SUPPORT', 'ENERGY_METABOLISM', 'BONE_HEALTH', 'BLOOD_HEALTH', 'ANTIOXIDANT', 'NEUROTRANSMITTER', 'CELL_GROWTH', 'OXYGEN_TRANSPORT', 'ENZYMATIC', 'ELECTROLYTE', 'HORMONE_REGULATION', 'GLUCOSE_REGULATION', 'ANTI_INFLAMMATORY', 'CARDIOPROTECTIVE', 'NEUROPROTECTIVE', 'ESSENTIAL_FATTY_ACID', 'COLLAGEN', 'MUSCLE_GROWTH', 'GUT_BARRIER', 'NUTRIENT_ABSORPTION', 'HORMONE_PRECURSOR', 'SKIN_HEALTH', 'ANTI_CANCER', 'IMMUNE_MODULATOR', 'STRUCTURAL', 'DETOXIFICATION', 'GUT_MICROBIOME', 'DNA_SYNTHESIS', 'LIGHT_FILTER');

-- CreateEnum
CREATE TYPE "EssentialityType" AS ENUM ('ESSENTIAL', 'CONDITIONALLY_ESSENTIAL', 'NON_ESSENTIAL', 'BENEFICIAL', 'UNCLEAR');

-- CreateEnum
CREATE TYPE "SourceType" AS ENUM ('EXOGENOUS', 'ENDOGENOUS', 'PARTIAL_SYNTHESIS', 'MICROBIOTA', 'DUAL_SOURCE', 'CONDITIONAL_SYNTHESIS', 'STORAGE_DEPENDENT', 'SYNTHETIC');

-- CreateEnum
CREATE TYPE "BioactiveType" AS ENUM ('RETINOID', 'CAROTENOID', 'TOCOPHEROL', 'TOCOTRIENOL', 'NAPHTHOQUINONE', 'SECOSTEROID', 'FLAVIN', 'NICOTINAMIDE', 'PYRIDOXINE', 'COBALAMIN', 'ASCORBATE', 'THIAMINE', 'FOLATE', 'PANTOTHENATE', 'BIOTIN', 'CHOLINE', 'ESSENTIAL_MINERAL', 'TRACE_ELEMENT', 'BIOFLAVONOID', 'POLYPHENOL', 'ORGANOSULFUR', 'XANTHOPHYLL', 'QUINONE', 'BETAINE', 'PHOSPHOLIPID', 'AMINO_ACID_DERIVATIVE', 'TERPENOID', 'ALKALOID', 'GLUCOSINOLATE', 'PHYTOSTEROL', 'PROBIOTIC_STRAIN', 'PREBIOTIC');

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
CREATE TABLE "Brand" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Brand_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "additives" (
    "id" TEXT NOT NULL,
    "name" VARCHAR(100) NOT NULL,
    "scientificName" VARCHAR(100),
    "description" TEXT,
    "origin" "OriginType" NOT NULL,
    "additiveType" "AdditiveType" NOT NULL,
    "healthConcerns" "HealthConcernType"[],
    "rating" "AdditiveRating" NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "additives_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "staple_foods" (
    "id" TEXT NOT NULL,
    "name" VARCHAR(100) NOT NULL,
    "allergenType" "AllergenType" NOT NULL DEFAULT 'NONE',
    "origin" "OriginType" NOT NULL,
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

    CONSTRAINT "staple_foods_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "micronutrients" (
    "id" TEXT NOT NULL,
    "name" VARCHAR(100) NOT NULL,
    "description" TEXT,
    "type" "TypeMicronutrient" NOT NULL,
    "tolerableLimit" TEXT,
    "unit" VARCHAR(20) NOT NULL,
    "dailyRecommendation" TEXT,
    "solubility" "SolubilityType" NOT NULL,
    "function" "FunctionType"[],
    "essentiality" "EssentialityType" NOT NULL,
    "source" "SourceType" NOT NULL,
    "bioactiveType" "BioactiveType" NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "micronutrients_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "staple_foods_micronutrients" (
    "stapleFoodId" TEXT NOT NULL,
    "micronutrientId" TEXT NOT NULL,
    "amount" DECIMAL(10,2) NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "staple_foods_micronutrients_pkey" PRIMARY KEY ("stapleFoodId","micronutrientId")
);

-- CreateIndex
CREATE INDEX "idx_additives_name" ON "additives"("name");

-- CreateIndex
CREATE INDEX "idx_additives_type" ON "additives"("additiveType");

-- CreateIndex
CREATE INDEX "idx_additives_health_concerns" ON "additives"("healthConcerns");

-- CreateIndex
CREATE INDEX "idx_additives_rating" ON "additives"("rating");

-- CreateIndex
CREATE INDEX "idx_staple_foods_name" ON "staple_foods"("name");

-- CreateIndex
CREATE INDEX "idx_staple_foods_origin" ON "staple_foods"("origin");

-- CreateIndex
CREATE INDEX "idx_staple_foods_allergen_type" ON "staple_foods"("allergenType");

-- AddForeignKey
ALTER TABLE "staple_foods_micronutrients" ADD CONSTRAINT "staple_foods_micronutrients_stapleFoodId_fkey" FOREIGN KEY ("stapleFoodId") REFERENCES "staple_foods"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "staple_foods_micronutrients" ADD CONSTRAINT "staple_foods_micronutrients_micronutrientId_fkey" FOREIGN KEY ("micronutrientId") REFERENCES "micronutrients"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
