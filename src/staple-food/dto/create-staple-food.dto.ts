import { AllergenType, OriginType } from '@prisma/client';
import {
  IsArray,
  IsEnum,
  IsNumber,
  IsOptional,
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
  @IsOptional()
  servingSize?: number = 0;

  @IsString()
  @IsOptional()
  servingMeasurement?: string = '';

  @IsNumber()
  calories: number = 0;

  @IsNumber()
  proteins: number = 0;

  @IsNumber()
  carbohydrates: number = 0;

  @IsNumber()
  fats: number = 0;

  @IsNumber()
  fiber: number = 0;

  @IsNumber()
  saturatedFats: number = 0;

  @IsNumber()
  sugars: number = 0;

  @IsArray()
  micronutrients: CreateStableFoodMicronutrientDto[];
}

export class CreateStableFoodMicronutrientDto {
  @IsUUID()
  micronutrientId: string;

  @IsNumber()
  amount: number = 0;
}
