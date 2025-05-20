import { Module } from '@nestjs/common';
import { BrandModule } from './brand/brand.module';
import { CategoryModule } from './category/category.module';
import { MicronutrientModule } from './micronutrient/micronutrient.module';

@Module({
  imports: [CategoryModule, BrandModule, MicronutrientModule],
  controllers: [],
  providers: [],
})
export class AppModule {}
