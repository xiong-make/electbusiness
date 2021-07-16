
## 基链标记base

base标记是一个基链接标记，是一个单标记。用以改变文件中所有链接标记的参数内定值，网页上的所有相对路径在链接时都将在前面加上基链接指向的地址。
比如:<base href="http://www.baidu.com">，那下面的href属性就会以上面设的为基准,
如:<a href="http://www.baidu.com/xxx.htm"></a>，现在就只需要写<a href="xxx.htm"></a>


## margin 值设定
通过 CSS，您可以完全控制外边距。有一些属性可用于设置元素每侧（上、右、下和左）的外边距。

## font-family

font-family 可以把多个字体名称作为一个“回退”系统来保存。如果浏览器不支持第一个字体，则会尝试下一个。也就是说，font-family 属性的值是用于某个元素的字体族名称或/及类族名称的一个优先表。浏览器会使用它可识别的第一个值。

有两种类型的字体系列名称：

指定的系列名称：具体字体的名称，比如："times"、"courier"、"arial"。
通常字体系列名称：比如："serif"、"sans-serif"、"cursive"、"fantasy"、"monospace"

## synchronized

## 使用纯java链接MySQL数据库步骤

JDBC（Java DataBase Connectivity,java数据库连接）是一种用于执行SQL语句的Java API，可以为多种关系数据库提供统一访问，它由一组用Java语言编写的类和接口组成。JDBC提供了一种基准，据此可以构建更高级的工具和接口，使数据库开发人员能够编写数据库应用程序。

jdbc的java api有哪些，四个常用的接口和一个类（Connection接口、Statement接口、PreparedStatement接口、ResultSet接口和DriverManager类），那我们怎么使用它，下面我就贴出一个简单的实例：

