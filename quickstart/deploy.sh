#!/bin/sh
hugo && rsync -avz --delete public/ ftp-009423@s12:~/9.suchet-architecte.fr
