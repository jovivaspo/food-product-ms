-- First create new column as array
ALTER TABLE "staple_foods" ADD COLUMN "allergenType_new" "AllergenType"[] DEFAULT ARRAY['NONE']::"AllergenType"[];

-- Copy data from old to new column, converting single values to arrays
UPDATE "staple_foods" SET "allergenType_new" = ARRAY["allergenType"]::"AllergenType"[];

-- Drop the old column
ALTER TABLE "staple_foods" DROP COLUMN "allergenType";

-- Rename new column to original name
ALTER TABLE "staple_foods" RENAME COLUMN "allergenType_new" TO "allergenType";
