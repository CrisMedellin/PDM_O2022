part of 'search_bar_bloc.dart';

// @immutable
// abstract class SearchBarState {}

// class SearchBarInitial extends SearchBarState {}

class SearchBarState {

  final String search;
  final String searchLen;
  final String bookArr;
  final String bookToShare;
  final String currentBook;

  SearchBarState({
    this.search       = 'robert kiyosaki', 
    this.searchLen    = '0', 
    this.bookArr      = '[]', 
    this.bookToShare  =  '{}', 
    this.currentBook  = '{"title":"Padre Rico Padre Pobre", "author":"Robert Kiyosaki", "image":"http://books.google.com/books/content?id=aXUkDwAAQBAJ&printsec=frontcover&img=1&zoom=5&edge=curl&source=gbs_api", "description":"en50MINUTOS.es te ofrece un análisis rápido y conciso de Padre Rico, Padre Pobre de Robert Kiyosaki, un superventas que cuenta con más de 15 millones de ejemplares vendidos. Si quieres descubrir en un tiempo récord cómo encaminarte hacia la riqueza, ¡en50Minutos.es te lo pone fácil! ¡Comienza hoy mismo a ampliar tus horizontes con en50MINUTOS.es! En tan solo 50 minutos, este libro te aportará: • Una nueva visión sobre la importancia de la contabilidad y la inversión para lograr emanciparte económicamente y no caer en el terrible ciclo del endeudamiento • La solución para deshacerte de la pasividad crónica que lleva al estancamiento financiero y aprender a invertir en activos para generar riqueza • Los trucos para salir de la carrera de la rata, es decir, el condicionamiento que la sociedad nos impone, que nos dice cómo comportarnos en la vida y nos impide crear nuestra propia riqueza Sobre en50MINUTOS.es | Book Review en50MINUTOS.es te ofrece análisis rápidos y prácticos de grandes superventas que te ayudarán a triunfar tanto en el ámbito profesional como en la esfera privada. Nuestras obras sintetizan los libros de forma completa y ágil, para que puedas sacarles todo el jugo sin perder ni un minuto. ¿A qué esperas para marcar la diferencia? Con Book Review en50MINUTOS.es, ¡atrévete a pensar en grande!", "date":"2017-05-19"}'
  });

}

