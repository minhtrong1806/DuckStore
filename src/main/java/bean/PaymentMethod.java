package bean;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Set;


@Entity
@Table(name = "payment_method")
public class PaymentMethod implements Serializable {

    @Id
    @GeneratedValue
    @Column(name = "id")
    private int paymentMethodID;

    @Column(name = "name")
    private String name;

    @OneToMany(mappedBy = "paymentMethod")
    private Set<ShopOrder> shopOrders;

    public PaymentMethod(String name){
        this.name = name;
    }
    public PaymentMethod(){}

    public void setId(int id) {
        this.paymentMethodID = id;
    }

    public int getId() {
        return paymentMethodID;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
}
