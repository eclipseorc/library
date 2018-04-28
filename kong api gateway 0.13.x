kong api gateway 0.13.x
Terminology(专业术语)
1、client：指下游客户端向kong代理端口发送的请求
2、upstream service:指你自己设置在kong代理后端的需要转发的api/service
3、Service:服务实体，顾名思义，是你需要反向代理的服务的抽象，例如那些api和微服务
4、Route:这里指kong路由实体。路由是进入kong的入口点，定义了与请求匹配的规则，并且把请求路由到匹配的服务
5、Plugin:这里指kong的插件

从高层角度看，Kong在其配置的代理端口（默认情况下为8000和8443）上侦听HTTP流量。 Kong会根据你配置的路由评估任何传入的HTTP请求，并尝试找到匹配的路由。如果某个请求符合特定路由的规则，Kong将处理代理请求。由于每条路由都与一个服务链接，因此Kong将运行您在路由及其相关服务上配置的插件，然后向上游代理请求。
