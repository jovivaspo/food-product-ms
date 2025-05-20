import { Controller } from '@nestjs/common';
import { MessagePattern, Payload } from '@nestjs/microservices';
import { AdditiveService } from './additive.service';

@Controller()
export class AdditiveController {
  constructor(private readonly additiveService: AdditiveService) {}

  @MessagePattern('findAllAdditive')
  findAll() {
    return this.additiveService.findAll();
  }

  @MessagePattern('findOneAdditive')
  findOne(@Payload() id: string) {
    return this.additiveService.findOne(id);
  }
}
