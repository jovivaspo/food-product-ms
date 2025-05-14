import { IsOptional, IsString, IsUUID } from 'class-validator';

export class CreateSubcategoryDto {
  @IsString()
  name: string;

  @IsString()
  @IsOptional()
  description?: string;

  @IsString()
  @IsUUID()
  categoryId: string;
}
