package com.leansolution.model;

public class Story {

    private String description;
    private boolean liked;

    public Story(final String description, final boolean liked) {
	this.description = description;
	this.liked = liked;
    }

    public String getDescription() {
	return description;
    }

    public void setDescription(final String description) {
	this.description = description;
    }

    public boolean isLiked() {
	return liked;
    }

    public void setLiked(final boolean liked) {
	this.liked = liked;
    }

}
