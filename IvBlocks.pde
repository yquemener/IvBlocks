
ArrayList<Block> blocks;
ArrayList<Zone> zones;
ArrayList<Sentence> sentences;
Block draggedBlock;

void setup() {
  size(displayWidth, displayHeight, P2D);
       background(0, 0, 0);

  blocks = new ArrayList<Block>();
  zones = new ArrayList<Zone>();
  sentences = new ArrayList<Sentence>();
  Zone z = new Zone(2,2,200,200, "trash", "trash");
  zones.add(z);
  sentences.add(new Sentence("for(@;@;@){", 100,300));  
  blocks.add(new Block(500,200,"int i=0", "generator"));
  blocks.add(new Block(500,250,"i<100", "generator"));
  blocks.add(new Block(500,300,"i++", "generator"));
}


void draw() {
  update();
  background(0);
  for(int i=0;i<zones.size();i++)
  {
    zones.get(i).draw();
  }
  for(int i=0;i<blocks.size();i++)
  {
    blocks.get(i).draw();
  }
}

void update() {
  for(int i=0;i<zones.size();i++)
  {
    Zone z = zones.get(i);
    if(z.inside(mouseX, mouseY) && mousePressed){
      z.toggled = true;
    }
    else
    {
      z.toggled = false;
    }
  }
  for(int i=0;i<sentences.size();i++)
  {
    sentences.get(i).update();
  }
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
  if(b.behavior=="generator")
  {
    draggedBlock = new Block(b.x, b.y, b.s, "instance");
    blocks.add(draggedBlock);
  }
  else
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
        for(int i=0;i<zones.size();i++)
    {
      Zone z = zones.get(i);
      if(z.inside(draggedBlock.x, draggedBlock.y)){
        onItemDropped(z, draggedBlock);      
      }
    }
  }    
}

void onItemDropped(Zone zone, Block b)
{
  if(zone.behavior=="trash")
  {
    blocks.remove(b);
  }
  if(zone.behavior=="changetext")
  {
    zone.label=b.s;
    blocks.remove(b);
  }
}