# B-FY

Para levantar los servidores primero se debe instalar las dependencias tanto del
cms como del site, con el comando:

```sh
npm install
```

luego se levanta el cms, cuando ya esté levantado se debe asegurar
que el site apuente a la url de magnoliaPublic, configurando el archivo `.env`
que se encuentra en el directorio `site`.

Una vez hecho esto se levanta el site con la siguiente secuencia de comandos:

1. `npm run build`
2. `node diist/server/entry.mjs`
