import { Module } from '@nestjs/common';
import { NatsModule } from 'src/nats/nats.module';
import { BrandController } from './brand.controller';
import { BrandService } from './brand.service';

@Module({
  controllers: [BrandController],
  providers: [BrandService],
  imports: [NatsModule],
})
export class BrandModule {}
