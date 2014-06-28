int LINE_HEIGHT = 18;

class Text {
  int x,y;
  String s;
  
  Text(int _x, int _y, String _s){
    x=_x;
    y=_y;
    s=_s;
  }
  
  void draw(int px, int py){
    stroke(255);
    fill(255);
    textSize(18);
    textAlign(LEFT,TOP);
    text(s, px+x,py+y);
  }
}

class Block {
  int x, y;
  int w, h;
  ArrayList<Block> children;
  ArrayList<Text> text;
  
  int cursorX, cursorY;
  
  Block(){
    x=0;y=0;
    w=0;h=0;
    cursorX=0;
    cursorY=0;
    children = new ArrayList<Block>();
    text = new ArrayList<Text>();
  }
  
  Block(int _x, int _y){
    x=_x;
    y=_y;
    w=0;h=0;
    cursorX=0;
    cursorY=0;
    children = new ArrayList<Block>();
    text = new ArrayList<Text>();
  }
  
  Block addText(String s){
    Text t = new Text(cursorX, cursorY, s);
    t.x=cursorX;
    t.y=cursorY;
    text.add(t);
    textSize(18);
    cursorX += int(textWidth(s));
    w = max(cursorX, w);
    h = max(cursorY+LINE_HEIGHT, h);
    return this;
  }
        
  Block newLine(){
    cursorX = x;
    cursorY += LINE_HEIGHT;
    w = max(cursorX, w);
    h = max(cursorY+LINE_HEIGHT, h);
    return this;
  }
  
  Block addBlock(Block b){
    /*int dx = cursorX-b.x;
    int dy = cursorY-b.y;
    b.translateAll(dx, dy);*/
    b.x=cursorX;
    b.y=cursorY;
    children.add(b);
    cursorX+=b.width();
    cursorY+=b.height()-LINE_HEIGHT;
    w = max(cursorX, w);
    h = max(cursorY+LINE_HEIGHT, h);
    return this;
  }
  
  
  int width(){ return w; }
  int height(){ return h; }
  
  void draw(int px, int py) {
    fill(0,0,0);
    noFill();
    stroke(255);
    rect(px+x-1,py+y-1, width()+2, height()+2);
    for(int i=0;i<children.size();i++){
      children.get(i).draw(px+x, py+y);
    }
    for(int i=0;i<text.size();i++){
      text.get(i).draw(px+x, py+y);
    }
  }

}
