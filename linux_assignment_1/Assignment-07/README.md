# Assignment 07
# PART - A
Here I performed a git task using command line.
## Basic Git Tasks
First clone the remote repo using below command and enter inyo it.
$ git clone https://github.com/<github_username>/<reponame>.git
In our case "test" is the remote repo.
![image](https://github.com/Kiran-dehlikar/linux_script/assets/104997588/5a185d7b-4857-4195-8e6a-494f70da6df2)

## Step 1
Create a folder ninja at the root level of your cloned code.
### Command:
$ mkdir ninja
### Output:
![image](https://github.com/Kiran-dehlikar/linux_script/assets/104997588/04dd0c47-9973-4a98-9291-333c9a93e947)

## Step 2
Add a file README.md with content "Trying fast forward merge" in  ninja folder
### Command:
$ cd ninja
$ vim RRADME.md
### Output:
![image](https://github.com/Kiran-dehlikar/linux_script/assets/104997588/a4bc229f-2eca-46bc-84c6-45375522d64e)

## Step 3
Create a branch ninja and move to it.
### Command:
$ git checkout -b ninja
$ git branch
### Output:
![image](https://github.com/Kiran-dehlikar/linux_script/assets/104997588/254a691b-cdf9-4399-b4b6-45f44a6f7015)

## Step 4
Run git status command
### Command:
$ git status
$ git add .   (here "." means all content)
### Output:
![image](https://github.com/Kiran-dehlikar/linux_script/assets/104997588/4c2db910-a2ef-4b5e-907b-e334721e0db3)

## Step 5
Commit your changes to ninja branch
### Command:
$ git commit -m "added ninja folder and readme"
### Output:
![image](https://github.com/Kiran-dehlikar/linux_script/assets/104997588/8e94ca70-f6c2-4436-bd53-380d20488b60)

## Step 6
Merge ninja branch to master branch make sure that a new commit get's created
### Command:
$ git checkout master
$ git log --graph    (to verify )
$ git merge ninja
$ git log --graph    (to verify)
### Output:
![image](https://github.com/Kiran-dehlikar/linux_script/assets/104997588/bf0965b4-51ef-4484-a421-279fe6ac4952)
![image](https://github.com/Kiran-dehlikar/linux_script/assets/104997588/a3a92c7c-056b-4726-99ff-c82f610d99b0)

## Step 7
Assuming you are in the master branch, modify README.md with content "Changes in master branch", commit the changes in master branch.
### Command:
$ git branch
$ vim README.md
$ git commit -m "modified by master"
### Output:
![image](https://github.com/Kiran-dehlikar/linux_script/assets/104997588/2be5a974-b33c-4f48-be75-54516b74f21d)

## Step 8
Switch to ninja branch, modify README.md with content "Changes in ninja branch", commit the changes in ninja branch.
### Command:
$ git checkout ninja 
$ git branch
$ vim README.md
$ git commit -m "modified by ninja"
### Output:
![image](https://github.com/Kiran-dehlikar/linux_script/assets/104997588/ca9dcfbc-5a23-4ab3-a8a7-235de2579bbd)
