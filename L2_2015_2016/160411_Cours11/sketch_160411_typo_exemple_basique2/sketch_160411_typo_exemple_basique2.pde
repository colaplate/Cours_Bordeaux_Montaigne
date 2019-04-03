// ----------------------------------------------
// Importation de la librairie PDF (Sketch > importer une librairie...)
import processing.pdf.*;

// ----------------------------------------------
TypoManager typo;
PVector[] points; // tableau de PVector
boolean export = false;

// ----------------------------------------------
void setup()
{
  // Taille du sketch
  size(800, 800);
  // Objet qui prend en paramètre : 
  // le nom de la fonte, le texte, la distance entre les points (en px)
  typo = new TypoManager(this, "futura.ttf", "A", 5);
  // Récupération de la liste de points générés
  points = typo.listePoints;
  // Démarrage de l'export pdf
}

// ----------------------------------------------
void draw()
{
  if (export)
  {
    beginRecord(PDF, "export.pdf");
  }
  background(255);
  // Pour tous les points de la liste
  for (int i=0; i<points.length ;i++)
  {
    float d = map(float(i) / (float(points.length-1)/2), 0, 1, 30, 60);
    ellipse(points[i].x, points[i].y, d, d);
  }
  if (export)
  {
    endRecord();
    export = false;
  }
}

// ----------------------------------------------
void keyPressed()
{
  if (key == ' ')
  {
    export = true;
  }
  if (key == 's')
  {
    saveFrame("export.png");
  }
}

