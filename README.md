# Interceptable Validators
ASP.NET Validators are a quite well designed but rather inflexible approach to form validation. This project provides a small javascript file to intercept ASP.NET validation with your own javascript code.

Validators can be intercepted on a page level or field level.

# HowTo
Add a the script `interceptableValidators.js` to your site and initialize validators **AFTER** the ASP.NET validation code block. This can be done by using jQuery's DomReady event

			$(function () {
				interceptPageValidation({
					beforeValidation: function () {
						console.log('beforeValidatorOnSubmit');
					},
					afterValidation: function (valid) {
						console.log('afterValidatorOnSubmit' + valid);
					}
				});

				interceptFieldValidation({
					beforeValidation: function (val) {
						console.log('beforeFieldValidation' + val);
					},
					afterValidation: function (val, valid) {
						var inputFields = $(val).parent('.input-fields:first');
						if (valid) {
							inputFields.removeClass('error');
						} else {
							inputFields.addClass('error');
						}
					}
				});
			});


To intercept page validation use the function `interceptPageValidation`, to intercept field validation use the function `interceptFieldValidation`.

Both functions expect an object passed as parameter that can defines methods

* beforeValidation
* afterValidation

For interceptFieldValidation you get parameters val (DOM element beeing validated) and valid (only in afterValidation) passed to your functions. For page validation your functions get valid passed (only in afterValidation).

# Demo
Just open InterceptableValidators.sln in Visual Studio 2010+ to see how interception works.

# Dependencies
This plugin does not depend on jQuery or any other javascript framework.