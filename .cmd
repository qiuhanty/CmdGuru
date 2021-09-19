cat /etc/*release // show linux distribution
uname -a // show kernel version
cat /proc/cpuinfo // show cpu info
lscpu // show cpu arch info
lsblk // show block devices
lsusb -tv // show USB devices
sudo dmidecode // show hardware information from the BIOS
sudo hdparm -tT /dev/[device] // read-speed test on [device]
sudo badblocks -s /dev/[device] // check for bad blocks on [device]
locate [name] // Find all files and dirs related to [name]
ln -s [filename] [link_name] // Create a symbolic link for [filename]
gpg -c [filename] // Encrypt a file
gpg [filename] // Decrypt a file
wc -l [filename] // count lines of a file
for i in {1..5} ; do echo -e '\a'; sleep 3; done // sound alert from terminal
alias beep="for i in {1..5} ; do echo -e '\a'; sleep 3; done" // sound alert from terminal
ps aux | grep -i [n]ginx // show process with the given name, do NOT show grep itself
free -g // show free memory (in GB), -m: MB, -k, KB
df -h // show disk space usage in human readable form
kill -9 [pid] // kill a process with pid
chown -R [user:group] [dir or file] // change owner of a dir or file
sudo date -s "01/31/2021 23:59:53" // set system time
ifconfig -a | grep -i "inet " | awk '{print $2}' | grep -v "127.0.0.1" // show local ip address
mysql -u root -p -h [ip_addr] // connect to a remote mysql database
crontab -e // edit cron jobs
find . -name *.jpg -type f -print | xargs tar -cvzf images.tar.gz // search all jpg images and archive it
cat url-list.txt | xargs wget –c // download all the URLs in a file
sort -t: -k 3n /etc/passwd // sort passwd file by 3rd field
awk '!($0 in array) { array[$0]; print }' [file] // remove duplicate lines, dedup
awk -F ':' '$3==$4' /etc/passwd // print all lines that has the same uid and gid
awk -F "(" '{print $2}' | awk -F ")" '{print $1}' [file] // extract content inside the first "()"
cat nginx.access.log | awk '{print $1}' | sort | uniq -c | sort -nr | head -10 // show top 10 ip that issued the most queries
ps -eo rss,pid,comm | sort -nr | awk '{$1=int($1/1024)"MB";}{ print;}' | head -10 // show top 10 processes with most RSS memory
sed 's/.$//' [DOS_file] // convert DOS file format (\r\n) to Unix file format
sed -n '1!G;h;$p' [file] // print file content in reverse order
7z a -t7z -m0=lzma -mx=9 -mfb=64 -md=32m -ms=on archive.7z dir1 // Add all files in dir1 to archive.7z with Max Compression
getfacl <file> // Get ACL
setfacl -m u:username:rX <file> // Add or modify ACL on file
getfacl file-A | setfacl -M - file-B // Copy ACL from file-A to file-B
setfacl -x u:username,g:groupname <file> // Delete ACL
setfacl -b <file> // Delete all ACL on file, including default
setfacl -k <directory> // Delete only default ACLs
apt search <phrase> // To find packages matching <phrase>
apt show <package> // To show information on a package
apt update // To fetch package list
apt upgrade // To download and install updates without installing new package
apt dist-upgrade // To download and install the updates AND install new necessary packages
apt update && apt dist-upgrade // To perform a full system upgrade
apt install <package>...  // To install package(s)
apt remove <package>...  // To uninstall package(s)
apt-cache search <phrase> // To find packages matching <phrase>
apt-cache show <package>...  // To display package records for the named package(s)
apt-cache rdepends <package> // To display reverse dependencies of a package
apt-cache showpkg <package> // a package // To display package versions, reverse dependencies and forward dependencies of
apt-get download <package> // To download a package without installing it. (The package will be downloaded in your current working dir)
apt-get -o Dir::Cache="/path/to/destination/dir/" -o Dir::Cache::archives="./" install ...  // To change cache dir and archive dir (where .deb are stored)
grep 'install ' /var/log/dpkg.log // To show apt-get installed packages
apt-get update -o DPkg::Options::='--force-confold' ...  // To silently keep old configuration during batch updates
aptitude search <phrase> // To find packages matching <phrase>
aptitude show <package>...  // To display package records for the named package(s)
aptitude install <package>...  // To install package(s)
aptitude remove <package>...  // To remove package(s)
aptitude autoclean // To remove unnecessary package
aria2c <url> // The url can be a http(s), ftp, .torrent file or even a magnet link // To download a file
aria2c --follow-torrent=mem <url> // To prevent downloading the .torrent file
bzip2 -z foo // To compress a file (foo -> foo.bz2)
bzip2 -d foo.bz2 // To decompress a file (foo.bz2 -> foo)
bzip2 -zc foo > foo.bz2 // To compress foo to stdout
bzip2 -dc foo.bz2 // To decompress foo.bz2 to stdout
cat <file> // To display the contents of a file
cat -n <file> // To display file contents with line numbers
cat -b <file> // To display file contents with line numbers (blank lines excluded)
chmod a+x myscript.sh // Add execute for all (myscript.sh)
chmod u=rwx, go=r myscript.sh // Set user to read/write/execute, group/global to read only (myscript.sh), symbolic mode
chmod a-w myscript.sh // Remove write from user/group/global (myscript.sh), symbolic mode
chmod = myscript.sh // Remove read/write/execute from user/group/global (myscript.sh), symbolic mode
chmod 644 myscript.sh // Set user to read/write and group/global read (myscript.sh), octal notation
chmod 755 myscript.sh // Set user to read/write/execute and group/global read/execute (myscript.sh), octal notation
chmod 666 myscript.sh // Set user/group/global to read/write (myscript.sh), octal notation
chown <user>:<group> <file> // To change a file's owner and group
chown -R <user> <directory> // To change a directory's owner recursively
chown --reference=<reference-file> <file> // To change ownership to match another file
comm -12 <file-1> <file-2> // Print lines appearing in both <file-1> and <file-2>
comm -23 <file-1> <file-2> // Print lines appearing only in <file-1>
convert original.jpg -resize 100x converted.jpg // To resize an image to a fixed width and proportional height
convert original.jpg -resize x100 converted.jpg // To resize an image to a fixed height and proportional width
convert original.jpg -resize 100x100 converted.jpg // To resize an image to a fixed width and height
convert original.jpg -resize 100x converted.png // To resize an image and simultaneously change its file type
cpdf in.pdf 1-3,6 -o out.pdf // Read in.pdf, select pages 1, 2, 3 and 6, and write those pages to out.pdf
cpdf -merge in.pdf in2.pdf AND -add-text "Copyright 2014" -o out.pdf // files together and adding a copyright stamp to every page
cpdf in.pdf even -o out.pdf // Select the even pages (2, 4, 6...) from in.pdf and write those pages to out.pdf
curl <url> -o <outfile> // To download and rename a file
curl -O <url> -O <url> // To download multiple files
curl http://example.com/pic[1-24].jpg // To download all sequentially numbered files (1-24)
curl -u <username>:<password> <url> // To download a file and pass HTTP authentication
curl -x <proxy-host>:<port> <url> // To download a file with a proxy
curl -u <username>:<password> -O ftp://example.com/pub/file.zip // To download a file over FTP
curl ftp://username:password@example.com // To get an FTP directory listing
curl -C - -o <partial-file> <url> // To resume a previously failed download
curl -I <url> // To fetch only the HTTP headers from a response
curl http://ifconfig.me/all.json // To fetch your external IP and network info as JSON
curl --limit-rate 1000B -O <outfile> // To limit the rate of a download
curl httpbin.org/ip // To get your global IP
curl -o /dev/null -w '%{http_code}\n' -s -I URL // To get only the HTTP status code
cut -d# -f3 // To cut out the third field of text or stdoutput that is delimited by a #
date +"%Y%m%d_%H%M%S" // To print the date in a format suitable for affixing to file names
date -d @1440359821 // To convert a Unix timestamp to Date (Linux)
date -r 1440359821 // To convert a Unix timestamp to Date (OSX)
date -u // To list UTC time
TZ='America/Los_Angeles' date // Show the time on the west coast of the US (use tzselect(1) to find TZ)
dd if=/dev/urandom of=/tmp/test.txt count=2 bs=512 // Read from {/dev/urandom} 2*512 Bytes and put it into {/tmp/test.txt}
dd if=/dev/zero of=/dev/null bs=4KB &; export dd_pid=`pgrep '^dd'`; while [[ -d /proc/$dd_pid ]]; do kill -USR1 $dd_pid && sleep 1 && clear; done // Watch the progress of 'dd'
dd if=/dev/zero of=/dev/null bs=128M status=progress // Watch the progress of 'dd' with the built-in `progress` functionality (introduced in coreutils v8.24)
ar vx foo.deb  # -> data.tar.gz // To extract the contents of a .deb file
tar xf data.tar.gz
sudo dpkg -i foo.deb // To install .deb file to a debian like system (e.g: Ubuntu)
sudo apt-get install -f
df -h // To print free disk space in a human-readable format
sudo dhclient -r // To release the current IP address
sudo dhclient // To obtain a new IP address
sudo dhclient <interface> // To obtain a new IP address for a specific interface
diff -u <file-1> <file-2> // To view the differences between two files
diff -ur <dir-1> <dir-2> // To view the differences between two directories
diff -ub <file-1> <file-2> // To ignore whitespace
diff -uB <file-1> <file-2> // To ignore blank lines
diff -ui <file-1> <file-2> // To ignore the differences between uppercase and lowercase
diff -q <file-1> <file-2> // To report whether the files differ
diff -s <file-1> <file-2> // To report whether the files are identical
diff <(command1) <(command2) // To diff the output of two commands or scripts
diff -Naur <file-1> <file-2> > <patch-file> // To generate a patch file from two files
dnf install <package> // To install a package
dnf search <phrase> // To find packages matching <phrase>
dnf provides <executable> // To find which package provides an executable
dnf download <package> // To download a package
dnf builddep <file> // To install the build dependencies for a SRPM or from a .spec file
docker -d // To start the docker daemon
docker run -ti <image-name> /bin/bash // To start a container with an interactive shell
docker exec -ti <container-name> bash // To "shell" into a running container (docker-1.3+)
docker inspect <container-name> (or <container-id>) // To inspect a running container
docker inspect --format {{.State.Pid}} <container-name-or-id> // To get the process ID for a container
docker inspect --format='{{json .Volumes}}' <container-id> | python -mjson.tool // To list (and pretty-print) the current mounted volumes for a container
docker cp foo.txt mycontainer:/foo.txt // To copy files/folders between a container and your host
docker ps // To list currently running containers
docker ps -a // To list all containers
docker rm $(docker ps -qa) // To remove all stopped containers
docker images // To list all images
docker rmi $(docker images | grep "^<none>" | awk "{print $3}") // To remove all untagged images
docker volume prune // To remove all volumes not used by at least one container
dpkg -i <deb-file> // To install or upgrade a package
dpkg -P <deb-file> // To remove a package (including configuration files)
dpkg -l // To list all installed packages with versions and details
dpkg -s <deb-file> | grep Status // To determine whether a Debian package is installed
du -sk *| sort -rn // To sort directories/files by size
du -sh // To show cumulative human-readable size
ffmpeg -i <file> // To print file metadata
for f in *.m4a; do ffmpeg -i "$f" -acodec libmp3lame -vn -b:a 320k "${f%.m4a}.mp3"; done // To convert all m4a files to mp3
ffmpeg -i input.foo -vcodec bar -acodec baz -b:v 21000k -b:a 320k -g 150 -threads 4 output.bar // -g : GOP, for searchability // To convert video from .foo to .bar
ffmpeg -r 18 -pattern_type glob -i '*.png' -b:v 21000k -s hd1080 -vcodec vp9 -an -pix_fmt yuv420p -deinterlace output.ext // To convert image sequence to video
ffmpeg -i video.ext -i audio.ext -c:v copy -c:a copy output.ext // To combine video and audio into one file
ffmpeg -i input_video.mp4 -vf ass=sub.ass output_video_subtitles.mp4 // To add ass subtitle to the video
ffmpeg -i input_video.webm output_video.mp4 // To convert webm to mp4
ffmpeg -i input_video.mp4 -acodec copy -vcodec copy -f mov output_video.mov // To convert mp4 to mov
ffmpeg -i input_video.mov -vcodec copy -acodec copy output_video.mp4 // To convert mov to mp4
find . -iname "*.jpg" // To find files by case-insensitive extension (ex: .jpg, .JPG, .jpG)
find . -type d // To find directories
find . -type f // To find files
find . -type f -perm 777 // To find files by octal permission
find . -xdev \( -perm -4000 \) -type f -print0 | xargs -0 ls -l // To find files with setuid bit set
find ./path/ -name '*.txt' -exec rm '{}' \; // To find files with extension '.txt' and remove them
find ./path/ -name '*.txt' | xargs grep 'string' // To find files with extension '.txt' and look for a string into them
find . -size +5M -type f -print0 | xargs -0 ls -Ssh | sort -z // To find files with size bigger than 5 Mebibyte and sort them by size
find . -type f -size +200000000c -exec ls -lh {} \; | awk '{ print $9 ": " $5 }' // To find files bigger than 2 Megabyte and list them
find . -type f -mtime +7d -ls // To find files modified more than 7 days ago and list file information
find . -type l -user <username-or-userid> -ls // To find symlinks owned by a user and list file information
find . -type d -empty -exec rmdir {} \; // To search for and delete empty directories
find . -maxdepth 2 -name build -type d // To search for directories named build at a max depth of 2 directories
find . ! -iwholename '*.git*' -type f // To search all files who are not in .git directory
find . -type f -samefile MY_FILE_HERE 2>/dev/null // To find all files that have the same node (hard link) as MY_FILE_HERE
find . -type f -exec chmod 644 {} \; // To find all files in the current directory and modify their permissions
fkill 1337 // To kill a process by pid
fkill safari // To kill processes by name (case insensitive)
fkill :8080 // To kill a process listening on a port
fkill // To run the interactive interface
gcc file.c // To compile a file
gcc -o file file.c // To compile a file with a custom output
gcc -g // debug symbols
gcc -ggdb3 // debug with all symbols
gcc -m64 // To build for 64 bits
gcc -mwindows // To build a GUI for windows (Mingw) (Will disable the term/console)
gdb your-executable // To start the debugger
b some-method, break some-method // To set a breakpoint gdb
clear // To delete all breakpoints gdb
r, run // To run the program gdb
n, next // To run the current line, stepping over any invocations gdb
s, step // To run the current line, stepping into any invocations gdb
c, continue // To continue execution gdb
q, quit // To exit gdb (after program terminated)
bt, backtrace // To print a stacktrace gdb
backtrace full // To print a stacktrace with local variables gdb
info args // To print the arguments to the funtion of the current stack frame gdb
info locals // To print the local variables in the currently selected stack frame gdb
info threads // To print a list of all the threads gdb
info sharedlibrary // To print a list of all the loaded shared libraries gdb
p length=strlen(string) // To evaluate an expression and print the result gdb
l, list // To list surrounding source code gdb
disassemble // Disassemble the current function or given location gdb
disassemble {LOCATION} // gdb
x/{COUNT}{FMT}{SIZE} {ADDRESS} // Examine content at address with a format and letter size // gdb
gem search <package> // To search for a package
gem install <package> // To install a package
gem install --user-install <package> // To install a package in user space
gem install <package> -v <version> // To install specific version of a package
gem uninstall <package> // To uninstall a package
gem update <package> // To upgrade a package
gem info <package> // To show details of a package
gem list --local // To list local packages
gem help <command> // To show help on command
git config --global user.name <name> // To set your identity
git config --global user.email <email>
git config --global core.editor <editor> // To set your editor
git config --global color.ui true // To enable color
git add --all // To stage all changes for commit
git stash // To stash changes locally, this will keep the changes in a separate changelist
git stash push -m <message> // To stash changes with a message
git stash list // To list all the stashed changes
git stash pop // To apply the most recent change and remove the stash from the stash list
git stash apply stash@{6} // from the stash list // To apply any stash from the list of stashes. This does not remove the stash
git commit -m <message> // To commit staged changes
git commit --amend // To edit previous commit message
git commit --date="`date --date='2 day ago'`" // Git commit in the past
git commit --date="Jun 13 18:30:25 IST 2015"
git reset --hard // To remove staged and working directory changes
git reset --hard HEAD~2 // To go 2 commits back
git update-ref -d HEAD // fatal: ambiguous argument 'HEAD~1': unknown revision or path not in the working tree.  // Running git reset --hard HEAD~1 will give error: // To revert first/initial commit on a branch
git clean -f -d // To remove untracked files
git clean -f -d -x // To remove untracked and ignored files
git push origin master // To push to the tracked master branch
git push git@github.com:<username>/<repo>.git // To push to a specified repository
git push origin <tagname> // To push a tag to remote
git push -f // To force a push
git branch -D <branch> // To delete the branch <branch>
git branch -u upstream/foo // To make an exisiting branch track a remote branch
git blame <file> // To see who commited which line in a file
git remote add upstream git@github.com:<username>/<repo>.git // Set a new repo // To sync a fork with the master repo
git remote -v                                                // Confirm new remote repo
git fetch upstream                                           // Get branches
git branch -va                                               // List local - remote branches
git checkout master                                          // Checkout local master branch
git checkout -b new_branch                                   // Create and checkout a new branch
git merge upstream/master                                    // Merge remote into local repo
git show 83fb499                                             // Show what a commit did.
git show 83fb499:path/fo/file.ext                            // Shows the file as it appeared at 83fb499.
git diff branch_1 branch_2                                   // Check difference between branches
git log                                                      // Show all the commits
git status                                                   // Show the changes from last commit
git log --pretty=email --patch-with-stat --reverse --full-index -- Admin\*.py > Sripts.patch // To view the commit history of a set of files
git --git-dir=../some_other_repo/.git format-patch -k -1 --stdout <commit SHA> | git am -3 -k // To import commits from another repo
git log @{u}..  // To view commits that will be pushed
git log -p feature --not master // To view changes that are new on a feature branch
git diff master...feature
git rebase -i @~7 // To perform an interactive rebase for the prior 7 commits
git diff --no-index path/to/file/A path/to/file/B // This can be used to diff files that are not in a git repo!  // To diff files WITHOUT considering them a part of git
git fetch --all // To pull changes while overwriting any local commits
git reset --hard origin/master
git submodule update --init --recursive // To update all submodules
git clone --depth 1 <remote-url> // (helps save data when cloning large repos) // To perform a shallow clone to only get latest commits
git pull --unshallow // To unshallow a clone
git checkout --orphan branch_name // To create a bare branch (one that has no commits on it)
git checkout -b master upstream/master // To checkout a new branch from a different starting point
git remote prune origin // So if you have a lot of useless branches, delete them on Github and then run this // To remove all stale branches (ones that have been deleted on remote)
git remote prune $(git remote | tr '\n' ' ') // To prune all remotes at once
git show :/cool // So, this will show the first commit that has "cool" in their message body // Revisions can also be identified with :/text
git checkout -p HEAD^ -- /path/to/file // To undo parts of last commit in a specific file
git revert <commit SHA> // To revert a commit and keep the history of the reverted change as a separate revert commit
git cherry-pick <commit SHA1> // this just applies a single commit from a branch to current branch: // To pick a commit from a branch to current branch. This is different than merge as
gpg --gen-key // Create a key
gpg --list-keys // To list a summary of all keys
gpg --armor --export // To show your public key
gpg --fingerprint KEY_ID // To show the fingerprint for a key
gpg --search-keys 'user@emailaddress.com' // Search for keys
gpg --encrypt --recipient 'user@emailaddress.com' example.txt // To Encrypt a File
gpg --output example.txt --decrypt example.txt.gpg // To Decrypt a File
gpg --output ~/public_key.txt --armor --export KEY_ID // Export keys
gpg --output ~/private_key.txt --armor --export-secret-key KEY_ID
grep <pattern> <file> // To search a file for a pattern
grep -in <pattern> <file> // To perform a case-insensitive search (with line numbers)
grep -R <pattern> <dir> // To recursively grep for string <pattern> in <dir>
grep -f <pattern-file> <file> // Read search patterns from a file (one per line)
grep -v <pattern> <file> // Find lines NOT containing pattern
grep "^00" <file>                                               // Match lines starting with 00 // To grep with regular expressions
grep -E "[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}" <file> // Find IP add
grep -rnw <dir> -e <pattern> // To find all files that match <pattern> in <dir>
ps aux | grep '[h]ttpd' // (Add [] to the first letter. Ex: sshd -> [s]shd) // To exclude grep from your grepped output of ps
ps aux | grep -E --color 'bash|$' // Colour in red {bash} and keep all other lines
gs -dBATCH -dNOPAUSE -q -sDEVICE=pdfwrite -sOutputFile=output.pdf input.pdf // To reduce the size of a pdf file
gyb --email youremail@gmail.com --action estimate // To estimate the number and the size of all mails on youremail@gmail.com
gzip test.txt // To create a *.gz compressed file
gzip -c test.txt > test_custom.txt.gz // To create a *.gz compressed file to a specific location using -c option (standard out)
gzip -d test.txt.gz // To uncompress a *.gz file
gzip -l *.gz // Display compression ratio of the compressed file using gzip -l
gzip -r documents_directory // Recursively compress all the files under a specified directory
gzip < test.txt > test.txt.gz // To create a *.gz compressed file and keep the original
sudo lshw // To display all hardware details
lsmod // To list currently loaded kernel modules
find /lib/modules/$(uname -r) -type f -iname "*.ko" // To list all available modules
modprobe <module> // To load a module
modprobe -r <module> // To remove a module
lspci // To list devices connected via pci bus
lspci -vvxxx // To debug output for pci devices (hex)
cat /proc/cpuinfo // To display cpu hardware stats
cat /proc/meminfo // To display memory hardware stats
dmesg // To output the kernel ring buffer
dmesg --kernel // Ouput kernel messages
head <file> // To show the first 10 lines of <file>
head -n <number> <file> // To show the first <number> lines of <file>
head -c <number> <file> // To show the first <number> bytes of <file>
hg clone // To clone a directory
hg add <file> // To add files to hg tracker
hg add <dir> // To add all files in <dir> to hg tracker
hg commit -m <message> // To create a commit with all tracked changes and a message
hg push // To push commits to source repository
hg pull // To pull changes from source repository
hg pull --rebase // To rebase local commits to disambiguate with remote repository
history | awk '{CMD[$2]++;count++;}END { for (a in CMD)print CMD[a] " " CMD[a]/count*100 "% " a;}' | grep -v "./" | column -c3 -s " " -t | sort -nr | nl | head -n10 // To see most used top 10 commands
http PUT example.org X-API-Token:123 name=John // Custom HTTP method HTTP headers and JSON data
http -f POST example.org hello=World // Submitting forms
http -v example.org // See the request that is being sent using one of the output options
http -a USERNAME POST https://api.github.com/repos/jkbrzt/httpie/issues/83/comments body='HTTPie is awesome!' // Use Github API to post a comment on an issue with authentication
http example.org < file.json // Upload a file using redirected input
http example.org/file > file // Download a file and save it via redirected output
http --download example.org/file // Download a file wget style
http --session=logged-in httpbin.org/headers // http --session=logged-in -a username:password httpbin.org/get API-Key:123 // persistent between requests to the same host: // Use named sessions_ to make certain aspects or the communication
http localhost:8000 Host:example.com // Set a custom Host header to work around missing DNS records
http PUT example.org name=John email=john@example.org // Simple JSON example
http PUT api.example.com/person/1 name=John age:=29 married:=false hobbies:='["http", "pies"]' description=@about-john.txt bookmarks:=@bookmarks.json // embedded into fields using =@ and :=@: // JSON into the resulting object. Text and raw JSON files can also be // Non-string fields use the := separator, which allows you to embed raw
http POST api.example.com/person/1 < person.json // Send JSON data stored in a file
http --form POST api.example.org/person/1 name='John Smith' email=john@example.org cv=@~/Documents/cv.txt // Regular Forms
http -f POST example.com/jobs name='John Smith' cv@~/Documents/cv.pdf // type is multipart/form-data: // If one or more file fields is present, the serialization and content // File Upload Forms
http example.org  User-Agent:Bacon/1.0  'Cookie:valued-visitor=yes;foo=bar' X-Foo:Bar  Referer:http://httpie.org/ // To set custom headers you can use the Header:Value notation
http -a username:password example.org // Basic auth
http --auth-type=digest -a username:password example.org // Digest auth
http -a username example.org // With password prompt
http httpbin.org/basic-auth/httpie/test
http --proxy=http:http://10.10.1.10:3128 --proxy=https:https://10.10.1.10:1080 example.org // You can specify proxies to be used through the --proxy argument for each protocol (which is included in the value in case of redirects across protocols)
http --proxy=http:http://user:pass@10.10.1.10:3128 example.org // With Basic authentication
http --verify=no https://example.org // --verify=no (default is yes): // To skip the HOST'S SSL CERTIFICATE VERIFICATION, you can pass
http --verify=/ssl/custom_ca_bundle https://example.org // You can also use --verify=<CA_BUNDLE_PATH> to set a CUSTOM CA BUNDLE path
http --cert=client.pem https://example.org // the path of the cert file with --cert: // To use a CLIENT SIDE CERTIFICATE for the SSL communication, you can pass
http --cert=client.crt --cert-key=client.key https://example.org // If the PRIVATE KEY is not contained in the cert file you may pass the path of the key file with --cert-key
iconv -f iso-8859-1 -t utf-8 iconv.src -o /tmp/iconv.out // To convert file (iconv.src) from iso-8859-1 to utf-8 and save to /tmp/iconv.out
ifconfig <interface> // To display network settings of an interface
ifconfig -a // To display all interfaces, even if down
ifconfig wlan0 {up|down} // To take down / up the wireless adapter
ifconfig eth0 192.168.1.100 netmask 255.255.255.0 // To set a static IP and netmask
route add -net 192.168.1.0 netmask 255.255.255.0 gw 192.168.1.1 // You may also need to add a gateway IP
indent -i3 -kr -nut -l120 // no tabs, 3 spaces per indent, wrap lines at 120 characters.  // To Format C/C++ source according to the style of Kernighan and Ritchie (K&R),
ip addr // To display all interfaces with addresses
ip link set dev wlan0 {up|down} // To take down / up the wireless adapter
ip addr add 192.168.1.100/32 dev eth0 // To set a static IP and netmask
ip addr del 192.168.1.100/32 dev eth0 // To remove a IP from an interface
ip address flush dev eth0 // To remove all IPs from an interface
ip route // To display all routes
ip -6 route // To display all routes for IPv6
ip route add default via 192.168.1.1 // To add default route via gateway IP
ip route add 192.168.0.0/24 dev eth0 // To add route via interface
ip link set dev eth0 address aa:bb:cc:dd:ee:ff // To change your mac address
ip neighbor show // To view neighbors (using ARP and NDP)
watch --interval 0 'iptables -nvL | grep -v "0     0"' // To show hit for rules with auto refresh
watch -d -n 2 iptables -nvL // To show hit for rule with auto refresh and highlight any changes since the last refresh
iptables -A INPUT -i eth0 -p tcp --dport 902 -j REJECT --reject-with icmp-port-unreachable // To block port 902 and hide this port from nmap
iwconfig wlan0 // To display wireless settings of the first wireless adapter
iwconfig wlan0 txpower {on|auto|off} // To take down / up the wireless adapter
iwconfig wlan0 mode {managed|ad-hoc|monitor} // To change the mode of the wireless adapter
java -jar <filename.jar> // To run a java file // To execute a java program
java -jar <filename.jar> <arg1> <arg2> ...  // To pass arguments to your java program
java -jar example.jar "Hello world" 1234
java -showversion // To get the version of the installed java enviroment
java -Xms256m -Xmx2g -Xss1m -jar <filename.jar> // set the intial memory size to be used by the program
java -classpath <classpath> -jar <filename.jar> // use the classpath variable
java -cp . HelloWorld "hello"
javac HelloWorld.java // To compile a simple source file
javac *.java // To compile several source files
javac -d build HelloWorld.java // To specify another destination directory
javac -sourcepath src/dependencies/java Main.java // To use another source directory for source dependencies
javac -classpath lib/commons-cli-1.4.jar:lib/log4j-1.2.12.jar HelloWorld.java // To define where compiled dependencies should be searched
javac -Werror NoWarning.java // To consider warnings as errors
javac -source 1.7 Java7.java // To compile Java 7 code
javac -verbose *.java // To make the compiler more verbose
javac -deprecation App.java // To display usage of deprecated APIs
javac -g HelloWorld.java // To include debugging info in class files
javac -version // To display version
javac -help // To get help
jbang init --template=cli CmdLineApp.java // Create a new command line application using Picocli
jbang edit --open=code CmdLineApp.java // Edit application with Visual Studio Code
jbang edit --live --open=idea CmdLineApp.java // Edit application with IDEA and have the project regenerated on dependencies changes
jbang build CmdLineApp.java // Rebuild application in cache without starting it
jbang CmdLineApp.java command arg1 arg2...  // Run command line application with jbang
jbang jdk list // List jbang installed JDK
jbang cache clear // Clear jbang cache
jbang completion | sudo tee /etc/bash_completion.d/jbang // Install auto-completion script for Bash
journalctl -f // To actively follow log (like tail -f)
journalctl -b -p err // To display all errors since last boot
journalctl --since=2012-10-15 --until="2011-10-16 23:59:59" // To filter by time period
journalctl -F _SYSTEMD_UNIT // To show list of systemd units logged in journal
journalctl -u dbus // To filter by specific unit
journalctl /usr/bin/dbus-daemon // To filter by executable name
journalctl _PID=123 // To filter by PID
journalctl _COMM=sshd // To filter by Command, e.g., sshd
journalctl _COMM=crond --since '10:00' --until '11:00' // To filter by Command and time period
journalctl --list-boots // To list all available boots
journalctl _UID=1000 // To filter by specific User ID e.g., user id 1000
jq "." < filename.json // To pretty print the json
jq '.foo' // To access the value at key "foo"
jq '.[0]' // To access first list item
jq '.[2:4]' // to slice and dice
jq '.[:3]'
jq '.[-2:]'
jrnl // To add entry to default jrnl (from your configured text editor)
jrnl <entry> // To add <entry> to default jrnl
jrnl --tags // To list of tags
jrnl @tag // To entries per tag
jrnl --export json // To export jrnl as json
jrnl -from 2009 -until may // To entries in a timeframe
kill -15 <pid> // To kill a process gracefully
kill -9 <pid> // To kill a process forcefully
kubectl -h // Display list of all available commands
kubectl command_name -h // Display an explanation of a specific command
kubectl api-resources // Display complete list of supported resources
kubectl explain resource_name // Display an explanation of a specific reource
kubectl explain resource_name.field_name // Display an explanation of a specific field of resource
kubectl options // Display list of global command-line options
ldconfig -p // To display available libraries
ldconfig // To update library resources
ldd // To display libraries and file location
ln -s <source-location> <symlink-location> // To create a symlink
ln -sf <source-location> <symlink-location> // To symlink, while overwriting existing destination files
ls <dir> // To display everything in <dir>, excluding hidden files
ls -a <dir> // To display everything in <dir>, including hidden files
ls -lh <dir> // To display all files, along with the size (with unit suffixes) and timestamp
ls -S <dir> // To display files, sorted by size
ls -d */ <dir> // To display directories only
ls -d .*/ */ <dir> // To display directories only, include hidden
lsblk // To show all available block devices along with their partitioning schemes
lsblk --scsi // To show SCSI devices
lsblk /dev/sda // To show a specific device
lsblk --fs // To fetch info about filesystems
lsblk --json // For JSON, LIST or TREE output formats use the following flags
lsblk --list
lsblk --tree // default view
sudo lsof -i4 // To list all IPv4 network files
sudo lsof -i6 // To list all IPv6 network files
lsof -i // To list all open sockets
lsof -Pnl +M -i4 // To list all listening ports
lsof -i TCP:80 // To find which program is using the port 80
lsof -i@192.168.1.5 // To list all connections to a specific host
lsof <path> // To list all processes accessing a particular file/directory
lsof -u <username> // To list all files open for a particular user
lsof -c <command> // To list all files/network connections a command is using
lsof -p <pid> // To list all files a process has open
pvcreate /dev/sda // Create PV
pvdisplay /dev/sda // Display info about PV
vgcreate vg0 /dev/sda // Create VG
vgdispay vg0 // Display info about VG
vgextend vg0 /dev/sdb // Add PV to VG, PV must be created before
pvmove /dev/sdb         // Move data from PV // Remove PV from VG
vgreduce data /dev/sdb
vgchange --activate n vg0 // Deactivate VG, do this when you want to physically remove device
lvcreate --name root --size 8G vg0 // Create LV
lvextend --size 16G vg0/root // Extend LV size
lvreduce --size 8G vg0/root // Reduce LV size, FS must be resized first!
lvremove vg0/root // Remove LV
lvcreate --name root --size 8G --mirrors 1 data vg0 // Create mirrored LV (RAID1)
man -t bash | ps2pdf - bash.pdf // To convert a man page to pdf
man 7 ascii // To view the ascii chart
mdadm --create /dev/md${M} --level=raid5 --raid-devices=4 /dev/sd{a,b,c,d,e}${P} --spare-devices=/dev/sdf1 // To create (initialize) a new array
mdadm --assemble /dev/md${M} /dev/sd{a,b,c,d,e}${P} // To manually assemble (activate) an existing array
mdadm --assemble --scan // To automatically assemble (activate) all existing arrays
mdadm --stop /dev/md${M} // To stop an assembled (active) array
mdadm --query /dev/md${M} // To see array configuration
mdadm --query --examine /dev/sd${D}${P} // To see array component configuration (dump superblock content)
mdadm --detail /dev/md${M} // To see detailed array confiration/status
mdadm --detail --scan > /etc/mdadm/mdadm.conf // (MAY be required by initrd for successfull boot) // To save existing arrays configuration
mdadm --zero-superblock /dev/sd${D}${P} // (MUST do before reusing a partition for other purposes) // To erase array component superblock
mdadm --manage /dev/md${M} --fail /dev/sd${D}${P} // (SHOULD when a device shows wear-and-tear signs, e.g. through SMART) // To manually mark a component as failed
mdadm --manage /dev/md${M} --remove /dev/sd${D}${P} // (SHOULD before preemptively replacing a device, after failing it) // To remove a failed component
sfdisk -d /dev/sd${D,sane} | sfdisk /dev/sd${D,new} // To prepare (format) a new device to replace a failed one
mdadm --manage /dev/md${M} --add /dev/sd${D,new}${P} // (this will trigger the rebuild) // To add new component to an existing array
cat /proc/mdstat // To see assembled (active) arrays status
mdadm --assemble /dev/md${M} /dev/sd{a,b,c,d,e}${P} --name="${name}:${M}" --update=name // To rename a device
minikube start --vm-driver=virtualbox // To start with virtualbox driver
minikube docker-env // To configure docker environment variables
minikube dashboard // To start view the dashboard in a browser
minikube service list // To list all services
minikube service <service> // To start a service in a browser
mkdir -p foo/bar/baz // To create nested directories
mkdir -p foo/{bar,baz} // To create foo/bar and foo/baz directories
mkdir -p foo/{bar,baz/{zip,zap}} // To create the foo/bar, foo/baz, foo/baz/zip and foo/baz/zap directories
more +5 <file> // To show <file> beginning at line number 5
mount -o remount,rw / // To mount / partition as read-write in repair mode
mount --bind <source> <destination> // To bind mount path to a second location
mount -o uid=username,gid=usergroup /dev/sdx /mnt/xxx // To mount Usb disk as user writable
mount -t nfs <host>:<remote-dir> <local-dir> // To mount a remote NFS directory
mount -o loop disk1.iso /mnt/disk // To mount an ISO
mysql -h <host> -u <username> -p // To connect to a database
mysqldump --all-databases --all-routines -u <username> -p > ~/dump.sql // To backup all databases
mysql -u <username> -p  < ~/fulldump.sql // To restore all databases
CREATE DATABASE owa CHARACTER SET utf8 COLLATE utf8_general_ci; // To create a database in utf8 charset // mysql
GRANT ALL PRIVILEGES ON database.* TO 'user'@'localhost'IDENTIFIED BY 'password' WITH GRANT OPTION; // To add a user and give rights on the given database // mysql
SHOW GRANTS FOR CURRENT_USER(); // To list the privileges granted to the account that you are using to connect to the server. Any of the 3 statements will work. // mysql
SHOW GRANTS; // mysql
SHOW GRANTS FOR CURRENT_USER; // mysql
SELECT * FROM tbl_name; // Basic SELECT Statement // mysql
INSERT INTO tbl_name (col1,col2) VALUES(15,col1*2); // Basic INSERT Statement // mysql
UPDATE tbl_name SET col1 = "example"; // Basic UPDATE Statement // mysql
DELETE FROM tbl_name WHERE user = 'jcole'; // Basic DELETE Statement // mysql
SHOW PROCEDURE STATUS; // To check stored procedure // mysql
SHOW FUNCTION STATUS; // To check stored function // mysql
mysqldump -u<username> -p<password> <database> > db.sql // To dump a database to a file (Note that your password will appear in your command history!)
mysqldump -u<username> -p <database> > db.sql // To dump a database to a file
mysqldump -u<username> -p<password> <database> | gzip -9 > db.sql // To dump a database to a .tgz file (Note that your password will appear in your command history!)
mysqldump -u<username> -p <database> | gzip -9 > db.sql // To dump a database to a .tgz file
mysqldump -u<username> -p<password> --all-databases > all-databases.sql // To dump all databases to a file (Note that your password will appear in your command history!)
mysqldump -u<username> -p --all-databases > all-databases.sql // To dump all databases to a file
mysqldump --no-data -u<username> -p <database> > dump_file // To export the database structure only
mysqldump --no-create-info -u<username> -p <database> > dump_file // To export the database data only
nc -p <src-port> -w <seconds> <dest-host> <dest-port> // To open a TCP connection from <src-port> to <dest-port> of <dest-host>, with a timeout of <seconds>
nc -u <dest-host> <dest-port> // To open a UDP connection to <dest-port> of <dest-host>
nc -s <source-host> <dest-host> <port> // To open a TCP connection to port 42 of <host> using <source-host> as the IP for the local end of the connection
nc -lU /var/tmp/dsocket // To create and listen on a UNIX-domain stream socket
nc -x<proxy-host>:<proxy-port> -Xconnect <dest-host> <dest-port> // directive in ssh_config(5) for more information.  // <proxy-port>. This example could also be used by ssh(1); see the ProxyCommand // To connect to <dest-port> of <dest-host> via an HTTP proxy at <proxy-host>,
nc -x<proxy-host>:<proxy-port> -Xconnect -Pruser <host> <port> // The same example again, this time enabling proxy authentication with username "ruser" if the proxy requires it
nc -zv -s source_IP target_IP Port // To choose the source IP for the testing using the -s option
ncat <host> [<port>] // Connect mode (ncat is client) | default port is 31337
ncat -l [<host>] [<port>] // Listen mode (ncat is server) | default port is 31337
ncat -l [<host>] [<port>] < file // Transfer file (closes after one transfer)
ncat -l --keep-open [<host>] [<port>] < file // Transfer file (stays open for multiple transfers)
ncat [<host>] [<port>] > file // Receive file
ncat -l --broker [<host>] [<port>] // Brokering | allows for multiple clients to connect
ncat -l --ssl [<host>] [<port>] // Listen with SSL | many options, use ncat --help for full list
ncat -l --allow <ip> // Access control
ncat -l --deny <ip>
ncat --proxy <proxyhost>[:<proxyport>] --proxy-type {http | socks4} <host>[<port>] // Proxying
ncat -l --chat [<host>] [<port>] // Chat server | can use brokering for multi-user chat
ncdu -o <file> // To save results to <file>
ncdu -f <file> // To read from <file>
ncdu -o- | gzip > <file> // To save results to a compressed file
zcat <file> | ncdu -f- // To read from a compressed file
sudo netstat -lnptu // To view which users/processes are listening to which ports
netstat -r // To view routing table (use -n flag to disable DNS lookups)
netstat -pln | grep <port> | awk '{print $NF}' // Which process is listening to port <port>
sudo netstat -vtlnp --listening -4 // Fast display of ipv4 tcp listening programs
ip route // For netstat -r
ip -s link // For netstat -i
ip maddr // For netstat -g
nkf -g <file> // To check the file's charactor code
nkf -w --overwrite <file> // To convert charactor code to UTF-8
nkf -e --overwrite <file> // To convert charactor code to EUC-JP
nkf -s --overwrite <file> // To convert charactor code to Shift-JIS
nkf -j --overwrite <file> // To convert charactor code to ISO-2022-JP
nkf -Lu --overwrite <file> // To convert newline to LF
nkf -Lw --overwrite <file> // To convert newline to CRLF
nkf -Lm --overwrite <file> // To convert newline to CR
echo テスト | nkf -WwMQ // To MIME encode
echo "=E3=83=86=E3=82=B9=E3=83=88" | nkf -WwmQ // To MIME decode
nmap [target] // Single target scan
nmap -iL [list.txt] // Scan from a list of targets
nmap -6 [target] // iPv6
nmap -O --osscan_guess [target] // OS detection
nmap -oN [output.txt] [target] // Save output to text file
nmap -oX [output.xml] [target] // Save output to xml file
nmap -source-port [port] [target] // Scan a specific port
nmap -A [target] // Do an aggressive scan
nmap -T5 --min-parallelism=50 -n --min-rate=300 [target] // --min-rate=X => min X packets / sec // -n => disable ReverseDNS // Speedup your scan
nmap -traceroute [target] // Traceroute
nmap -sP 192.168.0.0/24 // Example: Ping scan all machines on a class C network
nmcli d wifi disconnect iface <wiface> // Disconnect from WiFi - Parameters
nmcli radio wifi // Get WiFi status (enabled / disabled)
nmcli radio wifi <on|off> // Enable / Disable WiFi
nmcli dev wifi list // Show all available WiFi access points
nmcli dev wifi rescan // Refresh the available WiFi connection list
nmcli con // Show all available connections
nmcli con show --active // Show only active connections
nmcli dev status // Review the available devices
npm install <package> // To install a package in the current directory
npm install --save <package> // To install a package, and save it in the `dependencies` section of `package.json`
npm install --save-dev <package> // To install a package, and save it in the `devDependencies` section of `package.json`
npm outdated // To show outdated packages in the current directory
npm update // To update outdated packages
npm install -g npm // To update `npm` (will override the one shipped with Node.js)
npm uninstall <package> // To uninstall a package
service ntp status // To verify if ntpd is running
service ntp start // To start ntpd if not running
sudo hwclock -r // To display current hardware clock value
sudo hwclock --systohc // To apply system time to hardware time
sudo hwclock --hctosys // To apply hardware time to system time
sudo hwclock --localtime // To set hwclock to local time
sudo hwclock --utc // To set hwclock to UTC
sudo hwclock --set --date="8/10/15 13:10:05" // To set hwclock manually
ntpq -pn // To query surrounding stratum time servers
/etc/ntp.conf // To config file
/var/lib/ntp/ntp.drift // location of "drift" of your system clock compared to ntp servers: // To driftfile
numfmt --to=iec --suffix=B --padding=7 1048576 // To convert bytes to Human readable format
od <binary-file> // To dump a file in octal format
od -o <binary-file>
od -t o2 <binary-file>
od -x <binary-file> // To dump a file in hexadecimal format
od -t x2 <binary-file>
od -A x -t x1 <binary-file> // To dump a file in hexadecimal format, with hexadecimal offsets and a space between each byte
openssl genrsa -out server.key 2048 // To create a 2048-bit private key
openssl req -new -key server.key -out server.csr // To create the Certificate Signing Request (CSR)
openssl x509 -req -days 365 -in server.csr -signkey server.key -out server.crt // To sign a certificate using a private key and CSR
openssl req -text -noout -in server.csr // To show certificate information for a certificate signing request
openssl x509 -text -noout -in server.crt // To show certificate information for generated certificate
openssl x509 -in server.crt -noout -sha256 -fingerprint // To get the sha256 fingerprint of a certificate
echo | openssl s_client -connect <hostname>:443 2> /dev/null | \ // To view certificate expiration
patch <file> < <patch-file> // To patch one file
patch -R <file> < <patch-file> // To reverse a patch
patch -p1 -r <dir> < <patch-file> // To patch files in a directory, with one level (/) offset
pdftk *.pdf cat output all.pdf // To concatenate all pdf files into one
pdftk 1.pdf 2.pdf 3.pdf cat output 123.pdf // To concatenate specific pdf files into one
pdftk A=fist.pdf B=second.pdf cat A1-5 B3 output new.pdf // To concatenate pages 1 to 5 of first.pdf with page 3 of second.pdf
perl -v // To view the perl version
echo -e "foo\nbar\nbaz" | perl -pe 's/\n/\\n/g;' // Replace string "\n" to newline
cat test.txt | perl -0pe "s/test1\ntest2/test1 test2/m" // Replace newline with multiple line to space
pgrep <pattern> // To get a list of PIDs matching <pattern>
pgrep -f <pattern> | xargs kill // To kill all PIDs matching <pattern>
php -v // To view the php version
php -m // To view the installed php modules
php -i // To view phpinfo() information
php -l file.php // To lint a php file
find . -name "*.php" -print0 | xargs -0 -n1 -P8 php -l // To lint all php files within the cwd
php -a // To enter an interactive shell
php -i | grep "php.ini" // To locate the system's php.ini files
php -S localhost:3000 // To start a local webserver for the cwd on port 3000 (requires php >= 5.4)
ping -c 15 <host> // To ping <host> with 15 packets
ping -c 15 -i .5 <host> // To ping <host> with 15 packets, one every .5 seconds
ping -s 1500 -c 10 -M do <host> // To test if a packet size of 1500 bytes is supported (to check the MTU for example)
pip search <package> // To search for a package
pip install <package>...  // To install packages
pip install --user <package> // To install a package in user space
pip install --upgrade <package> // To upgrade a package
pip freeze > requirements.txt // To output and install packages in a requirement file
pip install -r requirements.txt
pip show <package> // To show details of a package
pip list --outdated // To list outdated packages
pip freeze --local | grep -v '^\-e' | cut -d = -f 1 | xargs -n1 pip install -U // To upgrade all outdated packages
pip list --outdated --format=freeze | cut -d = -f 1 | xargs -n1 pip install -U // To upgrade outdated packages on latest version of pip
pip install -I SomePackage1==1.1.0 'SomePackage2>=1.0.4' // To install specific version of a package
pkill <process-name> // To kill a process using its full process name
pkill -f <string> // To kill a process by its partial name
popd // To return to the directory at the top of the `pushd' stack
ps aux // To list every process on the system
ps axjf // To list a process tree
ps -aufoouser // To list every process owned by foouser
ps -eo pid,user,command // To list every process with a user-defined format
ps aux | grep '[h]ttpd' // Exclude grep from your grepped output of ps. Add [] to the first letter. Ex: sshd -> [s]shd
psql -U <username> -h <host> -d <database> // Connect to a specific database
psql -U <username> -h <host> --list // Get databases on a server
psql -U <username> -d <database> -c 'select * from tableName;' -o <outfile> // Execute sql query and save output to file
psql -U <username> -d <database> -H -c 'select * from tableName;' // Execute query and get tabular html output
psql -U <username> -d <database> -c 'copy (select * from tableName) to stdout with csv header;' -o <outfile> // (if column names in the first row are not needed, remove the word 'header') // Execute query and save resulting rows to csv file
psql -f <outfile> // Read commands from file
psql -f <outfile> <username> // Restore databases from file
pushd <directory> // To pushes your current directory to the top of a stack while changing to the specified directory
popd // To return use popd
pwd // Show the absolute path of your current working directory
python -m SimpleHTTPServer // Python v2.7
python -m http.server 8000 // Python 3
python -m smtpd -n -c DebuggingServer localhost:1025 // SMTP-Server for debugging, messages will be discarded, and printed on stdout.
python -m json.tool foo.json // Pretty print a json
route -n // To display routing table IP addresses instead of host names
route add default gateway 192.168.0.1 // To add a default gateway
route add -net 127.0.0.0 netmask 255.0.0.0 dev lo // To add the normal loopback entry, using netmask 255.0.0.0 and associated with
route add -net 192.56.76.0 netmask 255.255.255.0 dev eth0 // To add a route to the local network 192.56.76.x via "eth0".  The word "dev" can be omitted here
route del default // To delete the current default route, which is labeled "default" or 0.0.0.0 in the destination field of the current routing table
route add default gw mango-gw // To add a default route
route add ipx4 sl0 // To add the route to the "ipx4" host via the SLIP interface (assuming that "ipx4" is the SLIP host)
route add -net 192.57.66.0 netmask 255.255.255.0 gw ipx4 // To add the net "192.57.66.x" to be gateway through the former route to the SLIP interface
route add -net 10.0.0.0 netmask 255.0.0.0 reject // To install a rejecting route for the private network "10.x.x.x."
rpm -ivh <rpm> // To install a package
rpm -e <package> // To remove a package
rpm -e --nodeps <package> // To remove a package, but not its dependencies
rpm -qf <file> // To find what package installs a file
rpm -ql <package> // To find what files are installed by a package
rpm -qpl <rpm>
rpm -q --whatrequires <package> // To find what packages require a package or file
rpm -q --whatrequires <file>
rpm -qa // To list all installed packages
rpm -i --test <package> // To find a packages's dependencies
rpm -K <package> // To display checksum against a source
rpm -V <package> // To verify a package
rpm2cpio <rpm-file> | cpio -vt // To list contents of an RPM
rpm2cpio <rpm-file> | cpio -vid // To extract contents of an RPM
rsync -avz host:file1 :file1 /dest/ // To copy files from remote to local, maintaining file properties and sym-links (-a), zipping for faster transfer (-z), verbose (-v)
rsync -avz /source host:/dest
rsync -avc <src> <dest> // changed. (Useful for validating backups): // To copy files using checksum (-c) rather than time to detect if the file has
rsync -auv <src> <dest> // This command will create /dest/foo if it does not already exist // To copy contents of /src/foo to destination
rsync -auv <src> <dest> // To explicitly copy <src> to <dest>
rsync -avz -e "ssh -p1234" <source> <username>@<host>:<dest> // To copy file from local to remote over ssh with non standard port 1234 to destination folder in remoteuser's home directory
ruby -run -e httpd . -p <port> // To serve the current directory
ruby <file> // To execute a script file
ruby -e 'command' // To execute one line of script
ruby -c <file> // To check script file syntax
ruby -Idirectory // To specify $LOAD_PATH directory
ruby -Ispec spec/test_spec.rb
sam2p *.pdf out.pdf // To concatenate all pdf files into one
scd -ar ~/Documents/ // To index recursively some paths for the very first run
scd doc // To change to a directory path matching "doc"
scd a b c // To change to a path matching all of "a", "b" and "c"
scd "ts$" // To change to a directory path that ends with "ts"
scd -v // To show selection menu and ranking of 20 most likely directories
scd --alias=xray // To alias current directory as "xray"
scd xray // To jump to a previously defined aliased directory
scp <file> <user>@<host>:<dest> // To copy a file from your local machine to a remote server
scp <user>@<host>:<src> <dest> // To copy a file from a remote server to your local machine
scp -o "ProxyCommand nc -x 127.0.0.1:9999 -X 4 %h %p" <file> <user>@<host>:<dest> // To scp a file over a SOCKS proxy on localhost and port 9999 (see ssh for tunnel setup)
screen -S <session-name> // To start a new named screen session
screen -r <session-name> // To re-attach a detached session
screen -ls // To list all screen sessions
sed 's/day/night/g' <file> // To replace all occurrences of "day" with "night" and write to stdout
sed -i 's/day/night/g' <file> // To replace all occurrences of "day" with "night" within <file>
echo 'It is daytime' | sed 's/day/night/g' // To replace all occurrences of "day" with "night" on stdin
sed -i -r 's/^\s+//g' <file> // To remove leading spaces
sed '/^$/d' <file> // To remove empty lines and print results to stdout
sed ':a;N;$!ba;s/\n//g' <file> // To replace newlines in multiple lines
sed '/Once upon a time/i\Chapter 1' // To insert a line before a matching pattern
sed '/happily ever after/a\The end.' // To add a line after a matching pattern
sha256sum <file> // To compute hash (checksum) of <file>
echo -n "Hello World" | sha256sum
shutdown -r now // To reboot the system immediately
shutdown -h now // To shut system down immediately
shutdown -r +5 // To reboot system after 5 minutes
shutdown -c // To cancel a scheduled shutdown
smbclient -L <host> -U% // To display public shares on the server
smbclient //<host>/<share> -U<user>%<password> // To connect to a share
snap find <package> // To find <package>
snap info <package> // To view detailed information about <package>
snap find --private // To view all private snaps (must be logged in)
sudo snap install <package> // To install the <package>
sudo snap install <package> --channel=beta // To install the <package> from the "beta" channel
snap list // To view installed snaps
snap list --all // To list all revisions of installed snaps
sudo snap refresh // To (manually) update all snaps
sudo snap refresh <package> // To (manually) update <package>
sudo snap refresh <package> --channel=beta // To update <package> to the "beta" channel
sudo snap revert <package> // To revert <package> to a prior version
snap revert <package> --revision 5 // To revert <package> to revision 5
sudo snap remove <package> // To remove <package>
sudo snap login // To log in to snap (must first create account online)
snap logout // To log out of snap
snap changes // To view a transaction log summary
snap change 123 // To view details of item 123 in the transaction log
snap watch 123 // To watch transaction 123
snap abort 123 // To abort transaction 123
snap download <package> // To download <package> (and its assertions) *without* installing it
sort <file> // To sort a file
sort -u <file> // To sort a file by keeping only unique
sort -r <file> // To sort a file and reverse the result
sort -R <file> // To sort a file randomly
split <file> -l 1000 // To split a large text file into smaller files of 1000 lines each
split <file> -b 10M // To split a large binary file into smaller files of 10M each
sqlite3 <database> // to create database and launch interactive shell
sqlite3 <database> "create table os(id integer primary key, name text, year integer);" // to create table
sqlite3 <database> "insert into 'os' values(1,'linux',1991);" // to insert data
sqlite3 <database> ".tables" // to list tables
sqlite3 <database> ".schema 'os'" // to describe table
sqlite3 <database> "select * from 'os';" // to view records in table
sqlite3 <database> "select * from 'os' where year='1991';" // to view records in table conditionally
sqlite3 <database> "select * from 'os' where year like '19%';" // to view records with fuzzy matching
./sqlmap.py --url="<url>" --data="<post-data>" --banner // Test URL and POST data and return database banner (if possible)
./sqlmap.py -r <request-file> <options> // Parse request data and test | request data can be obtained with burp
./sqlmap.py -r <request-file> --fingerprint // Fingerprint | much more information than banner
./sqlmap.py -r <request-file> --current-user --current-db --hostname // Get database username, name, and hostname
./sqlmap.py -r <request-file> --is-dba // Check if user is a database admin
./sqlmap.py -r <request-file> --users --passwords // Get database users and password hashes
./sqlmap.py -r <request-file> --dbs // Enumerate databases
./sqlmap.py -r <request-file> -D <db-name> --tables // List tables for one database
./sqlmap.py -r <request-file> -D <db-name> -T <tbl-name> -C <col-name> --dump // Extract data
./sqlmap.py -r <request-file> --sql-query="<sql-query>" // Execute SQL Query
./sqlmap.py -r <request-file> --prefix="<sql-query>" --suffix="<sql-query>" // Append/Prepend SQL Queries
./sqlmap.py -r <request-file> --os-shell // Get backdoor access to sql server | can give shell access
ss -tlp // show all listing tcp sockets including the corresponding process
ss -t dst 192.168.2.1:80 // show all sockets connecting to 192.168.2.1 on port 80
ss -t state established '( dport = :ssh or sport = :ssh )' // show all ssh related connection
ssh -i <pemfile> <user>@<host> // To ssh via pem file (which normally needs 0600 permissions)
ssh -p <port> <user>@<host> // To connect on a non-standard port
ssh -A <user>@<host> // To connect and forward the authentication agent
ssh -t <user>@<host> 'the-remote-command' // To execute a command on a remote server
ssh -X <user>@<host> // To tunnel an x session over SSH
ssh -f -L 8080:remote.example.com:5000 user@personal.server.com -N // Redirect traffic with a tunnel between local host (port 8080) and a remote host (remote.example.com:5000) through a proxy (personal.server.com)
ssh -X -t <user>@<host> 'chromium-browser' // To launch a specific x application over SSH
ssh -qND <port> <user>@<host> // To create a SOCKS proxy on localhost and <port>
ssh -o "ProxyCommand nc -x 127.0.0.1:9999 -X 4 %h %p" <user>@<host> // To tunnel an ssh session over the SOCKS proxy on localhost and port 9999
ssh <user>@<host> -C -c blowfish -X // -X use an xsession, -C compress data, "-c blowfish" use the encryption blowfish
ssh-add <keyfile> // To add private key
ssh-add -K // To load resident keys from FIDO2 authenticator
ssh-add -K ~/.ssh/github_rsa // To store a GitHub SSH passphrase in your keychain
ssh-add -L // To list all public keys
ssh-add -l // To list fingerprints of all keys
ssh-add -d <keyfile> // To delete key
ssh-add -D // To delete all keys
ssh-copy-id <user>@<host> // To copy a key to a remote host
ssh-copy-id <user>@<host> -p 2222 // To copy a key to a remote host on a non-standard port
ssh-copy-id ~/.ssh/otherkey "username@host -p 2222" // To copy a key to a remote host on a non-standard port with non-standard ssh key
ssh-keygen -t rsa // To generate an SSH key
ssh-keygen -t rsa -b 4096 // To generate a 4096-bit SSH key
ssh-keygen -t ed25519-sk // To generate a FIDO/U2F token-backed key
ssh-keygen -t ed25519-sk -O resident // To generate a FIDO2 resident key
ssh-keygen -p -P <old-passphrase> -N <new-passphrase> -f <keyfile> // To update a passphrase on a key
ssh-keygen -p -P <old-passphrase> -N '' -f <keyfile> // To remove a passphrase on a key
ssh-keygen -t rsa -b 4096 -C "$USER@$HOSTNAME" -P <passphrase> // To generate a 4096 bit RSA key with a passphase and comment containing the user and hostname
ssh-keygen -lf <keyfile> // To print the fingerprint of a public key
ssh-keygen -E md5 -lf <keyfile> // To print the Github-style (MD5) fingerprint of a public key
ssh-keygen -K // To download resident keys from a FIDO2 authenticator to the current directory
ssh-keygen -y -f <private-key-file> > <public-key-file> // To view the public key associated with a private key
ssh-keygen -y -f ~/.ssh/private-key > ~/.ssh/public-key.pub
strace <command> // To strace a command
strace -o <outfile> <command> // To save the trace to a file
strace -e trace=open <command> // To follow only the open() system call
strace -e trace=file <command> // To follow all the system calls which open a file
strace -e trace=process <command> // To follow all the system calls associated with process management
strace -f <command> // To follow child processes as they are created
strace -c <command> // To count time, calls and errors for each system call
strace -p <pid> // To trace a running process (multiple PIDs can be specified)
svn update "/path" // To Update working copy from repository
svn status // To Show changed files in working copy
svn diff "/path/filename" // To Show what changed in local file
svn add "path/item" // To Add files or folders
svn revert "/path/file" // To Revert local uncommited changes
svn commit -m "message" "/path" // To Commit changes to repo
svn help diff // To Show help for 'svn diff'
systemctl // To see running processes
systemctl status foo.service // To check the status of a service
systemctl start/restart/stop foo.service // To start/restart/stop a service
systemctl reload foo.service // To reload a service's configuration
systemctl edit foo.service // To edit a service's configuration
systemctl daemon-reload // To reload systemd manager configuration
systemctl enable foo.service // To enable a service to startup on boot
systemctl disable foo.service // To disable a service to startup on boot
systemctl --user start/restart/stop emacs.service // To start/restart/stop per-user service
systemctl list-units // To see all active units, add --all for everything
systemctl list-units -at service // To see all service units
systemctl list-units -t service --state running // To see filtered units (all running service)
systemctl list-unit-files -at service // To see all service files, see which are enabled or disabled
systemctl list-units --all --state=inactive // To list all units with specific status, inactive, active, enabled, running, exited
systemctl list-unit-files // To use systemctl to list all unit files
journalctl -b // To see log items from the most recent boot
journalctl -k // To to see only kernal messages, add -b for at the most recent boot
journalctl -b -u foo.service // To get the log entries for a service since boot
systemctl list-dependencies foo.service // To list the dependencies of a service
systemctl show foo.service // To see low level details of a service settings on the system
systemctl list-units --type=target // To list currently loaded targets
systemctl isolate foo.target // To change current target
systemctl enable foo.target // To change default target
systemd-analyze // To display process startup time
systemd-analyze blame // To display process startup time at service level
systemctl list-units // To list running units
systemctl enable foo.service // To load a unit at startup
systemctl <start | stop> foo.service // To start or Stop a unit
tail <file> // To show the last 10 lines of <file>
tail -n <number> <file> // To show the last <number> lines of <file>
tail -n +<number> <file> // To show the last lines of <file> starting with <number>
tail -c <number> <file> // To show the last <number> bytes of <file>
tail -f <file> // To show the last 10 lines of <file> and to wait for <file> to grow
tar -xvf /path/to/foo.tar // To extract an uncompressed archive
tar -cvf /path/to/foo.tar /path/to/foo/ // To create an uncompressed archive
tar -xzvf /path/to/foo.tgz // To extract a .gz archive
tar -czvf /path/to/foo.tgz /path/to/foo/ // To create a .gz archive
tar -ztvf /path/to/foo.tgz // To list the content of an .gz archive
tar -xjvf /path/to/foo.tgz // To extract a .bz2 archive
tar -cjvf /path/to/foo.tgz /path/to/foo/ // To create a .bz2 archive
tar -xvf /path/to/foo.tar -C /path/to/destination/ // To extract a .tar in specified Directory
tar -jtvf /path/to/foo.tgz // To list the content of an .bz2 archive
tar czvf /path/to/foo.tgz --exclude=\*.{jpg,gif,png,wmv,flv,tar.gz,zip} /path/to/foo/ // To create a .gz archive and exclude all jpg,gif,... from the tgz
tcpdump -i eth0 // Intercepts all packets on eth0
tcpdump host 173.194.40.120 // Intercepts all packets from/to 173.194.40.120
tcpdump -nn -i any host 173.194.40.120 and port 80 // Intercepts all packets on all interfaces from / to 173.194.40.120 port 80, -nn => Disables name resolution for IP addresses and port numbers.
tcpdump -i any -A host 173.194.40.120 and port 80 | grep 'User-Agent' // Make a grep on tcpdump (ASCII), -s0 => By default, tcpdump only captures 68 bytes, -A  => Show only ASCII in packets.
tcpdump 'host ( 8.8.8.8 or 173.194.40.127 ) and port 80' -i any // Intercepts all packets on all interfaces from / to 8.8.8.8 or 173.194.40.127 on port 80
tcpdump 'tcp[tcpflags] & (tcp-syn|tcp-fin) != 0' // Intercepts all packets SYN and FIN of each TCP session.
tcpdump 'tcp[tcpflags] & (tcp-syn|tcp-fin) != 0 and not src and dst net local_addr' // To display SYN and FIN packets of each TCP session to a host that is not on our network
tcpdump 'tcp port 80 and (((ip[2:2] - ((ip[0]&0xf)<<2)) - ((tcp[12]&0xf0)>>2)) != 0)' // To display all IPv4 HTTP packets that come or arrive on port 80 and that contain only data (no SYN, FIN no, no packet containing an ACK)
tcpdump -w file.cap // Saving captured data
tcpdump -r file.cap // Reading from capture file
tmux attach // To restore tmux session
tmux attach -d // To detach an already attached session (great if you are moving devices with different screen resolutions)
tmux ls // To display session
(head -n1 && tail -n1) < file // print first line and last line
sed -e 1b -e '$!d' file // print first line and last line
sudo ioping -c 10 /dev/sda1 // disk perf/latency
