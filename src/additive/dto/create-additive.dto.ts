import {
  AdditiveRating,
  AdditiveType,
  HealthConcernType,
  OriginType,
} from '@prisma/client';
import { IsArray, IsEnum, IsOptional, IsString } from 'class-validator';

export class CreateAdditiveDto {
  @IsString()
  name: string;

  @IsString()
  @IsOptional()
  scientificName?: string;

  @IsString()
  @IsOptional()
  description?: string;

  @IsEnum(OriginType)
  origin: OriginType;

  @IsArray()
  @IsEnum(AdditiveType, {
    each: true,
    message: 'Each additive type must be a valid AdditiveType enum value',
  })
  additiveType: AdditiveType[];

  @IsArray()
  @IsEnum(HealthConcernType, {
    each: true,
    message: 'Each health concern must be a valid HealthConcernType enum value',
  })
  healthConcerns: HealthConcernType[];

  @IsEnum(AdditiveRating)
  rating: AdditiveRating;
}
