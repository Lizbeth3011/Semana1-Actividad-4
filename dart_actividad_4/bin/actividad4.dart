//GESTIÓN DE CALIFICACIONES DE ESTUDIANTES

// Definir la clase Estudiante que contiene el nombre y las calificaciones por asignatura

class Estudiante{
  String nombre;
  //Creación de mapa para las asignaturas y calificaciones
  Map<String, double> calificaciones;
  Estudiante (this.nombre, this.calificaciones);

  //Función para calcular el promedio de los estudiantes
  double promedioEstudiantes(){
    double suma = calificaciones.values.reduce((a,b)=>a+b);
    return suma / calificaciones.length;
  }

  @override
  String toString() {
    return 'Estudiante: $nombre, Promedio: ${promedioEstudiantes().toStringAsFixed(2)}';
  }
}

// Definir clase Escuela para la gestión de estudiantes y sus notas
class Escuela{
  //crear lista de Estudiantes con list
  List<Estudiante> estudiantes =[];

  //Función para agregar un estudiante y sus notas
  void agregarEstudiante(Estudiante estudiante){
    estudiantes.add(estudiante); //Agregar estudiantes con la operación add
    print('El estudiante ${estudiante.nombre} se agrego correctamente.');
  }

  //Función para calcular el promedio de cada estudiante
  void calcularPromedioEstudiantes(){
    for(var estudiante in estudiantes){
      double promedio = estudiante.promedioEstudiantes();
      print('El promedio de ${estudiante.nombre} es: ${promedio.toStringAsFixed(2)}');
    }
  }

  //Función para Determinar la calificación más alta y más baja para cada asignatura. 
  void maxMinAsignatura(){
    if(estudiantes.isEmpty){
      print('No hay estudiantes registrados.');
      return;
    }
  
  //Realizar mapas de notas max y min
  Map<String, double> calificacionesMax = {};
  Map<String, double> calificacionesMin ={};

    for (var estudiante in estudiantes) {
      estudiante.calificaciones.forEach((asignatura, calificacion) {
        if (!calificacionesMax.containsKey(asignatura)) {
          calificacionesMax[asignatura] = calificacion;
          calificacionesMin[asignatura] = calificacion;
        } else {
          if (calificacion > calificacionesMax[asignatura]!) {
            calificacionesMax[asignatura] = calificacion;
          }
          if (calificacion < calificacionesMin[asignatura]!) {
            calificacionesMin[asignatura] = calificacion;
          }
        }
      });
    }

  // Mostrar la calificación más alta y más baja por asignatura

    calificacionesMax.forEach((asignatura, max) {
        print('Asignatura: $asignatura, Calificación más alta: $max, Calificación más baja: ${calificacionesMin[asignatura]}');
    });

  }

  // Función para mostrar los estudiantes con un promedio superior a un valor dado
  void mostrarEstudiantesConPromedioSuperior(double valor) {
    print('Estudiantes con un promedio superior a $valor:');
    estudiantes
        .where((estudiante) => estudiante.promedioEstudiantes() > valor)
        .forEach((estudiante) => print(estudiante));
  }

  // Función para ordenar a los estudiantes por su promedio de forma ascendente o descendente

  void ordenarEstudiantes({bool ascendente = true}){
    estudiantes.sort((a,b) => ascendente
      ? a.promedioEstudiantes().compareTo(b.promedioEstudiantes())
      : b.promedioEstudiantes().compareTo(a.promedioEstudiantes()));
    print('Estudiantes ordenados por promedio (${ascendente ? "ascendente" : "descendente"}):');
    estudiantes.forEach((print));
  }
}
  void main() {
  // Crear una instancia de la clase Escuela
  Escuela escuela = Escuela();

  // Agregar estudiantes con sus respectivas calificaciones
  escuela.agregarEstudiante(Estudiante('Lizbeth', {'Lenguaje': 10, 'Dibujo': 8, 'Computación': 9}));
  escuela.agregarEstudiante(Estudiante('Rocío', {'Lenguaje': 9, 'Dibujo': 7, 'Computación': 8}));
  escuela.agregarEstudiante(Estudiante('Edwin', {'Lenguaje': 7, 'Dibujo': 8, 'Computación': 8}));

  // Calcular y mostrar el promedio de cada estudiante
  escuela.calcularPromedioEstudiantes();

  // Determinar la calificación más alta y más baja por asignatura
  escuela.maxMinAsignatura();

  // Mostrar los estudiantes que tienen un promedio superior a 8
  escuela.mostrarEstudiantesConPromedioSuperior(8);

  // Ordenar los estudiantes por promedio en orden ascendente
  escuela.ordenarEstudiantes(ascendente: true);

  // Ordenar los estudiantes por promedio en orden descendente
  escuela.ordenarEstudiantes(ascendente: false);
  }



