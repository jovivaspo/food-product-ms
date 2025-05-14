import {
  HttpStatus,
  Inject,
  Injectable,
  Logger,
  OnModuleInit,
} from '@nestjs/common';
import { ClientProxy, RpcException } from '@nestjs/microservices';
import { PrismaClient } from '@prisma/client';
import { NATS_SERVICE } from 'src/common/service';
import { CreateSubcategoryDto } from './dto/create-subcategory.dto';
import { UpdateSubcategoryDto } from './dto/update-subcategory.dto';

@Injectable()
export class SubcategoryService extends PrismaClient implements OnModuleInit {
  constructor(@Inject(NATS_SERVICE) private readonly client: ClientProxy) {
    super();
  }

  private readonly logger = new Logger(SubcategoryService.name);

  async onModuleInit() {
    await this.$connect();
    this.logger.log('Prisma connected');
  }

  async create(createSubcategoryDto: CreateSubcategoryDto) {
    // First check if category exists
    const category = await this.category.findUnique({
      where: {
        id: createSubcategoryDto.categoryId,
      },
    });

    if (!category) {
      throw new RpcException({
        status: HttpStatus.NOT_FOUND,
        message: `Category with id ${createSubcategoryDto.categoryId} not found`,
      });
    }

    return this.subcategory.create({
      data: {
        name: createSubcategoryDto.name,
        description: createSubcategoryDto.description,
        categoryId: createSubcategoryDto.categoryId,
      },
      include: {
        category: true,
      },
    });
  }

  findAll() {
    return this.subcategory.findMany({
      include: {
        category: true,
      },
    });
  }

  async findOne(id: string) {
    const subcategory = await this.subcategory.findUnique({
      where: {
        id,
      },
      include: {
        category: true,
      },
    });

    if (!subcategory) {
      throw new RpcException({
        status: HttpStatus.NOT_FOUND,
        message: `Subcategory with id ${id} not found`,
      });
    }

    return subcategory;
  }

  async update(id: string, updateSubcategoryDto: UpdateSubcategoryDto) {
    const subcategory = await this.findOne(id);

    if (updateSubcategoryDto.categoryId) {
      // Check if new category exists
      const categoryExists = await this.category.findUnique({
        where: {
          id: updateSubcategoryDto.categoryId,
        },
      });

      if (!categoryExists) {
        throw new RpcException({
          status: HttpStatus.NOT_FOUND,
          message: `Category with id ${updateSubcategoryDto.categoryId} not found`,
        });
      }
    }

    return this.subcategory.update({
      where: {
        id: subcategory.id,
      },
      data: {
        name: updateSubcategoryDto.name,
        description: updateSubcategoryDto.description,
        categoryId: updateSubcategoryDto.categoryId,
      },
      include: {
        category: true,
      },
    });
  }

  async remove(id: string) {
    const subcategory = await this.findOne(id);

    return this.subcategory.delete({
      where: {
        id: subcategory.id,
      },
      include: {
        category: true,
      },
    });
  }
}
