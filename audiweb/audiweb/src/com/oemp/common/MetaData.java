package com.oemp.common;

import java.lang.reflect.Field;
import java.util.ArrayList;
import java.util.List;

	@SuppressWarnings("unchecked")
	public class MetaData {
		private String idProperty;
		private String root = "rows";
		private String totalProperty = "total";
		private String successProperty = "success";
		private List fields = new ArrayList();

		public String getSuccessProperty() {
			return successProperty;
		}

		public void setSuccessProperty(String successProperty) {
			this.successProperty = successProperty;
		}

		public String getIdProperty() {
			return idProperty;
		}

		public void setIdProperty(String idProperty) {
			this.idProperty = idProperty;
		}

		public String getRoot() {
			return root;
		}

		public void setRoot(String root) {
			this.root = root;
		}

		public String getTotalProperty() {
			return totalProperty;
		}

		public void setTotalProperty(String totalProperty) {
			this.totalProperty = totalProperty;
		}

		public List getFields() {
			return fields;
		}

		public void reflectFields(String className) {
			fields.clear();
			try {
				Class cla = Class.forName(className);
				Field[] declaredFields = cla.getDeclaredFields();
				for (Field f : declaredFields) {
					Class fc = f.getType();
					
						JSONField field = new JSONField();
						field.setName(f.getName());
						String typeName = fc.getName();
						String jsonType = "string";
						if (typeName.contains("String")) {
							jsonType = "string";
						} else if (typeName.contains("int")
								|| typeName.contains("Integer")) {
							jsonType = "int";
						} else if (typeName.contains("float")
								|| typeName.contains("Float")
								|| typeName.contains("double")
								|| typeName.contains("Double")
								|| typeName.contains("BigDecimal")) {
							jsonType = "float";
						} else if (typeName.contains("boolean")
								|| typeName.contains("Boolean")) {
							jsonType = "boolean";
						} else if (typeName.contains("Date")
								|| typeName.contains("Timestamp")) {
							jsonType = "date";
						}
						field.setType(jsonType);
						fields.add(field);
						
					// System.out.println(f.getName() + ":" + fc.getName());
					
				}
			} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

		public boolean isContain(String className, String fieldName) {
			try {
				Class cla = Class.forName(className);
				Field[] declaredFields = cla.getDeclaredFields();
				for (Field f : declaredFields) {
					if (f.getName().equals(fieldName))
						return true;
				}
			} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return false;
		}
}
