## Multi-Language Debugging Toolkit

Multi-language debugging toolkit (mldtk) is a collection of software tools derived from the xtc project at http://www.cs.nyu.edu/xtc. The main goal of this toolkit is to make it easy to test and debug the computer programs written in multiple programming languages. It includes a debugger for mixed-environment (Blink), a runtime error detector for foreign language interfaces (Jinn), and a syntax and semantic error checker for processing macros in multiple languages (Marco). Its implementation works for Java and C/C++ while its design is programming language agnostic.
 
 ### Building mldtk
 ```
 $ git clone https://github.com/byeonglee/mldtk.git
 $ cd mldtk
 mldtk$ vi setup.sh
 mldtk$ source setup.sh
 mldtk$ make
 ```
 
 ### Running testsuites
 ```
 mldtk$ make check-jinn
 mldtk$ make check-blink
 mldtk$ make check-marco
 ```
 
 ## Related research papers
* MUSEUM: Debugging Real-World Multilingual Programs using Mutation Analysis. Information and Software Technology (IST) Volume 82, February 2017 \[[paper](https://byeonglee.github.io/publications/museum-ist-2017.pdf)\].
* Mutation-Based Fault Localization for Real-World Multilingual Programs. IEEE/ACM International Conference on Automated Software Engineering (ASE), Lincoln, November 2015 \[[paper](https://byeonglee.github.io/publications/museum-ase-2015.pdf)\].
* Debugging Mixed-Environment Programs with Blink. Software--Practice & Experience (SPE), Volumn 45 Issue 9, September 2015 \[[paper](https://byeonglee.github.io/publications/blink-spe-2015.pdf)\].
* Marco: Safe, Expressive, Macros for Any Language. European Conference on Object-Oriented Programming (ECOOP), pages 589-613, Beijing, June 2012 \[[paper](https://byeonglee.github.io/publications/marco-ecoop-2012.pdf)|[slides](https://byeonglee.github.io/publications/marco-ecoop-2012-slides.pdf)\].
* Jinn: Synthesizing Dynamic Bug Detectors for Foreign Language Interfaces. ACM SIGPLAN International Conference on Programming Language Design and Implementation (PLDI), pages 36-49, Toronto, June 2010 \[[paper](https://byeonglee.github.io/publications/jinn-pldi-2010.pdf)|[slides](https://byeonglee.github.io/publications/jinn-pldi-2010-slides.pdf)\].
* Debug All Your Code: Portable Mixed-Environment Debugging. ACM SIGPLAN International Conference on Object-Oriented Programming, Systems, Languages, and Applications (OOPSLA), pages 207-226, Orlando, October 2009 \[[paper](https://byeonglee.github.io/publications/blink-oopsla-2009.pdf)|[slides](https://byeonglee.github.io/publications/blink-oopsla-2009-slides.pdf)\].
