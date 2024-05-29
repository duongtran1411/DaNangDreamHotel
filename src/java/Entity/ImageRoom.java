package Entity;

public class ImageRoom {
    private int image_Room_Id;
    private int room_Id;
    private String image;

    public ImageRoom() {
    }

    public ImageRoom(int image_Room_Id, int room_Id, String image) {
        this.image_Room_Id = image_Room_Id;
        this.room_Id = room_Id;
        this.image = image;
    }

    public ImageRoom(String image) {
        this.image = image;
    }
    
    public int getImage_Room_Id() {
        return image_Room_Id;
    }

    public void setImage_Room_Id(int image_Room_Id) {
        this.image_Room_Id = image_Room_Id;
    }

    public int getRoom_Id() {
        return room_Id;
    }

    public void setRoom_Id(int room_Id) {
        this.room_Id = room_Id;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    @Override
    public String toString() {
        return "Image{" + "image_Room_Id=" + image_Room_Id + ", room_Id=" + room_Id + ", image=" + image + '}';
    }
    
    
}
