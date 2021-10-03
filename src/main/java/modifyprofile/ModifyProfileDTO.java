package modifyprofile;

public class ModifyProfileDTO {
    private String userId;        //사용자 아이디
    private String userPassword;  //사용자 비밀번호
    private String checkPassword; //비밀번호확인
    private String userName;      //사용자 이름
    private String userAddress;   //사용자 주소
    private long phoneNumber;     //휴대전화
    private long landlineNumber;  //일반전화


    public ModifyProfileDTO(String userId, String userPassword, String checkPassword, String userName, String userAddress, long phoneNumber, long landlineNumber) {
        this.userId = userId;
        this.userPassword = userPassword;
        this.checkPassword = checkPassword;
        this.userName = userName;
        this.userAddress = userAddress;
        this.phoneNumber = phoneNumber;
        this.landlineNumber = landlineNumber;
    }


    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getUserPassword() {
        return userPassword;
    }

    public void setUserPassword(String userPassword) {
        this.userPassword = userPassword;
    }

    public String getCheckPassword() {
        return checkPassword;
    }

    public void setCheckPassword(String checkPassword) {
        this.checkPassword = checkPassword;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getUserAddress() {
        return userAddress;
    }

    public void setUserAddress(String userAddress) {
        this.userAddress = userAddress;
    }

    public long getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(long phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public long getLandlineNumber() {
        return landlineNumber;
    }

    public void setLandlineNumber(long landlineNumber) {
        this.landlineNumber = landlineNumber;
    }
}
