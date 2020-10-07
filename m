Return-Path: <SRS0=blvA=DO=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 065F5C41604
	for <linux-remoteproc@archiver.kernel.org>; Wed,  7 Oct 2020 17:26:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9DC3C2168B
	for <linux-remoteproc@archiver.kernel.org>; Wed,  7 Oct 2020 17:26:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hK7cH4Hi"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728207AbgJGR0j (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 7 Oct 2020 13:26:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59320 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726348AbgJGR0j (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 7 Oct 2020 13:26:39 -0400
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com [IPv6:2607:f8b0:4864:20::1041])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 22FE9C0613D2
        for <linux-remoteproc@vger.kernel.org>; Wed,  7 Oct 2020 10:26:39 -0700 (PDT)
Received: by mail-pj1-x1041.google.com with SMTP id kk9so1384615pjb.2
        for <linux-remoteproc@vger.kernel.org>; Wed, 07 Oct 2020 10:26:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=M9ybGiqHvrypTyZEXdLpGDsphUXlCmQ4dG3V5WiWP+c=;
        b=hK7cH4Hi/OTAsATuPSF/XTD9n996EpRc1h5H9Pu2cn2i7W3Y+I4BuZKeYlUo/w/b35
         G8hDlilW3027XJeXWFviuDHG/IxcqdevZB5JAjXLBko1923w4dHEhrw2WvDAggSeOVDU
         ub2O0fqDEL0LnhcIR2eUu2t2lEj93U5R4f6zJNm6jP9hGMJVf50Cr6lgpylN9mtJnCyv
         V1mF1wjni/OjVuTplflycI62WIaI0l2df2ngb6Z5NURHxBuyRRBicvxsXhjgTI1+X0IH
         z+yjEQOEXq/y+oRUTpEe0BRM+g+WuThiuZp0NGeGZK04wVxbkDF0Cl+pmy8t7bfHhqz7
         x9gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=M9ybGiqHvrypTyZEXdLpGDsphUXlCmQ4dG3V5WiWP+c=;
        b=jLqQGdQU5Hxd48+pQ8gTd5HyfivIsJH2Ywzo11OZbcJwUrZlYu8ScDfe1NbdTFhyWD
         xiKQuMJG29NwsUM3ZxC/xKEsWU70jLCbY2kn6N0lln31BoniUtKFlW27UBV3Zd9fH5g9
         eOQUp4X1CJi86YVFPqfZRTszFICUzWd2T3EuSInxMbVaA//3byQCcU0tQ+VUdLjAku4b
         VB7Xw628lV1LI9h5zoQfzlF4Jda5w/WnpUmzSfUzlQ9snYeGsx1pNNXnxvr8+tD78XAf
         GV5hZIABU6JSFHeS3/FstMc0gi4R0xiT3wKFI2eU6TFuBX6UxL5raMwQY/AgM+IlLoKO
         IvCg==
X-Gm-Message-State: AOAM531lZ+EHzeulVbSKMMJvCe6j0efPRpTP+3x6BmgY0WHUgyddPgvR
        pHzeo94dZ718BG6MJqBUtoPUsQ==
X-Google-Smtp-Source: ABdhPJxqdvCkHlZoZkrWmICIoJ7mRQH5Pym1nz8GkT6xy1fjzmpTNgxS0CG1uZPwNv+aiPcbo5lW0w==
X-Received: by 2002:a17:902:6b44:b029:d3:e78a:8ab6 with SMTP id g4-20020a1709026b44b02900d3e78a8ab6mr3747407plt.72.1602091598549;
        Wed, 07 Oct 2020 10:26:38 -0700 (PDT)
Received: from xps15 (S0106002369de4dac.cg.shawcable.net. [68.147.8.254])
        by smtp.gmail.com with ESMTPSA id e19sm4193538pfl.135.2020.10.07.10.26.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2020 10:26:37 -0700 (PDT)
Date:   Wed, 7 Oct 2020 11:26:36 -0600
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
Cc:     ohad@wizery.com, bjorn.andersson@linaro.org, loic.pallardy@st.com,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 10/10] rpmsg: ns: Make Name service module transport
 agnostic
