import java.util.ArrayList;

public class NeuralNet {
  
  private int hiddenLayers;
  private int[] neuronsInLayers;
  private int numberOfOutputs;
  private NeuralLayer[] layers;
  private InputLayer in;
  private OutputLayer out;
  
  public NeuralNet(int[] nrnsInLyrs, double[] inpts, int nmbrOfOtpts) {
    hiddenLayers = nrnsInLyrs.length;
    neuronsInLayers = nrnsInLyrs;
    numberOfOutputs = nmbrOfOtpts;
    
    in = new InputLayer(inpts);
    
    layers = new NeuralLayer[hiddenLayers];
    
    for (int i = 0; i < layers.length; i++) {
      if (i != 0) {
        layers[i] = new NeuralLayer(neuronsInLayers[i], layers[i-1]);
        layers[i].calc();
      } else {
        layers[i] = new NeuralLayer(neuronsInLayers[i], in);
        layers[i].calc();
      }
    }
    
    out = new OutputLayer(numberOfOutputs, layers[layers.length-1]);
  }
  
  public void calc() {
    /*for (int i = 0; i < layers.length; i++) {
      layers[i].calc();
    }*/
    
    out.calc();
  }
  
  public void display () {
    
    for (int i = 0; i < layers.length; i++) {
      layers[i].display(layers.length, i);
    }
    out.display(layers.length, layers.length);
    for (int i = 0; i < layers.length; i++) {
      layers[i].displayEllipses();
    }
    out.displayEllipses();
    in.display(layers.length);
  }
  
  public ArrayList<ArrayList<ArrayList<Double>>> getWeights() {
    ArrayList<ArrayList<ArrayList<Double>>> temp = new ArrayList<ArrayList<ArrayList<Double>>>();
    
    for (int i = 0; i < layers.length; i++) {
      temp.add(layers[i].getWeights());
    }
    
    temp.add(out.getWeights());
    
    return new ArrayList<ArrayList<ArrayList<Double>>>(temp);
  }
  
  public void setWeights(ArrayList<ArrayList<ArrayList<Double>>> temp) {
    if (validateWeights(temp)) {
      for (int i = 0; i < layers.length; i++) {
        layers[i].setWeights(temp.get(i));
      }
      
      out.setWeights(temp.get(temp.size()-1));
    }
  }
  
  public boolean validateWeights(ArrayList<ArrayList<ArrayList<Double>>> temp) {
    boolean fin = true;
    
    //Check if the number of layers match
    if (temp.size() != hiddenLayers+1) {
      println("Error Code 1: Number of Layers differs from the neural network");
      fin = false;
    }
    
    //Loop through layers
    for (int i = 0; i < temp.size()-1; i++) {
      //Check if number of neurons in each layer matches
      if (temp.get(i).size() != neuronsInLayer[i]) {
        println("Error Code 2: Number of neurons in layer " + i + " of the ArrayList differs from the neural network");
        fin = false;
      }
      
      //Case for first layer which doesn't have an i-1
      if (i == 0) {
        //Loops through neurons
        for (int j = 0; j < temp.get(i).size(); j++) {
          //Checks if number of weights in each neuron matches number of inputs
          if (temp.get(i).get(j).size() != in.getInputs().length) {
            println("Error Code 3: number of weights in neuron " + j + " of layer " + i + " of the ArrayList differs from the neural network");
            fin = false;
          }
        }
      } else {
        //Loops through neurons
        for (int j = 0; j < temp.get(i).size(); j++) {
          //Checks if number of weights in each neuron matches number of neurons in previous layer
          if (temp.get(i).get(j).size() != layers[i-1].getWeights().size()) {
            println("Error Code 4: number of weights in neuron " + j + " of layer " + i + " of the ArrayList differs from the neural network");
            fin = false;
          }
        }
      }
    }
    
    //Checks if number of neurons in output layer matches
    if (temp.get(temp.size()-1).size() != out.getWeights().size()) {
      println("Error Code 5: number of neurons in the output layer of the ArrayList differs from the neural network");
      fin = false;
    }
    
    //Loops through output neurons
    for (int j = 0; j < temp.get(temp.size()-1).size(); j++) {
      //Checks if number of weights in each output neuron matches number of neurons in previous layer
      if (temp.get(temp.size()-1).get(j).size() != layers[layers.length-1].getWeights().size()) {
        println("Error Code 6: number of weights in neuron " + j + " of the output layer of the ArrayList differs from the neural network");
        fin = false;
      }
    }
    
    return fin;
  }
  
  public double[] getOutputs() {
    return out.getOutputs();
  }
  
  public double[] getSoftMaxedOutputs() {
    return out.getSoftMaxedOutputs();
  }
  
}