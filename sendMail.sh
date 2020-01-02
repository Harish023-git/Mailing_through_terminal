#!/bin/bash   

read -p "Enter your mail ID : " mailfrom
read -p "Enter recptionist Mail ID : " mailto
read -p "Enter password : " smtppwd
read -p "Enter Subject of mail : " subject
read -p "Enter the content of mail : " emailHTMLStr

HOSTNAME="mail.yahoo.com"
smtpsrv="smtp.yahoo.com"
smtpport="25"

function err_exit() { echo -e 1>&2; exit 1; }

function mail_input {
echo -ne "helo ${HOSTNAME}\r\n"
echo -ne "ehlo ${HOSTNAME}\r\n"
echo -ne "AUTH LOGIN\r\n"
echo -ne "${smtpusr}\r\n"
echo -ne "${smtppwd}\r\n"
echo -ne "MAIL FROM: <${mailfrom}>\r\n"
echo -ne "RCPT TO: <${mailto}>\r\n"
echo -ne "DATA\r\n"
echo -ne "Content-type: text/html\r\n"
echo -ne "From: <${mailfrom}>\r\n"
echo -ne "To: <${mailto}>\r\n"
echo -ne "Subject: ${subject}\r\n"
echo -ne "\r\n"
echo -ne ${emailHTMLStr}"\r\n"
echo -ne ".\r\n"
echo -ne "quit"
}

mail_input | openssl s_client -starttls smtp -connect ${smtpsrv}:${smtpport} || err_exit
