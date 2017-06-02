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
  
  public double[] getOutputs() {
    return out.getOutputs();
  }
  
  public double[] getSoftMaxedOutputs() {
    return out.getSoftMaxedOutputs();
  }
  
}