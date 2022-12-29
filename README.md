# Veracode Pipeline con Docker-Compose

Veracode Pipeline Scan CI tool escanea un archivo binario preconstruido para su análisis.

Los requisitos previos para usar PipelineScan son Java 8 , las credenciales, y el proyecto compilado antes de intentar escanear. Para lo anterior, se diseñó un docker-compose que permite hacer uso de PipelineScan rápidamente con la finalidad de realizar las primeras pruebas.


## About

La herramienta de CI `pipeline-scan` está diseñada para usarse en un pipeline CI/CD para realizar el análisis de seguridad del binario construido. Admite escaneos de código Java, JavaScript, Scala, Kotlin, Groovy y Android.

Para obtener más información sobre Pipeline Scan, visite la página del Centro de ayuda de Veracode: https://help.veracode.com/reader/tS9CaFwL4_lbIEWWomsJoA/ovfZGgu96UINQxIuTqRDwg

## Usage

La última versión siempre estará disponible en `https://downloads.veracode.com/securityscan/pipeline-scan-LATEST.zip`.


* Cuando se haya completado el Pipeline Scan:
   * Si no se encuentran problemas, la herramienta devuelve un código de estado de 0 y la tubería debería pasar.
   * Si se encuentran problemas, la herramienta devuelve un código de estado igual a la cantidad de fallas encontradas (hasta 200) y la tubería debería fallar.
   * Si el análisis falla (problemas de red, credenciales de API no válidas, etc.), la herramienta devolverá -1 y la tubería debería fallar.
   * Si el análisis no se completa dentro del tiempo máximo permitido del servicio, la herramienta devolverá -2 y la tubería debería fallar.
   * Si el escaneo no se completa dentro del tiempo especificado por el usuario (a través de la opción `--timeout`), la herramienta devolverá -3 y la tubería debería fallar.



### Paso 1. Copie sus credenciales

Copie sus credenciales api_key_id y api_key_secret en el archivo `credentials` como se muestra a continuación:

~~~
[default]
veracode_api_key_id = apikeyid123
veracode_api_key_secret = apikeysecret456
~~~



### Paso 2. Agregue el archivo binario

Copie el binario que desea escanear a la carpeta `binarios`.



### Paso 3. Edite el script

Indique en el script `scripts/scanPipelineScan.sh` los valores `policy` y `binario`.



### Paso 4. Construya la imágen docker

Para construir la imágen de ubuntu donde se va a montar el volumen ejecute:

`docker compose build`

cualquier cambio en el archivo Dockerfile requerirá realizar nuevamente la construcción de la imágen. Los datos en el no se perderán a menos que se elimine el volúmen.



### Paso 5. Ejecute docker compose

Levantar el contenedor con la imágen construída:

`docker compose up`

el paso 1 y 2 se puede resumir con `docker-compose up --build`



### Paso 6. Revise los resultados

Revise los resultados en la carpeta `results`.





&copy; Giovanni Aravena