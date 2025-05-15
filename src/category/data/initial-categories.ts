import { CreateCategoryDto } from '../dto/create-category.dto';

export const initialCategories: CreateCategoryDto[] = [
  {
    name: 'Bebidas',
    description:
      'Agua, zumos naturales, bebidas vegetales, refrescos, café, infusiones, caldos, bebidas alcohólicas (cervezas, vinos, licores), bebidas funcionales y energéticas. Incluye todas las opciones tanto frías como calientes, con y sin alcohol.',
  },
  {
    name: 'Snacks y Aperitivos',
    description:
      'Frutos secos, semillas, chips vegetales, patatas fritas, aceitunas, encurtidos, palomitas, tortitas de arroz o maíz, barritas de cereales, snacks proteicos, aperitivos salados y para picar entre horas.',
  },
  {
    name: 'Dulces y Chocolates',
    description:
      'Chocolates, bombones, tabletas, cacao en polvo, cremas para untar (de chocolate, avellanas), golosinas, caramelos, turrones, barritas energéticas dulces, postres envasados, helados y mermeladas.',
  },
  {
    name: 'Panadería y Repostería',
    description:
      'Panes (de molde, baguettes, integrales, especiales), bollería (croissants, magdalenas), galletas, bizcochos, harinas, repostería fresca, masas preparadas (hojaldre, pizza, empanadas) y productos de panadería.',
  },
  {
    name: 'Lácteos y Huevos',
    description:
      'Leche, yogures, quesos de todo tipo, mantequilla, nata, postres lácteos, batidos, huevos y derivados de huevo. Incluye opciones de origen animal y sus alternativas.',
  },
  {
    name: 'Carnes y Charcutería',
    description:
      'Carne fresca de todas las variedades (vacuno, pollo, cerdo, cordero), embutidos, jamones, salchichas, hamburguesas, carnes preparadas, patés y fiambres. Tanto productos frescos como envasados.',
  },
  {
    name: 'Pescados y Mariscos',
    description:
      'Pescado fresco y congelado, mariscos, conservas de pescado (atún, sardinas, anchoas), ahumados (salmón, bacalao), surimi y preparados de pescado. Incluye todas las preparaciones y presentaciones.',
  },
  {
    name: 'Frutas y Verduras',
    description:
      'Frutas frescas y congeladas, verduras y hortalizas frescas y congeladas, tubérculos, setas y hongos, ensaladas preparadas, gazpachos, cremogenados de frutas y verduras, y productos de IV y V gama.',
  },
  {
    name: 'Despensa Básica',
    description:
      'Arroz, pasta, legumbres (lentejas, garbanzos, judías), conservas vegetales, cereales (avena, quinoa, cuscús), semillas para cocinar, purés y cremas envasadas, sopas deshidratadas y bases para cocinar.',
  },
  {
    name: 'Platos Preparados',
    description:
      'Comidas listas para consumir (refrigeradas o congeladas), pizzas, lasañas, arroces preparados, ensaladas completas envasadas, sopas y cremas preparadas, platos de pasta, guisos y estofados envasados.',
  },
  {
    name: 'Salsas, Aceites y Condimentos',
    description:
      'Aceites (oliva, girasol), vinagres, salsas (tomate, mayonesa, mostaza), aliños para ensaladas, especias, hierbas aromáticas, sal, pimienta, condimentos, adobos y marinados.',
  },
  {
    name: 'Suplementos y Nutrición Específica',
    description:
      'Complementos alimenticios, proteínas en polvo, vitaminas, productos funcionales, superalimentos, alimentación infantil, productos dietéticos y alimentos para necesidades específicas.',
  },
];
