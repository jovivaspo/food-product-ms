import { CreateMicronutrientDto } from '../dto/create-micronutrient.dto';
import { aminoAcids } from './amino-acids';
import { antioxidants } from './antioxidants';
import { fattyAcids } from './fatty-acids';
import { minerals } from './minerals';
import { phytonutrients } from './phytonutrients';
import { probiotics } from './probiotics';
import { vitamins } from './vitamins';

export const initialMicronutrients: CreateMicronutrientDto[] = [
  // Vitaminas
  ...vitamins,

  // Minerales
  ...minerals,

  // Ácidos Grasos Esenciales
  ...fattyAcids,

  // Aminoácidos Esenciales
  ...aminoAcids,

  // Probióticos
  ...probiotics,

  // Antioxidantes
  ...antioxidants,

  //Fitonutrientes
  ...phytonutrients,
];
