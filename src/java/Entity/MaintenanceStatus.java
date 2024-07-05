/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Entity;

/**
 *
 * @author GIGABYTE
 */
public enum MaintenanceStatus {

    DIRTY_ROOM("dirty room"),
    CLEAN_ROOM("clean room"),
    FIX_ROOM("fix room");

    private final String value;

    MaintenanceStatus(String value) {
        this.value = value;
    }

    public String getValue() {
        return value;
    }

    public static MaintenanceStatus fromString(String text) {
        for (MaintenanceStatus status : MaintenanceStatus.values()) {
            if (status.value.equalsIgnoreCase(text)) {
                return status;
            }
        }
        throw new IllegalArgumentException("Unknown status: " + text);
    }

}
