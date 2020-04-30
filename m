Return-Path: <SRS0=rgFL=6O=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.4 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20D8AC47247
	for <linux-remoteproc@archiver.kernel.org>; Thu, 30 Apr 2020 20:32:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id EA953207DD
	for <linux-remoteproc@archiver.kernel.org>; Thu, 30 Apr 2020 20:32:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="abCaj1x9"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726799AbgD3UcJ (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Thu, 30 Apr 2020 16:32:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33436 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726338AbgD3UcJ (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 30 Apr 2020 16:32:09 -0400
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com [IPv6:2607:f8b0:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 204B8C035495
        for <linux-remoteproc@vger.kernel.org>; Thu, 30 Apr 2020 13:32:09 -0700 (PDT)
Received: by mail-pl1-x641.google.com with SMTP id d24so2737859pll.8
        for <linux-remoteproc@vger.kernel.org>; Thu, 30 Apr 2020 13:32:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=TRpun8ZJN69jp7jExSpIbQC8AtdvbGpEbLFXg6nKqKA=;
        b=abCaj1x9F40mJBqI6LU0+ztZr1PTYB4rbdxMELvUtArwQtVRG2nQPiaW+lKmwwuDmC
         r0eZJaQDVkXVuBEO3ODLsNGE/s7OzzoeQgodBRQekvXAXoiwCk7Rxi0v9n024EZXRi4P
         C+T8jKR8CKk3PZVhRx6fGcHUis3rG+/YEetmB/YzT5fvZM3oqnWfMwrow/IXExKg5Itr
         HGi3eduxCKubzqZqRCjuhLJ3ucIObmv+QlQVAoOkVnPMbahhjuM5nIbaSeNE+i7+rB87
         wqnwDEyLNgGfaLWhMl+em5/RZ76rAgbybtAB3JV3x+5XymSEkgYodPJujkV/d/GfqJaB
         kSeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=TRpun8ZJN69jp7jExSpIbQC8AtdvbGpEbLFXg6nKqKA=;
        b=J2rrM0R0hV3fESaPDPLD0m9AfEyFSVWaM7txBtDcMaULaOoft4iP5sH/JGd4i66a/m
         nxzWM9WuFSA/4yA0ZwlIlqFxuZRQ4oGz0sRXDNvxXpOPO0bUmMBj5UFCg43VIoVdokVZ
         Fwu4TdW2PihXMaaYyGn6MEp65Y96WSOQbPVWYXiMHT2XOh43qxxWN9wPUek+y+a3i6ep
         dn4x5r7atd+qmLKIg47g/gIhehK8HDS9NzWUiSE2PTg6tbeZhWNxy56UV/aBhEL7DOnR
         L57CBNi12C/yfhufJq7QUlBEsMv5XWcuF5D/EpOntMY0oUMlxE8WXEjc7E3SdqbGJdtO
         YEIQ==
X-Gm-Message-State: AGi0PuZE+tM+VG4qaQMS/CWyRK+gI/VUnE1XjoL3eHI/4wx1bP00c4Xs
        4z4rGBwJkQ/wSWYp1pnO2WJIMA==
X-Google-Smtp-Source: APiQypLQoIE3bTRSGHvLe5+M0yUzy3eAJWtOQvwH/zmhNnO7FRVC8auK4g+f7zJmgvGu05/FK3CxgQ==
X-Received: by 2002:a17:90b:46c2:: with SMTP id jx2mr659045pjb.67.1588278728464;
        Thu, 30 Apr 2020 13:32:08 -0700 (PDT)
Received: from xps15 (S0106002369de4dac.cg.shawcable.net. [68.147.8.254])
        by smtp.gmail.com with ESMTPSA id t3sm542056pfq.110.2020.04.30.13.32.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2020 13:32:07 -0700 (PDT)
Date:   Thu, 30 Apr 2020 14:32:05 -0600
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Arnaud POULIQUEN <arnaud.pouliquen@st.com>
Cc:     bjorn.andersson@linaro.org, ohad@wizery.com, loic.pallardy@st.com,
        s-anna@ti.com, linux-remoteproc@vger.kernel.org, corbet@lwn.net,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 11/14] remoteproc: Deal with synchronisation when
 changing FW image
Message-ID: <20200430203205.GA18004@xps15>
References: <20200424200135.28825-1-mathieu.poirier@linaro.org>
 <20200424200135.28825-12-mathieu.poirier@linaro.org>
 <4ab6d7ac-905b-494e-cce7-cb8a697decb7@st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4ab6d7ac-905b-494e-cce7-cb8a697decb7@st.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Wed, Apr 29, 2020 at 10:52:48AM +0200, Arnaud POULIQUEN wrote:
> 
> 
> On 4/24/20 10:01 PM, Mathieu Poirier wrote:
> > This patch prevents the firmware image from being displayed or changed
> > when the remoteproc core is synchronising with a remote processor. This
> > is needed since there is no guarantee about the nature of the firmware
> > image that is loaded by the external entity.
> > 
> > Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
> > ---
> >  drivers/remoteproc/remoteproc_sysfs.c | 24 +++++++++++++++++++++++-
> >  1 file changed, 23 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/remoteproc/remoteproc_sysfs.c b/drivers/remoteproc/remoteproc_sysfs.c
> > index 7f8536b73295..cdd322a6ecfa 100644
> > --- a/drivers/remoteproc/remoteproc_sysfs.c
> > +++ b/drivers/remoteproc/remoteproc_sysfs.c
> > @@ -13,9 +13,20 @@
> >  static ssize_t firmware_show(struct device *dev, struct device_attribute *attr,
> >  			  char *buf)
> >  {
> > +	ssize_t ret;
> >  	struct rproc *rproc = to_rproc(dev);
> >  
> > -	return sprintf(buf, "%s\n", rproc->firmware);
> > +	/*
> > +	 * In most instances there is no guarantee about the firmware
> > +	 * that was loaded by the external entity.  As such simply don't
> > +	 * print anything.
> > +	 */
> > +	if (rproc_needs_syncing(rproc))
> > +		ret = sprintf(buf, "\n");
> 
> A default name is provided in sysfs if no firmware is started/synchronised on boot.
> 
> IMO providing an empty name here could be confusing.
> Perhaps a refactoring of this sysfs entry would be nice:
>  - Normal boot (no firmware loaded) : empty name instead of a default name

That is guaranteed to break user space so we can't proceed this way.

>  - auto_boot: name provided by the platform driver or default name ( current implementation)
>  - synchronization: a predefined name such as Default, unknown, External, None,...   

Loic had the same comment.  Usually it is best to provide sysfs output that
don't need parsing, i.e 0/1 or nothing at all, but in the remoteproc subsystem
we already have "state", "name" and "firmware" that need parsing.  As such my
next revision will have "unknown", which I think is the best way to describe the
situation.

> 
> > +	else
> > +		ret = sprintf(buf, "%s\n", rproc->firmware);
> > +
> > +	return ret;
> >  }
> >  
> >  /* Change firmware name via sysfs */
> > @@ -39,6 +50,17 @@ static ssize_t firmware_store(struct device *dev,
> >  		goto out;
> >  	}
> >  
> > +	/*
> > +	 * There is no point in trying to change the firmware if loading the
> > +	 * image of the remote processor is done by another entity.
> > +	 */
> > +	if (rproc_needs_syncing(rproc)) {
> > +		dev_err(dev,
> > +			"can't change firmware while synchronising with MCU\n");
> 
> I don't know if you decide to keep "MCU" or not. If not the case
> you have also some other instances in your patch 9/14.

MCU should be long gone.  I thought I had spotted them all but was obviously
wrong.

> 
> Regards
> Arnaud
> 
> > +		err = -EBUSY;
> > +		goto out;
> > +	}
> > +
> >  	len = strcspn(buf, "\n");
> >  	if (!len) {
> >  		dev_err(dev, "can't provide a NULL firmware\n");
> > 
