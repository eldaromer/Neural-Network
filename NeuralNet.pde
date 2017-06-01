import java.util.ArrayList;

public class NeuralNet {
  
  private int hiddenLayers;
  private int neuronsInLayers;
  private int numberOfOutputs;
  private NeuralLayer[] layers;
  private InputLayer in;
  private OutputLayer out;
  
  public NeuralNet(int hdnLyrs, int nrnsInLyrs, double[] inpts, int nmbrOfOtpts) {
    hiddenLayers = hdnLyrs;
    neuronsInLayers = nrnsInLyrs;
    numberOfOutputs = nmbrOfOtpts;
    
    in = new InputLayer(inpts);
    
    layers = new NeuralLayer[hiddenLayers];
    
    for (int i = 0; i < layers.length; i++) {
      if (i != 0) {
        layers[i] = new NeuralLayer(neuronsInLayers, layers[i-1]);
        layers[i].calc();
      } else {
        layers[i] = new NeuralLayer(neuronsInLayers, in);
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
      
    }
  }
  
  public double[] getOutputs() {
    return out.getOutputs();
  }
  
}