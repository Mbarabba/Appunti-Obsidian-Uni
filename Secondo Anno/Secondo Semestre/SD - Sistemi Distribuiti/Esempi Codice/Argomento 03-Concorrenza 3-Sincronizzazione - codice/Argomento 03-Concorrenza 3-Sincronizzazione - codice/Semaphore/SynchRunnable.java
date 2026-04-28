import java.util.concurrent.*; 

public class SynchRunnable implements Runnable
  {
    private MaxAccessRes res;
    public SynchRunnable(MaxAccessRes res){
        this.res = res;
    }
   
    public void run()
    {
      res.access();      
    }
  }