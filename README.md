# LexYacc-BrainDead-Lang

Welcome to the LexYacc-BrainDead-Lang project! This repository contains the source code and documentation for BrainDead, a programming language implemented using Lex and Yacc (Flex and Bison).

# Project Structure

The project structure is as follows:

- `src`: This directory contains the source code for the BrainDead language.
    - `Braindead.l`: The Lex file that defines the lexical rules for BrainDead.
    - `Braindead.y`: The Yacc file that specifies the grammar and semantic actions for BrainDead.
    - `sample_1.mpl` and `sample_2.mpl`: These files are provided as sample programs written in BrainDead. They can be used to test the language implementation.
    - `Braindead.pdf`: This PDF file provides a detailed explanation of the BrainDead programming language. It covers the language syntax, semantics, and features.

# Getting Started

To use the BrainDead language, follow these steps:

1. Clone or download this repository to your local machine.
2. Ensure that you have Lex and Yacc (Flex and Bison) installed.
3. Navigate to the `src` directory.
4. Compile the Lex and Yacc files using the appropriate commands for your system. For example:
    - On Unix-like systems:
        ```
        flex Braindead.l
        bison -d Braindead.y
        cc lex.yy.c Braindead.tab.c -o braindead
        ```
    - On Windows systems (using WinFlexBison):
        ```
        win_flex Braindead.l
        win_bison -d Braindead.y
        gcc lex.yy.c Braindead.tab.c -o braindead
        ```
5. Execute the `braindead` executable to start the BrainDead interpreter.
6. You can now enter BrainDead code or load the sample programs (`sample_1.mpl` or `sample_2.mpl`) to see the language in action.

# Contributing

Contributions to the LexYacc-BrainDead-Lang project are welcome! If you find any issues or have suggestions for improvements, please open an issue or submit a pull request. We appreciate your feedback.


For more information and detailed documentation, please refer to the [BrainDead.pdf](Braindead.pdf) file.

# Contact
For any inquiries or questions, please feel free to contact me at iletisimehmetalpay@gmail.com.

