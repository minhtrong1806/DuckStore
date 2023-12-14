package utils;

import java.util.Set;

import DAO.ProductDAO;
import bean.ProductItem;

public class CalUtils {
	public static float getMinPrice(int productId) {
		ProductDAO productDAO = new ProductDAO();
		Set<ProductItem> items = productDAO.getProductItemsByProduct(productId);
		if (items == null || items.size() == 0) {
			return 0;
		}
		float priceMin = Float.MAX_VALUE;
		for (ProductItem item : items) {
			if (priceMin > item.getPrice()) {
				priceMin = item.getPrice();
			}
		}
		return priceMin;
	}
}
