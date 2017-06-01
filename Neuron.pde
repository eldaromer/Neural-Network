import java.util.Random;

public class Neuron {
  
  private NeuralLayer previous = null;
  private InputLayer in = null;
  private double[] inputs;
  private double output;
  private double[] weights;
  Random rand = new Random();
  
  public Neuron (NeuralLayer prev) {
    previous = prev;
    init();
  }
  
  public Neuron (InputLayer n) {
    in = n;
    init();
  }
  
  public void init() {
    if (in != null) {
      inputs = in.getInputs();
    } else {
      inputs = previous.getOutputs();
    }
    weights = new double[inputs.length];
    for (int i = 0; i < weights.length; i++) {
      weights[i] = rand.nextDouble();
    }
  }
  
  public void calc () {
    double summed = 0;
    
    for (int i = 0; i < inputs.length; i++) {
      summed += inputs[i]*weights[i];
    }
    
    output = sigmoid(summed);
    //println(output);
    
  }
  
  public double sigmoid(double unactivated) {
    double temp = 1;
    temp/=(1+Math.exp(-1*unactivated));
    return temp;
  }
  
  public double getOutput() {
    println(output);
    return output;
  }
  
}