![](https://img-blog.csdnimg.cn/20190419094410486.jpg)

 JDBC的六个固定步骤 
1.注册数据库驱动（利用反射）；
2.取得数据库连接对象Connection ；
3.访问数据库
4.处理结果集 ；
5.依次关闭结果集；


### 1.注册Java数据库驱动程序

在执行之前需要导入java.sql包

通过注册驱动，反射方式加载
```
    class.forName("Com.mysql.jdbc");
```

### 2.与数据库建立连接

```
    String url = "jdbc:mysql://127.0.0.1:3306/test";
    //设置用户名
    String username = "root";
    //设置密码
    String password = "123456";
    //获得连接对象、Connection接口的使用以及DriverManager类的使用
    Connection con = (Connection)DriverManager.getConnection(url, username, password);
```

### 3.访问数据库

```
    String sql;
    st=con.createStatement();
    rs=st.executeQuery(sql);
```

### 4.处理返回结果集

```
 while(rs.next()){
            System.out.println(rs.getString("id")+"  "+rs.getString("name")+"  "+rs.getString("age")+"  "+rs.getString("address"));
        }
```

### 5关闭数据库
先打开的后关闭，后打开的先关闭
```
rs.close();
st.close();
con.close();
```
## 数据库连接池

不断的**创建、销毁链接**，会导致访问数据库服务器的压力，而且对于内存来说，不断的开辟与销毁，内存的使用率极低。使用数据库连接池可以明显提高对数据库操作的性能！
数据库连接池的解决方案是在应用程序启动时建立足够的数据库连接，并将这些连接组成一个连接池(简单说：在一个“池”里放了好多半成品的数据库连接对象)，由应用程序动态地对池中的连接进行申请、使用和释放。对于多于连接池中连接数的并发请求，应该在请求队列中排队等待。并且应用程序可以根据池中连接的使用率，动态增加或减少池中的连接数。

### 简单使用方式

```
import java.sql.*;
import java.util.ArrayList;
public class ConnectionPool {
	// 存放Connection对象的数组，数组被看成连接池
	ArrayList<Connection> list = new ArrayList<Connection>();
	// 构造方法，创建15个连接对象，放到连接池中
	public ConnectionPool() {
		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		for (int i = 0; i < 15; i++) {
			try {
Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/test?characterEncoding=utf-8","root","root");
				list.add(con);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
	// 从连接池中取出一个连接对象
	public synchronized Connection getOneCon() {
		if (list.size() > 0) {
			// 删除数组的第一个元素，并返回该元素中的连接对象
			return list.remove(0);
		} else {
			// 连接对象被用完
			return null;
		}
	}
	// 把连接对象放回连接池中
	public synchronized void releaseCon(Connection con) {
		list.add(con);
	}
}

```

## 预处理语句访问数据库
如果你想多次执行一个Statement对象，通常使用PreparedStatement对象来代替，可以减少执行时间。

PreparedStatement 对象的主要特点是，与Statement对象不同，当它被创建时，会被赋予一条 SQL 语句。这样做的好处是，在大多数情况下，这个SQL语句会被立即发送到DBMS，在那里进行编译。因此，PreparedStatement 对象包含的不仅仅是一条 SQL 语句，而是一条已经预编译的SQL语句。这意味着，当 PreparedStatement被执行时，DBMS可以直接运行PreparedStatement SQL语句，而不必先编译它。

```
Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		//将查询结果装到集合ArrayList<Goods>中，并返回页面显示
		ArrayList<Goods> allGoods = null;
		//加载驱动
		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
			//建立连接
			con=DriverManager.getConnection("jdbc:mysql://localhost:3306/test?characterEncoding=utf-8","root","root");
			//预处理
			ps = con.prepareStatement("insert into goods values(null,?,?)");
			//发送添加SQL语句，实现添加的功能
			request.setCharacterEncoding("utf-8");
			ps.setString(1, request.getParameter("gname")); 
			ps.setString(2, request.getParameter("gprice"));
			ps.executeUpdate();
			//预处理
			ps = con.prepareStatement("select * from goods ");
			//发送查询SQL语句，返回结果集
			rs = ps.executeQuery();
```

## 批量处理多条记录

## 验证码
产生验证码的模板一
```
@WebServlet("/before_validateCode")
public class ValidateCode extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private char code[] = { 'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j',
			'k', 'm', 'n', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y',
			'z', 'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'J', 'K', 'L', 'M',
			'N', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z', '2',
			'3', '4', '5', '6', '7', '8', '9' };
	private static final int WIDTH = 50;
	private static final int HEIGHT = 20;
	private static final int LENGTH = 4;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		// 设置响应报头信息
		response.setHeader("Pragma", "No-cache");
		response.setHeader("Cache-Control", "no-cache");
		response.setDateHeader("Expires", 0);
		// 设置响应的MIME类型
		response.setContentType("image/jpeg");
		BufferedImage image = new BufferedImage(WIDTH, HEIGHT,
				BufferedImage.TYPE_INT_RGB);
		Font mFont = new Font("Arial", Font.TRUETYPE_FONT, 18);
		Graphics g = image.getGraphics();
		Random rd = new Random();
		// 设置背景颜色
		g.setColor(new Color(rd.nextInt(55) + 200, rd.nextInt(55) + 200, rd
				.nextInt(55) + 200));
		g.fillRect(0, 0, WIDTH, HEIGHT);
		// 设置字体
		g.setFont(mFont);
		// 画边框
		g.setColor(Color.black);
		g.drawRect(0, 0, WIDTH - 1, HEIGHT - 1);
		// 随机产生的验证码
		String result = "";
		for (int i = 0; i < LENGTH; ++i) {
			result += code[rd.nextInt(code.length)];
		}
		HttpSession se = request.getSession();
		se.setAttribute("rand", result);
		// 画验证码
		for (int i = 0; i < result.length(); i++) {
			g.setColor(new Color(rd.nextInt(200), rd.nextInt(200), rd
					.nextInt(200)));
			g.drawString(result.charAt(i) + "", 12 * i + 1, 16);
		}
		// 随机产生2个干扰线
		for (int i = 0; i < 2; i++) {
			g.setColor(new Color(rd.nextInt(200), rd.nextInt(200), rd
					.nextInt(200)));
			int x1 = rd.nextInt(WIDTH);
			int x2 = rd.nextInt(WIDTH);
			int y1 = rd.nextInt(HEIGHT);
			int y2 = rd.nextInt(HEIGHT);
			g.drawLine(x1, y1, x2, y2);
		}
		// 释放图形资源
		g.dispose();
		try {
			OutputStream os = response.getOutputStream();
			// 输出图像到页面
			ImageIO.write(image, "JPEG", os);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}
```



## 结果集ResultSetMetaData
**ResultSet**关于某个表的信息或一个查询的结果。您必须逐行访问数据行，但是您可以任何顺序访问列。**ResultSetMetaData**有关ResultSet中列的名称和类型的信息。

**ResultSet** 
ResultSet 对象是 JDBC 中最重要的单个对象。从本质上讲，它是对一个一般宽度和未知长度的表的一种抽象。几乎所有的方法和查询都将数据作为 ResultSet 返回。ResultSet 包含任意数量的命名列，您可以按名称访问这些列。它还包含一个或多个行，您可以按顺序自上而下逐一访问。在您使用 ResultSet 之前，必须查询它包含多少个列。此信息存储在 ResultSetMetaData 对象中。 

> //从元数据中获得列数 
> ResultSetMetaData rsmd; 
> rsmd = results.getMetaData(); 
> numCols = rsmd.getColumnCount(); 

当您获得一个 ResultSet 时，它正好指向第一行之前的位置。您可以使用 next() 方法得到其他每一行，当没有更多行时，该方法会返回 false。由于从数据库中获取数据可能会导致错误，您必须始终将结果集处理语句包括在一个 try 块中。 

您可以多种形式获取 ResultSet 中的数据，这取决于每个列中存储的数据类型。另外，您可以按列序号或列名获取列的内容。请注意，**列序号从 1 开始，而不是从 0 开始**。ResultSet 对象的一些最常用方法如下所示。 

> getInt(int); 将序号为 int 的列的内容作为整数返回。 

> getInt(String); 将名称为 String 的列的内容作为整数返回。 

> getFloat(int); 将序号为 int 的列的内容作为一个 float 型数返回。 

> getFloat(String); 将名称为 String 的列的内容作为 float 型数返回。 

> getDate(int); 将序号为 int 的列的内容作为日期返回。 

> getDate(String); 将名称为 String 的列的内容作为日期返回。 

> next(); 将行指针移到下一行。如果没有剩余行，则返回 false。 

> Close(); 关闭结果集。 

> getMetaData(); 返回 ResultSetMetaData 对象。 

**ResultSetMetaData** 

您使用 getMetaData() 方法从 ResultSet 中获取 ResultSetMetaData 对象。您可以使用此对象获得列的数目和类型以及每一列的名称。 

> getColumnCount(); 返回 ResultSet 中的列数。 
> getColumnName(int); 返回列序号为 int 的列名。 
> getColumnLabel(int); 返回此列暗含的标签。 
> isCurrency(int); 如果此列包含带有货币单位的一个数字，则返回 true。 
> isReadOnly(int); 如果此列为只读，则返回 true。 
> isAutoIncrement(int); 如果此列自动递增，则返回 true。这类列通常为键，而且始终是只读的。 
> getColumnType(int); 返回此列的 SQL 数据类型。 





## 条件查询与分页查询


## <a href="javascript:history.back()">

## <form action="admin_addGoods?act=add" method="post" enctype="multipart/form-data">

## <caption>

## 文件上传

## "admin_selectGoods?act=deleteSelect"

## target
<a> 标签的 target 属性规定在何处打开链接文档。

如果在一个 <a> 标签内包含一个 target 属性，浏览器将会载入和显示用这个标签的 href 属性命名的、名称与这个目标吻合的框架或者窗口中的文档。如果这个指定名称或 id 的框架或者窗口不存在，浏览器将打开一个新的窗口，给这个窗口一个指定的标记，然后将新的文档载入那个窗口。从此以后，超链接文档就可以指向这个新的窗口。

## iframe

iframe 元素会创建包含另外一个文档的内联框架（即行内框架）

