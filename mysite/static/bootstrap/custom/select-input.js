/**
 * 设置select可以输入内容
 * http://blog.csdn.net/fhm727/article/details/4557996
 */

/*作用方法：
var   obj=new   combox(var1,var2);
var1:新生成的combox变量(如:a)
var2:原下拉框的id;
obj.init():对象初始化;
注意:后台取值时用combox_var2进行取值;
*/

function combox(obj, select) {
    this.obj = obj;
    this.id = select;
    this.select = document.getElementById(select);
    /*要转换的下拉框*/
}

/*初始化对象*/
combox.prototype.init = function() {
    var inputbox = "<input id='combox_" + this.id + "' name='combox_" + this.select.name + "' onchange='" + this.obj + ".find()' onblur='" + this.obj + ".addItem(this.value)' "
    // inputbox += "style='position:absolute;width:" + (this.select.offsetWidth - 16) + ";height:" + this.select.offsetHeight + ";left:" + getL(this.select) + ";top:" + getT(this.select) + "' ";
    inputbox += "placeholder='请输入新版本号...'>";
    document.write(inputbox);
    // with(this.select.style) {
    //     left = getL(this.select);
    //     top = getT(this.select);
    //     // position = "absolute";
    //     width = this.select.offsetWidth;
    //     height = this.select.offsetHeight;
    //     clip = "rect(0 " + this.select.offsetWidth + " " + this.select.offsetHeight + " " + (this.select.offsetWidth - 18) + ")";
    //     /*切割下拉框*/
    // }
    this.select.onchange = new Function(this.obj + ".change()");
    this.select.onresize = new Function(this.obj + ".resize()");
    this.change();

}

window: onresize = function() {
        location.reload();
    }
    /*初始化结束*/



////////对象事件定义///////
combox.prototype.find = function() {
    /*当搜索到输入框的值时,下拉框自动定位*/
    var inputbox = document.getElementById("combox_" + this.id);
    with(this.select) {
        for (i = 0; i < options.length; i++)
            if (options[i].text.indexOf(inputbox.value) == 0) {
                selectedIndex = i;
                this.change();
                break;
            }
    }
}

combox.prototype.change = function() {
    /*定义下拉框的onchange事件*/
    var inputbox = document.getElementById("combox_" + this.id);
    inputbox.value = this.select.options[this.select.selectedIndex].text;
    with(inputbox) {
        select();
        focus();
    };
}

combox.prototype.addItem = function(str) {
    var findText = false;
    for (i = 0; i < this.select.length; i++)
        if (this.select.options[i].text.indexOf(str) == 0) {
            findText = true;
            break;
        }
    if (!findText) {
        this.select.options[this.select.length] = new Option(str, str);
        this.select.value = str;
    }
}

////////对象事件结束///////

/*公用定位函数(获取控件绝对坐标)*/
function getL(e) {
    var l = e.offsetLeft;
    while (e = e.offsetParent) {
        l += e.offsetLeft;
    }
    return l;
}

function getT(e) {
    var t = e.offsetTop;
    while (e = e.offsetParent) {
        t += e.offsetTop;
    }
    return t;
}
