import de.bezier.guido.*;
public static final int NUM_ROWS=20;
public static final int NUM_COLS=20;
//Declare and initialize NUM_ROWS and NUM_COLS = 20
private MSButton[][] buttons; //2d array of minesweeper buttons
private ArrayList <MSButton> bombs; //ArrayList of just the minesweeper buttons that are mined


void setup ()
{
    size(400, 400);
    textAlign(CENTER,CENTER);
    
    // make the manager
    Interactive.make( this );
    
   buttons=new MSButton[NUM_ROWS][NUM_COLS];
    for(int r=0;r<NUM_ROWS;r++)
    {
        for(int c=0; c<NUM_COLS;c++)
        {
            buttons[r][c]= new MSButton(r,c);
        }
    }  
    bombs= new ArrayList <MSButton>();
    //declare and initialize buttons
    for (int b=0; b<15; b++)
    {
    setBombs();
    }
}
public void setBombs()
{
    int randomC= (int) (Math.random()*20);
    int randomR= (int) (Math.random()*20);
   // System.out.println("randomR: "+randomR);
    //System.out.println("randomC: "+randomC);
   
    if (!bombs.contains(buttons[randomR][randomC]))
    {
         bombs.add(buttons[randomR][randomC]);
    }

}

public void draw ()
{
    background( 255);
    if(isWon())
        displayWinningMessage();
}
public boolean isWon()
{
    for (int i=0; i< bombs.size(); i++)
    {
        if (bombs.get(i).isMarked()==true)
        {
           return true;
         }
    }
    return false;
}
public void displayLosingMessage()
{
    //your code here
    text("Loser", 100,100);
    for (int i=0; i<bombs.size();i++)
    {
        bombs.get(i).marked= false;
        bombs.get(i).clicked=true;
    }
}
public void displayWinningMessage()
{
    //your code here
    text("You won!",100,100);
}

public class MSButton
{
    private int r, c;
    private float x,y, width, height;
    private boolean clicked, marked;
    private String label;
    
    public MSButton ( int rr, int cc )
    {
         width = 400/NUM_COLS;
         height = 400/NUM_ROWS;
        r = rr;
        c = cc; 
        x = c*width;
        y = r*height;
        label = "";
        marked = clicked = false;
        Interactive.add( this ); // register it with the manager
    }
    public boolean isMarked()
    {
        return marked;
    }
    public boolean isClicked()
    {
        return clicked;
    }
    // called by manager
    
    public void mousePressed () 
    {
        clicked = true;
        if (keyPressed==true)
        {
            marked= !marked;
        }
        else if (bombs.contains(this))
        {
            displayLosingMessage();
        }
        else if (countBombs(r, c)>0)
        {
             setLabel(""+countBombs(r,c));
        }
        else
        {
            if (isValid(r, c-1) && buttons[r][c-1].isClicked()==false)

              { buttons[r][c-1].mousePressed();}
        
           if (isValid(r,c+1)&& buttons[r][c+1].isClicked()==false)
               {  buttons[r][c+1].mousePressed();}
       
           if (isValid(r-1,c)&& buttons[r-1][c].isClicked()==false)
                { buttons[r-1][c].mousePressed();}
      
           if (isValid(r+1,c)&& buttons[r+1][c].isClicked()==false)
               { buttons[r+1][c].mousePressed();}
            
           if (isValid(r+1,c+1)&& buttons[r+1][c+1].isClicked()==false)
                {buttons[r+1][c+1].mousePressed();}

           
           if (isValid(r-1,c+1)&& buttons[r-1][c+1].isClicked()==false)
                {buttons[r-1][c+1].mousePressed();}

           
           if (isValid(r+1,c-1)&& buttons[r+1][c-1].isClicked()==false)
                {buttons[r+1][c-1].mousePressed();}

           
           if (isValid(r-1,c-1)&& buttons[r-1][c-1].isClicked()==false)
              {buttons[r-1][c-1].mousePressed();}

          
        }
        
    }

