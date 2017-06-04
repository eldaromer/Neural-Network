public class OutputLayer extends NeuralLayer{
  
  public OutputLayer(int nmbrOfNrns, NeuralLayer n) {
    super(nmbrOfNrns, n);
  }
  
  public double[] getSoftMaxedOutputs() {
    double[] temp = getOutputs();
    
    return Math_Functions.softmax(temp);
  }
  
}