public class NeuralLayer {
  
  private int numberOfNeurons;
  private NeuralLayer previous = null;
  private InputLayer in = null;
  private Neuron[] neurons;
  
  public NeuralLayer (int nmbrOfNrns, NeuralLayer prev) {
    numberOfNeurons = nmbrOfNrns;
    previous = prev;
    init();
  }
  
  public NeuralLayer (int nmbrOfNrns, InputLayer n) {
    numberOfNeurons = nmbrOfNrns;
    in = n;
    init();
  }
  
  public void init() {
    neurons = new Neuron[numberOfNeurons];
    if (in != null) {
      for (int i = 0; i < neurons.length; i++) {
        neurons[i] = new Neuron(in);
      }
    } else {
      for (int i = 0; i < neurons.length; i++) {
        neurons[i] = new Neuron(previous);
      }
    }
  }
  
  public void calc() {
    for (int i = 0; i < neurons.length; i++) {
      neurons[i].calc();
    }
  }
  
  public double[] getOutputs () {
    double[] temp = new double[numberOfNeurons];
    for (int i = 0; i < neurons.length; i++) {
      temp[i] = neurons[i].getOutput();
    }
    return temp;
  }
  
}