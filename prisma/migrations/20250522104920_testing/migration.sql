-- AlterTable
ALTER TABLE "staple_foods" ALTER COLUMN "allergenType" SET DEFAULT ARRAY[]::"AllergenType"[];

-- CreateIndex
CREATE INDEX "idx_staple_foods_allergen_type" ON "staple_foods"("allergenType");
