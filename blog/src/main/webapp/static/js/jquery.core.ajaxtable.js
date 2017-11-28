(function ($) {
    $.fn.dataGrid = function (options) {
        var settings = $.extend({
            title : '' ,
            url : '' ,
            method : 'POST' ,
            pageSize : 10 ,
            tableId : '' ,
            searchButtonId : '' ,
            pageShow : false ,
            dataType : 'JSON' ,
            checkbox : false ,
            queryParamsId : [] ,
            columns : [ {
                field : '' ,
                className : 'text-l' ,
                description : '' ,
                paramFormatter : function () {
                    return '';
                }
            } ] ,
            param : ''
        } , options || {});
        var tableId = settings.tableId.substring(1);
        var title = tableId + "-tableTitle";
        $("#" + title).remove();
        $(this).before("<div id=\"" + title + "\" style=\"background:#f2f2f2;height:30px;line-height:30px;\"><span style=\"margin-left:10px;font-weight:bold\">" + settings.title + "</span><input type=\"hidden\" value=\"1\" id=\"" + tableId + "_currentPage\" name=\"" + tableId + "_currentPage\"/></div>");
        _create_table_head(settings);
        if ( settings.searchButtonId ) {
            $(settings.searchButtonId).click(function () {
                $.openLoading();
                setTimeout(function () {
                    _query_data_ajxa(settings);
                    _select_checkbox_all();
                } , 1000);
            });
        }
        $.openLoading('正在加载数据，请稍等...');
        _query_data_ajxa(settings);
        _select_checkbox_all();

    }
})(jQuery);

var _create_table_head = function (settings) {
    var trStr = "" , th = "";
    if ( settings.checkbox ) {
        th += "<th style=\"width:25px;\"><input style=\"width: 15px;height: 18px;\" type=\"checkbox\" id=\"ckAll\"/></th>";
    }
    var array = settings.columns;
    for ( var i = 0 ; i < array.length ; i++ ) {
        var className = array[ i ].className;
        if ( 'id' != array[ i ].field )
            if ( "operate" == array[ i ].field ) {
                th += "<th class=\"" + className + "\">" + array[ i ].description + "</th>";
            } else {
                th += "<th class=\"" + className + "\">" + array[ i ].description + "</th>";
            }
    }
    var tableId = settings.tableId.substring(1);
    trStr += "<thead class=\"data-head\"><tr>" + th + "</tr></thead>";
    var _body_id = tableId + "-data-body";
    trStr += "<tbody id=\"" + _body_id + "\"></tbody>";
    $(settings.tableId).html(trStr);
};

//获取所有的查询条件
var _get_query_condition = function (settings) {
    var ids = settings.queryParamsId;
    var jsonStr = "{";
    for ( var i in ids ) {
        var ff = ids[ i ].substring(1);
        jsonStr += '"' + ff + '":"' + $(ids[ i ]).val() + '",';
    }
    jsonStr = (jsonStr.length > 1 ? jsonStr.substring(0 , jsonStr.length - 1) : jsonStr) + "}";
    return eval("(" + jsonStr + ")");
};
// 查询服务器数据
var _query_data_ajxa = function (settings) {
    var params = _get_query_condition(settings);
    var tableId = settings.tableId.substring(1);
    params.pageSize = settings.pageSize;
    params.currentPage = $("#" + tableId +"_currentPage").val();
    $.ajax({
        method : settings.method ,
        url : settings.url ,
        async : false ,
        data : params ,
        dataType : settings.dataType ,
        success : function (data) {
            data = data.object;
            _create_grid_table(data , settings);
        } ,
        error : function () {
            $.openTip('获取数据失败，请稍后再试...' , true , function () {
                $.closeLoading();
            });
        }
    });
};

var _each_value = function(key, json) {
	var ks = key.split(".");
	if (ks.length > 1) {
		var k = ks[0];
		var jsonStr = json[k];
		if (json instanceof Object) {
			var v = _each_value(ks[1], jsonStr);
			return v;
		}
	} else 
		return json ? json[key] : "";
}

