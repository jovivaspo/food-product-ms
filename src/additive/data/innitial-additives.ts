import {
  AdditiveRating,
  AdditiveType,
  HealthConcernType,
  OriginType,
} from '@prisma/client';
import { CreateAdditiveDto } from '../dto/create-additive.dto';

export const innitialAdditives: CreateAdditiveDto[] = [
  {
    name: 'Curcuminas',
    description:
      'Las Curcuminas (E100) son un grupo de pigmentos naturales amarillos extraídos principalmente de la raíz de la cúrcuma (Curcuma longa). Se utilizan ampliamente como colorante alimentario, proporcionando un tono amarillo-naranja a diversos productos como mostazas, quesos, dulces, bebidas y productos horneados.',
    scientificName: 'E100',
    origin: OriginType.VEGETAL,
    additiveType: [AdditiveType.COLORANT, AdditiveType.FLAVORING],
    healthConcerns: [HealthConcernType.DIGESTIVE_PROBLEMS],
    rating: AdditiveRating.SAFE_IN_MODERATION,
  },
];