    public void draw () 
    {    
        if (marked)
            fill(0);
        else if( clicked && bombs.contains(this) ) 
             fill(255,0,0);
        else if(clicked)
            fill( 200 );
        else 
            fill( 100 );

        rect(x, y, width, height);
        fill(0);
        text(label,x+width/2,y+height/2);
    }
    public void setLabel(String newLabel)
    {
        label = newLabel;
    }
    public boolean isValid(int r, int c)
    {
        //your code here
        if (r>20||c>20||r<0||c<0)
        {
        return false;
        }
        else 
        {
            return true;
        }
    }
    public int countBombs(int r, int c)
    {
        int numBombs = 0;
        if (isValid(r, c-1) && buttons[r][c-1].isMarked())

             {numBombs++;}
        
       if (isValid(r,c+1)&& buttons[r][c+1].isMarked())
           {numBombs++;}
           
        if (isValid(r-1,c)&& buttons[r-1][c].isMarked())
           {numBombs++;}
      
       if (isValid(r+1,c)&& buttons[r+1][c].isMarked())
           {numBombs++;}
           
       if (isValid(r+1,c+1)&& buttons[r+1][c+1].isMarked())
           {numBombs++;}
    
       if (isValid(r-1,c+1)&& buttons[r-1][c+1].isMarked())
           {numBombs++;}
           
       if (isValid(r-1,c-1)&& buttons[r-1][c-1].isMarked())
           {numBombs++; }      
       
       if (isValid(r-1,c+1)&& buttons[r-1][c+1].isMarked())
           {numBombs++;}
           
    return numBombs;
    }
}




import de.bezier.guido.*;
public static final int NUM_ROWS=20;
public static final int NUM_COLS=20;
//Declare and initialize NUM_ROWS and NUM_COLS = 20
private MSButton[][] buttons; //2d array of minesweeper buttons
private ArrayList <MSButton> bombs; //ArrayList of just the minesweeper buttons that are mined


void setup ()
{
    size(400, 400);
    textAlign(CENTER,CENTER);
    
    // make the manager
    Interactive.make( this );
    
   buttons=new MSButton[NUM_ROWS][NUM_COLS];
    for(int r=0;r<NUM_ROWS;r++)
    {
        for(int c=0; c<NUM_COLS;c++)
        {
            buttons[r][c]= new MSButton(r,c);
        }
    }  
    bombs= new ArrayList <MSButton>();
    //declare and initialize buttons
    for (int b=0; b<15; b++)
    {
    setBombs();
    }
}
public void setBombs()
{
    int randomC= (int) (Math.random()*20);
    int randomR= (int) (Math.random()*20);
   // System.out.println("randomR: "+randomR);
    //System.out.println("randomC: "+randomC);
   
    if (!bombs.contains(buttons[randomR][randomC]))
    {
         bombs.add(buttons[randomR][randomC]);
    }

}

public void draw ()
{
    background( 255);
    if(isWon())
        displayWinningMessage();
}
public boolean isWon()
{
    for (int i=0; i< bombs.size(); i++)
    {
        if (bombs.get(i).isMarked()==true)
        {
           return true;
         }
    }
    return false;
}
public void displayLosingMessage()
{
    //your code here
    text("Loser", 100,100);
    for (int i=0; i<bombs.size();i++)
    {
        bombs.get(i).marked= false;
        bombs.get(i).clicked=true;
    }
}
public void displayWinningMessage()
{
    //your code here
    text("You won!",100,100);
}

public class MSButton
{
    private int r, c;
    private float x,y, width, height;
    private boolean clicked, marked;
    private String label;
    
    public MSButton ( int rr, int cc )
    {
         width = 400/NUM_COLS;
         height = 400/NUM_ROWS;
        r = rr;
        c = cc; 
        x = c*width;
        y = r*height;
        label = "";
        marked = clicked = false;
        Interactive.add( this ); // register it with the manager
    }
    public boolean isMarked()
    {
        return marked;
    }
    public boolean isClicked()
    {
        return clicked;
    }
    // called by manager
    
