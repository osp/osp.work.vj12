//         jQuery.fn.sort = function() {
//           return this.pushStack([].sort.apply(this, arguments), []);
//         };

function sort_by_date(a, b){
    if ($(a).attr('data-datetime') == $(b).attr('data-datetime'))
        return $(a).attr('data-id') > $(b).attr('data-id') ? 1 : -1;
    else {
        return $(a).attr('data-datetime') > $(b).attr('data-datetime') ? 1 : -1;
    }
};
function sort_by_date_2(b, a){
    return $(a).attr('data-datetime') > $(b).attr('data-datetime') ? 1 : -1;
};

function toggle_src(a, img){
    var href = $(a).attr('href');
    var src = $(img).attr('src');
    $(img).attr('src', href);
    $(a).attr('href', src);
    return false
};

function sort_by(attribute) {
    function sort_by_attr(b, a){
        return $(a).attr(attribute) > $(b).attr('attribute') ? 1 : -1;
    };
    $('ul li').sort(sort_by_attr).appendTo('ul');
    return false
}
function spread_by(attribute) {
    var offset = 30;
    var values = []
    $('ul li').each(function() {
        var attr = $(this).attr(attribute);
        var index = $.inArray(attr, values);
        if (index === -1) {
            values.push(attr);
            index = values.length - 1;
        };
        $(this).css('padding-top', 50 + index * offset);
        $(this).css('padding-bottom', 3000);
    });

}

$(function() {
    (function() {
        var keys = [];
        $('ul li').each(function() {
            $.each(this.attributes, function(i, attr) {
                if ($.inArray(attr.name, keys) === -1) {
                    keys.push(attr.name);
                };
            });
        });
        var nav = $('<nav></nav>');
        var sort = $('<select></select>');
        for (var i = 0; i < keys.length; i++) {
            $('<option>' + keys[i] +'</option>')
                .attr('value', keys[i])
                .appendTo(sort);
        };
        var clone = sort.clone();
        clone.attr('name', 'sort_by');
        sort.attr('name', 'spread_by');
        $('<label for="sort_by">Sort by</label>').appendTo(nav);
        clone.appendTo(nav);
        $('<label for="spread_by">Spread by</label>').appendTo(nav);
        sort.appendTo(nav);
        nav.prependTo('body');
        sort.change(function() {
            spread_by($(this).val());
            return false;
        });
        clone.change(function() {
            sort_by($(this).val());
            return false;
        });

    })();
    $('a#sort_by_date').click(function() {
        $('ul li').sort(sort_by_date).appendTo('ul');
        return false;
    });
    $('a#sort_by_date_2').click(function() {
        $('ul li').sort(sort_by_date_2).appendTo('ul');
        return false;
    });
    $('a#spread_by_language').click(function() {
        spread_by('data-language');
        return false;
    });
    $('a#spread_by_destination').click(function() {
        spread_by('data-destination');
        return false;
    });
    //$('li a').click(function() {
        //toggle_src(this, $(this).find('img'));
        //return false;
    //});
    $('li').hover(function() {
        var prefix = "data-"; 
        var $infos = $("dl#infos").empty()
        $.each(this.attributes, function(i, attr) {
            if (attr.name.substring(0, prefix.length) === prefix
                    && attr.value !== "-") {
                $infos.append("<dt>" + attr.name.substring(prefix.length, attr.name.length) + "</dt>")
                    .append("<dd>" + attr.value + "</dd>")
            };
        });
    }, function() {
        var $infos = $("dl#infos").empty()
    });
});
