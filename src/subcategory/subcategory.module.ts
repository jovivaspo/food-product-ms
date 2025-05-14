import { Module } from '@nestjs/common';
import { NatsModule } from 'src/nats/nats.module';
import { SubcategoryController } from './subcategory.controller';
import { SubcategoryService } from './subcategory.service';

@Module({
  controllers: [SubcategoryController],
  providers: [SubcategoryService],
  imports: [NatsModule],
})
export class SubcategoryModule {}
