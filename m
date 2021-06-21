Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36503C4743C
	for <linux-remoteproc@archiver.kernel.org>; Mon, 21 Jun 2021 22:38:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1A2166124B
	for <linux-remoteproc@archiver.kernel.org>; Mon, 21 Jun 2021 22:38:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232180AbhFUWlL (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 21 Jun 2021 18:41:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56812 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230438AbhFUWlK (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 21 Jun 2021 18:41:10 -0400
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com [IPv6:2607:f8b0:4864:20::1034])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 37D03C061574
        for <linux-remoteproc@vger.kernel.org>; Mon, 21 Jun 2021 15:38:56 -0700 (PDT)
Received: by mail-pj1-x1034.google.com with SMTP id g4so10866185pjk.0
        for <linux-remoteproc@vger.kernel.org>; Mon, 21 Jun 2021 15:38:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=Jz6SZgWqvL7bHaWtc143EwS+GGx3tpyu63G3kkF5G0Q=;
        b=kW+IQr7wE/rsBw5XOkGVhQKIksvOjZDWJUqCzo4AakRWM3JXm8VXq2rEAz3gqonPMR
         K8t88Gd40XK4er0avf/G3+1FKK7CFKYfGREtf8t+arKT2zS66iGIoBHOnxhIGoqbvjfy
         Mcxkd7THfWcPYgyJ77fCbvNeBZdw9EUGr8UUx4TzVWWP8Oc9SFMp1t5hhYdvTXtDdrs/
         eAeqIDrVmvDGnzJOIfcSs2DdsB/l48dQq8gvMPM7GAnfn6wXFCjC4jiCva/RruIi+RO6
         vIeHaweutkbsE2423DHjp4y5S/SFJTxMoPJiggTeWERcCHcqDxHlMCdvmwCgSRkpzhdd
         kN8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Jz6SZgWqvL7bHaWtc143EwS+GGx3tpyu63G3kkF5G0Q=;
        b=DNDIvpupXEXIV+8Oj73TTvM7O4e51NezLukumTU3/G/clDRTD9VcsW7l+w2CMqwGd6
         dfGYg1S/MbRZdpDrXTxmhGDm95wN/q7s31P4F/2JhvHoSd6Y4SZJ85u3lKZKHHhFg4bh
         iyNwNljPoojaDqbe+heVnOpERftqOMXPA1cnzEh/VCJPTYCOlom7W8g7GEefU/OiTVim
         DWeKwfmtgP+9+Pw+RtZDpIm5CEKnXSGqc3eep/ftVL7QajE/6LeQD5gH3eGfV3uwHMqL
         I80fsSzNXmtYC4Qxpti40vxvx6hiyxwrNw4Lc09SRo2ij6zRororuk1iLSAs6EHkX/Lm
         B4Lw==
X-Gm-Message-State: AOAM530acns0KWeAijAV50YbQS11ZMxOCA54Wez4msWH75rwoUEh+QVA
        IQ3Wr5nDuBHgVzWg0mlW4OZHw5iaDvjlLA==
X-Google-Smtp-Source: ABdhPJw9vU7oA2IViNL+/RJ57i8/CfOF5jNQyJ/uCuSU5lXzt7k0ick+6HbL4XFbhwEfpybymi+ztw==
X-Received: by 2002:a17:902:6b04:b029:10d:8c9e:5f56 with SMTP id o4-20020a1709026b04b029010d8c9e5f56mr20175807plk.8.1624315135706;
        Mon, 21 Jun 2021 15:38:55 -0700 (PDT)
Received: from p14s (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
        by smtp.gmail.com with ESMTPSA id 10sm13863072pfh.174.2021.06.21.15.38.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Jun 2021 15:38:54 -0700 (PDT)
Date:   Mon, 21 Jun 2021 16:38:52 -0600
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com, julien.massot@iot.bzh
Subject: Re: [PATCH 3/4] rpmsg: char: Introduce the "rpmsg-raw" channel
Message-ID: <20210621223852.GA980846@p14s>
References: <20210607173032.30133-1-arnaud.pouliquen@foss.st.com>
 <20210607173032.30133-4-arnaud.pouliquen@foss.st.com>
 <20210615200102.GE604521@p14s>
 <b55cd4e5-fb9d-a0ab-03a9-3a771898db04@foss.st.com>
 <20210617213154.GA790564@p14s>
 <d8e81ecd-c77d-9d16-7e43-218bd54a9f83@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d8e81ecd-c77d-9d16-7e43-218bd54a9f83@foss.st.com>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Fri, Jun 18, 2021 at 01:35:43PM +0200, Arnaud POULIQUEN wrote:
> Hi Mathieu,
> 
> On 6/17/21 11:31 PM, Mathieu Poirier wrote:
> > On Wed, Jun 16, 2021 at 02:38:26PM +0200, Arnaud POULIQUEN wrote:
> >> Hi Mathieu,
> >>
> >> On 6/15/21 10:01 PM, Mathieu Poirier wrote:
> >>> On Mon, Jun 07, 2021 at 07:30:31PM +0200, Arnaud Pouliquen wrote:
> >>>> Allows to probe the endpoint device on a remote name service announcement,
> >>>> by registering a rpmsg_driverfor the "rpmsg-raw" channel.
> >>>>
> >>>> With this patch the /dev/rpmsgX interface can be instantiated by the remote
> >>>> firmware.
> >>>>
> >>>> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
> >>>> ---
> >>>>  drivers/rpmsg/rpmsg_char.c | 54 ++++++++++++++++++++++++++++++++++++--
> >>>>  1 file changed, 52 insertions(+), 2 deletions(-)
> >>>>
> >>>> diff --git a/drivers/rpmsg/rpmsg_char.c b/drivers/rpmsg/rpmsg_char.c
> >>>> index 4199ac1bee10..3b850b218eb0 100644
> >>>> --- a/drivers/rpmsg/rpmsg_char.c
> >>>> +++ b/drivers/rpmsg/rpmsg_char.c
> >>>> @@ -25,6 +25,8 @@
> >>>>  
> >>>>  #include "rpmsg_char.h"
> >>>>  
> >>>> +#define RPMSG_CHAR_DEVNAME "rpmsg-raw"
> >>>> +
> >>>>  static dev_t rpmsg_major;
> >>>>  static struct class *rpmsg_class;
> >>>>  
> >>>> @@ -416,6 +418,40 @@ int rpmsg_chrdev_eptdev_create(struct rpmsg_device *rpdev, struct device *parent
> >>>>  }
> >>>>  EXPORT_SYMBOL(rpmsg_chrdev_eptdev_create);
> >>>>  
> >>>> +static int rpmsg_chrdev_probe(struct rpmsg_device *rpdev)
> >>>> +{
> >>>> +	struct rpmsg_channel_info chinfo;
> >>>> +
> >>>> +	memcpy(chinfo.name, RPMSG_CHAR_DEVNAME, sizeof(RPMSG_CHAR_DEVNAME));
> >>>> +	chinfo.src = rpdev->src;
> >>>> +	chinfo.dst = rpdev->dst;
> >>>> +
> >>>> +	return __rpmsg_chrdev_eptdev_create(rpdev, &rpdev->dev, chinfo, true);
> >>>
> >>> I am a little puzzled here as to why we need different modes... Why can't we
> >>> simply call rpmsg_chrdev_eptdev_create() and let the endpoint be created on
> >>> open() and destroyed on release() as per the current implementation?
> >>
> >> The main reason is the support of the NS announcement
> >> a NS announcement is received from the remote processor:
> >> channel name: "rpmsg-raw"
> >> remote address (dst address): 0x400
> >> local address (scr address) : RPMSG_ADDR_ANY
> >> => no default endpoint, and not local address.
> >>
> >> case 1) if we use legacy implementation ( no default endpoint)
> >> => create/destroy endpoint on open/stop
> >> - on first open: created endpoint is bound to scr address 0x406
> >> - a first message is sent to the remote side, the address 0x406 is stored as
> >> default channel dst address on remote side.
> >> - on close: endpoint is closed and associated address 0x406 is free.
> >> - another driver create an enpoint the address 0x406 is reserved for this new
> >> endpoint.
> >> - on new open:  scr address is set to next value 0x407
> >> => how to inform remote processor that the address has changed?
> >> => no reservation mechanism that ensure that you can reuse the same address
> >>
> >> case 2) relying on use_default_ept
> >> => Ensure that both side have always the same addresses to communicate.
> > 
> > I see the problem and your solution is adequate - I think the code simply needs
> > to be moved around a little.  Here is what I suggest:
> > 
> > 1) Create the endpoint in rpmsg_chrdev_probe(), just before calling
> > rpmsg_chrdev_eptdev_create().  That way changes to rpmsg_eptdev_open() can be
> > kept to a minimum.  I don't think we'll be needing
> > __rpmsg_chrdev_eptdev_create() anymore.
> 
> Yes i could, but this will break a concept of the rpmsg_char that creates the
> endpoint on open, meaning that application is ready to communicate.

