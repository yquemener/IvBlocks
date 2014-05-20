class Block {
  int x, y;
  String s;
  String behavior;
  
  Block(){
    x=0;y=0;s="_";
    behavior="instance";
  }
  
  Block(int _x, int _y, String _s, String b)
  {
    x=_x;
    y=_y;
    s=_s;
    behavior=b;
  }
  
  void draw() {
    fill(0,0,0);
    noFill();
    stroke(255);
    ellipse(x,y,60,40);
    fill(255,255,255);
    textSize(20);
    textAlign(CENTER,CENTER);
    text(s,x,y);
  }

}