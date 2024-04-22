#include<stdio.h>
#include<ctype.h>
int n;
char p[10][10];

void first(char* res,char ch){
   int i,k,j,fe=0;
   char subRes[10];
   res[0]='\0';
   subRes[0]='\0';
   if(!isupper(ch)){//if it is non-terminal then add to result
     addToRes(res,ch);
     return;
   }
   for(i=0;i<n;i++){
      if(p[i][0]==ch){
         if(p[i][2]=='$'){
           addToRes(res,'$');
         }
         else{//if it is non-terminal then its first is called
           j=2;
           while(p[i][j]!='\0'){
             fe=0;
             first(subRes,p[i][j]);
             //here adding subRes to res,if repeated chars comes then they are not added in the final result
             for(k=0;subRes[k]!='\0';k++){
               addToRes(res,subRes[k]);
             }
             //if epsilon is there then it will check another productions of given ch
             for(k=0;subRes[k]!='\0';k++){
                if(subRes[k]=='$'){
                  fe=1;
                  break;
                }
             }
             if(!fe){//if epsilon is not there then no need to check further 
               break;
             }
             j++;
          }
       }
    }
 }
 return;
 }
 
void addToRes(char res[],char ch){
     int k;
     for(k=0;res[k]!='\0';k++){
        if(res[k]==ch)//if repeated then no need to add
          break;
     }
     res[k]=ch;
     res[k+1]='\0';
}
           
   
int main(){
   int i,choice;
   char ch;
   char res[10];
   printf("Enter number of productions:");
   scanf("%d",&n);
   for(i=0;i<n;i++){
      scanf("%s",p[i]);
   }
   do{
   printf("Find the First of :");
   scanf(" %c",&ch);
   first(res,ch);
   //printing the first of ch
   for(i=0;res[i]!='\0';i++){
      printf("%c ",res[i]);
   }
   printf("\n");
   printf("do you want to continue,press 1 to continue 0 to exit?");
   scanf("%d",&choice);
   }while(choice!=0);
}

//output
/*
Enter number of productions:5
S-aABb
A-c
A-$
B-d
B-$
Find the First of :A
c $ 
do you want to continue,press 1 to continue 0 to exit?1
Find the First of :B
d $ 
do you want to continue,press 1 to continue 0 to exit?1
Find the First of :S
a 
*/

   //first code
