package com.example.gatewaydemo.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

/**
 * @description:
 * @author: Mr.Joe
 * @create:
 */
@Configuration
public class GatewayConfig {

    @Bean(name = RemoteAddKeyResolver.BEAN_NAME)
    public RemoteAddKeyResolver remoteAddKeyResolver() {
        System.out.println("eeeeeee");
        return new RemoteAddKeyResolver();
    }
}
