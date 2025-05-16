import {
  BioactiveType,
  EssentialityType,
  FunctionType,
  SolubilityType,
  SourceType,
  TypeMicronutrient,
} from '@prisma/client';

export class CreateMicronutrientDto {
  name: string;
  description?: string;
  type: TypeMicronutrient;
  unit: string;
  dailyRecommendation?: string;
  tolerableLimit?: string;
  solubility: SolubilityType;
  function: FunctionType[];
  essentiality: EssentialityType;
  source: SourceType;
  bioactiveType: BioactiveType;
}
