import { Controller } from '@nestjs/common';
import { MessagePattern, Payload } from '@nestjs/microservices';
import { CreateSubcategoryDto } from './dto/create-subcategory.dto';
import { UpdateSubcategoryDto } from './dto/update-subcategory.dto';
import { SubcategoryService } from './subcategory.service';

@Controller()
export class SubcategoryController {
  constructor(private readonly subcategoryService: SubcategoryService) {}

  @MessagePattern('createSubcategory')
  create(@Payload() createSubcategoryDto: CreateSubcategoryDto) {
    return this.subcategoryService.create(createSubcategoryDto);
  }

  @MessagePattern('findAllSubcategory')
  findAll() {
    return this.subcategoryService.findAll();
  }

  @MessagePattern('findOneSubcategory')
  findOne(@Payload() id: string) {
    return this.subcategoryService.findOne(id);
  }

  @MessagePattern('updateSubcategory')
  update(@Payload() updateSubcategoryDto: UpdateSubcategoryDto) {
    return this.subcategoryService.update(
      updateSubcategoryDto.id,
      updateSubcategoryDto,
    );
  }

  @MessagePattern('removeSubcategory')
  remove(@Payload() id: string) {
    return this.subcategoryService.remove(id);
  }
}
