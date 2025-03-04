package com.hjh.communitysadministrativesystem.Entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

import java.io.Serializable;
import java.util.Date;

@Data
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class PaymentRecord implements Serializable {
    private int paymentId;
    private int wallet_id;
    private double amount;
    private Date payment_date; // 修改: paymentDate -> payment_date
    private String description;

    public int getWalletId() {
        return wallet_id;
    }

    public void setWalletId(int wallet_id) {
        this.wallet_id = wallet_id;
    }

    public Date getPaymentDate() {
        return payment_date;
    }

    public void setPaymentDate(Date payment_date) {
        this.payment_date = payment_date;
    }

}