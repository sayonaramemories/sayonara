#include<stdio.h>
#include<ctype.h>
#include<string.h>

char p[10][10];
char followResult[10];
int n,m=0;

void first(char ch){
  int k;
  if(islower(ch))
    addToRes(ch);
  for(k=0;k<n;k++){
     if(p[k][0]==ch){
       if(p[k][2]=='$')
         follow(p[k][0]);
       else if(islower(p[k][2]))
         addToRes(p[k][2]);
       else
        first(p[k][2]);
      }
   }
   
}

void follow(char ch){
  int i,j;
  if(p[0][0]==ch){//if the character is the first non-terminal then it's follow have epsilon in it
    addToRes('$');
  }
  //other productions may also have the char ch
  for(i=0;i<n;i++){
     for(j=2;j<strlen(p[i]);j++){
        if(p[i][j]==ch){//if char found in rhs 
           if(p[i][j+1]!='\0')//if it's next is not end of the string ,then that's first will be there in follow(char ch)
             first(p[i][j+1]);
           if(p[i][j+1]=='\0')//if char next is end of the string then the rhs nterminal's follow will be the follow of given char
             follow(p[i][0]);
        }
     }
  }
}


void addToRes(char ch){
  int i;
  for(i=0;i<=m;i++){
     if(followResult[i]==ch)
        return;
  }
  followResult[m++]=ch;
}

int main(){
  int i,choice=1;
  char ch;
  
  printf("Enter number of productions:");
  scanf("%d",&n);
  for(i=0;i<n;i++){
    scanf("%s",p[i]);
  }
  do{
  m=0;
  printf("Find the follow of :");
  scanf(" %c",&ch);
  follow(ch);
  //printing the result here
  for(i=0;i<m;i++){
    printf("%c ",followResult[i]);
  }
  printf("\n");
  printf("Do you want to continue press 1 to continue and 0 to exit ? :");
  scanf("%d",&choice);
  }while(choice!=0);
}

/*
output
Enter number of productions:5
S-aABb
A-c
A-$
B-d
B-$
Find the follow of :S
$ 
Do you want to continue press 1 to continue and 0 to exit ? :1
Find the follow of :A
d b 
Do you want to continue press 1 to continue and 0 to exit ? :B
Find the follow of :b 
Do you want to continue press 1 to continue and 0 to exit ? :1
Find the follow of :d

Do you want to continue press 1 to continue and 0 to exit ? :0
*/

  

 //follow code
