# SCSS

- it has another syntax -> .sass




$main: #444;   // variables

@import "buttons";  // import the _buttons.scss  // its a partial!



# nesting
```scss

.foo{
    color: #444;

    h2 {
        font-size: 3em;
    }
}

```




```scss
text: {
	decoration: underline;    // same as text-*
}

```





```scss

&.foo {    // & referes to the parent
	
}

```