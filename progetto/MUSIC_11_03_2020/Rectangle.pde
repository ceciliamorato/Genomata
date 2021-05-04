/* Simple class that builds rectangles and allows to identify their boundaries. */

class Rectangle {
   float x;
   float y;
   float ww;
   float hh;
   
   Rectangle(float x_, float y_, float w, float h) {
     x = x_;
     y = y_;
     ww = w;
     hh = h;
   }
   
   boolean contains(int px, int py) {
     return (px > x && px < x + ww  && py > y && py < y + hh);
   }
 
}
