package module;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

import org.nutz.json.Json;
import org.nutz.json.JsonFormat;

public class ResponseCode {
	protected String message;
	protected Integer status;

	public ResponseCode(Integer status, String message) {
		this.status = status;
		this.message = message;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	@Override
	public String toString() {
		String res = Json.toJson(this, new JsonFormat(true));
		try {
			res = URLEncoder.encode(URLEncoder.encode(res, "UTF-8"), "UTF-8");
		} catch (UnsupportedEncodingException e) {
		}
		return res;
	}

}
