Return-Path: <SRS0=Lqpx=AE=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2D9EC433E0
	for <linux-remoteproc@archiver.kernel.org>; Tue, 23 Jun 2020 21:32:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C626020724
	for <linux-remoteproc@archiver.kernel.org>; Tue, 23 Jun 2020 21:32:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tdKjXBvP"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2393679AbgFWVcs (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 23 Jun 2020 17:32:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50960 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388926AbgFWUMC (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 23 Jun 2020 16:12:02 -0400
Received: from mail-ot1-x341.google.com (mail-ot1-x341.google.com [IPv6:2607:f8b0:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0EB30C061755
        for <linux-remoteproc@vger.kernel.org>; Tue, 23 Jun 2020 13:12:02 -0700 (PDT)
Received: by mail-ot1-x341.google.com with SMTP id 72so4425883otc.3
        for <linux-remoteproc@vger.kernel.org>; Tue, 23 Jun 2020 13:12:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=XIF/78/oz3AALSTMCdkQl40XEyXtQL+RlWZw1uAr9zg=;
        b=tdKjXBvP63QvKoBudz2TiD3q5385th1hMT4YyYbkpfKPZCL8IJ+Ea/zWDdJaupAjUS
         /kBIO05NYoTtOQi7v+pjbbkLZ1Qb9T7/MilL7zxh96EEB+oGsCYT8rg0T6sgm+CnEPhR
         +yt2Ka2mZtXXNQGsmzR+xNKA93lfLcZkspz5RGQFiC44WauvAIf2kirLnhG4wUU1JjSY
         BUxdlSB0YrLdRk8T5A33yaoB5ZnoqGwr/HzmfalqHKKvqYB2VGE1uX3r4zpciuDSElnH
         sLKa76Di6HbMOjthg7U7OzD66Fl2B87tt+fZWbYrygveTZYkAZahP7rWsV4oaxrX7b0U
         tlMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=XIF/78/oz3AALSTMCdkQl40XEyXtQL+RlWZw1uAr9zg=;
        b=FGHHjUIC9OC5zJywBwYH36qGzw/4vk6S5soX64STmqereom0sUxw4vr3EQoqSbm37L
         HzXJEuVEPufJAzKaoHzN0TywMc1nhI+NIDwkBtuwQcGHlITRpffVxQG7y/HhokWL5MZY
         J3Jm3K7StMlTGoehlUM4fElFfmvxGzIV5XAsSOMp1Kg0x7Q4r3Jbl1t7IPChPqp1oLt8
         gr8mWc7vrPcOoihcjrljl0ZC138jlsXs3IQ3Ud6cDny9moQVbvrFT6gl8K0ablKZ0gCv
         5Q0jxD+ZNl2PAvlpO08iCH2yfINuSBPNxPwd72f8zL7UmhtoCm5nE6gjpbU+jcmTic4K
         hkEA==
X-Gm-Message-State: AOAM532z6ignstsOMoaCeHpLN/AGBjzkPFjus+ch/ICgEAcv0T4fpvy3
        Mq66ifcDemFVk2GIk/1tD0JidA==
X-Google-Smtp-Source: ABdhPJxzH8gIlLIF2g+bTSsjHv193lX+0hnB105m8aM4ZVMB52dgPURejz1TiABTEcdU/ErrOhXIlQ==
X-Received: by 2002:a9d:53c3:: with SMTP id i3mr20384120oth.300.1592943121239;
        Tue, 23 Jun 2020 13:12:01 -0700 (PDT)
Received: from builder.lan (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id s17sm249054oog.33.2020.06.23.13.12.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2020 13:12:00 -0700 (PDT)
Date:   Tue, 23 Jun 2020 13:09:18 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Mathieu Poirier <mathieu.poirier@linaro.org>
Cc:     ohad@wizery.com, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org, loic.pallardy@st.com,
        arnaud.pouliquen@st.com, s-anna@ti.com
Subject: Re: [PATCH v4 9/9] remoteproc: Properly handle firmware name when
 attaching
Message-ID: <20200623200918.GA407764@builder.lan>
References: <20200601175139.22097-1-mathieu.poirier@linaro.org>
 <20200601175139.22097-10-mathieu.poirier@linaro.org>
 <20200622073319.GK149351@builder.lan>
 <20200623194849.GC1908098@xps15>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200623194849.GC1908098@xps15>
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Tue 23 Jun 12:48 PDT 2020, Mathieu Poirier wrote:

> On Mon, Jun 22, 2020 at 12:33:19AM -0700, Bjorn Andersson wrote:
> > On Mon 01 Jun 10:51 PDT 2020, Mathieu Poirier wrote:
> > 
> > > This patch prevents the firmware image name from being displayed when
> > > the remoteproc core is attaching to a remote processor. This is needed
> > > needed since there is no guarantee about the nature of the firmware
> > > image that is loaded by the external entity.
> > > 
> > > Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
> > 
> > How about renaming the bool "firmware_unknown"?
> 
> My hope was to use the same variable, i.e "autonomous", for the RUNNING ->
> DETACHED and CRASHED -> DETACHED scenarios to reduce the amount of
> variables we need to keep track of when the functionality is implemented in
> upcoming pachsets.
> 

Sounds like a good goal, let's keep it as is for now!

Thanks,
Bjorn

> Thanks for the review,
> Mathieu
> 
> > 
> > Apart from that, I think this looks good.
> > 
> > Regards,
> > Bjorn
> > 
> > > ---
> > >  drivers/remoteproc/remoteproc_core.c  | 18 ++++++++++++++++++
> > >  drivers/remoteproc/remoteproc_sysfs.c | 16 ++++++++++++++--
> > >  include/linux/remoteproc.h            |  2 ++
> > >  3 files changed, 34 insertions(+), 2 deletions(-)
> > > 
> > > diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
> > > index 0e23284fbd25..a8adc712e7f6 100644
> > > --- a/drivers/remoteproc/remoteproc_core.c
> > > +++ b/drivers/remoteproc/remoteproc_core.c
> > > @@ -1642,6 +1642,14 @@ static int rproc_stop(struct rproc *rproc, bool crashed)
> > >  
> > >  	rproc->state = RPROC_OFFLINE;
> > >  
> > > +	/*
> > > +	 * The remote processor has been stopped and is now offline, which means
> > > +	 * that the next time it is brought back online the remoteproc core will
> > > +	 * be responsible to load its firmware.  As such it is no longer
> > > +	 * autonomous.
> > > +	 */
> > > +	rproc->autonomous = false;
> > > +
> > >  	dev_info(dev, "stopped remote processor %s\n", rproc->name);
> > >  
> > >  	return 0;
> > > @@ -2166,6 +2174,16 @@ int rproc_add(struct rproc *rproc)
> > >  	/* create debugfs entries */
> > >  	rproc_create_debug_dir(rproc);
> > >  
> > > +	/*
> > > +	 * Remind ourselves the remote processor has been attached to rather
> > > +	 * than booted by the remoteproc core.  This is important because the
> > > +	 * RPROC_DETACHED state will be lost as soon as the remote processor
> > > +	 * has been attached to.  Used in firmware_show() and reset in
> > > +	 * rproc_stop().
> > > +	 */
> > > +	if (rproc->state == RPROC_DETACHED)
> > > +		rproc->autonomous = true;
> > > +
> > >  	/* if rproc is marked always-on, request it to boot */
> > >  	if (rproc->auto_boot) {
> > >  		ret = rproc_trigger_auto_boot(rproc);
> > > diff --git a/drivers/remoteproc/remoteproc_sysfs.c b/drivers/remoteproc/remoteproc_sysfs.c
> > > index 8b462c501465..4ee158431f67 100644
> > > --- a/drivers/remoteproc/remoteproc_sysfs.c
> > > +++ b/drivers/remoteproc/remoteproc_sysfs.c
> > > @@ -14,8 +14,20 @@ static ssize_t firmware_show(struct device *dev, struct device_attribute *attr,
> > >  			  char *buf)
> > >  {
> > >  	struct rproc *rproc = to_rproc(dev);
> > > -
> > > -	return sprintf(buf, "%s\n", rproc->firmware);
> > > +	const char *firmware = rproc->firmware;
> > > +
> > > +	/*
> > > +	 * If the remote processor has been started by an external
> > > +	 * entity we have no idea of what image it is running.  As such
> > > +	 * simply display a generic string rather then rproc->firmware.
> > > +	 *
> > > +	 * Here we rely on the autonomous flag because a remote processor
> > > +	 * may have been attached to and currently in a running state.
> > > +	 */
> > > +	if (rproc->autonomous)
> > > +		firmware = "unknown";
> > > +
> > > +	return sprintf(buf, "%s\n", firmware);
> > >  }
> > >  
> > >  /* Change firmware name via sysfs */
> > > diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
> > > index bf6a310ba870..cf5e31556780 100644
> > > --- a/include/linux/remoteproc.h
> > > +++ b/include/linux/remoteproc.h
> > > @@ -491,6 +491,7 @@ struct rproc_dump_segment {
> > >   * @table_sz: size of @cached_table
> > >   * @has_iommu: flag to indicate if remote processor is behind an MMU
> > >   * @auto_boot: flag to indicate if remote processor should be auto-started
> > > + * @autonomous: true if an external entity has booted the remote processor
> > >   * @dump_segments: list of segments in the firmware
> > >   * @nb_vdev: number of vdev currently handled by rproc
> > >   */
> > > @@ -524,6 +525,7 @@ struct rproc {
> > >  	size_t table_sz;
> > >  	bool has_iommu;
> > >  	bool auto_boot;
> > > +	bool autonomous;
> > >  	struct list_head dump_segments;
> > >  	int nb_vdev;
> > >  	u8 elf_class;
> > > -- 
> > > 2.20.1
> > > 
