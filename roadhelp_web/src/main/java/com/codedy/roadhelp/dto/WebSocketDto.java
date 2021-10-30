package com.codedy.roadhelp.dto;

public class WebSocketDto {

    //region - Define Fields -
    private String message;
    private Object data;
    private int status;
    private long timeStamp;
    //endregion


    //region - Getter & Setter -
    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public Object getData() {
        return data;
    }

    public void setData(Object data) {
        this.data = data;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public long getTimeStamp() {
        return timeStamp;
    }

    public void setTimeStamp(long timeStamp) {
        this.timeStamp = timeStamp;
    }
    //endregion

}
