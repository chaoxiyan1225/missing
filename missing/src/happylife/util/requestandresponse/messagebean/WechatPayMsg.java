package happylife.util.requestandresponse.messagebean;

import java.io.Serializable;
import java.util.Date;


/**
 *
 * @author MAC
 * @date : Oct 31, 2014 11:24:19 AM
 */

public class WechatPayMsg implements Serializable {
	
	private static final long serialVersionUID = 1L;
	
	private String id;
	
	private String content;//返回来的字串
	
	private String sign_type;//签名方式sign_type 否String(8) 签名类型，取值：MD5、RSA，默认：MD5
	
	private String  sign;//签名
	
	private String  trade_mode;//1-即时到账 其他保留
	
	private String trade_state;//支付结果
	
	private String  time_end;//支付完成时间， 格式为yyyyMMddhhmmss，如2009 年12月27 日9 点10 分10 秒表示为20091227091010。时区为GMT+8beijing。
	
	private String  transaction_id;//交易号，28 位长的数值，其中前10位为商户号，之后8 位为订单产生的日期，如20090415，最后10 位是流水号。
	
	private String  total_fee;//支付金额，请求的total_fee
	
	private String  out_trade_no;//商户系统的订单号，与请求一致
	
	private String  attach;//商户数据包，原样返回，空参数不传递
	
	private String transport_fee;//物流费用，单位分，默认0。如果有值， 必须保证transport_fee +product_fee = total_fee
	
	private String  product_fee;//物品费用，单位分。如果有值，必须保证transport_fee +product_fee=total_fee
	
	private Date time;//发送过来的时间

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getSign_type() {
		return sign_type;
	}

	public void setSign_type(String sign_type) {
		this.sign_type = sign_type;
	}


	public String getSign() {
		return sign;
	}

	public void setSign(String sign) {
		this.sign = sign;
	}

	public String getTrade_mode() {
		return trade_mode;
	}

	public void setTrade_mode(String trade_mode) {
		this.trade_mode = trade_mode;
	}

	public String getTrade_state() {
		return trade_state;
	}

	public void setTrade_state(String trade_state) {
		this.trade_state = trade_state;
	}


	public String getTotal_fee() {
		return total_fee;
	}

	public void setTotal_fee(String total_fee) {
		this.total_fee = total_fee;
	}


	public String getTransaction_id() {
		return transaction_id;
	}

	public void setTransaction_id(String transaction_id) {
		this.transaction_id = transaction_id;
	}

	public String getOut_trade_no() {
		return out_trade_no;
	}

	public void setOut_trade_no(String out_trade_no) {
		this.out_trade_no = out_trade_no;
	}

	public String getAttach() {
		return attach;
	}

	public void setAttach(String attach) {
		this.attach = attach;
	}

	public String getTime_end() {
		return time_end;
	}

	public void setTime_end(String time_end) {
		this.time_end = time_end;
	}

	public String getTransport_fee() {
		return transport_fee;
	}

	public void setTransport_fee(String transport_fee) {
		this.transport_fee = transport_fee;
	}

	public String getProduct_fee() {
		return product_fee;
	}

	public void setProduct_fee(String product_fee) {
		this.product_fee = product_fee;
	}

	public Date getTime() {
		return time;
	}

	public void setTime(Date time) {
		this.time = time;
	}

	@Override
	public String toString() {
		return "WechatPayMsg [id=" + id + ", content=" + content
				+ ", sign_type=" + sign_type + ", sign=" + sign
				+ ", trade_mode=" + trade_mode + ", trade_state=" + trade_state
				+ ", time_end=" + time_end + ", transaction_id="
				+ transaction_id + ", total_fee=" + total_fee
				+ ", out_trade_no=" + out_trade_no + ", attach=" + attach
				+ ", transport_fee=" + transport_fee + ", product_fee="
				+ product_fee + ", time=" + time + "]";
	}
	
	
}
