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
import { CreateIngredientDto } from './dto/create-ingredient.dto';
import { UpdateIngredientDto } from './dto/update-ingredient.dto';

@Injectable()
export class IngredientService extends PrismaClient implements OnModuleInit {
  constructor(@Inject(NATS_SERVICE) private readonly client: ClientProxy) {
    super();
  }

  private readonly logger = new Logger(IngredientService.name);

  async onModuleInit() {
    await this.$connect();
    this.logger.log('Prisma connected');
  }

  async create(createIngredientDto: CreateIngredientDto) {
    const {
      risks = [],
      micronutrients = [],
      ...ingredientData
    } = createIngredientDto;

    return this.ingredient.create({
      data: {
        ...ingredientData,
        risks: {
          create: risks.map((risk) => ({
            riskType: risk.riskType,
            level: risk.level,
          })),
        },
        micronutrients: {
          create: micronutrients.map((micro) => ({
            micronutrientId: micro.micronutrientId,
            amount: micro.amount,
          })),
        },
      },
      include: {
        risks: true,
        micronutrients: {
          include: {
            micronutrient: true,
          },
        },
      },
    });
  }

  async findAll() {
    return this.ingredient.findMany({
      include: {
        risks: true,
        micronutrients: {
          include: {
            micronutrient: true,
          },
        },
      },
    });
  }

  async findOne(id: number) {
    const ingredient = await this.ingredient.findUnique({
      where: { id },
      include: {
        risks: true,
        micronutrients: {
          include: {
            micronutrient: true,
          },
        },
      },
    });

    if (!ingredient) {
      throw new RpcException({
        status: HttpStatus.NOT_FOUND,
        message: `Ingredient with id ${id} not found`,
      });
    }

    return ingredient;
  }

  async update(id: number, updateIngredientDto: UpdateIngredientDto) {
    await this.findOne(id); // Check if exists

    const {
      risks = [],
      micronutrients = [],
      ...ingredientData
    } = updateIngredientDto;

    // Delete existing relations
    await this.ingredientRisk.deleteMany({
      where: { ingredientId: id },
    });
    await this.ingredientMicronutrient.deleteMany({
      where: { ingredientId: id },
    });

    // Update with new relations
    return this.ingredient.update({
      where: { id },
      data: {
        ...ingredientData,
        risks: {
          create: risks.map((risk) => ({
            riskType: risk.riskType,
            level: risk.level,
          })),
        },
        micronutrients: {
          create: micronutrients.map((micro) => ({
            micronutrientId: micro.micronutrientId,
            amount: micro.amount,
          })),
        },
      },
      include: {
        risks: true,
        micronutrients: {
          include: {
            micronutrient: true,
          },
        },
      },
    });
  }

  async remove(id: number) {
    await this.findOne(id); // Check if exists

    // Prisma will automatically handle cascading deletes for relations
    return this.ingredient.delete({
      where: { id },
      include: {
        risks: true,
        micronutrients: true,
      },
    });
  }
}
