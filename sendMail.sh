#!/bin/bash   

#Geting user data
read -p "Enter your mail ID : " mailfrom
read -p "Enter recipient Mail ID : " mailto
read -p "Enter password : " smtppwd
read -p "Enter Subject of mail : " subject
read -p "Enter the content of mail : " content
smtpusr=$mailfrom

#Redirecting to stderr
function err_exit() { echo -e 1>&2; exit 1; }

#Send mail
function mail_input {
echo -ne "AUTH LOGIN\n"
echo -ne "${smtpusr}\n"
echo -ne "${smtppwd}\n"
echo -ne "MAIL FROM: <${mailfrom}>\n"
echo -ne "RCPT TO: <${mailto}>\n"
echo -ne "DATA\n"
echo -ne "Content-type: text/html\n"
echo -ne "From: <${mailfrom}>\n"
echo -ne "To: <${mailto}>\n"
echo -ne "Subject: ${subject}\n"
echo -ne "\n"
echo -ne ${content}"\n"
echo -ne ".\n"
echo -ne "quit"
}

mail_input | openssl s_client -starttls smtp -connect smtp.yahoo.com:25 || err_exit
