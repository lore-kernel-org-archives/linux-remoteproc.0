Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B74430F7FF
	for <linux-remoteproc@vger.kernel.org>; Mon,  7 Sep 2026 21:41:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788817288; cv=none; b=nJEfh7aH7ayVn4BTIiQ11CDswFfrrWNr5dGStjYHTMe8bEbO0Qmh4sTPv3ZLq5l1IgJ/LCdyZO10ZFtoPe4V/EQfhDMZ8dY+x1aZBrAfRf18kH/QZyKE6p9/1lQzXAfY1JlXNUISWyImtwakjyZ8jufHpdXEqGPttK3vpHm9nCg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788817288; c=relaxed/simple;
	bh=1i31BeRMFT9Vp3AcAN/RmvKH0I2VjZNU1gijNLV1tQo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VZAnTb1LswIZgxQY8RBYe4lKBY0pagCyjA0FOjEjD4O2BrrifXHe6Juj2WESdnroK9UkDuOyyBMqYDAqlmfNQ/gxYKmAQR3//x0T5MnJ1/1mG2z3qSitva3p+wvtRUpGXUk9h8lGVDRezmPUxQhdCbDf2acUpGdtXuLfBsehxUA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=S87jxa6g; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=KwbZ/tou; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="S87jxa6g";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="KwbZ/tou"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1788817285;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=JaECoODu5PWLeAxmwxwy2TeJHbPjZIpe/fjVw/Ok5Aw=;
	b=S87jxa6g3lJLjBi4dFjQtC4NqNtoLEpmw1amWj+Tl+XvD30AFI7G/mrJ+hjw723dTw4tNe
	Syb9+kmTy5dhOguDW2dh6eTHqTMPxh4+vdCqgtGJ+bworbn2RPLeepMmVZKfaUDQZvBwjE
	1hpK8FjBpjm7fDFZVBQ0uaFA3hA0FQs=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-609-4RgVPn38PHeBQMMRE4j8pw-1; Mon, 07 Sep 2026 17:41:22 -0400
X-MC-Unique: 4RgVPn38PHeBQMMRE4j8pw-1
X-Mimecast-MFC-AGG-ID: 4RgVPn38PHeBQMMRE4j8pw_1788817281
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-49cf4cc2125so19102675e9.2
        for <linux-remoteproc@vger.kernel.org>; Mon, 07 Sep 2026 14:41:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1788817281; x=1789422081; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=JaECoODu5PWLeAxmwxwy2TeJHbPjZIpe/fjVw/Ok5Aw=;
        b=KwbZ/touk+AoUhpw0CA+kuWP4KJaWRcAs0VioiQxmHKxPu3u2ryvllNKDnaMU1GWu3
         U1pvRlogoiJOzpRfgLS1XYugdwusm4fV32DY63FJwQOndhcRbD6css1FjEgq5muyJMrm
         rodi7NG6Vsxa71/PB6KOwoVUDzb3cka4Pobt+euydUgxhycKec9zbo1CuzwB31lHlO1n
         zIllMmJXB0vgkrY7Lw+Gu9QxW7QIp6z99phXK3b33/GVYptr4qxyC9lu8a1LKea3BcQU
         zk9Rs1JO8+xIPDqqhGuNW+Bk77hTMpTDUFbY5Hvl/YGOhhNpGV8DPQqARGwNiiyFCkcX
         1+OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788817281; x=1789422081;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JaECoODu5PWLeAxmwxwy2TeJHbPjZIpe/fjVw/Ok5Aw=;
        b=XZ6Eeg2u+/KCYyVFLY10YxlPUAj3eYmjqeF9FOnUiqI7e8dNqs9bG1TTPenoJ0zTvX
         YBi248OWg1XPv2ZpifyY7DunsQfwb0DVHI8n4QctfLmJj2v9KpJ7c3X7P/Mc0rES4DNJ
         DL8c9/7DU6ElvLpQhEh1mvPL3J7C0hNK80+eARgW8V23+1sIiFqebLv6+A8WeG0fV5W5
         u+Wy584oF1erGs/tv9FqZFkn3836Z6LajW5bWPvIPl5kJr5txQS013FLdeklE2ibJeAe
         Euot0Iw789zHY9csBnYJuiVODSnwIRRCD4tjuhDD0UYhUKUnSmllycGG5GKILuUy0zWM
         ZWeQ==
