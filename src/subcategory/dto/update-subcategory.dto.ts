import { IsOptional, IsString, IsUUID } from 'class-validator';

export class UpdateSubcategoryDto {
  @IsString()
  @IsOptional()
  name?: string;

  @IsString()
  @IsOptional()
  description?: string;

  @IsString()
  @IsUUID()
  @IsOptional()
  categoryId?: string;

  @IsString()
  @IsUUID()
  id: string;
}
