package filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

public class FilterA implements Filter {
	// 인코딩을 수행할 인코딩 캐릭터 셋 지정
	String encoding;

	// 필터 설정 관리자
	FilterConfig filterConfig;

	@Override
	public void init(FilterConfig fConfig) throws ServletException {
		// 초기화
		// getInitParameter() : web.xml에 초기화해서 지정한 파라미터 값을 불러오는 메소드.
		this.filterConfig = fConfig;
		this.encoding = fConfig.getInitParameter("encoding");
	}

	@Override
	public void destroy() {
		// destroy : 웹 애플리케이션이 끝날 때 같이 끝남
		this.encoding = null;
		this.filterConfig = null;
	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		// TODO Auto-generated method stub
		if (request.getCharacterEncoding() == null) {
			if (encoding != null)
				request.setCharacterEncoding(encoding);
		}

		chain.doFilter(request, response);

	}

}
