# DVWA - Bruteforce - Medium

## Set Up Burp Suite

Start a new temp project in Burp Suite.

We will be using Burp Suite Browser.

1. Click on Proxy.
2. Under Proxy click Intercept.
3. Now click on Open Browser.
4. Enter the IP Address of the DVWA Virtual Machine.

![1692543303765](image/Easy/1692543303765.png)

now you have this site.

## Login

Username: admin

Password: password

![1692543445399](image/Easy/1692543445399.png)

## Set up for this challenge

1. Go to DVWA Security.![1692543564250](image/Easy/1692543564250.png)
2. Now Select hard in the drop down menu and submit. You get the following alert. ![1692630287473](image/Hard/1692630287473.png)
3. For confirmation on bottom left side you can check. ![1692630332250](image/Hard/1692630332250.png)
4. Now click on Brute Force.

![1692543990678](image/Easy/1692543990678.png)

## Now Lets Start with the attack.

Now in burpsuite, click on ``Intercept is off`` to turn the intercept on.

Try entering the username ``admin`` and password ``pass`` and login.

![1692714406919](image/Hard/1692714406919.png)

Now lets send this information to Intruder.

Click on Action then Send to Intruder or Press ``Ctrl + i``.

![1692714540504](image/Hard/1692714540504.png)

select pass and click on add.

![1692544546600](image/Easy/1692544546600.png)

now we have set pass as the variable.

We now have a user_token that changes every time so the method used in easy and medium will not work. You can try and check it out.

Now lets add the user token as a variable.

![1692714749592](image/Hard/1692714749592.png)

Now we are gonna change the attack type to pitchfork as we have 2 variables.


## Setting Up the Payload

Go to Intuder -> Payloads

For the first payload sets![1692715036446](image/Hard/1692715036446.png)

In payload settings, lets load up this [file](https://github.com/danielmiessler/SecLists/blob/master/Passwords/xato-net-10-million-passwords.txt) from SecLists.

Click on load then goto the location of the file and select the file.

After Setup You get this

![1692547116563](image/Easy/1692547116563.png)

and for the second payload we will be using recursive grep.

![1692715095768](image/Hard/1692715095768.png)

Under Settings -> Grep - Extract click on add.

![1692715237226](image/Hard/1692715237226.png)

click on fetch responce.

![1692715297659](image/Hard/1692715297659.png)

Set start at offset and end at fixed length.

Give ok.

![1692715361938](image/Hard/1692715361938.png)

Set redirections to Always

![1692715618014](image/Hard/1692715618014.png)

## Final Step

Go to Intruder -> Settings -> Grep Match

Clear all and add ``incorrect`` and ``Incorrect`` to the list.

![1692547274335](image/Easy/1692547274335.png)

Go to resource pool and create a new resource pool with max set as 1.

![1692715477023](image/Hard/1692715477023.png)

Now start the attack.

## Results

![1692715738158](image/Hard/1692715738158.png)

We can see payload 1 is the passwords and payload 2 is the user token which always changes.

We can see changes in the row 2  in length and incorrect.

So we searched for incorrect passwords so all incorrect passwords are marked 1

the the password for admin user is ``password``.

The only problem faced was, there is a dely of 2 seconds.

Simmilarly there are few other users in the database their passwords are

* admin:password
* 1337:charley
* gordonb:abc123
* Pablo:letmein
* Smithy:password
