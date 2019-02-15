## 0.2.1 - Recognize z/OS UNIX Assembler files
* ASM: include file type 's' in the list of file types associated with ASM.

## 0.2.0 - Incremental improvements based on usage
* PLX: treat @logic/endlogic as multiline comments
* PLX: Apply highlighting to macro files too
* PLX: When highlighting BIFs like Length(), highlight the name only (was highlighting the open paren too)
* PLX: Many new snippets to insert common constructs like If, Select

## 0.1.0 - First Release
* Basic assembler and PL/x syntax highlighting.  Plenty of TODOs in the grammar files.  Not all of them can be implemented given Atom's restrictions on hightlighters, which in some cases conflict with the language definitions.