X-Forwarded-Encrypted: i=1; AKwUvBwnEKVXi8XXHoLnJH9SPwHzNg60fuc1erVv7LXgKg2ucNnF7lPimD0fypoVE03mMM9K5kxzqUMiOPkhH0kxcCD+@vger.kernel.org
X-Gm-Message-State: AFuF++mVujIH8Iuu7R2GV6wuNoM5GQ4iW+C9l4/3h6Yq0Z4FGMhqh20G
	tPdtpZ0DSAZD+g/9RCDeGTQNlREZFqhThmXG01xLpKpQ2/dOJuFU6xicPkvIG6muDEZBd6WUX5O
	ETHnkyA+O2dDNXiOEZAdCNaUWpAbQIUxzvJ2EPZkuPnwMkBU+qXsqsaaLefclEv/MN7g/IEY=
X-Gm-Gg: AYBFou1CSlCdn6Nq57zuOGuheUSmOfK1jE+fs4YsqOGMB6pZ0IEFm+5FSjvj8STJi5t
	B2D+/bKDnlOGHF6K1qhD6/QRT8eKr981fVcDmMAnWkFVtbOOBJ6U39bE+0ARDpkj86GqlvwUbBI
	7CGYzmbfe8qgASIaYKaPIvcgurz5L9oqmNOfHjaxrjbTnHgh31LMrwm6MTNrvo8V4n+cHIPLK9v
	4a50oxu07dr4/a4DfwlIB6BDfVZHTsjatVkwqCQy5TdpHXvCfxP7Ebas1x6P5nStALuFT4Avlwk
	yiNip5qX/BFHfUfhNcIzXjBp235tX5fq0NSj7THyt9Kx1Xx2qXgi802S+G8n5w6QJ9geOunk6ke
	DhXA6xa+DO/dSx7o6g2zfB+w=
X-Received: by 2002:a05:600c:3d92:b0:49d:726:cc9f with SMTP id 5b1f17b1804b1-49d0726cd2emr320765715e9.5.1788817280972;
        Mon, 07 Sep 2026 14:41:20 -0700 (PDT)
X-Received: by 2002:a05:600c:3d92:b0:49d:726:cc9f with SMTP id 5b1f17b1804b1-49d0726cd2emr320765175e9.5.1788817280462;
        Mon, 07 Sep 2026 14:41:20 -0700 (PDT)
Received: from redhat.com (IGLD-80-230-79-236.inter.net.il. [80.230.79.236])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ce58da3acsm892607965e9.0.2026.09.07.14.41.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 14:41:19 -0700 (PDT)
Date: Mon, 7 Sep 2026 17:41:15 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Karl Mehltretter <kmehltretter@gmail.com>
Cc: Jason Wang <jasowangio@gmail.com>, Gerd Hoffmann <kraxel@redhat.com>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	Eugenio =?iso-8859-1?Q?P=E9rez?= <eperezma@redhat.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rusty Russell <rusty@rustcorp.com.au>,
	Pawel Moll <pawel.moll@arm.com>, Cornelia Huck <cohuck@redhat.com>,
	Halil Pasic <pasic@linux.ibm.com>,
	Eric Farman <farman@linux.ibm.com>,
	Richard Weinberger <richard@nod.at>,
	Anton Ivanov <anton.ivanov@cambridgegreys.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	Hans de Goede <hansg@kernel.org>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Vadim Pasternak <vadimp@nvidia.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	virtualization@lists.linux.dev, linux-input@vger.kernel.org,
	linux-s390@vger.kernel.org, kvm@vger.kernel.org,
	linux-um@lists.infradead.org, platform-driver-x86@vger.kernel.org,
	linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/3] virtio: synchronize callbacks during device reset
Message-ID: <20260907174032-mutt-send-email-mst@kernel.org>
References: <20260905152059.89560-1-kmehltretter@gmail.com>
 <20260907091033-mutt-send-email-mst@kernel.org>
 <ap8rCQII9fASEosZ@gmail.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ap8rCQII9fASEosZ@gmail.com>

On Mon, Sep 07, 2026 at 11:23:19PM +0200, Karl Mehltretter wrote:
> On Mon, Sep 07, 2026 at 09:13:28AM +0100, Michael S. Tsirkin wrote:
> > got all 3 patches now. it's a good start, thanks, but they need
> > a bit more work, in particular addressing sashiko comments.
> > I'd also prefer patch 1 to be split: moving code from pci to core
> > is separate from ccw fixes.
> > 
> > Pls write or at least edit commit log messages yourself,
> > after reviewing Documentation/process/coding-assistants.rst
> > 
> 
> Thank you for the review and feedback. I'll work on a v2 now.
> 
> Karl

FYI I picked the virtio input patch, no need to repost that.
If you want to fix the evt leak, it can be a separate patch.

-- 
MST

