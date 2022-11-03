CREATE TABLE "orders" (
  "id" int NOT NULL AUTO_INCREMENT,
  "order_date" datetime NOT NULL,
  "user_id" int NOT NULL,
  "discount" int DEFAULT "0",
  "order_status" varchar(15) NOT NULL DEFAULT "enCarrito",
  "delivery_method" varchar(45) DEFAULT NULL,
  "delivery_adress" varchar(255) DEFAULT NULL,
  "between_streets" varchar(255) DEFAULT NULL,
  "payment_method" varchar(45) DEFAULT NULL,
  "createdAt" datetime DEFAULT NULL,
  "updatedAt" datetime DEFAULT NULL,
  "deletedAt" datetime DEFAULT NULL,
  PRIMARY KEY ("id"),
  KEY "fk_orders_users_idx" ("user_id"),
  CONSTRAINT "fk_orders_users" FOREIGN KEY ("user_id") REFERENCES "users" ("id")
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COLLATE=utf8_0900_ai_ci;


LOCK TABLES "orders" WRITE;

INSERT INTO "orders" VALUES (1,"2022-09-03 16:22:28",1,0,"enCarrito",NULL,NULL,NULL,NULL,"2022-09-03 16:22:28","2022-09-03 16:22:28",NULL),(2,"2022-09-07 15:02:05",2,0,"enCarrito",NULL,NULL,NULL,NULL,"2022-09-07 15:02:05","2022-09-07 15:02:05",NULL),(3,"2022-09-13 15:15:00",4,0,"enProceso","envio","San Martín 500, Capilla del Señor",NULL,"mercadoPago","2022-09-13 15:15:00","2022-09-20 16:02:00",NULL),(4,"2022-09-13 15:18:09",4,0,"retirada","retiro",NULL,NULL,"efectivo","2022-09-13 15:18:09","2022-09-20 15:46:31",NULL),(5,"2022-09-13 20:02:20",4,0,"enProceso",NULL,NULL,NULL,"mercadoPago","2022-09-13 20:02:20","2022-09-14 00:21:56",NULL),(6,"2022-09-14 18:34:09",4,0,"enProceso","retiro",NULL,NULL,"efectivo","2022-09-14 18:34:09","2022-09-20 13:02:58",NULL),(7,"2022-09-15 13:04:12",5,0,"enProceso","retiro",NULL,NULL,"efectivo","2022-09-15 13:04:12","2022-09-20 13:03:05",NULL),(8,"2022-09-15 18:01:01",4,0,"enProceso","retiro",NULL,NULL,"efectivo","2022-09-15 18:01:01","2022-09-20 13:28:42",NULL),(9,"2022-09-15 19:54:20",4,0,"lista","retiro",NULL,NULL,"efectivo","2022-09-15 19:54:20","2022-09-20 15:45:05",NULL),(10,"2022-09-15 20:33:37",5,0,"lista","retiro",NULL,NULL,"efectivo","2022-09-15 20:33:37","2022-09-20 15:40:44",NULL),(11,"2022-09-19 19:28:23",4,0,"lista","retiro",NULL,NULL,"efectivo","2022-09-19 19:28:23","2022-09-20 15:41:25",NULL);

UNLOCK TABLES;


DROP TABLE IF EXISTS "orders_details";

CREATE TABLE "orders_details" (
  "id" int NOT NULL AUTO_INCREMENT,
  "order_id" int NOT NULL,
  "product_id" int NOT NULL,
  "amount" int NOT NULL,
  "createdAt" datetime DEFAULT NULL,
  "updatedAt" datetime DEFAULT NULL,
  "deletedAt" datetime DEFAULT NULL,
  PRIMARY KEY ("id"),
  KEY "fk_od_orders_idx" ("order_id"),
  KEY "fk_or_products_idx" ("product_id"),
  CONSTRAINT "fk_od_orders" FOREIGN KEY ("order_id") REFERENCES "orders" ("id"),
  CONSTRAINT "fk_or_products" FOREIGN KEY ("product_id") REFERENCES "products" ("id")
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8 COLLATE=utf8mb4_0900_ai_ci;

LOCK TABLES "orders_details" WRITE;

INSERT INTO "orders_details" VALUES (1,1,2,1,"2022-09-03 16:27:08","2022-09-06 15:21:03",NULL),(2,1,4,1,"2022-09-03 16:27:22","2022-09-06 15:19:41",NULL),(3,1,4,1,"2022-09-03 16:27:37","2022-09-03 16:27:37","2022-09-04 22:13:54"),(4,1,6,1,"2022-09-03 16:30:33","2022-09-03 16:30:33","2022-09-04 23:56:46"),(5,1,3,1,"2022-09-04 22:13:42","2022-09-04 22:13:42","2022-09-04 22:14:04"),(6,1,3,3,"2022-09-04 22:29:06","2022-09-06 23:38:19",NULL),(7,2,6,1,"2022-09-07 15:02:05","2022-09-07 15:02:05",NULL),(8,3,2,1,"2022-09-13 15:15:00","2022-09-13 15:15:00",NULL),(9,4,5,1,"2022-09-13 15:18:09","2022-09-13 15:18:09",NULL),(10,5,79,1,"2022-09-13 20:02:20","2022-09-13 20:02:36","2022-09-13 20:02:41"),(11,5,1,1,"2022-09-14 00:17:04","2022-09-14 00:17:04",NULL),(12,6,1,5,"2022-09-14 18:34:09","2022-09-15 13:00:38","2022-09-15 14:30:46"),(13,6,3,2,"2022-09-15 13:02:44","2022-09-15 13:02:45","2022-09-15 14:30:47"),(14,7,1,1,"2022-09-15 13:04:12","2022-09-15 13:04:12","2022-09-15 20:28:05"),(15,7,2,1,"2022-09-15 13:04:20","2022-09-15 13:04:20","2022-09-15 20:28:06"),(16,7,4,1,"2022-09-15 13:10:32","2022-09-15 13:10:32","2022-09-15 20:28:07"),(17,7,3,1,"2022-09-15 13:10:35","2022-09-15 13:10:35","2022-09-15 20:28:04"),(18,6,5,1,"2022-09-15 13:11:13","2022-09-15 13:11:13","2022-09-15 14:30:48"),(19,6,2,1,"2022-09-15 14:01:44","2022-09-15 14:01:44","2022-09-15 14:30:49"),(20,6,2,1,"2022-09-15 14:32:41","2022-09-15 18:00:46",NULL),(21,8,1,1,"2022-09-15 18:01:01","2022-09-15 18:01:01",NULL),(22,8,4,1,"2022-09-15 18:01:17","2022-09-15 18:01:17",NULL),(23,8,10,1,"2022-09-15 18:01:19","2022-09-15 18:01:19",NULL),(24,9,1,1,"2022-09-15 19:54:20","2022-09-15 19:54:25",NULL),(25,7,5,1,"2022-09-15 20:28:12","2022-09-15 20:34:29",NULL),(26,10,1,1,"2022-09-15 20:33:37","2022-09-15 20:33:37",NULL),(27,10,2,1,"2022-09-15 20:33:40","2022-09-15 20:33:40",NULL),(28,11,2,1,"2022-09-19 19:28:23","2022-09-19 19:28:23",NULL),(29,11,5,1,"2022-09-19 19:28:51","2022-09-19 19:28:51",NULL);

UNLOCK TABLES;

DROP TABLE IF EXISTS "products";

CREATE TABLE "products" (
  "id" int NOT NULL AUTO_INCREMENT,
  "name" varchar(255) NOT NULL,
  "description" varchar(500) DEFAULT NULL,
  "price" decimal(10,2) DEFAULT "0.00",
  "product_photo" varchar(500) DEFAULT NULL,
  "category_id" int DEFAULT NULL,
  "special_offer" tinyint DEFAULT "0",
  "createdAt" datetime DEFAULT NULL,
  "updatedAt" datetime DEFAULT NULL,
  "deletedAt" datetime DEFAULT NULL,
  "stock" int DEFAULT "0",
  PRIMARY KEY ("id"),
  KEY "fk_products_category_idx" ("category_id"),
  CONSTRAINT "fk_products_category" FOREIGN KEY ("category_id") REFERENCES "products_categories" ("id")
) ENGINE=InnoDB AUTO_INCREMENT=104 DEFAULT CHARSET=utf8 COLLATE=utf8mb4_0900_ai_ci;

LOCK TABLES "products" WRITE;

INSERT INTO "products" VALUES (1,"Agua con gas","Agua con gas Baja en Sodio Glaciar 1.5 L",140.00,"Agua-Baja-En-Sodio-Glaciar-Con-Gas-15-L-1-240110.webp",1,1,"2022-08-26 21:54:43","2022-08-26 21:54:43",NULL,1000),(2,"Chocolate Milka","Chocolate con leche Milka 150 grs",119.99,"Chocolate-Milka-Con-Leche-150-Gr-1-26505.webp",2,0,"2022-08-26 21:59:17","2022-09-02 14:31:45",NULL,1000),(3,"Limpiavidrios Mr Musculo","Repuesto Mr Musculo Limpiavirios 900ml",89.50,"Limpiador-Vidrios-Y-Multiuso-Doy-Pack-Mr-Musculo-900-Ml-1-249086.webp",3,0,"2022-08-26 21:59:17","2022-09-02 14:41:46",NULL,1000),(4,"Leche La Serenisima Zero","Leche larga vida zero lactosa La Serenísima 1L ",240.00,"Leche-Ls-Uat-Pa-Desc-Zero-Lact-For-Vit-1-859051.webp",6,0,"2022-08-26 21:59:17","2022-09-15 23:02:14",NULL,1000),(5,"Paso de los Toros Pomelo","Gaseosa Paso de los toros Pomelo 1.5Lts",136.00,"Gaseosa-Paso-De-Los-Toros-Pomelo-15l-1-248189.webp",1,1,"2022-08-26 21:59:17","2022-09-02 14:42:18",NULL,1000),(6,"Carne Picada","Carne Picada Especial ALCER",223.75,"Picada-Especial-1-861724.webp",4,0,"2022-08-26 21:59:17","2022-09-02 14:38:54",NULL,1000),(7,"Coca-Cola Sin Azúcar 1.75Lts","Gaseosa marca Coca-Cola, Sin Azúcar. 1,75lt",223.99,"Gaseosa-Coca-Cola-Sin-Azucar-1-75lt-1-367450.webp",1,0,"2022-08-26 21:59:17","2022-09-02 14:42:27",NULL,1000),(8,"DogChow Pollo 100gr","Alimento Para Perros marca Dog-Chow sabor Pollo. Envase 100grs",356.00,"img-1656903138829-DogChow-Pollo-100gr.webp",5,1,"2022-08-26 21:59:17","2022-08-26 21:59:17",NULL,1000),(9,"Ayudín Clásica","Lavandina clásica marca Ayudín. Envase de 2Lts",475.00,"img-1656903217106-Ayudín-Clásica.webp",3,1,"2022-08-26 21:59:17","2022-08-26 21:59:17",NULL,1000),(10,"Antitranspirante Rexona Fútbol","Desodorante Antitranspirante Rexona FútbolFanatics En Aerosol 150ml",400.20,"img-1656903272269-Antitranspirante-Rexona-Fútbol.webp",3,0,"2022-08-26 21:59:17","2022-08-26 21:59:17",NULL,1000),(11,"Antitranspirante Rexona Invisible","Desodorante Antitranspirante Rexona Invisible En Aerosol 150ml",420.00,"img-1656903324076-Antitranspirante-Rexona-Invisible.webp",3,1,"2022-08-26 21:59:17","2022-08-26 21:59:17",NULL,1000),(12,"Pure de Tomate Salsati","Pure De Tomate marca Salsati 520gr",560.00,"img-1656903373286-Pure-de-Tomate-Salsati.webp",5,0,"2022-08-26 21:59:17","2022-08-26 21:59:17",NULL,1000),(13,"Lechuga Criolla","Lechuga Criolla. Precio por Kilo",60.75,"img-1656903422208-Lechuga-Criolla.webp",5,0,"2022-08-26 21:59:17","2022-09-02 14:33:03",NULL,1000),(14,"LimpiaVidrios CIF","Limpiador de Vidrios Cif Bio Original 375gr",359.99,"img-1656903473984-LimpiaVidrios-CIF.webp",3,1,"2022-08-26 21:59:17","2022-09-15 23:01:58",NULL,1000),(15,"Ades Manzana","Jugo Ades-Soja sabor Manzana 1-Lt",426.00,"img-1656903510401-Ades-Manzana.webp",1,0,"2022-08-26 21:59:17","2022-08-26 21:59:17",NULL,1000),(16,"Papas Mc Cain Tradicionales","Papas Tradicional Mc Cain Bsa 720 Grm",236.77,"img-1660694127063-Papas-Mc-Cain-Tradicionales.jpg",5,0,"2022-08-26 21:59:17","2022-09-20 20:43:32",NULL,1000),(76,"GATORADE Manzana","Bebida Isotónica GATORADE Manzana Botella 1,25 L ",303.19,"img-1661950243716-gatorade.jpg",1,0,"2022-08-31 12:50:43","2022-08-31 12:50:43",NULL,1000),(77,"Yerba Mate Hierbas Serranas Chamigo","Yerba Mate Hierbas Serranas Chamigo Paq 500 Grm",307.60,"img-1662128501980-yerba-chamigo.jpg",5,0,"2022-09-02 14:21:41","2022-09-15 23:01:43",NULL,1001),(78,"Pañuelos ELITE","Pañuelos ELITE Doble Hoja Caja 75 Unidades ",167.99,"img-1662130454085-elite.jpg",3,0,"2022-09-02 14:54:14","2022-09-04 23:11:36",NULL,105),(79,"Alfajor Terrabusi","Alfajor Terrabusi Chocolate",120.00,"img-1662848343566-Alfajor-Terrabusi.jpg",2,0,"2022-09-10 22:19:03","2022-09-10 22:19:03",NULL,200),(80,"Leche Las Tres Niñas 1 litro","0 Lactosa Uat Vitaminas / Zinc",244.00,"img-1663704873796-Leche-Las-Tres-Niñas-1-litro.webp",6,0,"2022-09-20 20:14:33","2022-09-20 20:14:33",NULL,10),(81,"Manteca Clásica La Serenísima 200gr","Manteca calidad extra. Libre de gluten. Fuente de vitaminas A, D y E.",427.00,"img-1663704985174-Manteca-Clásica-La-Serenísima-200gr.webp",6,0,"2022-09-20 20:16:25","2022-09-20 20:16:25",NULL,10),(82,"Manteca Light La Serenísima 200gr","Manteca dietética, reducida en calorías, reducida en grasas. Libre de gluten.",428.00,"img-1663705074571-Manteca-Light-La-Serenísima-200gr.webp",6,0,"2022-09-20 20:17:54","2022-09-20 20:17:54",NULL,10),(83,"Yogur Ser Natur 300 gr","Sin lactosa. Sin endulzantes artificiales. Endulzado sólo con stevia.",357.00,"img-1663705656409-Yogur-Ser-Natur-300-gr.webp",6,0,"2022-09-20 20:27:36","2022-09-20 20:27:36",NULL,10),(84,"Yogur Ser Con Cereal Pote 155 gr","Con probióticos, antioxidantes y proteínas.",271.00,"img-1663705839547-Yogur-Ser-Con-Cereal-Pote-155-gr.webp",6,0,"2022-09-20 20:30:39","2022-09-20 20:30:39",NULL,10),(85,"Yog Light Milkaut Cremoso Vainilla 190g","Fortificado con vitamina D y zinc",132.00,"img-1663705975628-Yog-Light-Milkaut-Cremoso-Vainilla-190g.webp",6,0,"2022-09-20 20:32:55","2022-09-20 20:32:55",NULL,10),(86,"Queso Port Salut La Serenísima por kg","30gr de queso aporta el mismo calcio que un vaso de leche",1735.00,"img-1663706117450-Queso-Port-Salut-La-Serenísima-por-kg.webp",6,0,"2022-09-20 20:35:17","2022-09-20 20:35:17",NULL,10),(87,"Queso Port Salut Light La Serenísima paquete por kg","Queso por salut dietético. Sin lactosa.",2129.00,"img-1663706181066-Queso-Port-Salut-Light-La-Serenísima-paquete-por-kg.webp",6,0,"2022-09-20 20:36:21","2022-09-20 20:36:21",NULL,10),(88,"7up 2.25l","7up Lima Limón 2.25 litros",370.00,"img-1663706318690-7up-2.25l.webp",1,0,"2022-09-20 20:38:38","2022-09-20 20:38:38",NULL,10),(89,"Gaseosa Cola Pepsi Regular 2.25l","Gaseosa Cola Pepsi Regular",373.00,"img-1663706380650-Gaseosa-Cola-Pepsi-Regular-2.25l.webp",1,0,"2022-09-20 20:39:40","2022-09-20 20:39:40",NULL,10),(90,"Cerveza Stella Artois 975 Cc","Cerveza Stella Artois Pura Malta Retornable",489.00,"img-1663706478711-Cerveza-Stella-Artois-975-Cc.webp",1,0,"2022-09-20 20:41:18","2022-09-20 20:41:18",NULL,10),(91,"Cerveza Andes Rubia Ret 1lt","Cerveza Andes Rubia Ret 1lt",390.00,"img-1663706516716-Cerveza-Andes-Rubia-Ret-1lt.webp",1,0,"2022-09-20 20:41:56","2022-09-20 20:41:56",NULL,10),(92,"Cerveza Roja Patagonia Amber Lager 730 Ml","Cerveza Roja Patagonia Amber Lager Botella Descartable",499.00,"img-1663706557794-Cerveza-Roja-Patagonia-Amber-Lager-730-Ml.webp",1,0,"2022-09-20 20:42:37","2022-09-20 20:42:37",NULL,10),(93,"Alfajor Blanco Terrabusi 38 Gr","Alfajor Blanco Con Dulce De Leche Terrabusi 38 Gr",120.00,"img-1663706669385-Alfajor-Blanco-Terrabusi-38-Gr.webp",2,0,"2022-09-20 20:44:29","2022-09-20 20:44:29",NULL,10),(94,"Alfajor Tofi Negro 46 Gr","Alfajor Tofi Negro 46 Gr",103.00,"img-1663706723789-Alfajor-Tofi-Negro-46-Gr.webp",2,0,"2022-09-20 20:45:23","2022-09-20 20:45:23",NULL,10),(95,"Caramelos Butter Toffees Dulce De Leche 140g","Caramelos Butter Toffees Dulce De Leche 140g",362.00,"img-1663706791025-Caramelos-Butter-Toffees-Dulce-De-Leche-140g.webp",2,0,"2022-09-20 20:46:31","2022-09-20 20:46:31",NULL,10),(96,"Caramelos Halls Strong Lyptus 25,2 Gr","Caramelos Halls Strong Lyptus 25,2 Gr",95.00,"img-1663706812744-Caramelos-Halls-Strong-Lyptus-25,2-Gr.webp",2,0,"2022-09-20 20:46:52","2022-09-20 20:46:52",NULL,10),(97,"Chocolate Aguila Para Taza 150 Gr","Chocolate Aguila Para Taza 150 Gr",363.00,"img-1663706867365-Chocolate-Aguila-Para-Taza-150-Gr.webp",2,0,"2022-09-20 20:47:47","2022-09-20 20:47:47",NULL,10),(98,"Chocolate Kinder 100 Gr","8 barras de chocolate con leche rellenas",452.00,"img-1663706918505-Chocolate-Kinder-100-Gr.webp",2,0,"2022-09-20 20:48:38","2022-09-20 20:48:38",NULL,10),(99,"Chocolate Toblerone Clasico 100gr","Swiss millk chocolate with honey and almond nougat",681.00,"img-1663706964536-Chocolate-Toblerone-Clasico-100gr.webp",2,0,"2022-09-20 20:49:24","2022-09-20 20:49:24",NULL,10),(100,"Suprema De Pollo Granel X Kg","Suprema De Pollo Granel X Kg",1025.00,"img-1663707009521-Suprema-De-Pollo-Granel-X-Kg.webp",4,0,"2022-09-20 20:50:09","2022-09-20 20:50:09",NULL,10),(101,"Milanesa Bola De Lomo","Milanesa Bola De Lomo",1385.00,"img-1663707032596-Milanesa-Bola-De-Lomo.webp",4,0,"2022-09-20 20:50:32","2022-09-20 20:50:32",NULL,10),(102,"Te Negro Clasico Green Hills Momento 100 Saquitos","Saquitos en sobre de 2gr",622.00,"img-1663707134236-Te-Negro-Clasico-Green-Hills-Momento-100-Saquitos.webp",5,0,"2022-09-20 20:52:14","2022-09-20 20:52:14",NULL,10),(103,"Té Taragui Filtro Diamantado X 100 Saquitos","100 saquitos de 2gr. Hecho en Corrientes.",382.00,"img-1663707186657-Té-Taragui-Filtro-Diamantado-X-100-Saquitos.webp",5,0,"2022-09-20 20:53:06","2022-09-20 20:53:06",NULL,10);

UNLOCK TABLES;


DROP TABLE IF EXISTS "products_categories";
CREATE TABLE "products_categories" (
  "id" int NOT NULL AUTO_INCREMENT,
  "name" varchar(255) NOT NULL,
  "description" varchar(500) DEFAULT NULL,
  PRIMARY KEY ("id")
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8mb4_0900_ai_ci;

LOCK TABLES "products_categories" WRITE;

INSERT INTO "products_categories" VALUES (1,"Bebidas","Bebidas"),(2,"Golosinas","Golosinas"),(3,"Limpieza","Limpieza"),(4,"Carnicería","Carnicería"),(5,"Almacén","Almacén"),(6,"Lácteos","Lácteos");

UNLOCK TABLES;

DROP TABLE IF EXISTS "users";

CREATE TABLE "users" (
  "id" int NOT NULL AUTO_INCREMENT,
  "email" varchar(255) NOT NULL,
  "password" varchar(255) NOT NULL,
  "category" varchar(255) NOT NULL,
  "name" varchar(255) NOT NULL,
  "last_name" varchar(255) NOT NULL,
  "birth_date" date NOT NULL,
  "profil_photo" varchar(500) DEFAULT NULL,
  "createdAt" datetime DEFAULT NULL,
  "updatedAt" datetime DEFAULT NULL,
  "deletedAt" datetime DEFAULT NULL,
  PRIMARY KEY ("id")
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8mb4_0900_ai_ci;

LOCK TABLES "users" WRITE;

INSERT INTO "users" VALUES (1,"manu@alcer.com","$2a$10$fIuFL9tk1/UKNtuOa45d3OUPj4VR.q/hLqYj77goSfJJ6fwmi9BGq","adminUser","manu","manu","2022-08-02","1661952854210.jpg","2022-08-31 13:34:14","2022-08-31 13:34:14",NULL),(2,"manucomun@alcer.com","$2a$10$5t8uqiB9YSX2d1D/E2nLx.ybvAENdsx.0yr.LSJNL5gdrhHh07O..","normalUser","ma","sdad","2022-09-21","defaultUser.png","2022-09-06 23:29:14","2022-09-06 23:29:14",NULL),(3,"otro@usuario.com","$2a$10$isJgT2yYEz1AyeQhmi6iQu6TsJEyc9XGqL2hZgkJb8jYRsQbTHeca","normalUser","otro","yosd","2022-09-20","1662565815143.jpg","2022-09-07 15:29:50","2022-09-07 15:50:57",NULL),(4,"prueba@prueba.com","$2a$10$LdD1H4bFKULw1GMuAw/TrufNKBaeZFNTH5maVuw5eCsced4ISY67.","adminUser","Juan","Perez","1990-10-30","1663704473017.jpg","2022-09-13 15:14:48","2022-09-20 20:07:53",NULL),(5,"js.urquiza@gmail.com","$2a$10$1LinG1RVPey1zttFa/sh5eSi4MECjhkzbV/M1EvmfBRXqZskk16MG","normalUser","Juan Santiago","Urquiza","1990-10-30","1663704478505.jpg","2022-09-15 13:04:03","2022-09-20 20:07:58",NULL),(6,"usuario@alcer.com","$2a$10$EPEc56EviH4aHG96pxElw.dDxEGTojpm/k5CX16jD2E5Mp8dz9L.C","normalUser","Usuario","Generico","2000-10-23","defaultUser.png","2022-09-15 22:18:15","2022-09-15 22:18:15",NULL);

UNLOCK TABLES;
