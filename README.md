# Aplicación Mobile de Agendamiento en Flutter

## Descripción

El proyecto es una aplicación móvil diseñada para permitir a los usuarios agendar citas con profesionales de manera eficiente. Ofrece una funcionalidad básica de inicio de sesión para los usuarios y almacena la información de las citas en el dispositivo.

Como almacena datos en local, para revisar el funcionamiento es importante comenzar registrando profesionales.

##### Tecnologías Utilizadas
- Flutter sdk: >=3.1.0 <4.0.0
- shared_preferences 2.0.8
- table_calendar any
- lottie 1.0.1
- cuppertino_icons 1.02

## Ejecución

- Para ver la versión de desarrollo, luego de descargar, ejecutar en la terminal

```
    flutter pub get
```
- Luego para iniciarlo idealmente utilizar un emulador con algún editor de código y ejecutar
```
    flutter run
```

## Modelos de datos

- Los usuarios se almacenan de forma local con la siguiente estructura

```
I/flutter (20752): Id : 1
I/flutter (20752): Nombre: Diego Díaz
I/flutter (20752): Email: email@email.cl
I/flutter (20752): Contraseña: password
I/flutter (20752): -----
I/flutter (20752): Id : 2
I/flutter (20752): Nombre: Fernanda Tapia
I/flutter (20752): Email: email2@email.cl
I/flutter (20752): Contraseña: password
I/flutter (20752): -----
I/flutter (20752): Id : 3
I/flutter (20752): Nombre: Francisco Fernandez
I/flutter (20752): Email: email3@email.cl
I/flutter (20752): Contraseña: password
I/flutter (20752): -----
}
```

Las citas se almacenan de forma local con la siguiente estructura
```
{
    {
        id: 2, 
        idUsuario: 1, 
        fecha: 2023-10-25T00:00:00.000Z, 
        hora: 15:00 PM, 
        nombrePaciente: Giselle Silva, 
        emailPaciente: email@email.cl, 
        telefonoPaciente: 982726554
    }
    {
        id: 3, 
        idUsuario: 5, 
        fecha: 2023-10-24T00:00:00.000Z, 
        hora: 14:00 PM, 
        nombrePaciente: Francisco González, 
        emailPaciente: email@email.cl, 
        telefonoPaciente: 98272647}
}
```
## Imagenes de la aplicación

<img src="https://raw.githubusercontent.com/Dieego533/app-agenda-flutter/master/assets/images/1.JPG" width="200" /> &emsp;&emsp; <img src="https://raw.githubusercontent.com/Dieego533/app-agenda-flutter/master/assets/images/2.JPG" width="200" /> &emsp;&emsp; <img src="https://raw.githubusercontent.com/Dieego533/app-agenda-flutter/master/assets/images/5.JPG" width="200" /> &emsp;&emsp;





### La aplicación debe seguir en desarrollo para 
- Restringir las horas de los profesionales una vez tomadas.
- Personalizar la vista luego de iniciar sesión creando dinamicamente las citas programadas.
- Desarrollar la lógica para asignar un link al agendar la sesión.
- Desarrollar y mejorar las restricciones generales.
- Entre otras mejoras que quedan fuera del contexto de la prueba.
