package Entidades;

public class Header {
	private String itemMenu, url;

	public Header(String itemMenu, String url) {
		super();
		this.itemMenu = itemMenu;
		this.url = url;
	}

	public String getItemMenu() {
		return itemMenu;
	}

	public void setItemMenu(String itemMenu) {
		this.itemMenu = itemMenu;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}
}
