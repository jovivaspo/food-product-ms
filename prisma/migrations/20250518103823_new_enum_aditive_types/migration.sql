-- AlterEnum
-- This migration adds more than one value to an enum.
-- With PostgreSQL versions 11 and earlier, this is not possible
-- in a single migration. This can be worked around by creating
-- multiple migrations, each migration adding only one value to
-- the enum.


ALTER TYPE "AdditiveType" ADD VALUE 'Acidulantes';
ALTER TYPE "AdditiveType" ADD VALUE 'Agentes de carga';
ALTER TYPE "AdditiveType" ADD VALUE 'Agentes de recubrimiento';
ALTER TYPE "AdditiveType" ADD VALUE 'Antiaglomerantes';
ALTER TYPE "AdditiveType" ADD VALUE 'Antiespumantes';
ALTER TYPE "AdditiveType" ADD VALUE 'Antioxidantes';
ALTER TYPE "AdditiveType" ADD VALUE 'Clarificantes';
ALTER TYPE "AdditiveType" ADD VALUE 'Coagulantes';
ALTER TYPE "AdditiveType" ADD VALUE 'Fijadores de color';
ALTER TYPE "AdditiveType" ADD VALUE 'Gases';
ALTER TYPE "AdditiveType" ADD VALUE 'Gasificantes';
ALTER TYPE "AdditiveType" ADD VALUE 'Gelificantes';
ALTER TYPE "AdditiveType" ADD VALUE 'Humectantes';
ALTER TYPE "AdditiveType" ADD VALUE 'Reguladores de acidez';
ALTER TYPE "AdditiveType" ADD VALUE 'Saborizantes';
ALTER TYPE "AdditiveType" ADD VALUE 'Sales de fundido';
ALTER TYPE "AdditiveType" ADD VALUE 'Secuestrantes';
ALTER TYPE "AdditiveType" ADD VALUE 'Tratamiento de harinas';
ALTER TYPE "AdditiveType" ADD VALUE 'Varios';
