import sys
import numpy as np
import time

def read(list):
    filename='input.txt'
    for line in open(filename):
        x,y=line.split('')
        list.append(np.array(([x,y]),dtype=int))
    #while(f>>x>>y){
     #   cin>>x>>y;
      #  point p(x,y);
       # v.push_back(p);
    #}

#int aliveNeighbours(point p,vector<vector<int>> grid){
 #   int count=0;
  #  for(int i=p.i-1;i<=p.i+1;i++){
  #      for(int j=p.j-1;j<=p.j+1;j++){
   #         if(grid[i][j]==1){
    #            count++;
    #        }
    #    }
    #}
    #return count-1;
#}
def alive_neighbours(point,grid):
    count=0
    for i in xrange(point[0]-1,point[0]+1):
        for j in xrange(point[1]-1,point[1]+1):
            if grid[i,j] == 1:
                count=count+1
    return count-1


#bool newPoint(vector<point> v,point p){
 #   for(int i=0;i<v.size();i++){
  #      if(v[i].i==p.i && v[i].j==p.j){
   #         return false;
    #    }
    #}
    #return true;
#}
def new_point(points, newpoint):
    flag=True
    for i in xrange(len(points)):
        if newpoint[0] == points[i][0] and newpoint[1] == points[i][1]:
            flag=False
            break
    return flag
vector<point> iterate(vector<point> v,vector<vector<int>> grid){
    vector<point> newV;
    for(int i=0;i<v.size();i++){
        int an=aliveNeighbours(v[i],grid);
        if(an==2 || an==3){
            newV.push_back(v[i]);
        }
        for(int r=v[i].i-1;r<=v[i].i+1;r++){
            for(int c=v[i].j-1;c<=v[i].j+1;c++){
                point q(r,c);
                an=aliveNeighbours(q,grid);
                if(an==3 && newPoint(newV,q)){
                    newV.push_back(q);
                }
            }
        }
    }
    return newV;
}
void renderGrid(vector<vector<int>> &grid,vector<point> livingCells){
    for(int i=0;i!=grid.size();i++)
        fill(grid[i].begin(), grid[i].end(), 0);
    //fill(grid.begin(),grid.end(),(fill(grid[0].begin(),grid[0].end(),0)));
    for(int k=0;k<livingCells.size();k++){
        grid[livingCells[k].i][livingCells[k].j]=1;
    }
}
def displayGrid(grid):
    file=open("output.txt",'w');
    for i in xrange(100):
        for j in xrange(100):
            file.write(grid[i,j]) # do something to impreove efficiency

def delay(seconds):
    time.sleep(seconds*1000)

def main():
    livingCells=list()
    #vector< vector<int> > grid(100,vector<int>(100,0));
    grid=np.zeros((100,100),dtype=np.int)
    read(livingCells);
    c=50;
    #while c != 0:

    #while(c--!=0){
     #   //renderGrid(grid,livingCells);
      #  //livingCells=iterate(livingCells,grid);
       # //displayGrid(grid);
        #//cout.flush();
        #cout<<2;
        #//delay(1);
    #}

if __name__=="__main__":
    main()
