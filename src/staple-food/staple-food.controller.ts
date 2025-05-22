import { Controller } from '@nestjs/common';
import { MessagePattern, Payload } from '@nestjs/microservices';
import { CreateStapleFoodDto } from './dto/create-staple-food.dto';
import { StapleFoodService } from './staple-food.service';

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
  findOne(@Payload() id: string) {
    return this.stapleFoodService.findOne(id);
  }

  @MessagePattern('removeStapleFood')
  remove(@Payload() id: string) {
    return this.stapleFoodService.remove(id);
  }
}
