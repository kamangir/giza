# giza 🔻

read the working paper: ([pdf](https://github.com/kamangir/assets/blob/main/giza/giza.pdf))

---

```bash
 > giza help
giza digest \
	[dryrun,publish] \
	[<application-1+application-2>|all]
 . digest applications.
giza pylint -  \
	[<args>]
 . pylint giza.
giza pytest \
	[dryrun,list,~log,plugin=<plugin-name>,show_warning] \
	[filename.py|filename.py::test]
 . pytest giza.
giza test \
	list
 . list giza tests.
giza test \
	what=all|<test-name>,dryrun \
	dryrun
 . test giza.
giza open|open_pdf
 . open giza.pdf.
giza update|update_pdf [~pull,push,~rm]
 . update assets/giza.pdf in https://github.com/kamangir/giza/.
```

---

![image](./assets/giza.png)

[awesome bash cli](https://github.com/kamangir/awesome-bash-cli) 🚀 (`abcli`) is an example implementation of `giza` ([svg](./assets/giza.svg)).
