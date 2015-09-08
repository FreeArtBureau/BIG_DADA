/*
::::::::::::::
 DATA_ESAD 2015
 ::::::::::::::
 
 --------------
 RSS_Reader_01
 --------------
 
 */

///////////////////////////////// GLOBALS //////////////////////////////
PFont myFont;
int x = 10;
int y = 50;

/////////////////////////////////////// SETUP //////////////////////////////
void setup() {
  size(800, 900);
  background(0);
  smooth();
  myFont = createFont("helvetica", 18);
  textFont(myFont);
  fill(255);
  /*
  // Quelques adresses RSS (Il en existe beaucoup donc n'hésitez pas d'essayer d'autres adresses) :
   http://newsrss.bbc.co.uk/rss/newsonline_world_edition/technology/rss.xml
   http://feeds.bbci.co.uk/news/uk/rss.xml
   http://rss.liberation.fr/rss/9/
   http://www.lemonde.fr/rss/une.xml
   http://news.yahoo.com/rss/topstories
   */

  // Adresse WEB
  String url = "http://rss.liberation.fr/rss/9/"; 

  // On charge l'adresse dans un objet XML 
  XML rss = loadXML( url );


  // Chaque contenu se trouve dans des balises à l'intérieur de la balise <channel>
  // On se sert de la méthode getChildren pour accéder à la balise voulue
  XML[] title = rss.getChildren("channel/item/title");
  String s = rss.format(0); // formats XML :–)
  print(s);// Afficher le contenu brut en XML dans la console en bas.

  // Pour afficher le contenu d'une balise, on se sert d'une boucle FOR
  // pour parcourir chaque élément et éventuellement l'afficher.
  for (int i = 0; i < title.length; i++) {    
    text(title[i].getContent(), x, y);
    y+=20;
  }
}