    public void mousePressed () 
    {
        clicked = true;
        if (keyPressed==true)
        {
            marked= !marked;
        }
        else if (bombs.contains(this))
        {
            displayLosingMessage();
        }
        else if (countBombs(r, c)>0)
        {
             setLabel(""+countBombs(r,c));
        }
        else
        {
            if (isValid(r, c-1) && buttons[r][c-1].isClicked()==false)

              { buttons[r][c-1].mousePressed();}
        
           if (isValid(r,c+1)&& buttons[r][c+1].isClicked()==false)
               {  buttons[r][c+1].mousePressed();}
       
           if (isValid(r-1,c)&& buttons[r-1][c].isClicked()==false)
                { buttons[r-1][c].mousePressed();}
      
           if (isValid(r+1,c)&& buttons[r+1][c].isClicked()==false)
               { buttons[r+1][c].mousePressed();}
            
           if (isValid(r+1,c+1)&& buttons[r+1][c+1].isClicked()==false)
                {buttons[r+1][c+1].mousePressed();}

           
           if (isValid(r-1,c+1)&& buttons[r-1][c+1].isClicked()==false)
                {buttons[r-1][c+1].mousePressed();}

           
           if (isValid(r+1,c-1)&& buttons[r+1][c-1].isClicked()==false)
                {buttons[r+1][c-1].mousePressed();}

           
           if (isValid(r-1,c-1)&& buttons[r-1][c-1].isClicked()==false)
              {buttons[r-1][c-1].mousePressed();}

          
        }
        
    }

    public void draw () 
    {    
        if (marked)
            fill(0);
        else if( clicked && bombs.contains(this) ) 
             fill(255,0,0);
        else if(clicked)
            fill( 200 );
        else 
            fill( 100 );

        rect(x, y, width, height);
        fill(0);
        text(label,x+width/2,y+height/2);
    }
    public void setLabel(String newLabel)
    {
        label = newLabel;
    }
    public boolean isValid(int r, int c)
    {
        //your code here
        if (r>20||c>20||r<0||c<0)
        {
        return false;
        }
        else 
        {
            return true;
        }
    }
    public int countBombs(int r, int c)
    {
        int numBombs = 0;
        if (isValid(r, c-1) && buttons[r][c-1].isMarked())

             {numBombs++;}
        
       if (isValid(r,c+1)&& buttons[r][c+1].isMarked())
           {numBombs++;}
           
        if (isValid(r-1,c)&& buttons[r-1][c].isMarked())
           {numBombs++;}
      
       if (isValid(r+1,c)&& buttons[r+1][c].isMarked())
           {numBombs++;}
           
       if (isValid(r+1,c+1)&& buttons[r+1][c+1].isMarked())
           {numBombs++;}
    
       if (isValid(r-1,c+1)&& buttons[r-1][c+1].isMarked())
           {numBombs++;}
           
       if (isValid(r-1,c-1)&& buttons[r-1][c-1].isMarked())
           {numBombs++; }      
       
       if (isValid(r-1,c+1)&& buttons[r-1][c+1].isMarked())
           {numBombs++;}
           
    return numBombs;
    }
}




import de.bezier.guido.*;
public static final int NUM_ROWS=20;
public static final int NUM_COLS=20;
//Declare and initialize NUM_ROWS and NUM_COLS = 20
private MSButton[][] buttons; //2d array of minesweeper buttons
private ArrayList <MSButton> bombs; //ArrayList of just the minesweeper buttons that are mined


