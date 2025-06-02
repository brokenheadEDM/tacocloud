package tacos.security;

import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.core.userdetails.UserDetails;
public interface UserDetailService {
    UserDetails loadUserByUsername(String username) throws UsernameNotFoundException;
}
