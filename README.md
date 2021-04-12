# Song Mixer
Autor: Yone Hernández León

### Descripción de la aplicación
La aplicación consiste en un mixer de psitas de sonido con el cual se puede combinar diferentes conjuntos de pistas de una misma canción y visualizar las frecuencias de las mismas.

### Controles de la aplicación
- Botones Z, X, C, V, B, N y M para encender y apagar las pistas de la canción.
- Boton ESPACIO para apagar todas las pistas.

### Caracteristicas de la aplicación
La aplicación permite:
- Encender y apagar las distintas pistas de la canción.
- Ver las frecuencias (derecha e izquierda) de cada pista, diferenciadas por colores
- Apagar todas las pistas a la vez.

### Decisiones adoptadas para la solución propuesta
Para completar la aplciación, primero se creo la ventana y se dividió el fondo donde se muestran las frecuecias y el panel donde se encuentran los botones. Acto seguido, se implementaron dichos botones y se relacionó a cada uno con un boton, un color y una pista de la canción. Se siguió el desarrollo implementando a reproducción de las pistas en bucle y se completó la funcionalidad de los botones. Finalmente, se implementó una clase para la representación de las frecuencias, y se pulieron los detalles y corrigieron errores.

### Resultado de la aplicación
![Animación 1](https://github.com/YoneHernandezLeon/SoundMixer/blob/main/soundmixer.gif?raw=true)

### Errores conocidos
No existen errores conocidos.

### Referencias
##### Sonidos:
- Creados originalmente
#### Frafmentos de código:
- Clase WaveformRenderer, de la cual se tomó referencia para la implementación en la aplicación: http://code.compartmental.net/minim/audioplayer_method_addlistener.html
##### Lenguaje de programación:
- https://processing.org/reference/