void setup ()
{
    size(400, 400);
    textAlign(CENTER,CENTER);
    
    // make the manager
    Interactive.make( this );
    
   buttons=new MSButton[NUM_ROWS][NUM_COLS];
    for(int r=0;r<NUM_ROWS;r++)
    {
        for(int c=0; c<NUM_COLS;c++)
        {
            buttons[r][c]= new MSButton(r,c);
        }
    }  
    bombs= new ArrayList <MSButton>();
    //declare and initialize buttons
    for (int b=0; b<15; b++)
    {
    setBombs();
    }
}
public void setBombs()
{
    int randomC= (int) (Math.random()*20);
    int randomR= (int) (Math.random()*20);
   // System.out.println("randomR: "+randomR);
    //System.out.println("randomC: "+randomC);
   
    if (!bombs.contains(buttons[randomR][randomC]))
    {
         bombs.add(buttons[randomR][randomC]);
    }

}

public void draw ()
{
    background( 255);
    if(isWon())
        displayWinningMessage();
}
public boolean isWon()
{
    for (int i=0; i< bombs.size(); i++)
    {
        if (bombs.get(i).isMarked()==true)
        {
           return true;
         }
    }
    return false;
}
public void displayLosingMessage()
{
    //your code here
    text("Loser", 100,100);
    for (int i=0; i<bombs.size();i++)
    {
        bombs.get(i).marked= false;
        bombs.get(i).clicked=true;
    }
}
public void displayWinningMessage()
{
    //your code here
    text("You won!",100,100);
}

public class MSButton
{
    private int r, c;
    private float x,y, width, height;
    private boolean clicked, marked;
    private String label;
    
    public MSButton ( int rr, int cc )
    {
         width = 400/NUM_COLS;
         height = 400/NUM_ROWS;
        r = rr;
        c = cc; 
        x = c*width;
        y = r*height;
        label = "";
        marked = clicked = false;
        Interactive.add( this ); // register it with the manager
    }
    public boolean isMarked()
    {
        return marked;
    }
    public boolean isClicked()
    {
        return clicked;
    }
    // called by manager
    
    public void mousePressed () 
    {
        clicked = true;
        if (keyPressed==true)
        {
            marked= !marked;
        }
        else if (bombs.contains(this))
        {
            displayLosingMessage();
        }
        else if (countBombs(r, c)>0)
        {
             setLabel(""+countBombs(r,c));
        }
        else
        {
            if (isValid(r, c-1) && buttons[r][c-1].isClicked()==false)

              { buttons[r][c-1].mousePressed();}
        
           if (isValid(r,c+1)&& buttons[r][c+1].isClicked()==false)
               {  buttons[r][c+1].mousePressed();}
       
           if (isValid(r-1,c)&& buttons[r-1][c].isClicked()==false)
                { buttons[r-1][c].mousePressed();}
      
           if (isValid(r+1,c)&& buttons[r+1][c].isClicked()==false)
               { buttons[r+1][c].mousePressed();}
            
           if (isValid(r+1,c+1)&& buttons[r+1][c+1].isClicked()==false)
                {buttons[r+1][c+1].mousePressed();}

           
           if (isValid(r-1,c+1)&& buttons[r-1][c+1].isClicked()==false)
                {buttons[r-1][c+1].mousePressed();}

           
           if (isValid(r+1,c-1)&& buttons[r+1][c-1].isClicked()==false)
                {buttons[r+1][c-1].mousePressed();}

           
           if (isValid(r-1,c-1)&& buttons[r-1][c-1].isClicked()==false)
              {buttons[r-1][c-1].mousePressed();}

          
        }
        
    }

    public void draw () 
    {    
        if (marked)
            fill(0);
        else if( clicked && bombs.contains(this) ) 
             fill(255,0,0);
        else if(clicked)
            fill( 200 );
        else 
            fill( 100 );

        rect(x, y, width, height);
        fill(0);
        text(label,x+width/2,y+height/2);
    }
    public void setLabel(String newLabel)
    {
        label = newLabel;
    }
    public boolean isValid(int r, int c)
    {
        //your code here
        if (r>20||c>20||r<0||c<0)
        {
        return false;
        }
        else 
        {
            return true;
        }
    }
    public int countBombs(int r, int c)
    {
        int numBombs = 0;
        if (isValid(r, c-1) && buttons[r][c-1].isMarked())

             {numBombs++;}
        
       if (isValid(r,c+1)&& buttons[r][c+1].isMarked())
           {numBombs++;}
           
        if (isValid(r-1,c)&& buttons[r-1][c].isMarked())
           {numBombs++;}
      
       if (isValid(r+1,c)&& buttons[r+1][c].isMarked())
           {numBombs++;}
           
       if (isValid(r+1,c+1)&& buttons[r+1][c+1].isMarked())
           {numBombs++;}
    
       if (isValid(r-1,c+1)&& buttons[r-1][c+1].isMarked())
           {numBombs++;}
           
       if (isValid(r-1,c-1)&& buttons[r-1][c-1].isMarked())
           {numBombs++; }      
       
       if (isValid(r-1,c+1)&& buttons[r-1][c+1].isMarked())
           {numBombs++;}
           
    return numBombs;
    }
}




