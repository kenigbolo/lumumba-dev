// DOM ready polyfill
function onDOMready(fn) {
    if (document.readyState != 'loading'){
        fn();
    } else {
        document.addEventListener('DOMContentLoaded', fn);
    }
}

// On DOM ready
onDOMready(function(){

    // Init custom select inputs
    var FILTER_SELECT_CLASSNAME = 'filter__droprown-select';
    var FILTER_SELECT_MARKER = 'select-type-filter';
    var FORM_SELECT_CLASSNAME = 'form__select';
    var FORM_SELECT_MARKER = 'select-type-form';

    Select.init({
        selector: '.' + FILTER_SELECT_CLASSNAME,
        className: 'select-theme-default ' + FILTER_SELECT_MARKER
    });

    Select.init({
        selector: '.' + FORM_SELECT_CLASSNAME,
        className: 'select-theme-default ' + FORM_SELECT_MARKER
    });

    // Init dropdown
    var DROPDOWN_TARGET_CLASSNAME = 'contestants__item';
    var DROPDOWN_CONTENT_CLASSNAME = 'drop__root';
    var dropdownContent = document.querySelector('.' + DROPDOWN_CONTENT_CLASSNAME);

    if (dropdownContent) {
        document.querySelectorAll('.' + DROPDOWN_TARGET_CLASSNAME).forEach(function(el) {
            var drop = new Drop({
                target: el,
                content: dropdownContent.cloneNode(true),
                position: 'bottom center',
                openOn: 'hover',
                hoverOpenDelay: 150,
                hoverCloseDelay: 100,
                classes: 'drop-theme-arrows'
            });
        });
    }

});

//# sourceMappingURL=data:application/json;base64,eyJ2ZXJzaW9uIjozLCJuYW1lcyI6W10sIm1hcHBpbmdzIjoiIiwic291cmNlcyI6WyJtYWluLmpzIl0sImZpbGUiOiJtYWluLmpzIiwic291cmNlUm9vdCI6Ii9zcmMvanMifQ==
