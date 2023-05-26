## Description

This Bash script allows you to search for a keyword in all files in the current directory and its subdirectories. The script outputs the count of occurrences of the keyword for each file, along with the filename and directory. Made it per my final exam in linux, thought it could be useful for others.

Tested on only text files within current and all subdirectories. 

## Usage

To use the script, simply run it from the command line with the following syntax:

```
bash ./search.sh <keyword>
```

Replace `<keyword>` with the search term you want to use. The script will search for the keyword in all files in the current directory and its subdirectories, and output the results to the console.

## Example

Here's an example of how to use the script:

```
bash ./search.sh "example"
```

This will search for the keyword "example" in all files in the current directory and its subdirectories, and output the count of occurrences of the keyword for each file, along with the filename and directory.

## Example Output

```
Count  Filename                       Directory
-----  --------                       ---------
1      a2-feedback.txt                /home/user/final_exam/assignments
```

## Notes

- The script only searches for exact matches of the keyword. It does not perform partial matches or fuzzy searches (It can however treat everything under lower case in the script).
- The script does not search binary files or files that are not readable.
- The script uses the `grep` command to search for the keyword in each file. If you want to customize the search behavior, you can modify the `grep` command in the script.
- The script is designed to be run on Unix-based systems, such as Linux and macOS. It may not work on Windows systems without additional software.

