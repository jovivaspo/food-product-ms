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
import { CreateCategoryDto } from './dto/create-category.dto';
import { UpdateCategoryDto } from './dto/update-category.dto';

@Injectable()
export class CategoryService extends PrismaClient implements OnModuleInit {
  constructor(@Inject(NATS_SERVICE) private readonly client: ClientProxy) {
    super();
  }

  private readonly logger = new Logger(CategoryService.name);

  async onModuleInit() {
    await this.$connect();
    this.logger.log('Prisma connected');
  }

  create(createCategoryDto: CreateCategoryDto) {
    return this.category.create({
      data: {
        name: createCategoryDto.name,
        description: createCategoryDto.description,
      },
    });
  }

  findAll() {
    return this.category.findMany();
  }

  async findOne(id: string) {
    const category = await this.category.findUnique({
      where: {
        id,
      },
    });

    if (!category) {
      throw new RpcException({
        status: HttpStatus.NOT_FOUND,
        message: `Category with id ${id} not found`,
      });
    }
    return category;
  }

  async update(id: string, updateCategoryDto: UpdateCategoryDto) {
    const category = await this.findOne(id);

    return this.category.update({
      where: {
        id: category.id,
      },
      data: {
        name: updateCategoryDto.name,
        description: updateCategoryDto.description,
      },
    });
  }

  async remove(id: string) {
    const category = await this.findOne(id);

    return this.category.delete({
      where: {
        id: category.id,
      },
    });
  }
}
