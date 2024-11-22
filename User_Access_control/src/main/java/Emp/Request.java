package Emp;

 // Ensure it's in the correct package

public class Request {
    private int id;
    private String username;
    private String software;
    private String accessLevel;
    private String status;

    public Request(int id, String username, String software, String accessLevel, String status) {
        this.id = id;
        this.username = username;
        this.software = software;
        this.accessLevel = accessLevel;
        this.status = status;
    }

    public int getId() {
        return id;
    }

    public String getUsername() {
        return username;
    }

    public String getSoftware() {
        return software;
    }

    public String getAccessLevel() {
        return accessLevel;
    }

    public String getStatus() {
        return status;
    }
}
