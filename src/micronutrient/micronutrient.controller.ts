import { Controller } from '@nestjs/common';
import { MessagePattern, Payload } from '@nestjs/microservices';
import { MicronutrientService } from './micronutrient.service';

@Controller()
export class MicronutrientController {
  constructor(private readonly micronutrientService: MicronutrientService) {}

  @MessagePattern('findAllMicronutrient')
  findAll() {
    return this.micronutrientService.findAll();
  }

  @MessagePattern('findOneMicronutrient')
  findOne(@Payload() id: string) {
    return this.micronutrientService.findOne(id);
  }
}
