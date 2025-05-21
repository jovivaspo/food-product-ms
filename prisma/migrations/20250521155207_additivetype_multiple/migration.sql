/*
  Warnings:

  - Changed the column `additiveType` on the `additives` table from a scalar field to a list field. If there are non-null values in that column, this step will fail.

*/
-- AlterTable
ALTER TABLE "additives" ALTER COLUMN "additiveType" TYPE "AdditiveType"[] USING ARRAY["additiveType"]::"AdditiveType"[];
