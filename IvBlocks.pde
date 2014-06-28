
ArrayList<Block> blocks;
Block draggedBlock;

void setup() {
  size(displayWidth, displayHeight, P2D);
       background(0, 0, 0);

  blocks = new ArrayList<Block>();
  Block b = new Block(500,200);
  b.addText("for(").addBlock((new Block()).addText("int i=0")).addText(";;){");
  blocks.add(b);
}


void draw() {
  //update();
  background(0);
  for(int i=0;i<blocks.size();i++)
  {
    blocks.get(i).draw(0,0);
  }
}

void update() {

}

Block findClosestBlock(int x, int y)
{
  boolean found = false;
  int mindist=1000000;
  int goodi=0;
  int threshold = 100;
  for(int i=0; i<blocks.size(); i++)
  {
    Block b = blocks.get(i);
    int dist = abs(b.x-x) + abs(b.y-y);
    if((dist<threshold) && (dist<mindist))
    {
      found = true;
      mindist = dist;
      goodi = i;
    }
  }
  if(found)
  {
    return blocks.get(goodi);
  }
  else
  {
    return null;
  }
}

void mousePressed() {
  Block b=findClosestBlock(mouseX,mouseY);
  if(b==null){
    draggedBlock=null;
    return;
    }
  {
    draggedBlock=b;
  }
}


void mouseDragged() {
  if(draggedBlock != null)
  {
    draggedBlock.x = mouseX;
    draggedBlock.y = mouseY;
   }
}

void mouseReleased(){
  if(draggedBlock != null)
  {
  }    
}


