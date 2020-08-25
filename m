Return-Path: <SRS0=CAUm=CD=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B4DEC433E1
	for <linux-remoteproc@archiver.kernel.org>; Tue, 25 Aug 2020 13:53:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0738B2078D
	for <linux-remoteproc@archiver.kernel.org>; Tue, 25 Aug 2020 13:53:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="WGKESrTe"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726483AbgHYNxk (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 25 Aug 2020 09:53:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:44598 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726457AbgHYNxh (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 25 Aug 2020 09:53:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1598363613;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=138cvp+YSMgYfNEN+hQF14KPIqzw0MKaD5TwzikQyNY=;
        b=WGKESrTeiOMTzSQKi0RZkynXp8rD2XnFUsLvDPE3/6DcSLUHyd3fUzjmQZSnySl3IsZCtq
        3hG/Df1hREAwVm/+Nyf0PzpzTQcHK1/HD3FFQ4rlLePjJjFTOZvEmc2kYAH1yhRtyLVCV1
        uZ0HBxkWZAoBjNiJbPvOWW7BpI26284=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-512-lwfIAndSPKyfcC2fhY5UKw-1; Tue, 25 Aug 2020 09:53:31 -0400
X-MC-Unique: lwfIAndSPKyfcC2fhY5UKw-1
Received: by mail-qk1-f198.google.com with SMTP id x20so8998922qki.20
        for <linux-remoteproc@vger.kernel.org>; Tue, 25 Aug 2020 06:53:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=138cvp+YSMgYfNEN+hQF14KPIqzw0MKaD5TwzikQyNY=;
        b=Ax5PqY9jdvMUHekPGWxqfcqeifY6I4VOrj/1ZKQADD7NCjLYZbiuzigCEDKaRyr6YK
         o+XYUo+yE42YyNJJLUXYVGetKQ8Ou1FC+uC6DKuuQ+T2dv/FJSQvja+PLKIA8TrjPFrw
         opz4zuKcWxhnQa5WeysjL6g/ZJ0hYZywY0MzZZIPfpGyhj1l7Gb9Zq2ubrd+Z3BUHPAe
         z2BkC2fg69ZSjao5ahZI9nEwT2e+Ot5M00fiJBkea9jVeLeXQ923zhuIQEsLMvXBWonv
         POlKMBAtP9O0kpgOto9Gnc5bFbm1Q6/gwW/YbjJ7mGaKB4qgITEdCWK117sx5yzRZjli
         9f0A==
X-Gm-Message-State: AOAM530sWgOYzYTmeS5UT5krtho0f0T01DOPQL7LiHh0QOWz/E3J5H4Y
        F9whe7a15oPQDoQNIlpu1yb6JcRHZBu0bZdrf//y3Sgpd/zgBqA8ZF5mo2LsceZhmXLQCuhxx5q
        mitZ80ovGq+DR/wiLTAe9Ky30kNULpg==
X-Received: by 2002:ac8:564f:: with SMTP id 15mr9428448qtt.54.1598363610799;
        Tue, 25 Aug 2020 06:53:30 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyPrT+ZhqGX/WxO3DdmtRmLzR6D+VgulQzBW64lie1cdwBxPXFdHdxWQdatgY6vKjfkuFcqew==
X-Received: by 2002:ac8:564f:: with SMTP id 15mr9428417qtt.54.1598363610497;
        Tue, 25 Aug 2020 06:53:30 -0700 (PDT)
Received: from redhat.com (bzq-109-64-136-54.red.bezeqint.net. [109.64.136.54])
        by smtp.gmail.com with ESMTPSA id v24sm1877951qtb.13.2020.08.25.06.53.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Aug 2020 06:53:29 -0700 (PDT)
Date:   Tue, 25 Aug 2020 09:53:24 -0400
From:   "Michael S. Tsirkin" <mst@redhat.com>
To:     Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
Cc:     kvm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        virtualization@lists.linux-foundation.org,
        sound-open-firmware@alsa-project.org,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
        Liam Girdwood <liam.r.girdwood@linux.intel.com>,
        Jason Wang <jasowang@redhat.com>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Vincent Whitchurch <vincent.whitchurch@axis.com>
Subject: Re: [PATCH v4 4/4] vhost: add an RPMsg API
Message-ID: <20200825095148-mutt-send-email-mst@kernel.org>
References: <20200722150927.15587-1-guennadi.liakhovetski@linux.intel.com>
 <20200722150927.15587-5-guennadi.liakhovetski@linux.intel.com>
 <20200804102132-mutt-send-email-mst@kernel.org>
 <20200804151916.GC19025@ubuntu>
 <20200810094013-mutt-send-email-mst@kernel.org>
 <20200812123243.GA10218@ubuntu>
 <20200825134109.GA9822@ubuntu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200825134109.GA9822@ubuntu>
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Tue, Aug 25, 2020 at 03:41:10PM +0200, Guennadi Liakhovetski wrote:
> Hi Michael,
> 
> ...back from holidays and still unsure what your preferred solution 
> for the message layout would be:
> 
> On Wed, Aug 12, 2020 at 02:32:43PM +0200, Guennadi Liakhovetski wrote:
> > Hi Michael,
> > 
> > Thanks for a review.
> > 
> > On Mon, Aug 10, 2020 at 09:44:15AM -0400, Michael S. Tsirkin wrote:
> > > On Tue, Aug 04, 2020 at 05:19:17PM +0200, Guennadi Liakhovetski wrote:
> 
> [snip]
> 
> > > > > > +static int vhost_rpmsg_get_single(struct vhost_virtqueue *vq)
> > > > > > +{
> > > > > > +	struct vhost_rpmsg *vr = container_of(vq->dev, struct vhost_rpmsg, dev);
> > > > > > +	unsigned int out, in;
> > > > > > +	int head = vhost_get_vq_desc(vq, vq->iov, ARRAY_SIZE(vq->iov), &out, &in,
> > > > > > +				     NULL, NULL);
> > > > > > +	if (head < 0) {
> > > > > > +		vq_err(vq, "%s(): error %d getting buffer\n",
> > > > > > +		       __func__, head);
> > > > > > +		return head;
> > > > > > +	}
> > > > > > +
> > > > > > +	/* Nothing new? */
> > > > > > +	if (head == vq->num)
> > > > > > +		return head;
> > > > > > +
> > > > > > +	if (vq == &vr->vq[VIRTIO_RPMSG_RESPONSE] && (out || in != 1)) {
> > > > > 
> > > > > This in != 1 looks like a dependency on a specific message layout.
> > > > > virtio spec says to avoid these. Using iov iters it's not too hard to do
> > > > > ...
> > > > 
> > > > This is an RPMsg VirtIO implementation, and it has to match the virtio_rpmsg_bus.c 
> > > > driver, and that one has specific VirtIO queue and message usage patterns.
> > > 
> > > That could be fine for legacy virtio, but now you are claiming support
> > > for virtio 1, so need to fix these assumptions in the device.
> > 
> > I can just deop these checks without changing anything else, that still would work. 
> > I could also make this work with "any" layout - either ignoring any left-over 
> > buffers or maybe even getting them one by one. But I wouldn't even be able to test 
> > those modes without modifying / breaking the current virtio-rpmsg driver. What's 
> > the preferred solution?
> 
> Could you elaborate a bit please?
> 
> Thanks
> Guennadi

I'd prefer it that we make it work with any layout.
For testing, there was a hack for virtio ring which
split up descriptors at a random boundary.
I'll try to locate it and post, sounds like something
we might want upstream for debugging.

-- 
MST

