public class InputLayer {
  
  private double[] inputs;
  private int neuronScale;
  
  public InputLayer(double[] ins) {
    inputs = ins;
  }
  
  public int getNumberOfInputs () {
    return inputs.length;
  }
  
  public double[] getInputs() {
    return inputs;
  }
  
  public int getNeuronScale() {
    return neuronScale;
  }
  
  public void display(int nmbrOfLyrs) {
    int layerScale = width/(nmbrOfLyrs+3);
    neuronScale = height/(inputs.length+1);
    
    for (int i = 0; i < inputs.length; i++) {
      noStroke();
      fill(0);
      ellipse(layerScale*(1), neuronScale*(i+1), 50, 50);
      textSize(20);
      textAlign(CENTER, CENTER);
      fill(255);
      text((int)inputs[i], layerScale*(1), neuronScale*(i+1));
    }
  }
  
}