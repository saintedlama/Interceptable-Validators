function interceptPageValidation(opt) {
    if (typeof (ValidatorOnSubmit) == 'function') {
        var OriginalValidatorOnSubmit = ValidatorOnSubmit;
        ValidatorOnSubmit = function () {
            if (opt.beforeValidation) {
                opt.beforeValidation();
            }

            var valid = OriginalValidatorOnSubmit();

            if (opt.afterValidation) {
                opt.afterValidation(valid);
            }

            return valid;
        };
    }
}

function interceptFieldValidation(opt) {
    if (typeof (Page_Validators) == 'object') {
        for (var i = 0, length = Page_Validators.length; i < length; i++) {
            var pageValidator = Page_Validators[i];

            if (pageValidator.evaluationfunction) {
                var evaluationFunction = pageValidator.evaluationfunction;

                pageValidator.evaluationfunction = function (val) {
                    if (opt.beforeValidation) {
                        opt.beforeValidation(val);
                    }

                    var valid = evaluationFunction(val);

                    if (opt.afterValidation) {
                        opt.afterValidation(val, valid);
                    }

                    return valid;
                };
            }
        }
    }
}