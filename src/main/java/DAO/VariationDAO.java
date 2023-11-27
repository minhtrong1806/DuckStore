package DAO;

import java.util.Set;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.JoinType;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;

import bean.Variation;
import bean.VariationOption;
import utils.HibernateUtil;

public class VariationDAO {
	private final static SessionFactory factory = HibernateUtil.getSessionFactory();
	
	public Set<VariationOption> getVariationOptionsbyVariation(String variationName){
		try(Session session = factory.openSession()){
			CriteriaBuilder builder = session.getCriteriaBuilder();
			CriteriaQuery<Variation> query = builder.createQuery(Variation.class);
			Root<Variation> root = query.from(Variation.class);
			
			Predicate conditionPredicate = builder.equal(builder.lower(root.get("name")), variationName.toLowerCase());
			query.where(conditionPredicate);
			root.fetch("variationOptions", JoinType.LEFT);
			
			Variation variation = session.createQuery(query).uniqueResult();
			session.close();
			
			Set<VariationOption> variationOptions = variation.getVariationOptions();
			return variationOptions;
		}
	}
	
	public Variation getVariation(String variationName) {
		try (Session session = factory.openSession()){
			CriteriaBuilder builder = session.getCriteriaBuilder();
			CriteriaQuery<Variation> query = builder.createQuery(Variation.class);
			Root<Variation> root = query.from(Variation.class);
			
			Predicate condition = builder.equal(builder.lower(root.get("name")), variationName.toLowerCase());
			query.where(condition);
			
			Query<Variation> variationQuery = session.createQuery(query);
			Variation variation = variationQuery.uniqueResult();
			if(variation != null) {
				return variation;
			}
			else {
				return null;
			}			
		}
	}
}
