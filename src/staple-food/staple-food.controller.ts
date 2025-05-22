import { Controller } from '@nestjs/common';
import { MessagePattern, Payload } from '@nestjs/microservices';
import { StapleFoodService } from './staple-food.service';
import { CreateStapleFoodDto } from './dto/create-staple-food.dto';
import { UpdateStapleFoodDto } from './dto/update-staple-food.dto';

@Controller()
export class StapleFoodController {
  constructor(private readonly stapleFoodService: StapleFoodService) {}

  @MessagePattern('createStapleFood')
  create(@Payload() createStapleFoodDto: CreateStapleFoodDto) {
    return this.stapleFoodService.create(createStapleFoodDto);
  }

  @MessagePattern('findAllStapleFood')
  findAll() {
    return this.stapleFoodService.findAll();
  }

  @MessagePattern('findOneStapleFood')
  findOne(@Payload() id: number) {
    return this.stapleFoodService.findOne(id);
  }

  @MessagePattern('updateStapleFood')
  update(@Payload() updateStapleFoodDto: UpdateStapleFoodDto) {
    return this.stapleFoodService.update(updateStapleFoodDto.id, updateStapleFoodDto);
  }

  @MessagePattern('removeStapleFood')
  remove(@Payload() id: number) {
    return this.stapleFoodService.remove(id);
  }
}
