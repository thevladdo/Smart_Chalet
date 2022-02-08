package it.unicam.cs.ids.smartchalet.security;

import it.unicam.cs.ids.smartchalet.Service.AuthCredentialService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Component;
import org.springframework.web.filter.OncePerRequestFilter;
import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@Component
public class JwtFilter extends OncePerRequestFilter {

    @Autowired
    private JwtUtil jwtUtil;

    @Autowired
    private AuthCredentialService authService;

    @Override
    protected void doFilterInternal(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse,
            FilterChain filterChain) throws ServletException, IOException {
        if (httpServletRequest.getRequestURI().contains("/public/")) {
            filterChain.doFilter(httpServletRequest, httpServletResponse);
            return;
        }
        String token = jwtUtil.resolveToken(httpServletRequest);
        if (token != null && jwtUtil.validateToken(token)) {
            UserDetails userDetails = authService.loadUserByUsername(jwtUtil.extractUsername(token));
            SecurityContextHolder.getContext().setAuthentication(
                    new UsernamePasswordAuthenticationToken(userDetails, "", userDetails.getAuthorities()));
        } else {
            SecurityContextHolder.clearContext();
            httpServletResponse.sendError(403, "Invalid Token");
        }
        filterChain.doFilter(httpServletRequest, httpServletResponse);
    }

}

