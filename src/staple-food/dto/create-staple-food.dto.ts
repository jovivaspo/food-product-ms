import { AllergenType, OriginType } from '@prisma/client';
import {
  IsArray,
  IsEnum,
  IsNumber,
  IsOptional,
  IsPositive,
  IsString,
  IsUUID,
} from 'class-validator';

export class CreateStapleFoodDto {
  @IsString()
  name: string;

  @IsArray()
  @IsEnum(AllergenType, {
    each: true,
    message: 'Each allergen type must be a valid AllergenType enum value',
  })
  allergenType: AllergenType[];

  @IsEnum(OriginType)
  origin: OriginType;

  @IsNumber()
  @IsPositive()
  @IsOptional()
  servingSize?: number = 0;

  @IsString()
  @IsOptional()
  servingMeasurement?: string = '';

  @IsNumber()
  @IsPositive()
  calories: number = 0;

  @IsNumber()
  @IsPositive()
  proteins: number = 0;

  @IsNumber()
  @IsPositive()
  carbohydrates: number = 0;

  @IsNumber()
  @IsPositive()
  fats: number = 0;

  @IsNumber()
  @IsPositive()
  fiber: number = 0;

  @IsNumber()
  @IsPositive()
  saturatedFats: number = 0;

  @IsNumber()
  @IsPositive()
  sugars: number = 0;

  @IsArray()
  micronutrients: CreateStableFoodMicronutrientDto[];
}

export class CreateStableFoodMicronutrientDto {
  @IsUUID()
  micronutrientId: string;

  @IsNumber()
  @IsPositive()
  amount: number = 0;
}
