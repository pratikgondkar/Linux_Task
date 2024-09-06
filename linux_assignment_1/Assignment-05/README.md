# ASSIGNMENT 05 

# Part A 
I create a utility (templateEngine.sh) that can generate values file and replace the variables provided as arguments.
for example: ./teplateEngine.sh template.file key1=value1 key2=value2....
Here in our case template.file is "trainer.template" having content 
{{fname}} is trainer of {{topic}} 

### Command :
./teplateEngine.sh trainer.template fname=sandeep topic=linux

### Output :
![image](https://github.com/kiran-opstree/devops_ninja/assets/149475012/ff4f06de-29f3-4d82-8121-4f1a65a83a22)



# Part B : Text editor utility
Here I create a utility (otTextEditor.sh) to make changes in the file.

## 1. Add a line at top
Here I use a case statement where action is "addLineTop" followed by filename and statement.
### Command :
./otTextEditor.sh addLineTop file1.txt "Hello adding line at top."

### Output :
![image](https://github.com/kiran-opstree/devops_ninja/assets/149475012/7b0bc3c2-2dcd-488c-9d5f-b5247b482342)


## 2. Add a line at bottom
Here I use a case statement where action is "addLineBottom" followed by filename and statement.

### Command :
./otTextEditor.sh addLineBottom file1.txt "adding line at bottom."

### Output :
![image](https://github.com/kiran-opstree/devops_ninja/assets/149475012/59e0f840-03e5-45a8-be25-9ecfc0de0260)


## 3. Add a line at specific line number

Here I use a case statement where action is "addLineAt" followed by filename, line number and statement.

### Command :
./otTextEditor.sh addLineAt file1.txt 4 "adding line at line no."

### Output :
![image](https://github.com/kiran-opstree/devops_ninja/assets/149475012/e1b5831f-5981-4e75-832c-f0adb05f6bad)


## 4. Replace first word

Here I use a case statement where action is "updateFirstWord" followed by filename, old_word and new_word.

### Command :
./otTextEditor.sh updateFirstWord file1.txt "at" "on"

### Output :
![image](https://github.com/kiran-opstree/devops_ninja/assets/149475012/0603a0d3-b1ae-4ddc-8094-46da715ab439)


## 5. Replace all word

Here I use a case statement where action is "updateAllWords" followed by filename, old_word and new_word.

### Command :
./otTextEditor.sh updateAllWords file1.txt "line" "KING"

### Output :
![image](https://github.com/kiran-opstree/devops_ninja/assets/149475012/28651d3d-b86c-4fc8-8513-f64295139cfb)


## 6. Delete first word

Here I use a case statement where action is "deleteFirstWord" followed by filename and word.

### Command :
./otTextEditor.sh deleteFirstWord file1.txt "message"

### Output :
![image](https://github.com/kiran-opstree/devops_ninja/assets/149475012/285387b4-beab-435e-a5a2-77f91218986d)


## 7. Delete all word

Here I use a case statement where action is "deleteAllWords" followed filename and word.

### Command :
./otTextEditor.sh deleteAllWords file1.txt "message"

### Output :
![image](https://github.com/kiran-opstree/devops_ninja/assets/149475012/fca0c243-5592-46d1-80ec-1637d3b3245e)


## 8. Delete a line

Here I use a case statement where action is "deleteLine" followed by filename and line number.

### Command :
./otTextEditor.sh deleteLine file1.txt 3

### Output :
![image](https://github.com/kiran-opstree/devops_ninja/assets/149475012/9562b30f-0acf-4ab8-a2a1-6cf2d8444bf4)


## 9. Delete a line containeing a word

Here I use a case statement where action is "deleteLine" followed by filename, line number and word.

### Command :
./otTextEditor.sh deleteLine file1.txt 7 Capture

### Output :
![image](https://github.com/kiran-opstree/devops_ninja/assets/149475012/2eb67439-9870-47da-a10e-d7bb579db664)



