# Flutter Weather

## Descripción

Esta aplicación de clima, ofrece una experiencia de usuario sencilla y funcional para obtener datos meteorológicos en tiempo real. A pesar de su simplicidad, este proyecto fue diseñado para explorar las diferencias en el desarrollo de aplicaciones móviles entre Flutter y otros frameworks como Kotlin y SwiftUI. La aplicación demuestra cómo Flutter facilita el manejo de la arquitectura y la integración de servicios de terceros, simplificando significativamente el proceso de desarrollo en comparación con otras tecnologías.

### Enfoque en la Sencillez y Eficiencia

-Aunque la aplicacion pueda parecer sencilla al usar weather, no es la intencion en si, ya que el poner una entidad de clima y hacer unas llamadas es algo que se hace en  multidud de ocaciones, y podria copiar y pegar, la intencion del proyecto es usar el potencial de flutter con librerias que no he tocado.

- Implementada con la librería Weather, la aplicación ahorra la necesidad de definir entidades complejas, permitiendo una integración directa y eficiente con la API de clima.
- Utiliza el patrón BLoC (Business Logic Component) para la gestión del estado, lo que ayuda a mantener una arquitectura clara y concisa.
- Evita la sobreingeniería, como la incorporación de casos de uso y otros elementos de la arquitectura limpia, lo cual es una ventaja en aplicaciones de este tamaño.

## Características

- Búsqueda del clima por ciudad.
- Colores dinamicos dependiendo de la hora.
- Visualización de la temperatura actual, máxima y mínima.
- Información sobre las condiciones climáticas.
- Datos sobre la hora de amanecer y puesta del sol.
- Cambio dinámico de idioma entre español e inglés.

## Tecnologías Utilizadas y Recursos

- Flutter para el desarrollo multiplataforma.
- BLoC para la gestión del estado.
- Easy Localization para la internacionalización.
- API de Weather para obtener datos meteorológicos.

## Instalación

Actualmente ya tiene una API KEY funcional de openweathermap.

