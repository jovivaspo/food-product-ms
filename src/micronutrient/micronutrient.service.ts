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
import { initialMicronutrients } from './data/initial-micronutrients';

@Injectable()
export class MicronutrientService extends PrismaClient implements OnModuleInit {
  constructor(@Inject(NATS_SERVICE) private readonly client: ClientProxy) {
    super();
  }

  private readonly logger = new Logger(MicronutrientService.name);
  async onModuleInit() {
    await this.$connect();
    this.logger.log('Prisma connected');
    await this.seedInitialMicronutrients();
  }

  private async seedInitialMicronutrients() {
    const count = await this.micronutrient.count();
    if (count === 0) {
      await this.micronutrient.createMany({
        data: initialMicronutrients,
      });
      this.logger.log('Initial micronutrients seeded successfully');
    }
  }

  findAll() {
    return this.micronutrient.findMany({
      select: {
        id: true,
        name: true,
        description: true,
        type: true,
        unit: true,
        dailyRecommendation: true,
        tolerableLimit: true,
        solubility: true,
        function: true,
        essentiality: true,
        source: true,
        bioactiveType: true,
      },
    });
  }

  async findOne(id: string) {
    const micronutrient = await this.micronutrient.findUnique({
      where: {
        id,
      },
    });

    if (!micronutrient) {
      throw new RpcException({
        status: HttpStatus.NOT_FOUND,
        message: `Micronutrient with id ${id} not found`,
      });
    }
    return micronutrient;
  }

  async removeAll() {
    return this.micronutrient.deleteMany();
  }
}
