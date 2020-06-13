package com.thebestshop.dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.thebestshop.entity.Category;

@Transactional
@Repository
public class CategoryDAO {
	@Autowired
	SessionFactory factory;

	public List<Category> findAll(){
		Session session = factory.getCurrentSession();
		String hql = "FROM Category";
		Query query = session.createQuery(hql);
		List<Category> list = query.list();
		
		return list;
	}
	
	public Category findById(Integer id) {
		Session session = factory.getCurrentSession();
		Category entity = (Category) session.get(Category.class, id);
		return entity;
	}
	
	public Category create(Category entity) {
		Session session = factory.getCurrentSession();
		session.save(entity);
		return entity;
	}
	
	public void update(Category entity) {
		Session session = factory.getCurrentSession();
		session.update(entity);
	}
	
	public void delete(Integer id) {
		Session session = factory.getCurrentSession();
		session.delete(session.get(Category.class, id));
	}
}	
