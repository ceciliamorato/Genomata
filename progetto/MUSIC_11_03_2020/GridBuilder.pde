/* Grid builder, set the cooridnates in the space, set the dimensions of the grid */

private static final int GRID_WIDTH = 36; //number of cells per dimension
private static final int GRID_HEIGHT = 36;
private static final int GRID_DEPTH = 36;

private static final int CELL_SIZE = 16; // Just to create grid, cells size is controlled by energy values

final int centreZ= GRID_DEPTH / 2 * CELL_SIZE; // 36/2 center of the grid in the space
final int centreX = GRID_WIDTH / 2 * CELL_SIZE;
final int centreY =  GRID_HEIGHT / 2 * CELL_SIZE;


private class GridBuilder {

    private int mWidth; 
    private int mHeight;
    private int mDepth;
    
    private int mCentreX;
    private int mCentreY;
    private int mCentreZ;
    
    Grid build() {
        return new Grid(mWidth, mHeight, mDepth, mCentreX, mCentreY, mCentreZ);
    }

    GridBuilder setWidth(int w) {
        mWidth = w;
        return this;
    }

    GridBuilder setHeight(int h) {
        mHeight = h;
        return this;
    }

    GridBuilder setDepth(int d) {
        mDepth = d;
        return this;
    }

    GridBuilder setCentreX(int centreX) {
        mCentreX = centreX;
        return this;
    }

    GridBuilder setCentreY(int centreY) {
        mCentreY = centreY;
        return this;
    }

    GridBuilder setCentreZ(int centreZ) {
        mCentreZ = centreZ;
        return this;
    }

}
