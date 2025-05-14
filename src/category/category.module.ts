import { Module } from '@nestjs/common';
import { NatsModule } from 'src/nats/nats.module';
import { CategoryController } from './category.controller';
import { CategoryService } from './category.service';

@Module({
  controllers: [CategoryController],
  providers: [CategoryService],
  imports: [NatsModule],
})
export class CategoryModule {}
