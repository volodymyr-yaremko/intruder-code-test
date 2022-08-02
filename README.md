# Intruder Code Test

## Introduction

Welcome to the Intruder code test.

We recommend that the test should take 3-4 hours. It would be great if you could let us know how much time you spent on the test. There is no right or wrong amount of time, this info will simply help us with context when reviewing the results.

Your task is to write new code that parses the `example.nessus` XML file, stores the results in the database and then displays the results in the Vue.js front-end.

Feel free to amend the existing code if you like.

## Prerequisites

Before starting this code test you should ensure that you have the following environment setup.

- Ruby 2.7.5
- Node 16.13.0
- NPM 8.1.0

## Background

Nessus is an automated vulnerability scanner that can be used to scan IT systems for security vulnerabilities. Once the scan is complete, Nessus generates a results file in XML format containing various sections, such as: _Targets_, _Policy_, and _Report_. _Targets_ are the systems that were scanned, the _Policy_ describes the configuration of the scan and the _Report/ReportItems_ are the results (security vulnerabilities) of the scan.

**We're interested in the Report section: the data here represents the actual findings of a vulnerability scan. You can ignore the other sections.** You can find more details on the Nessus XML format [here](https://static.tenable.com/documentation/dot_nessus_file_format.pdf).

## Story Specification

**The**  **goal of this coding test is to build an application that allows users to upload an  Nessus XML file (**`example.nessus`**) and then display the results in a "nice way".**

You will have to take a look at the XML structure and decide how you want to extract the information from the XML file and then store it in the database (i.e. design the models). Finally, you should pick whatever format of presentation you think is best suited to display the results in the front-end.

You can assume that XML files are well-formed and have the same structure as the provided example.

## Evaluation

This assignment is purposefully somewhat open-ended because we're interested in seeing what and how you prioritise. That being said, consider how your implementation might handle a file upload larger (e.g. 500MB or more) than the `example.nessus` included.

Additionally, we're looking for **clean code that follows best practices**, and it's always nice to see a **user-friendly UI.**

Your submission doesn't have to be "perfect", the idea behind the code test is to set the stage for our follow-on discussion. So please use it show off how you would approach a problem like this. Comments or notes that explain your thought process are appreciated, too!

## Questions?

If you have any questions or want to clarify something, please open an issue on the GitLab project. This will alert our team and someone will get back to you as soon as possible.
