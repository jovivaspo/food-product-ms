import {
  AdditiveType,
  AllergenType,
  OriginType,
  RiskLevel,
  RiskType,
} from '@prisma/client';
import { Type } from 'class-transformer';
import {
  IsBoolean,
  IsEnum,
  IsNumber,
  IsOptional,
  IsPositive,
  IsString,
  ValidateNested,
} from 'class-validator';

export class CreateIngredientRiskDto {
  @IsEnum(RiskType)
  riskType: RiskType;

  @IsEnum(RiskLevel)
  level: RiskLevel;
}

export class CreateIngredientMicronutrientDto {
  @IsString()
  micronutrientId: string;

  @IsNumber()
  @IsPositive()
  amount: number;
}

export class CreateIngredientDto {
  @IsString()
  name: string;

  @IsString()
  @IsOptional()
  scientificName?: string;

  @IsBoolean()
  isBasicFood: boolean;

  @IsString()
  @IsOptional()
  description?: string;

  @IsEnum(AllergenType)
  @IsOptional()
  allergenType?: AllergenType;

  @IsEnum(OriginType)
  origin: OriginType;

  @IsEnum(AdditiveType)
  @IsOptional()
  additiveType?: AdditiveType;

  @IsNumber()
  @IsPositive()
  @IsOptional()
  servingSize?: number;

  @IsString()
  @IsOptional()
  servingMeasurement?: string;

  @IsNumber()
  @IsPositive()
  calories: number;

  @IsNumber()
  @IsOptional()
  proteins?: number;

  @IsNumber()
  @IsOptional()
  carbohydrates?: number;

  @IsNumber()
  @IsOptional()
  sugars?: number;

  @IsNumber()
  @IsOptional()
  fats?: number;

  @IsNumber()
  @IsOptional()
  saturatedFats?: number;

  @IsNumber()
  @IsOptional()
  fiber?: number;

  @ValidateNested({ each: true })
  @Type(() => CreateIngredientRiskDto)
  @IsOptional()
  risks?: CreateIngredientRiskDto[];

  @ValidateNested({ each: true })
  @Type(() => CreateIngredientMicronutrientDto)
  @IsOptional()
  micronutrients?: CreateIngredientMicronutrientDto[];
}
