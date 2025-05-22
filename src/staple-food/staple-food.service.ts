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
import { CreateStapleFoodDto } from './dto/create-staple-food.dto';

@Injectable()
export class StapleFoodService extends PrismaClient implements OnModuleInit {
  constructor(@Inject(NATS_SERVICE) private readonly client: ClientProxy) {
    super();
  }

  private readonly logger = new Logger(StapleFoodService.name);

  async onModuleInit() {
    await this.$connect();
    this.logger.log('Prisma connected');
  }

  async create(createStapleFoodDto: CreateStapleFoodDto) {
    const { micronutrients, allergenType, ...rest } = createStapleFoodDto;

    return this.$transaction(async (prisma) => {
      const stapleFood = await prisma.stapleFood.create({
        data: {
          ...rest,
          allergenType: allergenType || [],
          micronutrients: {
            create: micronutrients.map((m) => ({
              micronutrientId: m.micronutrientId,
              amount: m.amount ?? 0,
            })),
          },
        },
        include: {
          micronutrients: {
            include: {
              micronutrient: true,
            },
          },
        },
      });

      return stapleFood;
    });
  }

  findAll() {
    return this.stapleFood.findMany({
      select: {
        id: true,
        name: true,
        allergenType: true,
        origin: true,
        servingSize: true,
        servingMeasurement: true,
        calories: true,
        proteins: true,
        carbohydrates: true,
        fats: true,
        saturatedFats: true,
        sugars: true,
        micronutrients: true,
      },
    });
  }

  async findOne(id: string) {
    const stapleFood = await this.stapleFood.findUnique({
      where: {
        id,
      },
    });

    if (!stapleFood) {
      throw new RpcException({
        status: HttpStatus.NOT_FOUND,
        message: `Staple food with id ${id} not found`,
      });
    }
    return stapleFood;
  }

  async remove(id: string) {
    const stapleFood = await this.findOne(id);

    return this.stapleFood.delete({
      where: {
        id: stapleFood.id,
      },
    });
  }
}
