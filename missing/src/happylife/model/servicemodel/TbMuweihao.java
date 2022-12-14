package happylife.model.servicemodel;

public class TbMuweihao {
	private String deadName;
	private String muweihao;
	private String jisaoTel;
	private String jisaoDate;
	private String userName;
	private String relation;
	private String jisaoBeizhu;
	private String uuid;
	
	public String getDeadName() {
		return deadName;
	}
	public void setDeadName(String deadName) {
		this.deadName = deadName;
	}
	public String getMuweihao() {
		return muweihao;
	}
	public void setMuweihao(String muweihao) {
		this.muweihao = muweihao;
	}
	public String getJisaoTel() {
		return jisaoTel;
	}
	public void setJisaoTel(String jisaoTel) {
		this.jisaoTel = jisaoTel;
	}
	public String getJisaoDate() {
		return jisaoDate;
	}
	public void setJisaoDate(String jisaoDate) {
		this.jisaoDate = jisaoDate;
	}
	public String getJisaoBeizhu() {
		return jisaoBeizhu;
	}
	public void setJisaoBeizhu(String jisaoBeizhu) {
		this.jisaoBeizhu = jisaoBeizhu;
	}
	public String getUuid() {
		return uuid;
	}
	public void setUuid(String uuid) {
		this.uuid = uuid;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getRelation() {
		return relation;
	}
	public void setRelation(String relation) {
		this.relation = relation;
	}
	@Override
	public String toString() {
		return "TbMuweihao [deadName=" + deadName + ", muweihao=" + muweihao
				+ ", jisaoTel=" + jisaoTel + ", jisaoDate=" + jisaoDate
				+ ", userName=" + userName + ", relation=" + relation
				+ ", jisaoBeizhu=" + jisaoBeizhu + ", uuid=" + uuid + "]";
	}
	
}
