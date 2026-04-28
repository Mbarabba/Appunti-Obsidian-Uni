import java.util.concurrent.ForkJoinPool;
import java.util.concurrent.RecursiveTask;

public class Main {
  
	public static void main(String[] args)
	{
    // creating a ForkJoinPool with 4 threads
		ForkJoinPool fjp = new ForkJoinPool(10);

		double[] nums = new double[5000];
		double sum = 0;
		for (int i = 0; i < nums.length; i++) {
			nums[i] = (double)(((i % 2) == 0) ? i : -1);
			sum += nums[i];
		}
		
		System.out.println("Sequential Summation " + sum);
		SumTask task = new SumTask(nums, 0, nums.length);
		double summation = fjp.invoke(task);
		System.out.println("Recursive Summation " + summation);
	}
}

// exteending RecursiveTask class (Genric class))
class SumTask extends RecursiveTask<Double> {
	final int seqThreshold = 500;
	double[] data;
	int start, end;

	//constructor
	SumTask(double[] data, int start, int end)
	{
		this.data = data;
		this.start = start;
		this.end = end;
	}

	@Override
	protected Double compute() // method the thread has to execute
	{
		double sum = 0;
		if ((end - start) < seqThreshold) { // base case
			for (int i = start; i < end; i++)
				sum += data[i];
      System.out.println("Leaf Task");
		}
		else { // recursive case
			int middle = (start + end) / 2;

			SumTask subtaskA = new SumTask(data, start, middle);
			SumTask subtaskB = new SumTask(data, middle, end);

			subtaskA.fork(); 
      System.out.println("Forking Task A: start " + start + " end " + middle);
			subtaskB.fork();
      System.out.println("Forking Task B: start " + middle + " end " + end);
      
			sum += subtaskA.join() + subtaskB.join();
      System.out.println("Joining Tasks sum: " + sum);
		}
		return sum;
	}
}
