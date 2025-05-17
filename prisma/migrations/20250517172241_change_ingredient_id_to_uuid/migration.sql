/*
  Warnings:

  - The primary key for the `ingredient_micronutrients` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - The primary key for the `ingredients` table will be changed. If it partially fails, the table could be left without primary key constraint.

*/
-- DropForeignKey
ALTER TABLE "ingredient_micronutrients" DROP CONSTRAINT "ingredient_micronutrients_ingredientId_fkey";

-- DropForeignKey
ALTER TABLE "ingredient_risks" DROP CONSTRAINT "ingredient_risks_ingredientId_fkey";

-- AlterTable
ALTER TABLE "ingredient_micronutrients" DROP CONSTRAINT "ingredient_micronutrients_pkey",
ALTER COLUMN "ingredientId" SET DATA TYPE TEXT,
ADD CONSTRAINT "ingredient_micronutrients_pkey" PRIMARY KEY ("ingredientId", "micronutrientId");

-- AlterTable
ALTER TABLE "ingredient_risks" ALTER COLUMN "ingredientId" SET DATA TYPE TEXT;

-- AlterTable
ALTER TABLE "ingredients" DROP CONSTRAINT "ingredients_pkey",
ALTER COLUMN "id" DROP DEFAULT,
ALTER COLUMN "id" SET DATA TYPE TEXT,
ADD CONSTRAINT "ingredients_pkey" PRIMARY KEY ("id");
DROP SEQUENCE "ingredients_id_seq";

-- AddForeignKey
ALTER TABLE "ingredient_risks" ADD CONSTRAINT "ingredient_risks_ingredientId_fkey" FOREIGN KEY ("ingredientId") REFERENCES "ingredients"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ingredient_micronutrients" ADD CONSTRAINT "ingredient_micronutrients_ingredientId_fkey" FOREIGN KEY ("ingredientId") REFERENCES "ingredients"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