Message-ID: <20201007172636.GB575646@xps15>
References: <20200922001000.899956-1-mathieu.poirier@linaro.org>
 <20200922001000.899956-11-mathieu.poirier@linaro.org>
 <20200930071327.GG20683@ubuntu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200930071327.GG20683@ubuntu>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Wed, Sep 30, 2020 at 09:13:27AM +0200, Guennadi Liakhovetski wrote:
> On Mon, Sep 21, 2020 at 06:10:00PM -0600, Mathieu Poirier wrote:
> > Make name service module transport agnostic by using the rpmsg
> > device specific byte conversion routine.
> > 
> > Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
> > ---
> >  drivers/rpmsg/rpmsg_ns.c | 10 ++++------
> >  include/linux/rpmsg_ns.h |  4 ++--
> >  2 files changed, 6 insertions(+), 8 deletions(-)
> > 
> > diff --git a/drivers/rpmsg/rpmsg_ns.c b/drivers/rpmsg/rpmsg_ns.c
> > index b3318bf84433..1df3aaadfe10 100644
> > --- a/drivers/rpmsg/rpmsg_ns.c
> > +++ b/drivers/rpmsg/rpmsg_ns.c
> > @@ -18,9 +18,7 @@ static int rpmsg_ns_cb(struct rpmsg_device *rpdev, void *data, int len,
> >  	struct rpmsg_ns_msg *msg = data;
> >  	struct rpmsg_device *newch;
> >  	struct rpmsg_channel_info chinfo;
> > -	struct virtio_rpmsg_channel *vch = to_virtio_rpmsg_channel(rpdev);
> > -	struct virtproc_info *vrp = vch->vrp;
> > -	struct device *dev = &vrp->vdev->dev;
> > +	struct device *dev = &rpdev->dev;
> >  	int ret;
> >  
> >  #if defined(CONFIG_DYNAMIC_DEBUG)
> > @@ -38,13 +36,13 @@ static int rpmsg_ns_cb(struct rpmsg_device *rpdev, void *data, int len,
> >  
> >  	strncpy(chinfo.name, msg->name, sizeof(chinfo.name));
> >  	chinfo.src = RPMSG_ADDR_ANY;
> > -	chinfo.dst = virtio32_to_cpu(vrp->vdev, msg->addr);
> > +	chinfo.dst = rpmsg32_to_cpu(rpdev, msg->addr);
> >  
> >  	dev_info(dev, "%sing channel %s addr 0x%x\n",
> > -		 virtio32_to_cpu(vrp->vdev, msg->flags) & RPMSG_NS_DESTROY ?
> > +		 rpmsg32_to_cpu(rpdev, msg->flags) & RPMSG_NS_DESTROY ?
> >  		 "destroy" : "creat", msg->name, chinfo.dst);
> >  
> > -	if (virtio32_to_cpu(vrp->vdev, msg->flags) & RPMSG_NS_DESTROY) {
> > +	if (rpmsg32_to_cpu(rpdev, msg->flags) & RPMSG_NS_DESTROY) {
> >  		ret = rpmsg_release_channel(rpdev, &chinfo);
> >  		if (ret)
> >  			dev_err(dev, "rpmsg_destroy_channel failed: %d\n", ret);
> > diff --git a/include/linux/rpmsg_ns.h b/include/linux/rpmsg_ns.h
> > index aabc6c3c0d6d..9f3030b2145b 100644
> > --- a/include/linux/rpmsg_ns.h
> > +++ b/include/linux/rpmsg_ns.h
> > @@ -41,8 +41,8 @@ struct rpmsg_hdr {
> >   */
> >  struct rpmsg_ns_msg {
> >  	char name[RPMSG_NAME_SIZE];
> > -	__virtio32 addr;
> > -	__virtio32 flags;
> > +	u32 addr;
> > +	u32 flags;
> 
> These aren't (necessarily) native endianness, right? Don't they deserve a 
> separate type? __rpmsg32?
> 

I kept them as u32 type to be as generic as possible and let the endianness
conversion callback do the work.  Making them a __rpmsg32 is a good idea, it
would force a proper implementation. 

> Thanks
> Guennadi
> 
> >  } __packed;
> >  
> >  /**
> > -- 
> > 2.25.1
> > 
