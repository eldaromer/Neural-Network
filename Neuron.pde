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
  
  public void display (int x, int y, int layerScale) {
    textSize(15);
    textAlign(CENTER, CENTER);
    fill(0, 0, 155);
    if (in == null) {
      int before = previous.getNumberOfNeurons();
      int prevScale = previous.getNeuronScale();
      for (int i = 0; i < before; i++) {
        String c = "FF" + weightColor(weights[i]);
        stroke(unhex(c));
        line(x-layerScale, prevScale*(i+1), x, y);
        //text((""+weights[i]).substring(0, 5), ((x-layerScale)*(3.0/4.0) + x*(1.0/4.0)), (prevScale*(i+1)*(3.0/4.0)+y*(1.0/4.0)));
      }
    } else {
      int before = in.getNumberOfInputs();
      int prevScale = in.getNeuronScale();
      for (int i = 0; i < before; i++) {
        String c = "FF" + weightColor(weights[i]);
        stroke(unhex(c));
        line(x-layerScale, prevScale*(i+1), x, y);
        //text((""+weights[i]).substring(0, 5), (x-layerScale)*(2.0/3.0) + x*(1.0/3.0), (prevScale*(i+1)*(2.0/3.0)+y*(1.0/3.0)));
      }
    }
  }
  
  public String weightColor(double weight) {
    return ColorTools.hsvToRgb((float)weight, 1.0, .5);
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