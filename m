Return-Path: <SRS0=pQ+L=6G=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.4 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B77ADC55185
	for <linux-remoteproc@archiver.kernel.org>; Wed, 22 Apr 2020 21:29:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8C36920781
	for <linux-remoteproc@archiver.kernel.org>; Wed, 22 Apr 2020 21:29:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Wgc1ULdG"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726189AbgDVV3b (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 22 Apr 2020 17:29:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54554 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726112AbgDVV3a (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 22 Apr 2020 17:29:30 -0400
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com [IPv6:2607:f8b0:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CD280C03C1A9
        for <linux-remoteproc@vger.kernel.org>; Wed, 22 Apr 2020 14:29:30 -0700 (PDT)
Received: by mail-pg1-x542.google.com with SMTP id j7so1735441pgj.13
        for <linux-remoteproc@vger.kernel.org>; Wed, 22 Apr 2020 14:29:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=syYiAj+wu7MnicwmENUYjrI6RIjCwou9F8AP2RkW6sI=;
        b=Wgc1ULdGKCEG/P7efZhcdY9Q/saIgpoMtqm85n2Sd21Cx8PU0x4BnlTMU+0U5ZmYzV
         k94tla2zlZeoOiu9PpkpNQXiIwPymBrt5EHthb4Azg1sBVjYhocT+SosAbWqRODxHZQb
         N0ATL48NYm1m5TAIOi+4wJ/sQ8i6dZQLHKa6gWeb189fcItgftM6GoByWHbCho52DNGD
         /mKdiCog6jyIRNaTxETPxi8HDjKZyAMy527TqAI81NB71QFQ9J5e0DiRvr5T1XLbGvEp
         QaqB494lMq5rEwvCb7z2UIlm5A1xQ7Yspbw7w0BQYg1cCheZPJg5hOjRnuNq4+4q1SFe
         DOJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=syYiAj+wu7MnicwmENUYjrI6RIjCwou9F8AP2RkW6sI=;
        b=Ap+A2ITkRy9Xa4CI8JN3HfFgahmGl9nTXL9jFUrCGpiW1zNoaXCCM/GJlpxRUTdZi3
         goLBWhT+V/gDW8YlxAyxwz96Sz8xY0PzRzU0w2UUPR/CwWsu2JaWQXn3R05UUTh5Q5+w
         23xGZROXFtk9TzkeL9hnefhfBD9XMcGq/eo5XnE+8MlMP91vKjudrEMUdffPLBCkHXNN
         j4Eck3XEH/92rv6mCrgOnCToDdIjOrI3BgYwNtMPB2tYfLX0A9wDywdT5c4sg518vRDs
         fu1VYzMEho++Hk0Wg6qPoUR7YfC4W6RnARNg/izVZ0zpLC6ulIh5j9p4a3TU+WycRbgZ
         d6EA==
X-Gm-Message-State: AGi0Puas3NGGV/xJHM46Uek5WgOEtxLBkkjTL3kP01c6be37cQ/Ao+ZN
        ICaRiHaxbK7vzGrtq76Ftgw4fA==
X-Google-Smtp-Source: APiQypIU9cmsi3iVhb56UOiiPeEjoOyPWssj+fjMlgm4ECq8CTV3GLwivoKnvHhy9pX+DcH/pfIUTw==
X-Received: by 2002:a63:e63:: with SMTP id 35mr1018854pgo.330.1587590970218;
        Wed, 22 Apr 2020 14:29:30 -0700 (PDT)
Received: from xps15 (S0106002369de4dac.cg.shawcable.net. [68.147.8.254])
        by smtp.gmail.com with ESMTPSA id c15sm424951pfo.188.2020.04.22.14.29.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Apr 2020 14:29:29 -0700 (PDT)
Date:   Wed, 22 Apr 2020 15:29:27 -0600
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Suman Anna <s-anna@ti.com>
Cc:     Loic PALLARDY <loic.pallardy@st.com>,
        "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>,
        "ohad@wizery.com" <ohad@wizery.com>,
        "peng.fan@nxp.com" <peng.fan@nxp.com>,
        Arnaud POULIQUEN <arnaud.pouliquen@st.com>,
        Fabien DESSENNE <fabien.dessenne@st.com>,
        "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>
Subject: Re: [PATCH v2 15/17] remoteproc: Correctly deal with MCU
 synchronisation when changing FW image
Message-ID: <20200422212927.GA20503@xps15>
References: <20200324214603.14979-1-mathieu.poirier@linaro.org>
 <20200324214603.14979-16-mathieu.poirier@linaro.org>
 <91d38ff6a39f4e07838d1e85c392eb8f@SFHDAG7NODE2.st.com>
 <20200330232139.GF31331@xps15>
 <f08ca2c3-d2de-2b3c-4134-950ef0107029@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f08ca2c3-d2de-2b3c-4134-950ef0107029@ti.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org
Message-ID: <20200422212927.qHUokZVC3VXUAXUXCYb1pvujRihq3l4y5hgdkpBHWxc@z>

Hi Suman,

On Tue, Mar 31, 2020 at 05:14:18PM -0500, Suman Anna wrote:
> Hi Mathieu,
> 
> On 3/30/20 6:21 PM, Mathieu Poirier wrote:
> > On Fri, Mar 27, 2020 at 01:50:18PM +0000, Loic PALLARDY wrote:
> >>
> >>> This patch prevents the firmware image from being displayed or changed
> >>> when
> >>> the remoteproc core is synchronising with an MCU. This is needed since
> >>> there is no guarantee about the nature of the firmware image that is loaded
> >>> by the external entity.
> >>>
> >>> Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
> >>> ---
> >>>  drivers/remoteproc/remoteproc_sysfs.c | 25
> >>> ++++++++++++++++++++++++-
> >>>  1 file changed, 24 insertions(+), 1 deletion(-)
> >>>
> >>> diff --git a/drivers/remoteproc/remoteproc_sysfs.c
> >>> b/drivers/remoteproc/remoteproc_sysfs.c
> >>> index 7f8536b73295..4956577ad4b4 100644
> >>> --- a/drivers/remoteproc/remoteproc_sysfs.c
> >>> +++ b/drivers/remoteproc/remoteproc_sysfs.c
> >>> @@ -13,9 +13,20 @@
> >>>  static ssize_t firmware_show(struct device *dev, struct device_attribute
> >>> *attr,
> >>>  			  char *buf)
> >>>  {
> >>> +	ssize_t ret;
> >>>  	struct rproc *rproc = to_rproc(dev);
> >>>
> >>> -	return sprintf(buf, "%s\n", rproc->firmware);
> >>> +	/*
> >>> +	 * In most instances there is no guarantee about the firmware
> >>> +	 * that was loaded by the external entity.  As such simply don't
> >>> +	 * print anything.
> >>> +	 */
> >>> +	if (rproc_sync_with_mcu(rproc))
> >>> +		ret = sprintf(buf, "\n");
> >> Is it enough to provide empty name, or should we add a message to indicate that's name is unkown/undefined ?
> >>
> > 
> > Don't know... It is easy to find plenty of cases in sysfs where null values are
> > represented with a "\n", and just as many where "unknown", "undefined" or "-1"
> > are used. I know GKH prefers the least amount of information as possible, hence
> > going with a "\n".
> > 
> > Again, no strong opinion...
> > 
> >> Regards,
> >> Loic
> >>> +	else
> >>> +		ret = sprintf(buf, "%s\n", rproc->firmware);
> >>> +
> >>> +	return ret;
> >>>  }
> >>>
> >>>  /* Change firmware name via sysfs */
> >>> @@ -33,6 +44,18 @@ static ssize_t firmware_store(struct device *dev,
> >>>  		return -EINVAL;
> >>>  	}
> >>>
> >>> +	/*
> >>> +	 * There is no point in trying to change the firmware if the MCU
> >>> +	 * is currently running or if loading of the image is done by
> >>> +	 * another entity.
> >>> +	 */
> >>> +	if (rproc_sync_with_mcu(rproc)) {
> >>> +		dev_err(dev,
> >>> +			"can't change firmware while synchronising with
> >>> MCU\n");
> >>> +		err = -EBUSY;
> >>> +		goto out;
> >>> +	}
> >>> +
> 
> So, I have done a patch sometime back to deny sysfs operations [1] (the
> primary usecase is for a rproc-client driver driven boot where auto-boot
> is not set) which is still a need for me. Do you see that as orthogonal
> to that, or can we leverage that here somehow. I cannot use the sync_
> conditions for my cases since they are not already booted before.

No matter how much I try to fit the functionality provided by the
"deny_sysfs_ops" flag in the patch you pointed out, I just can't come up with
something I am happy with.

The only thing the topics of remote processor synchronisation and kernel
initiated remote processor boot have in common is preventing sysfs access under
specific circumstances.  As such it is probably best to keep their implemenation
seperated for the time being.

Thanks,
Mathieu

> 
> Also, any reason why you want to do this check before the rproc->state
> unlike the logic around the 'state' file in the next patch?
> 
> [1] https://patchwork.kernel.org/patch/10601325/
> 
> regards
> Suman
> 
> >>>  	if (rproc->state != RPROC_OFFLINE) {
> >>>  		dev_err(dev, "can't change firmware while running\n");
> >>>  		err = -EBUSY;
> >>> --
> >>> 2.20.1
> >>
> 
