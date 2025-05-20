import { Module } from '@nestjs/common';
import { NatsModule } from 'src/nats/nats.module';
import { AdditiveController } from './additive.controller';
import { AdditiveService } from './additive.service';

@Module({
  controllers: [AdditiveController],
  providers: [AdditiveService],
  imports: [NatsModule],
})
export class AdditiveModule {}
