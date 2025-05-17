import { IsUUID } from 'class-validator';
import { CreateIngredientDto } from './create-ingredient.dto';

export class UpdateIngredientDto extends CreateIngredientDto {
  @IsUUID()
  id: string;
}
