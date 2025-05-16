import { Module } from '@nestjs/common';
import { NatsModule } from 'src/nats/nats.module';
import { MicronutrientController } from './micronutrient.controller';
import { MicronutrientService } from './micronutrient.service';

@Module({
  controllers: [MicronutrientController],
  providers: [MicronutrientService],
  imports: [NatsModule],
})
export class MicronutrientModule {}
