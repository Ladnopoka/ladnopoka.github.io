---
title: File Converter  
layout: post  
background: images/csv-to-json.jpg 
subtitle: A versatile file converter that transforms files between various formats such as JSON, CSV, MD, and HTML.  
category: software  
languages:  
  - name: C#  
    slug: csharp  
---

<div style="text-align: center; margin-top: -30px; margin-bottom: 25px; scale: 1">
  <a href="https://github.com/Ladnopoka/FileConverter" target="_blank" class="btn btn-primary" style="padding: 10px 20px; font-size: 1.2em;">GitHub Repository</a>
</div>

# File Converter
<h3 style="font-size: 25px">
The File Converter is a C# project designed to convert files between several formats, including JSON, CSV, Markdown (MD), and HTML. This project was developed during my university studies and tested on Windows 10 using Visual Studio Code.
</h3>

## Features
- **Format Conversion**: Convert files between CSV, JSON, MD, and HTML formats.
- **Console Application**: Accepts input and output file paths through the command line, making it easy to automate conversions.
- **Error Handling**: Detects and handles incorrect file paths and formats.
- **Helper Commands**: Provides various commands such as `-verbose`, `-list-formats`, and `-help` for better user interaction.
- **Cross-format Parsing**: Parses and extracts data from supported file formats and outputs them in the desired format.

## Supported Formats
- **CSV**: Converts to and from CSV files.
- **JSON**: Parses JSON files and outputs them into other formats or converts files into JSON.
- **HTML**: Supports HTML table parsing and conversion.
- **Markdown (MD)**: Handles Markdown file format for conversion to/from other types.

## Command-Line Options
- `-v | -verbose`: Enables verbose mode, providing detailed output during file conversion.
- `-o <file> | -output=<file>`: Specifies the output file.
- `-l | -list-formats`: Lists all the available formats (CSV, JSON, HTML, MD).
- `-h | -help`: Displays the help menu with available options.
- `-i | -info`: Shows version information of the program.

## Prerequisites
- Visual Studio Code or any C# compatible IDE.
- .NET runtime installed on your machine.

## How to Use
Run the application through the command line by specifying an input file, an output file, and optional flags:
bash
dotnet run input.csv output.json -v

# Contact
## For any inquiries or feedback, feel free to reach out to:

**Jevgenij Ivanov** <br>
**Email**: ladnopokaa@gmail.com <br><br>
**GitHub**: https://github.com/Ladnopoka <br>
**itch.io**: https://ladnogames.itch.io/ <br>
**YouTube**: https://www.youtube.com/@LadnoDev <br>
**X**: https://x.com/Ladnopokaa <br>
**Discord**: https://discord.gg/BPsncTZe
