public static class Math_Functions {
  
  public static double sigmoid(double unactivated) {
    double temp = 1;
    temp/=(1+Math.exp(-1*unactivated));
    return temp;
  }
  
  public static double[] softmax(double[] input) {
    double[] fin = new double[input.length];
    double eSum = 0;
    for (int i = 0; i < input.length; i++) {
      eSum+= exp((float)input[i]);
    }
    
    for (int i = 0; i < input.length; i++) {
      fin[i] = exp((float)input[i])/eSum;
    }
    
    return fin;
  }
}