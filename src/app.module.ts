import { Module } from '@nestjs/common';
import { BrandModule } from './brand/brand.module';
import { CategoryModule } from './category/category.module';
import { IngredientModule } from './ingredient/ingredient.module';
import { MicronutrientModule } from './micronutrient/micronutrient.module';
import { SubcategoryModule } from './subcategory/subcategory.module';

@Module({
  imports: [
    CategoryModule,
    SubcategoryModule,
    BrandModule,
    MicronutrientModule,
    IngredientModule,
  ],
  controllers: [],
  providers: [],
})
export class AppModule {}
