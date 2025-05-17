import { Module } from '@nestjs/common';
import { NatsModule } from 'src/nats/nats.module';
import { IngredientController } from './ingredient.controller';
import { IngredientService } from './ingredient.service';

@Module({
  controllers: [IngredientController],
  providers: [IngredientService],
  imports: [NatsModule],
})
export class IngredientModule {}
