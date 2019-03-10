int diameter =1;
int rijen_xas = 10;
int rijen_yas = 13;

int a =3;
float xs;
float ys;
boolean b= true;
boolean c =true;
boolean e =true;
PVector[] Vvector = new PVector[6];
PVector[] Cvector = new PVector[6];
void setup() {
  size(500, 500);
  for (int i =0; i<6; i++) {  
    Vvector[i] = new PVector((diameter*10)*sqrt(3), diameter*10);
    Vvector[i].rotate(PI/3*i);
  }
  for (int i =0; i<6; i++) {  
    Cvector[i] = new PVector(Vvector[(i%6)].x +Vvector[((i+1)%6)].x, Vvector[(i%6)].y+Vvector[((i+1)%6)].y);
    Cvector[i].div(2);
  }
}

void draw() {
  if(c){
  frameRate(3);
  if (b) {
      background(random(0, 155), random(0, 155), random(0, 155));
    for (int i =0; i<6; i++) {  
      Cvector[i].add(Cvector[i]);
      Cvector[i].mult(0.635);
    }
    a++;
  }
  if (!b) {
      background(random(0, 155), random(0, 155), random(0, 155));
    for (int i =0; i<6; i++) {  
      Cvector[i].div(1.27);
    }
    a--;
  }
  if (a>7) {
    b =false;
  }
  if (a<5) {
    e =false;
    // b =true;
  }
  /*  if(Cvector[0].y - Vvector[0].y <10*diameter){
   println(Cvector[0].y);
   }*/
  if (!e) {
    boolean f4 =true;
    xs =sqrt(pow(Cvector[0].x, 2) +pow(Cvector[0].y, 2))*3;
    ys =sqrt(pow(Cvector[0].x, 2) +pow(Cvector[0].y, 2))*0.85;
    float w = floor(rijen_xas/1.01);
    float q = floor(rijen_yas*2.3);
    if (w <1) {
      w =1; 
      q =1;
    }
    for (int i =0; i<  w; i++) {  
      for (int j =0; j<q; j++) {  
        if (j%2 ==0) {
          shape(i, j, f4);
          line(Cvector[1].x +(i)*xs, Cvector[1].y+(j)*ys, (i)*xs, (j+0)*ys);
          line(Cvector[3].x +(i)*xs, Cvector[3].y+(j)*ys, (i)*xs, (j+0)*ys);
          line(Cvector[5].x +(i)*xs, Cvector[5].y+(j)*ys, (i)*xs, (j+0)*ys);
        }
        if (j%2 ==1) {
          shape(i+0.5, j, f4);
          line(Cvector[1].x +(i+0.5)*xs, Cvector[1].y+(j)*ys, (i+0.5)*xs, (j+0)*ys);
          line(Cvector[3].x +(i+0.5)*xs, Cvector[3].y+(j)*ys, (i+0.5)*xs, (j+0)*ys);
          line(Cvector[5].x +(i+0.5)*xs, Cvector[5].y+(j)*ys, (i+0.5)*xs, (j+0)*ys);
        }
      }
    }
    e = true;
    b =true;
  } else if (e) {
    boolean f4 =false;
    xs =sqrt(pow(Cvector[0].x, 2) +pow(Cvector[0].y, 2))*2;
    ys =sqrt(pow(Cvector[0].x, 2) +pow(Cvector[0].y, 2))*1.8;

    for (int i =0; i<rijen_xas; i++) {  
      for (int j =0; j<rijen_yas; j++) {  
        if (j%2 ==0) {
          shape(i, j, f4);
        }
        if (j%2 ==1) {
          shape(i+0.5, j, f4);
        }
      }
    }
  }
  }
}
void mousePressed() {
  if (c) {
    c= false;
  } else {
    c= true;
  }
}

void shape(float i,float j, boolean f4) {
  float l =0.5;
  float r =0.8;
  beginShape();

  for (int k =0; k<6; k++) {  
    fill((240/rijen_xas)+(i)*(240/rijen_xas), (240/rijen_xas)+(j)*(240/rijen_yas), (i)*(j)*((120/rijen_xas+120/rijen_yas)/2));
    vertex(Vvector[k].x +(i)*xs, Vvector[k].y +(j)*ys);
    vertex(Cvector[k].x+(i)*xs, Cvector[k].y +(j)*ys);
    if (a>7) {
      vertex(Vvector[k].x*l +(i)*xs, Vvector[k].y*l +(j)*ys);
      vertex(Cvector[k].x*l+(i)*xs, Cvector[k].y*l +(j)*ys);
    }
  } 
  endShape(CLOSE);

  if (a ==7) {
    beginShape();
    for (int k =0; k<6; k++) {
      fill(random(155, 255), random(155, 255), random(155, 255));
      vertex(Vvector[k].x*l +(i)*xs, Vvector[k].y*l +(j)*ys);
      vertex(Cvector[k].x*r+(i)*xs, Cvector[k].y*r +(j)*ys);
    }
    endShape(CLOSE);
  }
}
