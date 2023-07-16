import { NestFactory } from '@nestjs/core';
import { AppModule } from './app.module';

import { FancyLogger } from 'fancy-logger';

async function bootstrap() {
  const app = await NestFactory.create(AppModule);
  await app.listen(3000);

  FancyLogger.log('Backend has started');
}
bootstrap();
