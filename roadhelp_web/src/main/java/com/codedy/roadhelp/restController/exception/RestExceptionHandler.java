package com.codedy.roadhelp.restController.exception;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;

//@ControllerAdvice
@ControllerAdvice(basePackages = "com.codedy.roadhelp.restController") //Target all Controllers within specific packages
public class RestExceptionHandler {

    //Add an exception handler for restNotFoundException
    @ExceptionHandler
    public ResponseEntity<RestErrorResponse> handlerException(RestNotFoundException restNotFoundException) {

        //Create restErrorResponse
        RestErrorResponse restErrorResponse = new RestErrorResponse(
                HttpStatus.NOT_FOUND.value(),
                restNotFoundException.getMessage(),
                System.currentTimeMillis()
        );

        // return ResponseEntity
        return new ResponseEntity<>(restErrorResponse, HttpStatus.NOT_FOUND);

    }

    // Add another exception handler ... to catch any exception (catch all)
    @ExceptionHandler
    public ResponseEntity<RestErrorResponse> handlerException(Exception exception) {

        //Create restErrorResponse
        RestErrorResponse restErrorResponse = new RestErrorResponse(
                HttpStatus.BAD_REQUEST.value(),
                exception.getMessage(),
                System.currentTimeMillis()
        );

        // return ResponseEntity
        return new ResponseEntity<>(restErrorResponse, HttpStatus.BAD_REQUEST);

    }

}
