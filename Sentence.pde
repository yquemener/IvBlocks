class Sentence{
  Block handle;
  ArrayList<Zone> parts;
  
  /*Sentence(String initstr, int x, int y)
  {
    parts = new ArrayList<Zone>();
    handle = new Block();
    handle.x=x;
    handle.y=y;
    handle.s="O";
    handle.behavior="handle";
    blocks.add(handle);
    String[] labels=initstr.split("@");
    for(int i=0;i<labels.length;i++)
    {
      Zone z = new Zone(0,0,10,40,labels[i],"");
      parts.add(z);
      zones.add(z);
      if(i<labels.length-1)
      {
        z = new Zone(0,0,10,40,"","changetext");
        parts.add(z);
        zones.add(z);
      }
    }
    update();
  }
  
  void update()
  {
    int x=handle.x;
    int y=handle.y+40;
    for(int i=0;i<parts.size();i++)
    {
      parts.get(i).x = x;
      parts.get(i).y = y;
      if(parts.get(i).behavior=="")
      {
        parts.get(i).w = int(textWidth(parts.get(i).label))+10;   
      }
      else
      {
        parts.get(i).w = max(50, (int)(textWidth(parts.get(i).label))+10);  
      }
      x+=parts.get(i).w+10;     
    }
  }*/
}
