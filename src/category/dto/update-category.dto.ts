import { PartialType } from '@nestjs/mapped-types';
import { IsString, IsUUID } from 'class-validator';
import { CreateCategoryDto } from './create-category.dto';

export class UpdateCategoryDto extends PartialType(CreateCategoryDto) {
  @IsString()
  @IsUUID()
  id: string;
}
