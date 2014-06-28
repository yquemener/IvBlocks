class Zone{
  int x,y,w,h;
  String label;
  boolean toggled;
  String behavior;
  
  Zone(int _x, int _y, int _w, int _h, String _label, String _b)
  {
    x=_x; y=_y; w=_w; h=_h;
    label = _label;
    toggled = false;
    behavior=_b;
  }
  
  void draw()
  {
    stroke(255);
    if(toggled)
    {
      fill(255);
      rect(x,y,w,h);
      fill(0);
    }
    else
    {
      fill(0);
      rect(x,y,w,h);
      fill(255);
    }
    textSize(20);
    textAlign(CENTER,CENTER);
    text(label, x,y,w,h);
  }
  
  boolean inside(int _x, int _y)
  {
    return (_x>x && _x<x+w && _y>y && _y<y+h);
  }
}
