openssl s_client -connect <ip>:<port>           #eg: imap.yahoo.mail.com:993
a01 LOGIN <username> <password>                 
a02 LIST "" "*"               
a03 SELECT <mailbox>                            #eg: Inbox
a04 FETCH <sequence_Numer> <data>               #eg: 1 BODY[TEXT]
a05 logout