import de.bezier.guido.*;
public static final int NUM_ROWS=20;
public static final int NUM_COLS=20;
//Declare and initialize NUM_ROWS and NUM_COLS = 20
private MSButton[][] buttons; //2d array of minesweeper buttons
private ArrayList <MSButton> bombs; //ArrayList of just the minesweeper buttons that are mined


void setup ()
{
    size(400, 400);
    textAlign(CENTER,CENTER);
    
    // make the manager
    Interactive.make( this );
    
   buttons=new MSButton[NUM_ROWS][NUM_COLS];
    for(int r=0;r<NUM_ROWS;r++)
    {
        for(int c=0; c<NUM_COLS;c++)
        {
            buttons[r][c]= new MSButton(r,c);
        }
    }  
    bombs= new ArrayList <MSButton>();
    //declare and initialize buttons
    for (int b=0; b<15; b++)
    {
    setBombs();
    }
}
public void setBombs()
{
    int randomC= (int) (Math.random()*20);
    int randomR= (int) (Math.random()*20);
   // System.out.println("randomR: "+randomR);
    //System.out.println("randomC: "+randomC);
   
    if (!bombs.contains(buttons[randomR][randomC]))
    {
         bombs.add(buttons[randomR][randomC]);
    }

}

public void draw ()
{
    background( 255);
    if(isWon())
        displayWinningMessage();
}
public boolean isWon()
{
    for (int i=0; i< bombs.size(); i++)
    {
        if (bombs.get(i).isMarked()==true)
        {
           return true;
         }
    }
    return false;
}
public void displayLosingMessage()
{
    //your code here
    text("Loser", 100,100);
    for (int i=0; i<bombs.size();i++)
    {
        bombs.get(i).marked= false;
        bombs.get(i).clicked=true;
    }
}
public void displayWinningMessage()
{
    //your code here
    text("You won!",100,100);
}

public class MSButton
{
    private int r, c;
    private float x,y, width, height;
    private boolean clicked, marked;
    private String label;
    
    public MSButton ( int rr, int cc )
    {
         width = 400/NUM_COLS;
         height = 400/NUM_ROWS;
        r = rr;
        c = cc; 
        x = c*width;
        y = r*height;
        label = "";
        marked = clicked = false;
        Interactive.add( this ); // register it with the manager
    }
    public boolean isMarked()
    {
        return marked;
    }
    public boolean isClicked()
    {
        return clicked;
    }
    // called by manager
    