In my opinion creating and destorying an endpoint on open/close is something we
want to move away from. 

> 
> I would rather preserve this behavior.
> 
> > 
> > 2) We can get rid of use_default_ept by taking advantage of the fact that the
> > rpmsg_char driver does not use rpmsg_device::ept.  If we create the endpoint in
> > rpmsg_chrdev_probe() we know that if rpdev->ept exists, we must not create
> > or destroy the endpoint in rpmsg_eptdev_open() and rpmsg_eptdev_release().
> >
> > 3) Function rpmsg_eptdev_open() doesn't change much.  If rpdev->ept is NULL
> > than
> > an endpoint is created as the current implementation.  Otherwise we simply do:
> >
> >         eptdev->ept = rpdev->ept;
> >
> 
> In qcom_glink_create_chrdev, a rpmsg_ctrl rpdev with a default endpoint is
> created and used as parameter of the  pmsg_ctrldev_register_device [1]
> => rpdev->ept is not NULL.
> 
> So the rpmsg_char has to differentiate 2 cases on rpmsg_eptdev_open:
> - A enpdoint has to be created as requested by RPMSG_CREATE_EPT_IOCTL
> (regardless of the rpdev->ept value)
> - for a rpmsg device created by an NS announcement: A default endpoint has to be
> reused (or created if rpdev->ept is null).
> 
> so the rpdev->ept test is not relevant for decision, the use_default_ept ( or
> another flag) is mandatory.

