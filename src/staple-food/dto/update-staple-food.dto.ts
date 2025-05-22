import { PartialType } from '@nestjs/mapped-types';
import { CreateStapleFoodDto } from './create-staple-food.dto';

export class UpdateStapleFoodDto extends PartialType(CreateStapleFoodDto) {
  id: number;
}
