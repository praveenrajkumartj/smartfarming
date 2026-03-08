package com.smartfarminganddigitalagriplatform.repository;

import com.smartfarminganddigitalagriplatform.entity.User;
import com.smartfarminganddigitalagriplatform.entity.UserConnection;
import org.springframework.data.jpa.repository.JpaRepository;
import java.util.List;
import java.util.Optional;

public interface UserConnectionRepository extends JpaRepository<UserConnection, Long> {

        Optional<UserConnection> findByUserAAndUserBOrUserBAndUserA(User u1, User u2, User u3, User u4);

        List<UserConnection> findByUserAAndStatusOrUserBAndStatus(User u1, UserConnection.Status s1, User u2,
                        UserConnection.Status s2);

        List<UserConnection> findByUserBAndStatus(User userB, UserConnection.Status status);

        List<UserConnection> findByUserAAndStatus(User userA, UserConnection.Status status);
}
