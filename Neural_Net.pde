NeuralNet nn;
int[] neuronsInLayer = {5, 5, 5};
double[] inputs = {3.0, 5.0, 2.0, 8.0};
int numberOfOutputs = 3;
double[] outputs;
double[] softMaxed;
boolean initiated = false;
ArrayList<ArrayList<ArrayList<Double>>> temp;

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
  
  temp = new ArrayList<ArrayList<ArrayList<Double>>>();
  
  for (int i = 0; i < neuronsInLayer.length; i++) {
    temp.add(new ArrayList<ArrayList<Double>>());
    for (int j = 0; j < neuronsInLayer[i]; j++) {
      temp.get(i).add(new ArrayList<Double>());
      if (i != 0) {
        for (int k = 0; k < neuronsInLayer[i-1]; k++) {
          temp.get(i).get(j).add(new Double(0.5));
        }
      } else {
        for (int k = 0; k < inputs.length; k++) {
          temp.get(i).get(j).add(new Double(0.5));
        }
      }
    }
  }
  
  temp.add(new ArrayList<ArrayList<Double>>());
  for (int j = 0; j < numberOfOutputs; j++) {
    temp.get(temp.size()-1).add(new ArrayList<Double>());
    for (int k = 0; k < neuronsInLayer[neuronsInLayer.length-1]; k++) {
      temp.get(temp.size()-1).get(j).add(new Double(0.5));
    }
  }
  
}

public void draw () {
  background(#ffd1dc);
  nn.display();
  nn.setWeights(temp);
}