package ASM_ClotherStore.entity;

public interface Report {
	String getCategory();
	Double getTotalAmount();
	Integer getTotalCount();
	Integer getMinPrice();
	Integer getMaxPrice();
	Integer getAveragePrice();
}
