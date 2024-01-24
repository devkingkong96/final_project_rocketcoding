package com.rocket.config;

import com.rocket.security.DBConnectionProvider;
import lombok.RequiredArgsConstructor;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.web.SecurityFilterChain;

@Configuration
@EnableWebSecurity
@RequiredArgsConstructor
public class SecurityConfig {

    private final DBConnectionProvider dbprovider;

    @Bean
    SecurityFilterChain authenticationPath(HttpSecurity http) throws Exception {
        return http
                .csrf(csrf->csrf.disable())
                .authorizeHttpRequests(request->{
                    request.requestMatchers("/login","/resources/**").permitAll()
                           .requestMatchers("/member/emailCheck").permitAll()
                           .requestMatchers("/member/sendPwd").permitAll()
                           .requestMatchers("/WEB-INF/views/**").permitAll()
                           .requestMatchers("/**").hasAnyAuthority("USER")
                           .anyRequest().authenticated();
                })
                .formLogin(formlogin->{
                    formlogin.loginPage("/login") //로그인 페이지
                             .successForwardUrl("/")
                             .failureForwardUrl("/test")
                             .usernameParameter("empNo")
                             .passwordParameter("empPw");
                })
                .logout(logout->{
                    logout.logoutUrl("/logout")
                          .logoutSuccessUrl("/login")
                          .deleteCookies("JSESSIONID")
                          .clearAuthentication(true)
                          .invalidateHttpSession(true);
                })
                .rememberMe(rememberme->{
                    rememberme.tokenValiditySeconds(60*60*3)
                              .rememberMeParameter("rememberMe")
                              .userDetailsService(dbprovider);
                })
                .sessionManagement(maxsession->{
                	maxsession.sessionFixation().changeSessionId()
                				.maximumSessions(1)
                				.expiredUrl("/login")
                				.maxSessionsPreventsLogin(false);
                })
                //.userDetailsService(dbprovider)

                .authenticationProvider(dbprovider)
                .build();
    }
}