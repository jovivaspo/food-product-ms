import { Inject, Injectable, Logger, OnModuleInit } from '@nestjs/common';
import { ClientProxy } from '@nestjs/microservices';
import { PrismaClient } from '@prisma/client';
import { NATS_SERVICE } from 'src/config';
import { innitialAdditives } from './data/innitial-additives';

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
      throw new Error(`Additive with id ${id} not found`);
    }

    return additive;
  }

  async removeAll() {
    return this.additive.deleteMany();
  }
}
