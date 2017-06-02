NeuralNet nn;
int[] neuronsInLayer = {5, 2, 3, 6, 1};
double[] inputs = {3.0, 5.0, 2.0, 8.0};
int numberOfOutputs = 10;
double[] outputs;
double[] softMaxed;
boolean initiated = false;

public void setup () {
  size(1500, 800);
  surface.setResizable(true);
  
  print("Initiating Neural Network with values: [");
  for (int i = 0; i < inputs.length; i++) {
    if (i != inputs.length-1) {
      print(""+ inputs[i] + ", ");
    } else {
      print(inputs[i]);
    }
  }
  
  println("]");
  
  nn = new NeuralNet(neuronsInLayer, inputs, numberOfOutputs);
  
  nn.calc();
  
  outputs = nn.getOutputs();
  softMaxed = nn.getSoftMaxedOutputs();
  
  print("Neural Network Output: [");
  for (int i = 0; i < outputs.length; i++) {
    if (i != outputs.length-1) {
      print(""+ outputs[i] + ", ");
    } else {
      print(outputs[i]);
    }
  }
  
  println("]");
  
  print("Neural Network SoftMaxed Output: [");
  for (int i = 0; i < softMaxed.length; i++) {
    if (i != softMaxed.length-1) {
      print(""+ softMaxed[i] + ", ");
    } else {
      print(softMaxed[i]);
    }
  }
  
  println("]");
  
}

public void draw () {
  background(#ffd1dc);
  nn.display();
}