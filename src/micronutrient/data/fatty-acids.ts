import { CreateMicronutrientDto } from '../dto/create-micronutrient.dto';

export const fattyAcids: CreateMicronutrientDto[] = [
  {
    name: 'Omega-3 (EPA)',
    description: 'Reduce inflamación y riesgo de enfermedades cardíacas',
    type: 'FATTY_ACID',
    unit: 'g',
    dailyRecommendation: '0,50',
    tolerableLimit: '3,00',
    solubility: 'FAT_SOLUBLE',
    function: ['ANTI_INFLAMMATORY', 'CARDIOPROTECTIVE'],
    essentiality: 'ESSENTIAL',
    source: 'EXOGENOUS',
    bioactiveType: 'PHOSPHOLIPID',
  },
  {
    name: 'Omega-3 (DHA)',
    description: 'Importante para el desarrollo cerebral y función visual',
    type: 'FATTY_ACID',
    unit: 'g',
    dailyRecommendation: '0,50',
    tolerableLimit: '3,00',
    solubility: 'FAT_SOLUBLE',
    function: ['NEUROPROTECTIVE', 'VISION'],
    essentiality: 'ESSENTIAL',
    source: 'PARTIAL_SYNTHESIS',
    bioactiveType: 'PHOSPHOLIPID',
  },
  {
    name: 'Omega-3 (ALA)',
    description:
      'Precursor de EPA y DHA, beneficioso para la salud cardiovascular',
    type: 'FATTY_ACID',
    unit: 'g',
    dailyRecommendation: '1,60',
    tolerableLimit: 'No establecido',
    solubility: 'FAT_SOLUBLE',
    function: ['CARDIOPROTECTIVE', 'HORMONE_PRECURSOR'],
    essentiality: 'ESSENTIAL',
    source: 'EXOGENOUS',
    bioactiveType: 'PHOSPHOLIPID',
  },
  {
    name: 'Omega-6 (Ácido linoleico)',
    description: 'Apoya el crecimiento celular y desarrollo neurológico',
    type: 'FATTY_ACID',
    unit: 'g',
    dailyRecommendation: '17,00',
    tolerableLimit: 'No establecido',
    solubility: 'FAT_SOLUBLE',
    function: ['CELL_GROWTH', 'NEUROTRANSMITTER'],
    essentiality: 'ESSENTIAL',
    source: 'EXOGENOUS',
    bioactiveType: 'PHOSPHOLIPID',
  },
  {
    name: 'Omega-6 (Ácido araquidónico)',
    description: 'Precursor de moléculas de señalización celular',
    type: 'FATTY_ACID',
    unit: 'g',
    dailyRecommendation: '0,20',
    tolerableLimit: 'No establecido',
    solubility: 'FAT_SOLUBLE',
    function: ['HORMONE_PRECURSOR', 'CELL_GROWTH'],
    essentiality: 'ESSENTIAL',
    source: 'PARTIAL_SYNTHESIS',
    bioactiveType: 'PHOSPHOLIPID',
  },
  {
    name: 'Omega-9 (Ácido oleico)',
    description: 'Beneficioso para la salud cardiovascular',
    type: 'FATTY_ACID',
    unit: 'g',
    dailyRecommendation: '0,00',
    tolerableLimit: 'No establecido',
    solubility: 'FAT_SOLUBLE',
    function: ['CARDIOPROTECTIVE', 'STRUCTURAL'],
    essentiality: 'NON_ESSENTIAL',
    source: 'ENDOGENOUS',
    bioactiveType: 'PHOSPHOLIPID',
  },
];
