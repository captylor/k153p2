package filter;

import java.io.IOException;

import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

public class Filter implements javax.servlet.Filter{

	@Override
	public void destroy() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
	}

	@Override
	public void init(FilterConfig arg0) throws ServletException {
		// TODO Auto-generated method stub
		
	}

}
/*
 * web.xml
<web-app>
...
	<filter>
		<filter-name>myFilter</filter-name>
		<filter-class>myFilter</filter-class>
	</filter>
	<filter-mapping>
		<filter-name>myFilter</filter-name>
		<url-pattern>*.jsp</url-pattern>
	</filter-mapping>
...
</web-app>
 * 
 * */
 