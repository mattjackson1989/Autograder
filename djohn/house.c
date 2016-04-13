/*
  house.c

  Square footage of a house

  Doe John
  djohn@uakron.edu
*/

#include <stdio.h>

int main() {

  // input the house depth
  printf("Enter the depth of the house (in feet):  ");
  double height;
  scanf("%lf", &height);

  // input the house width
  printf("Enter the width of the house (in feet):  ");
  double width;
  scanf("%lf", &width);
  
  // compute the area of the house
  double area = width * height;

  // output the area of the house
  printf("The house is %.0f square feet\n", area);

  return 0;
}
