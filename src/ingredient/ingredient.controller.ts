import { Controller } from '@nestjs/common';
import { MessagePattern, Payload } from '@nestjs/microservices';
import { CreateIngredientDto } from './dto/create-ingredient.dto';
import { UpdateIngredientDto } from './dto/update-ingredient.dto';
import { IngredientService } from './ingredient.service';

@Controller()
export class IngredientController {
  constructor(private readonly ingredientService: IngredientService) {}

  @MessagePattern('createIngredient')
  create(@Payload() createIngredientDto: CreateIngredientDto) {
    return this.ingredientService.create(createIngredientDto);
  }

  @MessagePattern('findAllIngredients')
  findAll() {
    return this.ingredientService.findAll();
  }

  @MessagePattern('findOneIngredient')
  findOne(@Payload() id: number) {
    return this.ingredientService.findOne(id);
  }

  @MessagePattern('updateIngredient')
  update(@Payload() updateIngredientDto: UpdateIngredientDto) {
    return this.ingredientService.update(
      updateIngredientDto.id,
      updateIngredientDto,
    );
  }

  @MessagePattern('removeIngredient')
  remove(@Payload() id: number) {
    return this.ingredientService.remove(id);
  }
}
