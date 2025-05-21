import {
  HttpStatus,
  Inject,
  Injectable,
  Logger,
  OnModuleInit,
} from '@nestjs/common';
import { ClientProxy, RpcException } from '@nestjs/microservices';
import { PrismaClient } from '@prisma/client';
import { NATS_SERVICE } from 'src/config';
import { innitialAdditives } from './data/innitial-additives';
import { CreateAdditiveDto } from './dto/create-additive.dto';

@Injectable()
export class AdditiveService extends PrismaClient implements OnModuleInit {
  constructor(@Inject(NATS_SERVICE) private readonly client: ClientProxy) {
    super();
  }

  private readonly logger = new Logger(AdditiveService.name);

  async onModuleInit() {
    await this.$connect();
    this.logger.log('Prisma connected');
    await this.seedInitialAdditives();
  }

  private async seedInitialAdditives() {
    const count = await this.additive.count();
    if (count === 0) {
      await this.additive.createMany({
        data: innitialAdditives,
      });
      this.logger.log('Initial additives seeded successfully');
    }
  }

  async create(createAdditiveDto: CreateAdditiveDto) {
    return this.additive.create({
      data: createAdditiveDto,
    });
  }

  findAll() {
    return this.additive.findMany({
      select: {
        id: true,
        name: true,
        scientificName: true,
        description: true,
        origin: true,
        additiveType: true,
        healthConcerns: true,
        rating: true,
      },
    });
  }

  async findOne(id: string) {
    const additive = await this.additive.findUnique({
      where: {
        id,
      },
    });

    if (!additive) {
      throw new RpcException({
        status: HttpStatus.NOT_FOUND,
        message: `Additive with id ${id} not found`,
      });
    }

    return additive;
  }

  async remove(id: string) {
    const additive = await this.findOne(id);

    return this.additive.delete({
      where: {
        id: additive.id,
      },
    });
  }

  async removeAll() {
    return this.additive.deleteMany();
  }
}
