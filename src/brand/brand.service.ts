import { Inject, Injectable, Logger, OnModuleInit } from '@nestjs/common';
import { ClientProxy } from '@nestjs/microservices';
import { PrismaClient } from '@prisma/client';
import { NATS_SERVICE } from 'src/config';
import { CreateBrandDto } from './dto/create-brand.dto';
import { UpdateBrandDto } from './dto/update-brand.dto';

@Injectable()
export class BrandService extends PrismaClient implements OnModuleInit {
  constructor(@Inject(NATS_SERVICE) private readonly client: ClientProxy) {
    super();
  }
  private readonly logger = new Logger(BrandService.name);

  async onModuleInit() {
    await this.$connect();
    this.logger.log('Prisma connected');
  }

  create(createBrandDto: CreateBrandDto) {
    return this.brand.create({
      data: {
        name: createBrandDto.name,
      },
    });
  }

  findAll() {
    return this.brand.findMany();
  }

  findOne(id: string) {
    return this.brand.findUnique({
      where: { id },
    });
  }

  update(id: string, updateBrandDto: UpdateBrandDto) {
    return this.brand.update({
      where: { id },
      data: {
        name: updateBrandDto.name,
      },
    });
  }

  remove(id: string) {
    return this.brand.delete({
      where: { id },
    });
  }
}