// 创建表格
var _create_grid_table = function (data , settings) {
	var tableId = settings.tableId.substring(1);
    var objs;
    try {
        objs = data.content
        if (!objs) objs = data.maps;
    } catch ( e ) {
        objs = data.maps;
    }
    var trStr = "";
    var array = settings.columns;
    var num = 0 , len;
    for ( var j = 0 ; len = objs.length, j < len ; j++ ) {
        var jsonStr = eval(objs[ j ]);
        trStr += "<tr data-id =\"" + jsonStr[ "id" ] + "\">";
        var tdObj = "";
        for ( var i = 0 ; i < array.length ; i++ ) {
            var key = array[ i ].field;
            var value = _each_value(key, jsonStr);
            if ( array[ i ].paramFormatter ) {
                value = array[ i ].paramFormatter;
                var fn = eval(value);
                value = fn.call(this , jsonStr);
            }
            if ( key != 'id' ) {
                if ( "operate" == key ) {
                    tdObj += "<td class=\"" + array[ i ].className + "\" role-id=\"" + jsonStr[ 'id' ] + "\">" + value + "</td>";
                } else {
                    if ( !value ) {
                        value = "";
                    }
                    tdObj += "<td class=\"" + array[ i ].className + "\">" + value + "</td>";
                }
            } else {
                if ( settings.checkbox ) {
                    if ( !array[ i ].paramFormatter ) {
                        value = "";
                    }
                    if ( !value )
                        tdObj += "<td style=\"width:25px;\"><input data-id=\"" + jsonStr[ 'id' ] + "\" style=\"width: 15px;height: 18px;\" type=\"checkbox\" name=\"checkOne\"/></td>";
                    else
                        tdObj += "<td style=\"width:25px;\"><input data-id=\"" + jsonStr[ 'id' ] + "\" checked=\"" + value + "\" style=\"width: 15px;height: 18px;\" type=\"checkbox\" name=\"checkOne\"/></td>";
                }
            }
        }
        trStr += tdObj + "</tr>";
    }
    var columnList = settings.columns;
    for ( var i = 0 ; i < columnList.length ; i++ ) {
        var key = array[ i ].field;
        if ( key === 'id' ) {
            num++;
        }
    }
    if ( num == 0 ) throw "列表必须包含ID列";
    if ( settings.pageSize == 0 ) {
        throw "pageSize 必须大于0,初始化datagrid时必须设定pageSize的值";
    }
    var pagerId = tableId + "-box"
    if ( data.totalPage > 0 ) {
        var curr = (data.currentPage - 1) * settings.pageSize + 1;
        var pos = data.currentPage > 0 ? (data.currentPage * settings.pageSize > data.totalRecord ? data.totalRecord : data.currentPage * settings.pageSize) : (1 * settings.pageSize);
        trStr += "<tr class=\"borpage-none\"><td class=\"bor-none\" colspan=\"2\">显示 " + curr + " 到 " + pos + " ，共 " + data.totalRecord + " 条</td><td class=\"bor-none tdpage-pos\" colspan=\"" + (array.length - 1) + "\"><div id=" + pagerId +" style=\"height: 30px;\" class=\"M-box r\"></div></td></tr>"
    } else if ( objs.length == 0 )
        trStr += "<tr class=\"borpage-none\"><td class=\"bor-none tdpage-pos text-r\" style=\"\" colspan=\"" + (array.length + 1) + "\">没有符合条件的数据</div></td></tr>"
    var tableId = settings.tableId.substring(1);
    var _tb_id = tableId + "-data-body";
    $("#" + _tb_id).empty();
    $("#" + _tb_id).html(trStr);
    $.closeLoading();
    $('#' + pagerId).pagination({
        totalData : data.totalRecord ,
        showData : settings.pageSize ,
        coping : true ,
        isHide : false ,
        current : data.currentPage ,
        callback : function (api) {
            var currentPage = api.getCurrent();
            $("#" + tableId +"_currentPage").val(currentPage);
            $.openLoading('正在加载数据，请稍等...');
            setTimeout(function () {
                _query_data_ajxa(settings);
                _select_checkbox_all();
            } , 2000)
        }
    });
};
/**
 * checkbox全选/反选
 */
var _select_checkbox_all = function () {
    $("#ckAll").click(function () {
        $("input[name='checkOne']").prop("checked" , this.checked);
        $("input[name='checkOne']").parent().parent().css("background:yellow");
    });

    $("input[name='checkOne']").click(function () {
        var $subs = $("input[name='checkOne']");
        $("#ckAll").prop("checked" , $subs.length == $subs.filter(":checked").length ? true : false);
    });
};