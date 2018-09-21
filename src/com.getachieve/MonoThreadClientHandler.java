package com.getachieve;

import java.io.DataInputStream;
import java.io.DataOutputStream;
import java.io.IOException;
import java.lang.reflect.Constructor;
import java.lang.reflect.Method;
import org.apache.commons.lang3.text.WordUtils;
import java.net.Socket;
import org.json.*;

public class MonoThreadClientHandler implements Runnable {

    public Session session;

    private static Socket clientDialog;

    public MonoThreadClientHandler(Socket client) {
        MonoThreadClientHandler.clientDialog = client;
    }

    @Override
    public void run() {

        try {
            session = new Session();
            session.init(this.clientDialog);

            // инициируем каналы общения в сокете, для сервера

            // канал чтения из сокета
            DataInputStream in = new DataInputStream(clientDialog.getInputStream());
            System.out.println("DataInputStream created");

            // канал записи в сокет
            DataOutputStream out = new DataOutputStream(clientDialog.getOutputStream());
            System.out.println("DataOutputStream  created");

            // начинаем диалог с подключенным клиентом в цикле, пока сокет не закрыт клиентом
            while (!clientDialog.isClosed()) {
                System.out.println("Server reading from channel");

                // серверная нить ждёт в канале чтения (inputstream) получения
                // данных клиента после получения данных считывает их
                String entry = in.readUTF();

                // и выводит в консоль
                System.out.println("READ from clientDialog message - " + entry);

                // инициализация проверки условия продолжения работы с клиентом
                // по этому сокету по кодовому слову - quit в любом регистре
                if (entry.equalsIgnoreCase("quit")) {

                    // если кодовое слово получено то инициализируется закрытие
                    // серверной нити
                    System.out.println("Client initialize connections suicide ...");
                    break;
                }

                JSONObject params = new JSONObject(entry);

                String path 				= params.get("path").toString();
                String[] pathInfo 			= path.split("/");
                String class_name 			= pathInfo[0];
                String method_name 			= pathInfo[1];
                params.remove("path");

                try {
                    Class<?> cls 		= Class.forName("com.getachieve.controller." + WordUtils.capitalize(class_name) + "Controller");
                    Constructor<?> ctor = cls.getConstructor(Session.class);
                    Object object 		= ctor.newInstance(session);
                    Method method = cls.getDeclaredMethod(method_name, JSONObject.class);
                    Object val = method.invoke(object, params);
                    JSONObject jsonResponse = (JSONObject) val;
                    out.writeUTF(jsonResponse.toString());
                    // освобождаем буфер сетевых сообщений
                    out.flush();
                    System.out.println(jsonResponse.toString());
                } catch (Exception e) {
                    e.printStackTrace();
                }

                // возвращаемся в началло для считывания нового сообщения
            }
            System.out.println("Client disconnected");

            // закрываем сначала каналы сокета !
            in.close();
            out.close();

            // потом закрываем сокет общения с клиентом в нити моносервера
            clientDialog.close();

            System.out.println("Closing connections & channels - DONE.");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}