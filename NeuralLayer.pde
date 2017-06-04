public class NeuralLayer {
  
  private int numberOfNeurons;
  private NeuralLayer previous = null;
  private InputLayer in = null;
  private Neuron[] neurons;
  private int neuronScale;
  private int layerScale;
  private int position;
  
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
  
  public int getNumberOfNeurons () {
    return numberOfNeurons;
  }
  
  public int getNeuronScale() {
    return neuronScale;
  }
  
  public double[] getOutputs () {
    double[] temp = new double[numberOfNeurons];
    for (int i = 0; i < neurons.length; i++) {
      temp[i] = neurons[i].getOutput();
    }
    return temp;
  }
  
  public ArrayList<ArrayList<Double>> getWeights() {
    ArrayList<ArrayList<Double>> temp = new ArrayList<ArrayList<Double>>();
    
    for (int i = 0; i < neurons.length; i++) {
      temp.add(neurons[i].getWeights());
    }
    
    return temp;
  }
  
  public void setWeights(ArrayList<ArrayList<Double>> temp) {
    
    for (int i = 0; i < neurons.length; i++) {
      neurons[i].setWeights(temp.get(i));
    }
    
  }
  
  public void display (int nmbrOfLyrs, int position) {
    layerScale = width/(nmbrOfLyrs+3);
    neuronScale = height/(neurons.length+1);
    this.position = position;
    
    for (int i = 0; i < neurons.length; i++) {
      neurons[i].display(layerScale*(position+2), neuronScale*(i+1), layerScale);
    }
  }
  
  public void displayEllipses() {
    fill(0);
    noStroke();
    for (int i = 0; i < neurons.length; i++) {
      ellipse(layerScale*(position+2), neuronScale*(i+1), 50, 50);
      
    }
  }
  
}