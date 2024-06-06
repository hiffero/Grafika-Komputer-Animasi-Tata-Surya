PImage sunTexture, mercuryTexture, venusTexture, earthTexture, marsTexture, jupiterTexture, saturnTexture, uranusTexture, neptuneTexture;
PShape sun, mercury, venus, earth, mars, jupiter, saturn, uranus, neptune;
ArrayList<Star> stars = new ArrayList<Star>();

float rotationSpeed = 0.01;
float sunRadius = 100; // Perbesar ukuran Matahari
float distanceScale = 2.0; // Perbesar skala jarak planet dari Matahari

void setup() {
  size(1500, 800, P3D);
  sunTexture = loadImage("sun_texture.jpg");
  mercuryTexture = loadImage("mercury_texture.png");
  venusTexture = loadImage("venus_texture.jpg");
  earthTexture = loadImage("earth_texture.jpeg");
  marsTexture = loadImage("mars_texture.jpg");
  jupiterTexture = loadImage("jupiter_texture.jpg");
  saturnTexture = loadImage("saturn_texture.jpg");
  uranusTexture = loadImage("uranus_texture.jpg");
  neptuneTexture = loadImage("neptune_texture.jpg");

  sun = createTexturedSphere(sunRadius, sunTexture);
  mercury = createTexturedSphere(10, mercuryTexture); // Perbesar ukuran Merkurius
  venus = createTexturedSphere(18, venusTexture); // Perbesar ukuran Venus
  earth = createTexturedSphere(20, earthTexture); // Perbesar ukuran Bumi
  mars = createTexturedSphere(15, marsTexture); // Perbesar ukuran Mars
  jupiter = createTexturedSphere(50, jupiterTexture); // Perbesar ukuran Jupiter
  saturn = createTexturedSphere(35, saturnTexture); // Perbesar ukuran Saturnus
  uranus = createTexturedSphere(30, uranusTexture); // Perbesar ukuran Uranus
  neptune = createTexturedSphere(25, neptuneTexture); // Perbesar ukuran Neptunus
  
  // Inisialisasi bintang
  for (int i = 0; i < 100; i++) {
    stars.add(new Star());
  }
}

void draw() {
  background(0);
  lights(); // Menambahkan pencahayaan
  drawStars(); // Gambar bintang pada latar belakang
  translate(width / 2, height / 2);
  
  rotateScene(); // Putar pemandangan berdasarkan interaksi pengguna
  
  drawSun();
  drawPlanets();
}

void drawSun() {
  shape(sun, 0, 0);
}

void drawPlanets() {
  pushMatrix();
  rotateY(radians(frameCount * rotationSpeed));
  translate(distanceScale * 100, 0); // Perbesar jarak orbit Merkurius
  shape(mercury, 0, 0);
  popMatrix();

  pushMatrix();
  rotateY(radians(frameCount * rotationSpeed) / 1.6);
  translate(distanceScale * 180, 0); // Perbesar jarak orbit Venus
  shape(venus, 0, 0);
  popMatrix();

  pushMatrix();
  rotateY(radians(frameCount * rotationSpeed) / 2);
  translate(distanceScale * 250, 0); // Perbesar jarak orbit Bumi
  shape(earth, 0, 0);
  popMatrix();

  pushMatrix();
  rotateY(radians(frameCount * rotationSpeed) / 2.5);
  translate(distanceScale * 300, 0); // Perbesar jarak orbit Mars
  shape(mars, 0, 0);
  popMatrix();

  pushMatrix();
  rotateY(radians(frameCount * rotationSpeed) / 3);
  translate(distanceScale * 450, 0); // Perbesar jarak orbit Jupiter
  shape(jupiter, 0, 0);
  popMatrix();

  pushMatrix();
  rotateY(radians(frameCount * rotationSpeed) / 3.5);
  translate(distanceScale * 600, 0); // Perbesar jarak orbit Saturnus
  shape(saturn, 0, 0);
  popMatrix();

  pushMatrix();
  rotateY(radians(frameCount * rotationSpeed) / 4);
  translate(distanceScale * 750, 0); // Perbesar jarak orbit Uranus
  shape(uranus, 0, 0);
  popMatrix();

  pushMatrix();
  rotateY(radians(frameCount * rotationSpeed) / 4.5);
  translate(distanceScale * 900, 0); // Perbesar jarak orbit Neptunus
  shape(neptune, 0, 0);
  popMatrix();
}

void rotateScene() {
  rotateY(frameCount * 0.01);
}

PShape createTexturedSphere(float radius, PImage texture) {
  PShape sphere = createShape(SPHERE, radius);
  sphere.setTextureMode(NORMAL); // Mode tekstur NORMAL
  sphere.setTexture(texture);
  sphere.noStroke(); // Menghilangkan garis luar (stroke)
  return sphere;
}

void drawStars() {
  for (Star star : stars) {
    star.update();
    star.display();
  }
}

class Star {
  float x, y;
  float speed;
  
  Star() {
    x = random(-width / 2, width / 2);
    y = random(-height / 2, height / 2);
    speed = random(1, 3);
  }
  
  void update() {
    x -= speed;
    if (x < -width / 2) {
      x = width / 2;
      y = random(-height / 2, height / 2);
    }
  }
  
  void display() {
    noStroke();
    fill(255);
    ellipse(x, y, 2, 2);
  }
}