Yes, we need a flag.  May I suggest "fixed_ept" rather than "used_default_ept"?

> 
> 
> > 4) Make sure the teardown path works as well.  From what I can see, it should.
> > 
> > 5) Add a __lot__ of comments.
> > 
> > If the above all works this entire patchset should become really small.
> 
> Thanks,
> Arnaud
> 
> > 
> >>
> >>>
> >>> I'd rather keep things simple for the refactoring and introduce new features
> >>> later if need be.
> >>
> >> Yes I agree with you, but here it could become a nightmare for the remote
> >> processor if the Linux endpoint address is not stable.
> >>
> >> Anyway we can consider this as a workaround waiting the extension of the NS
> >> announcement to have a better management of the address exchange on channel
> >> initialization.
> >>
> >> Thanks
> >> Arnaud
> >>
> >>>
> >>> As I said, it may be that I don't understand the usecase.
> >>>
> >>> Thanks,
> >>> Mathieu
> >>>
> >>>> +}
> >>>> +
> >>>> +static void rpmsg_chrdev_remove(struct rpmsg_device *rpdev)
> >>>> +{
> >>>> +	int ret;
> >>>> +
> >>>> +	ret = device_for_each_child(&rpdev->dev, NULL, rpmsg_chrdev_eptdev_destroy);
> >>>> +	if (ret)
> >>>> +		dev_warn(&rpdev->dev, "failed to destroy endpoints: %d\n", ret);
> >>>> +}
> >>>> +
> >>>> +static struct rpmsg_device_id rpmsg_chrdev_id_table[] = {
> >>>> +	{ .name	= RPMSG_CHAR_DEVNAME },
> >>>> +	{ },
> >>>> +};
> >>>> +
> >>>> +static struct rpmsg_driver rpmsg_chrdev_driver = {
> >>>> +	.probe = rpmsg_chrdev_probe,
> >>>> +	.remove = rpmsg_chrdev_remove,
> >>>> +	.id_table = rpmsg_chrdev_id_table,
> >>>> +	.drv = {
> >>>> +		.name = "rpmsg_chrdev",
> >>>> +	},
> >>>> +};
> >>>> +
> >>>>  static int rpmsg_chrdev_init(void)
> >>>>  {
> >>>>  	int ret;
> >>>> @@ -429,16 +465,30 @@ static int rpmsg_chrdev_init(void)
> >>>>  	rpmsg_class = class_create(THIS_MODULE, "rpmsg");
> >>>>  	if (IS_ERR(rpmsg_class)) {
> >>>>  		pr_err("failed to create rpmsg class\n");
> >>>> -		unregister_chrdev_region(rpmsg_major, RPMSG_DEV_MAX);
> >>>> -		return PTR_ERR(rpmsg_class);
> >>>> +		ret = PTR_ERR(rpmsg_class);
> >>>> +		goto free_region;
> >>>> +	}
> >>>> +
> >>>> +	ret = register_rpmsg_driver(&rpmsg_chrdev_driver);
> >>>> +	if (ret < 0) {
> >>>> +		pr_err("rpmsg: failed to register rpmsg raw driver\n");
> >>>> +		goto free_class;
> >>>>  	}
> >>>>  
> >>>>  	return 0;
> >>>> +
> >>>> +free_class:
> >>>> +	class_destroy(rpmsg_class);
> >>>> +free_region:
> >>>> +	unregister_chrdev_region(rpmsg_major, RPMSG_DEV_MAX);
> >>>> +
> >>>> +	return ret;
> >>>>  }
> >>>>  postcore_initcall(rpmsg_chrdev_init);
> >>>>  
> >>>>  static void rpmsg_chrdev_exit(void)
> >>>>  {
> >>>> +	unregister_rpmsg_driver(&rpmsg_chrdev_driver);
> >>>>  	class_destroy(rpmsg_class);
> >>>>  	unregister_chrdev_region(rpmsg_major, RPMSG_DEV_MAX);
> >>>>  }
> >>>> -- 
> >>>> 2.17.1
> >>>>
