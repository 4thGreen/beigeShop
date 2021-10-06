package user;

public class UserDTO {
    private String userId;        //사용자 아이디
    private String userPassword;  //사용자 비밀번호
    private String userPasswordCheck; //비밀번호확인
    private String userName;      //사용자 이름
    private String userAddress;   //사용자 주소
    private long mobileNumber;     //휴대전화
    private long phoneNumber;  //일반전화
    private String userEmail;


//    public UserDTO(String userId, String userPassword, String checkPassword, String userName, String userAddress, long phoneNumber, long landlineNumber, String userEmail) {
//        this.userId = userId;
//        this.userPassword = userPassword;
//        this.userPasswordCheck = checkPassword;
//        this.userName = userName;
//        this.userAddress = userAddress;
//        this.mobileNumber = phoneNumber;
//        this.phoneNumber = landlineNumber;
//        this.userEmail = userEmail;
//    }


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

    public String getUserPasswordCheck() {
        return userPasswordCheck;
    }

    public void setUserPasswordCheck(String userPasswordCheck) {
        this.userPasswordCheck = userPasswordCheck;
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

    public long getMobileNumber() {
        return mobileNumber;
    }

    public void setMobileNumber(long mobileNumber) {
        this.mobileNumber = mobileNumber;
    }

    public long getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(long phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public String getUserEmail() {
        return userEmail;
    }

    public void setUserEmail(String userEmail) {
        this.userEmail = userEmail;
    }
}
