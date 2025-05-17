import {
  AdditiveType,
  AllergenType,
  OriginType,
  RiskLevel,
  RiskType,
} from '@prisma/client';

export class CreateIngredientRiskDto {
  riskType: RiskType;
  level: RiskLevel;
}

export class CreateIngredientMicronutrientDto {
  micronutrientId: string;
  amount: number;
}

export class CreateIngredientDto {
  name: string;
  scientificName?: string;
  isBasicFood?: boolean;
  description?: string;
  allergenType?: AllergenType;
  origin: OriginType;
  additiveType?: AdditiveType;
  servingSize?: number;
  servingMeasurement?: string;
  calories: number;
  proteins?: number;
  carbohydrates?: number;
  sugars?: number;
  fats?: number;
  saturatedFats?: number;
  fiber?: number;
  risks?: CreateIngredientRiskDto[];
  micronutrients?: CreateIngredientMicronutrientDto[];
}
