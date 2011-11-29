$(function() {
    function toggle_src(a, img){
        var href = $(a).attr('href');
        var src = $(img).attr('src');
        $(img).attr('src', href);
        $(a).attr('href', src);
        return false
    };

    function sort_by(myattr) {
        //var myattr = myattr;
        function sort_by_attr(a, b){
            return $(a).attr(myattr) > $(b).attr(myattr) ? 1 : -1;
        };
        $('ul li').sort(sort_by_attr).appendTo('ul');

        $('.tag').remove();
        var current_attr;
        $('ul li').each(function() {
            var this_attr = $(this).attr(myattr);
            if (this_attr !== current_attr) {
                current_attr = this_attr;
                var foo = $('<div></div>');
                foo.addClass('tag');
                foo.text(this_attr);
                foo.prependTo(this);
            };
        });
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
            $(this).css('margin-top', 50 + index * offset);
            //$(this).css('padding-bottom', 3000);
        });
    }
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
    $("li").click(function(evt) {
        evt.preventDefault();
        evt.stopPropagation();
        
        $(this).zoomTo({
            targetsize: 0.8,
            scalemode: "both",
            duration: 1000,
            easing: "ease",
            nativeanimation: true
        });
        
        //var a = $(this).find('a');
        //var img = a.find('img');
        //toggle_src(a, img);
    });

    $("body").click(function(evt) {
        evt.stopPropagation();
        $(this).zoomTo({targetsize: 1});
    });
});
