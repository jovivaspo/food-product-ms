import { Module } from '@nestjs/common';
import { CategoryModule } from './category/category.module';
import { SubcategoryModule } from './subcategory/subcategory.module';

@Module({
  imports: [CategoryModule, SubcategoryModule],
  controllers: [],
  providers: [],
})
export class AppModule {}
