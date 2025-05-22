import { Module } from '@nestjs/common';
import { NatsModule } from 'src/nats/nats.module';
import { StapleFoodController } from './staple-food.controller';
import { StapleFoodService } from './staple-food.service';

@Module({
  controllers: [StapleFoodController],
  providers: [StapleFoodService],
  imports: [NatsModule],
})
export class StapleFoodModule {}
