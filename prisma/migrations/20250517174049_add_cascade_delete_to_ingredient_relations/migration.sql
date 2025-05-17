-- DropForeignKey
ALTER TABLE "ingredient_micronutrients" DROP CONSTRAINT "ingredient_micronutrients_ingredientId_fkey";

-- DropForeignKey
ALTER TABLE "ingredient_risks" DROP CONSTRAINT "ingredient_risks_ingredientId_fkey";

-- AddForeignKey
ALTER TABLE "ingredient_risks" ADD CONSTRAINT "ingredient_risks_ingredientId_fkey" FOREIGN KEY ("ingredientId") REFERENCES "ingredients"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ingredient_micronutrients" ADD CONSTRAINT "ingredient_micronutrients_ingredientId_fkey" FOREIGN KEY ("ingredientId") REFERENCES "ingredients"("id") ON DELETE CASCADE ON UPDATE CASCADE;
