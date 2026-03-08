package com.smartfarminganddigitalagriplatform.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.dao.DaoAuthenticationProvider;
import org.springframework.security.config.annotation.authentication.configuration.AuthenticationConfiguration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.security.web.util.matcher.AntPathRequestMatcher;

@Configuration
@EnableWebSecurity
public class SecurityConfig {

    @Autowired
    private CustomUserDetailsService userDetailsService;

    @Bean
    public PasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }

    @Bean
    public DaoAuthenticationProvider authenticationProvider() {
        DaoAuthenticationProvider authProvider = new DaoAuthenticationProvider();
        authProvider.setUserDetailsService(userDetailsService);
        authProvider.setPasswordEncoder(passwordEncoder());
        return authProvider;
    }

    @Bean
    public AuthenticationManager authenticationManager(AuthenticationConfiguration config) throws Exception {
        return config.getAuthenticationManager();
    }

    @Bean
    public SecurityFilterChain filterChain(HttpSecurity http) throws Exception {
        http
                .csrf(csrf -> csrf.disable())
                .authorizeHttpRequests(auth -> auth
                        .requestMatchers("/admin/**").hasRole("ADMIN")
                        .requestMatchers("/farmer/safety/**", "/farmer/safety-hub").authenticated()
                        .requestMatchers("/farmer/**").hasAnyRole("FARMER", "MENTOR")
                        .requestMatchers("/buyer/**").hasAnyRole("BUYER", "B2B_BUYER")
                        .requestMatchers("/b2b/**").hasAnyRole("B2B_BUYER", "ADMIN")
                        .requestMatchers("/mentor/become").hasRole("FARMER")
                        .requestMatchers("/mentor/**").hasRole("MENTOR")
                        .requestMatchers("/clinic/expert/register").permitAll()
                        .requestMatchers("/chat/**").authenticated()
                        .anyRequest().permitAll())
                .formLogin(form -> form
                        .loginPage("/login")
                        .loginProcessingUrl("/login")
                        .usernameParameter("email")
                        .passwordParameter("password")
                        .successHandler((request, response, authentication) -> {
                            String role = authentication.getAuthorities().iterator().next().getAuthority();
                            if (role.equals("ROLE_ADMIN")) {
                                response.sendRedirect("/admin/dashboard");
                            } else if (role.equals("ROLE_FARMER")) {
                                response.sendRedirect("/farmer/dashboard");
                            } else if (role.equals("ROLE_BUYER")) {
                                response.sendRedirect("/buyer/dashboard");
                            } else if (role.equals("ROLE_EXPERT")) {
                                response.sendRedirect("/clinic/expert/dashboard");
                            } else if (role.equals("ROLE_MENTOR")) {
                                response.sendRedirect("/mentor/dashboard");
                            } else if (role.equals("ROLE_B2B_BUYER")) {
                                response.sendRedirect("/b2b/dashboard");
                            } else {
                                response.sendRedirect("/home");
                            }
                        })
                        .failureUrl("/login?error=true")
                        .permitAll())
                .logout(logout -> logout
                        .logoutRequestMatcher(new AntPathRequestMatcher("/logout"))
                        .logoutSuccessUrl("/login?logout=true")
                        .invalidateHttpSession(true)
                        .deleteCookies("JSESSIONID", "Agroplanter-remember-me")
                        .permitAll())
                .exceptionHandling(ex -> ex
                        .accessDeniedPage("/login?error=true"))
                .rememberMe(remember -> remember
                        .key("AgroplanterSecureKey_2026")
                        .tokenValiditySeconds(86400 * 30) // 30 days
                        .userDetailsService(userDetailsService)
                        .rememberMeParameter("remember-me")
                        .rememberMeCookieName("Agroplanter-remember-me")
                        .useSecureCookie(false))
                .authenticationProvider(authenticationProvider());

        return http.build();
    }
}
