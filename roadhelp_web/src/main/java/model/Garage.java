package model;
import javax.persistence.*;
import javax.validation.constraints.Email;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import java.io.Serializable;
import java.util.Date;

@Entity
@Table(name = "garages")
public class Garage extends BaseModel implements Serializable{
    // - - - - -
    //region - Define Fields -
    @NotNull
    @Size(min = 2, max = 64)
    private String username;

    @NotNull
    @Email
    @Size(min = 2, max = 64)
    private String email;

    //@NotNull
    //@Size(min = 2, max = 128)
    private String password;


    // - - - - -
    private Date emailVerifiedAt;
    private String verificationCode;
    private String resetPasswordCode;
    private String rememberToken;


    // - - - - -
    @Size(max = 128)
    private String image;

    private Boolean gender;

    @Size(min = 2, max = 64)
    private String firstName;

    @Size(min = 2, max = 64)
    private String lastName;

    @Size(min = 2, max = 16)
    private String phone;

    @Size(min = 2, max = 128)
    private String address;

    // - - - - -
    @NotNull
    private Boolean active;
    //endregion

    //region - Relationship -
    @ManyToOne
    @JoinColumn(name = "partnerId") //updatable = false, insertable = false
    private Partner partner;

    //endregion
}
