package com.hzh.MyMessageBoard.pojo;

public class Message {
    int userId;
    int messageId;
    String message;
    int row;
    int line;
    String userName;

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public int getMessageId() {
        return messageId;
    }

    public void setMessageId(int messageId) {
        this.messageId = messageId;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public int getRow() {
        return row;
    }

    public void setRow(int row) {
        this.row = row;
    }

    public int getLine() {
        return line;
    }

    public void setLine(int line) {
        this.line = line;
    }

    @Override
    public String toString() {
        return "Message{" +
                "userId=" + userId +
                ", messageId=" + messageId +
                ", message='" + message + '\'' +
                ", row=" + row +
                ", line=" + line +
                ", userName=" + userName +
                '}';
    }
}
