package com.example.demo

import mu.KotlinLogging
import org.springframework.boot.autoconfigure.SpringBootApplication
import org.springframework.boot.runApplication
import org.springframework.core.env.Environment
import java.lang.management.ManagementFactory
import java.net.UnknownHostException

@SpringBootApplication
class DemoApplication

@Throws(UnknownHostException::class)
fun main(args: Array<String>) {
	val applicationContext = runApplication<DemoApplication>(*args)
	val environment: Environment = applicationContext.environment
	val logger = KotlinLogging.logger {}
	val runtimeMxBean = ManagementFactory.getRuntimeMXBean()
	val arguments = runtimeMxBean.inputArguments

	logger.info {
		"""
----------------------------------------------------------
Application '${environment.getProperty("spring.application.name")}' is running!

Active profile(s): ${environment.getProperty("spring.profiles.active")}
Local URL        : http://localhost:${environment.getProperty("server.port")}
JVM runtime args : ${arguments.joinToString(",")}}
----------------------------------------------------------"""
	}
}
