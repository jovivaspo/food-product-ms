import { Module } from '@nestjs/common';
import { CategoryModule } from './category/category.module';
import { SubcategoryModule } from './subcategory/subcategory.module';
import { BrandModule } from './brand/brand.module';

@Module({
  imports: [CategoryModule, SubcategoryModule, BrandModule],
  controllers: [],
  providers: [],
})
export class AppModule {}
