package DAO;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;

import org.hibernate.Session;
import org.hibernate.SessionFactory;

import bean.Variation;
import bean.VariationOption;
import utils.HibernateUtil;

public class VariationOptionDAO {
	private final static SessionFactory factory = HibernateUtil.getSessionFactory();

	public VariationOption getVariationOption(String value, Session session) {
		CriteriaBuilder builder = session.getCriteriaBuilder();
		CriteriaQuery<VariationOption> query = builder.createQuery(VariationOption.class);
		Root<VariationOption> root = query.from(VariationOption.class);

		query.select(root);
		query.where(builder.equal(builder.lower(root.get("value")), value.toLowerCase()));

		VariationOption variationOption = session.createQuery(query).uniqueResult();
		return variationOption;
		
	}
	
//	public VariationOption getVariationOption(String value) {
//		try (Session session = factory.openSession()) {
//			CriteriaBuilder builder = session.getCriteriaBuilder();
//			CriteriaQuery<VariationOption> query = builder.createQuery(VariationOption.class);
//			Root<VariationOption> root = query.from(VariationOption.class);
//
//			query.select(root);
//			query.where(builder.equal(builder.lower(root.get("value")), value.toLowerCase()));
//
//			VariationOption variationOption = session.createQuery(query).uniqueResult();
//			Hibernate.initialize(variationOption.getProductItems());
//			return variationOption;
//		}
//	}

	public boolean addVariationOption(String input, String type) {
		try (Session session = factory.openSession()) {
			try {
				session.getTransaction().begin();
				if (!isVariationOptionExists(session, input)) {
					VariationDAO variationDAO = new VariationDAO();
					Variation variation = new Variation();
					if (type == "size") {
						variation = variationDAO.getVariation("size");

					}
					if (type == "color") {
						variation = variationDAO.getVariation("color");
					}
					VariationOption newvVariation = new VariationOption(input, null, null);
					newvVariation.setVariation(variation);
					session.save(newvVariation);
				}
				session.getTransaction().commit();
				session.close();
				return true;
			} catch (Exception e) {
				if (session.getTransaction() != null) {
					session.getTransaction().rollback();
				}
				e.printStackTrace();
			}
			return false;
		}
	}

	public boolean isVariationOptionExists(Session session, String VariationOptionName) {
		CriteriaBuilder builder = session.getCriteriaBuilder();
		CriteriaQuery<Long> query = builder.createQuery(Long.class);
		Root<VariationOption> root = query.from(VariationOption.class);

		query.select(builder.count(root));
		query.where(builder.equal(builder.lower(root.get("value")), VariationOptionName.toLowerCase()));

		Long count = session.createQuery(query).uniqueResult();
		return count != null && count > 0;
	}
}