    public void mousePressed () 
    {
        clicked = true;
        if (keyPressed==true)
        {
            marked= !marked;
        }
        else if (bombs.contains(this))
        {
            displayLosingMessage();
        }
        else if (countBombs(r, c)>0)
        {
             setLabel(""+countBombs(r,c));
        }
        else
        {
            if (isValid(r, c-1) && buttons[r][c-1].isClicked()==false)

              { buttons[r][c-1].mousePressed();}
        
           if (isValid(r,c+1)&& buttons[r][c+1].isClicked()==false)
               {  buttons[r][c+1].mousePressed();}
       
           if (isValid(r-1,c)&& buttons[r-1][c].isClicked()==false)
                { buttons[r-1][c].mousePressed();}
      
           if (isValid(r+1,c)&& buttons[r+1][c].isClicked()==false)
               { buttons[r+1][c].mousePressed();}
            
           if (isValid(r+1,c+1)&& buttons[r+1][c+1].isClicked()==false)
                {buttons[r+1][c+1].mousePressed();}

           
           if (isValid(r-1,c+1)&& buttons[r-1][c+1].isClicked()==false)
                {buttons[r-1][c+1].mousePressed();}

           
           if (isValid(r+1,c-1)&& buttons[r+1][c-1].isClicked()==false)
                {buttons[r+1][c-1].mousePressed();}

           
           if (isValid(r-1,c-1)&& buttons[r-1][c-1].isClicked()==false)
              {buttons[r-1][c-1].mousePressed();}

          
        }
        
    }

    public void draw () 
    {    
        if (marked)
            fill(0);
        else if( clicked && bombs.contains(this) ) 
             fill(255,0,0);
        else if(clicked)
            fill( 200 );
        else 
            fill( 100 );

        rect(x, y, width, height);
        fill(0);
        text(label,x+width/2,y+height/2);
    }
    public void setLabel(String newLabel)
    {
        label = newLabel;
    }
    public boolean isValid(int r, int c)
    {
        //your code here
        if (r>20||c>20||r<0||c<0)
        {
        return false;
        }
        else 
        {
            return true;
        }
    }
    public int countBombs(int r, int c)
    {
        int numBombs = 0;
        if (isValid(r, c-1) && buttons[r][c-1].isMarked())

             {numBombs++;}
        
       if (isValid(r,c+1)&& buttons[r][c+1].isMarked())
           {numBombs++;}
           
        if (isValid(r-1,c)&& buttons[r-1][c].isMarked())
           {numBombs++;}
      
       if (isValid(r+1,c)&& buttons[r+1][c].isMarked())
           {numBombs++;}
           
       if (isValid(r+1,c+1)&& buttons[r+1][c+1].isMarked())
           {numBombs++;}
    
       if (isValid(r-1,c+1)&& buttons[r-1][c+1].isMarked())
           {numBombs++;}
           
       if (isValid(r-1,c-1)&& buttons[r-1][c-1].isMarked())
           {numBombs++; }      
       
       if (isValid(r-1,c+1)&& buttons[r-1][c+1].isMarked())
           {numBombs++;}
           
    return numBombs;
    }
}




import de.bezier.guido.*;
public static final int NUM_ROWS=20;
public static final int NUM_COLS=20;
//Declare and initialize NUM_ROWS and NUM_COLS = 20
private MSButton[][] buttons; //2d array of minesweeper buttons
private ArrayList <MSButton> bombs; //ArrayList of just the minesweeper buttons that are mined


void setup ()
{
    size(400, 400);
    textAlign(CENTER,CENTER);
    
    // make the manager
    Interactive.make( this );
    
   buttons=new MSButton[NUM_ROWS][NUM_COLS];
    for(int r=0;r<NUM_ROWS;r++)
    {
        for(int c=0; c<NUM_COLS;c++)
        {
            buttons[r][c]= new MSButton(r,c);
        }
    }  
    bombs= new ArrayList <MSButton>();
    //declare and initialize buttons
    for (int b=0; b<15; b++)
    {
    setBombs();
    }
}
public void setBombs()
{
    int randomC= (int) (Math.random()*20);
    int randomR= (int) (Math.random()*20);
   // System.out.println("randomR: "+randomR);
    //System.out.println("randomC: "+randomC);
   
    if (!bombs.contains(buttons[randomR][randomC]))
    {
         bombs.add(buttons[randomR][randomC]);
    }

}

public void draw ()
{
    background( 255);
    if(isWon())
        displayWinningMessage();
}
public boolean isWon()
{
    for (int i=0; i< bombs.size(); i++)
    {
        if (bombs.get(i).isMarked()==true)
        {
           return true;
         }
    }
    return false;
}
public void displayLosingMessage()
{
    //your code here
    text("Loser", 100,100);
    for (int i=0; i<bombs.size();i++)
    {
        bombs.get(i).marked= false;
        bombs.get(i).clicked=true;
    }
}
public void displayWinningMessage()
{
    //your code here
    text("You won!",100,100);
}

