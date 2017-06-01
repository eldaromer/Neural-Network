NeuralNet nn;
int hiddenLayers = 3;
int neuronsInLayer = 3;
double[] inputs = {3.0, 5.0};
int numberOfOutputs = 2;
double[] outputs;

public void setup () {
  size(1000, 500);
  
  print("Initiating Neural Network with values: [");
  for (int i = 0; i < inputs.length; i++) {
    if (i != inputs.length-1) {
      print(""+ inputs[i] + ", ");
    } else {
      print(inputs[i]);
    }
  }
  
  println("]");
  
  NeuralNet nn = new NeuralNet(hiddenLayers, neuronsInLayer, inputs, numberOfOutputs);
  
  nn.calc();
  
  outputs = nn.getOutputs();
  
  print("Neural Network Output: [");
  for (int i = 0; i < outputs.length; i++) {
    if (i != outputs.length-1) {
      print(""+ outputs[i] + ", ");
    } else {
      print(outputs[i]);
    }
  }
  
  println("]");
  
}

public void draw () {
  background(255);
}