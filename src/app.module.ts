import { Module } from '@nestjs/common';
import { BrandModule } from './brand/brand.module';
import { CategoryModule } from './category/category.module';
import { MicronutrientModule } from './micronutrient/micronutrient.module';
import { AdditiveModule } from './additive/additive.module';
import { StapleFoodModule } from './staple-food/staple-food.module';

@Module({
  imports: [CategoryModule, BrandModule, MicronutrientModule, AdditiveModule, StapleFoodModule],
  controllers: [],
  providers: [],
})
export class AppModule {}
