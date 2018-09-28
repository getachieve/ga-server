package com.getachieve;

import java.io.FileInputStream;
import java.io.IOException;
import java.net.ServerSocket;
import java.net.Socket;
import java.util.Properties;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;


public class MultiThreadServer {

    static ExecutorService executeIt = Executors.newFixedThreadPool(2);
    private static int port = 4455;

    public static void main(String[] args) {
        FileInputStream fis;
        Properties property = new Properties();

        try {
            fis = new FileInputStream("resources/config.properties");
            property.load(fis);

            String url = property.getProperty("db.url");
            String login = property.getProperty("db.login");
            String password = property.getProperty("db.password");

            new Db(url, login, password);

        } catch (IOException e) {
            System.err.println("Can't read properties");
            System.exit(1);
        }

        // стартуем сервер на порту port и инициализируем переменную для обработки консольных команд с самого сервера
        try (ServerSocket server = new ServerSocket(port)) {
            System.out.println("Server socket created, command console reader for listen to server commands");

            // стартуем цикл при условии что серверный сокет не закрыт
            while (!server.isClosed()) {

                // становимся в ожидание
                // подключения к сокету общения под именем - "clientDialog" на
                // серверной стороне
                Socket client = server.accept();

                // после получения запроса на подключение сервер создаёт сокет
                // для общения с клиентом и отправляет его в отдельную нить
                // в Runnable(при необходимости можно создать Callable)
                // монопоточную нить = сервер - MonoThreadClientHandler и тот
                // продолжает общение от лица сервера
                executeIt.execute(new MonoThreadClientHandler(client));
                System.out.print("Connection accepted.");
            }

            // закрытие пула нитей после завершения работы всех нитей
            executeIt.shutdown();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}