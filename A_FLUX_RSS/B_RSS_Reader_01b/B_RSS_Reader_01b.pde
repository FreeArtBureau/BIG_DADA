/*
::::::::::::::
 DATA_ESAD 2015
 ::::::::::::::
 
 ----------------
 B_RSS_Reader_01b
 ----------------
 WIKIPEDIA RSS 
 PLUS D'INFO : http://fr.wikipedia.org/wiki/Wikipédia:Syndication
 */

////////////////////// GLOBALS
PFont myFont;
int x = 10;
int y = 50;
// Cette variable sert à accéder à un article spécifique 
// et on peut voir ce qui a changé et par qui.
String sujet = "France";

/////////////////////////////////////// SETUP
void setup() {
  size(800, 900);
  background(0);
  smooth();
  myFont = createFont("helvetica", 18);
  textFont(myFont);
  fill(255);

  // Adresse WEB
  // Voir les dernières changements dans un article spécifique
   String url = "http://en.wikipedia.org/w/index.php?title="+sujet+"&action=history&feed=rss"; 

  // Voir les titres des derniers articles changés
  //String url = "http://en.wikipedia.org/w/index.php?title=Special:NewPages&feed=rss"; 

  // On charge l'adresse dans un objet XML 
  XML rss = loadXML( url );


  // Chaque contenu se trouve dans des balises à l'intérieur de la balise <channel>
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