public class MSButton
{
    private int r, c;
    private float x,y, width, height;
    private boolean clicked, marked;
    private String label;
    
    public MSButton ( int rr, int cc )
    {
         width = 400/NUM_COLS;
         height = 400/NUM_ROWS;
        r = rr;
        c = cc; 
        x = c*width;
        y = r*height;
        label = "";
        marked = clicked = false;
        Interactive.add( this ); // register it with the manager
    }
    public boolean isMarked()
    {
        return marked;
    }
    public boolean isClicked()
    {
        return clicked;
    }
    // called by manager
    
    public void mousePressed () 
    {
        clicked = true;
        if (keyPressed==true)
        {
            marked= !marked;
        }
        else if (bombs.contains(this))
        {
            displayLosingMessage();
        }
        else if (countBombs(r, c)>0)
        {
             setLabel(""+countBombs(r,c));
        }
        else
        {
            if (isValid(r, c-1) && buttons[r][c-1].isClicked()==false)

              { buttons[r][c-1].mousePressed();}
        
           if (isValid(r,c+1)&& buttons[r][c+1].isClicked()==false)
               {  buttons[r][c+1].mousePressed();}
       
           if (isValid(r-1,c)&& buttons[r-1][c].isClicked()==false)
                { buttons[r-1][c].mousePressed();}
      
           if (isValid(r+1,c)&& buttons[r+1][c].isClicked()==false)
               { buttons[r+1][c].mousePressed();}
            
           if (isValid(r+1,c+1)&& buttons[r+1][c+1].isClicked()==false)
                {buttons[r+1][c+1].mousePressed();}

           
           if (isValid(r-1,c+1)&& buttons[r-1][c+1].isClicked()==false)
                {buttons[r-1][c+1].mousePressed();}

           
           if (isValid(r+1,c-1)&& buttons[r+1][c-1].isClicked()==false)
                {buttons[r+1][c-1].mousePressed();}

           
           if (isValid(r-1,c-1)&& buttons[r-1][c-1].isClicked()==false)
              {buttons[r-1][c-1].mousePressed();}

          
        }
        
    }

    public void draw () 
    {    
        if (marked)
            fill(0);
        else if( clicked && bombs.contains(this) ) 
             fill(255,0,0);
        else if(clicked)
            fill( 200 );
        else 
            fill( 100 );

        rect(x, y, width, height);
        fill(0);
        text(label,x+width/2,y+height/2);
    }
    public void setLabel(String newLabel)
    {
        label = newLabel;
    }
    public boolean isValid(int r, int c)
    {
        //your code here
        if (r>20||c>20||r<0||c<0)
        {
        return false;
        }
        else 
        {
            return true;
        }
    }
    public int countBombs(int r, int c)
    {
        int numBombs = 0;
        if (isValid(r, c-1) && buttons[r][c-1].isMarked())

             {numBombs++;}
        
       if (isValid(r,c+1)&& buttons[r][c+1].isMarked())
           {numBombs++;}
           
        if (isValid(r-1,c)&& buttons[r-1][c].isMarked())
           {numBombs++;}
      
       if (isValid(r+1,c)&& buttons[r+1][c].isMarked())
           {numBombs++;}
           
       if (isValid(r+1,c+1)&& buttons[r+1][c+1].isMarked())
           {numBombs++;}
    
       if (isValid(r-1,c+1)&& buttons[r-1][c+1].isMarked())
           {numBombs++;}
           
       if (isValid(r-1,c-1)&& buttons[r-1][c-1].isMarked())
           {numBombs++; }      
       
       if (isValid(r-1,c+1)&& buttons[r-1][c+1].isMarked())
           {numBombs++;}
           
    return numBombs;
    }
}




