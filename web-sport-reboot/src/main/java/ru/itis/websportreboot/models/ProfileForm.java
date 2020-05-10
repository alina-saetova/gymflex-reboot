package ru.itis.websportreboot.models;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotEmpty;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class ProfileForm {

    @Email(message = "{errors.incorrect.email}")
    @NotEmpty(message = "{errors.null.email}")
    private String email;

    @NotEmpty(message = "{errors.null.first.name}")
    private String firstName;

    @NotEmpty(message = "{errors.null.last.name}")
    private String lastName;

    @NotEmpty(message = "{errors.null.login}")
    private String login;
}
