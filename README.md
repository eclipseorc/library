# library
日常工作种用的的小工具
1、利用jquery在已经产生的表格数据中进行搜索，不用再进行后台请求
<table id="jfilter">

   <thead>
   <tr colspan="3">
      <input type="text" id="filtertxt">
      <input type="button" id="ss" value="搜索" style="margin-left: 50px;"/>
   </tr>
      <tr><th>姓名</th><th>性别</th><th>暂住地</th></tr>
   </thead>
   <tbody>
      <tr><td>张山</td><td>男</td><td>浙江宁波</td></tr>
      <tr><td>李四</td><td>女</td><td>浙江杭州</td></tr>
      <tr><td>王五</td><td>男</td><td>湖南长沙</td></tr>
      <tr><td>找六</td><td>男</td><td>浙江温州</td></tr>
      <tr><td>Rain</td><td>男</td><td>浙江杭州</td></tr>
      <tr><td>MAXMAN</td><td>女</td><td>浙江杭州</td></tr>
      <tr><td>王六</td><td>男</td><td>浙江杭州</td></tr>
      <tr><td>李字</td><td>女</td><td>浙江杭州</td></tr>
      <tr><td>李四</td><td>男</td><td>湖南长沙</td></tr>
   </tbody>
</table>

<script type="text/javascript">
    $(function(){
        $("#ss").on('click', function() {
            var search = $("#filtertxt").val();
            //如果seach有值则进行搜索，没有值显示全部
            if (search) {
                $("#jfilter tbody tr").hide().filter(":contains('" + search + "')").show();
            } else {
                $("#jfilter tbody tr").show(); 
            }
        });
    });
</script>
基本思路：
先将所有的信息隐藏起来，再查询搜索条件，将结果显示出来
