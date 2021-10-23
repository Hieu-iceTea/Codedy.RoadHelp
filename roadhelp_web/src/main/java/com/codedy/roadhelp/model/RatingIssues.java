package com.codedy.roadhelp.model;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonProperty;

import javax.persistence.*;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import java.util.HashMap;

@Entity
@Table(name = "ratingissues")
public class RatingIssues extends BaseModel {

    //region - Define Fields -
    @NotNull
    private int ratePoint;

    @Size(max = 256)
    private String comment;
    //endregion


    //region - Relationship -
    @JsonIgnore
    @OneToOne(cascade = CascadeType.ALL)
    @JoinColumn(name = "issue_id")
    private Issue issue;

    @JsonIgnore
    @ManyToOne(cascade = {CascadeType.PERSIST, CascadeType.MERGE, CascadeType.DETACH, CascadeType.REFRESH})
    @JoinColumn(name = "user_member_id")
    private User userMember;
    //endregion


    //region - Getter & Setter -
    public int getRatePoint() {
        return ratePoint;
    }

    public void setRatePoint(int ratePoint) {
        this.ratePoint = ratePoint;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    public Issue getIssue() {
        return issue;
    }

    public void setIssue(Issue issue) {
        this.issue = issue;
    }

    public User getUserMember() {
        return userMember;
    }

    public void setUserMember(User userMember) {
        this.userMember = userMember;
    }
    //endregion


    //region - Relationship Helper -

    /**
     * Hàm này trả về cấu trúc nguyên thủy của entity này.<br/><br/>
     * <p>
     * Viết bởi: Hiếu iceTea<br/>
     * Ngày: 23-10-2021<br/>
     * Thời gian: 22:22<br/>
     *
     * @return
     */
    public HashMap<String, Object> toHashMap() {
        HashMap<String, Object> hashMap = super.toHashMap();

        hashMap.put("issueId", issue != null ? issue.getId() : null);
        hashMap.put("userMemberId", userMember != null ? userMember.getId() : null);

        hashMap.put("ratePoint", ratePoint);
        hashMap.put("comment", comment);

        return hashMap;
    }

    @JsonProperty("issue")
    public HashMap<String, Object> getIssueHashMap() {
        return issue != null ? issue.toHashMap() : null;
    }

    @JsonProperty("userMember")
    public HashMap<String, Object> getUserMemberHashMap() {
        return userMember != null ? userMember.toHashMap() : null;
    }
    //endregion

}
