Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20B8BC433ED
	for <linux-remoteproc@archiver.kernel.org>; Mon, 17 May 2021 16:40:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0644260FD9
	for <linux-remoteproc@archiver.kernel.org>; Mon, 17 May 2021 16:40:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243013AbhEQQl5 (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 17 May 2021 12:41:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41822 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240385AbhEQQl1 (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 17 May 2021 12:41:27 -0400
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com [IPv6:2607:f8b0:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E86BEC043164
        for <linux-remoteproc@vger.kernel.org>; Mon, 17 May 2021 08:47:33 -0700 (PDT)
Received: by mail-pl1-x634.google.com with SMTP id p6so3362137plr.11
        for <linux-remoteproc@vger.kernel.org>; Mon, 17 May 2021 08:47:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=FRBnxsunwKZMN3HF3sG/rPb6rE3SlX3UxhINuxk4Q2g=;
        b=UiIQMcXUY5269CNue563SejGPAfXEtbk4+D3088yWt3FZ23ZJxavGXVfapk+jydZe+
         syNGASpatkACDUf67lQUWay0tml1OK9d2PjKHoroChl6KOkt3GicIWZn16YGxQrqgtE6
         sA+iuOG93EiXC8EjHEW9iStuOA7vE34eHb/Idln5OhoHhkwqpRpP/vFtFZv84sjxp885
         2ayprXeG9mZ/uMdV9V1hMk1JCJYbCI6hyNuKSrDUtjKDlHauLzR5V+G3flxfo8uUprQb
         2lwzHvjDkuN2T7s9yyxvmjYN9OVqGLoRu6MCxa/OsAK0ybZVJ7QwPcQB684ujuyBfJ6b
         eurA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=FRBnxsunwKZMN3HF3sG/rPb6rE3SlX3UxhINuxk4Q2g=;
        b=U47KAGgPqmnyVvViku+wsVJFXCZzteE6VQdqMzSOqPWhkheITKdWQEX6B6Ux4c9KWi
         sTALutCrLMgX2SojckM7MFL6z7OfIrPN3zUpFz5dMOya9G8keVWaQicLf4pJa3Ed50qr
         6BX3vSzwMQmIgKhG3+w0zXTyt1bk4N8BuwyxYUl9jJeiOXEWst36jFjOD2/VwmiX/+xY
         hmNDyRiDlwuecBM+Ev9W8aP6PyzjlHnjTeOxV/nWy1iIm1FZQCI9cLXQXtYdFrnBSdSB
         F3bDlTFrhgmN7VcfwuwbJytDQmSh3gcP9Cc0ob4nf9csBqvK6RVEtTIN+m92cwe0+iIU
         kQ7A==
X-Gm-Message-State: AOAM532uqTyl6z/maUT/ymAsMJtyg1WEB+C43JCXPXIKUldC/4axNw/W
        D5A7wxZ6gT1+2cbN6GHDFkeJ4w==
X-Google-Smtp-Source: ABdhPJyNnxU8yRlnUwkZ4bSnuzXA5ieaZwu1CTQ/cFaXqiqGgzklZz6RnwYGsshne7IYDvCyQ27qmw==
X-Received: by 2002:a17:90a:b945:: with SMTP id f5mr86375pjw.233.1621266453330;
        Mon, 17 May 2021 08:47:33 -0700 (PDT)
Received: from xps15 (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
        by smtp.gmail.com with ESMTPSA id w2sm4839275pjq.5.2021.05.17.08.47.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 May 2021 08:47:32 -0700 (PDT)
Date:   Mon, 17 May 2021 09:47:30 -0600
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH v3 5/6] rpmsg: char: Introduce a rpmsg driver for the
 rpmsg char device
Message-ID: <20210517154730.GA496383@xps15>
References: <20210429135507.8264-1-arnaud.pouliquen@foss.st.com>
 <20210429135507.8264-6-arnaud.pouliquen@foss.st.com>
 <20210505164159.GB1766375@xps15>
 <5a41e653-4d75-c5d5-a8e3-e247a50507f3@foss.st.com>
 <20210506161125.GA1804623@xps15>
 <e54fb7ce-41c9-4282-22d0-3188af81dc0f@foss.st.com>
 <20210507163113.GA1907885@xps15>
 <17df93bf-a055-5519-f6e5-ab4751a81ebf@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <17df93bf-a055-5519-f6e5-ab4751a81ebf@foss.st.com>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Mon, May 17, 2021 at 12:04:29PM +0200, Arnaud POULIQUEN wrote:
> Hello Mathieu,
> 
> On 5/7/21 6:31 PM, Mathieu Poirier wrote:
> > Good morning,
> > 
> > On Fri, May 07, 2021 at 11:30:30AM +0200, Arnaud POULIQUEN wrote:
> >> Hi Mathieu,
> >>
> >> On 5/6/21 6:11 PM, Mathieu Poirier wrote:
> >>> Good day,
> >>>
> >>> On Wed, May 05, 2021 at 08:25:24PM +0200, Arnaud POULIQUEN wrote:
> >>>> Hi Mathieu,
> >>>>
> >>>> On 5/5/21 6:41 PM, Mathieu Poirier wrote:
> >>>>> Hi Arnaud,
> >>>>>
> >>>>> On Thu, Apr 29, 2021 at 03:55:06PM +0200, Arnaud Pouliquen wrote:
> 
> [snip...]
> 
> >>>>>> +};
> >>>>>
> >>>>> The sole purpose of doing this is to create instances of rpmsg_chrdevs from the
> >>>>> name service - but is it really needed?  Up to now and aside from GLINK and SMD,
> >>>>> there asn't been other users of it so I'm wondering if it is worth going through
> >>>>> all this trouble.
> >>>>
> >>>> It is a good point.
> >>>>
> >>>> Just as a reminder, the need of ST and, I assume, some other companies, is to
> >>>> have a basic/generic communication channel to control a remote processor
> >>>> application.
> >>>>
> >>>> Nothing generic exists today for a virtio transport based implementation.
> >>>> Companies have to create their own driver.
> >>>>
> >>>> The purpose of my work is to allow our customer to use RPMsg without developing
> >>>> a specific driver to control remote applications.
> >>>>
> >>>> The rpmsg_chrdev char is a good candidate for this. No protocol, just a simple
> >>>> inter-processor link to send and receive data. The rpmsg_tty is another one.
> >>>>
> >>>> Focusing on the rpmsg_chrdev:
> >>>> We did a part of the work with the first patch set that would be in 5.13.
> >>>> But is it simple to use it for virtio transport based platforms?
> >>>> If we don't implement the NS announcement support in rpmsg_chrdev, using
> >>>> rpmsg_chrdev for a user application seems rather tricky.
> >>>> How to instantiate the communication?
> >>>
> >>> Since we already have /dev/rpmsg_ctrlX user space can instantiate an 
> >>> using that interface, which is how things are done in the GLINK/SMD world.
> >>>
> >>> Wouldn't that cover the usecases you had in mind?
> >>
> >> I have in mind that to make RPMsg easy to use, we need a generic driver with a
> >> basic user interface to send end receive data, that supports the NS announcement:
> >> -  remote side could instantiate it.
> >> -  an instantiation of the device by a Linux application generates a NS
> >> announcement sent to the remote side (for instance to create a channel for debug
> >> trace).
> >>
> > 
> > The communication using a rpmsg_chrdev should be happening in two different ways,
> > i.e RPMSG_CREATE_EPT_IOCTL and RPMSG_CREATE_DEV_IOCTL (as you had in a previous
> > patchset). 
> > 
> > From user space communication using a rpmsg_chrdev should be initiated in two
> > different ways, i.e RPMSG_CREATE_EPT_IOCTL and RPMSG_CREATE_DEV_IOCTL (as you
> > had in a previous patchset). 
> > 
> > Regarding RPMSG_CREATE_EPT_IOCTL, patches 1, 2 and 3 take care of the legacy
> > compatibility and I am quite happy with that.  In this case the driver works the
> > same way regardless of the transport mechanism - virtio, GLINK or SMD.
> 
> Ok i will send a new revision including only this ones, and continue the updates
> in a new patchset.
> 
> > 
> > Then there is instantiation with RPMSG_CREATE_DEV_IOCTL.  That creates a new
> > channel (with endpoint) when coming from /dev/rpmsg_ctrlX.  When we have that
> > functionality we can make the rpmsg_chrdev available from the name service, making
> > sure the end result is the same regardless of source of the request (remote
> > processor or user space).  I was under the impression that functionality would
> > be part of an upcoming patchset.
> > 
> > Unless I'm missing parts of the story, proceeding this way should cover all the
> > requirements we talked about.
> 
> From my windows, there are 3 remaining features:
> - capability to instantiate rpmsg_chrdev from the remote side (NS announcement)

I think this should be #2.

> - capability to instantiate rpmsg_chrdev from local user application
>   (RPMSG_CREATE_DEV_IOCTL)

This should be #1.  Once this is firmly in place #2 (above) should be relatively
easy to implement.  #1 and #2 can be in the same patchset, or not, depending on
what you prefer. 

> - capability to send a NS announcement to the remote side on  rpmsg_chrdev local
> instantiation using RPMSG_CREATE_DEV_IOCTL. This one could be more tricky to
> implement as the endpoint can be created after the channel.

That should probably come after #1 and #2, and in a separate patchset.

> 
> To simplify the review while keeping the overall picture in mind (and perhaps
> prioritize based on other companies' interests), Please, just tell me what would
> be your preference in term of splitting and next step.
> 
> > 
> >> On the other side, the initial work requested by Bjorn seems to be reached:
> >> de-correlate the control part to be able to reuse it for other rpmsg devices.
> >>
> >> I just have the feeling that we are stay in the middle of the road without the
> >> patches 4,5 and 6 to have a first basic interface relying on RPMsg.
> >>
> >>>
> >>> As you pointed out above rpmsg_chrdev should be light and simple - eliminating
> >>> patches 4, 5 and 6 would yield that.
> >>>
> >>
> >> My concern here is more about the complexity of using it by application, for
> >> platforms that rely on virtio rpmsg transport. For instance applications need to
> >> know the notion of local and remote RPMsg addressing.
> >>
> >> Based on your feeling, here is my proposition for next steps:
> >>  1- resend a version a version with only patch 1,2 3 + the patch to clean-up the
> >>    #include in rpmsg_char
> >>  2- switch back to the RPMsg TTY upstream.
> >>  3- extend rpmsg_ctrl IOCTLs to allow instantiate RPMSG_TTY from Linux userland.
> >>
> > 
> > Introducing RPMSG_TTY makes sense if a serial controller is only accessible from
> > the remote processor.  On the flip side it is an overkill if we just want a raw
> > message passing mechanism.  For that the rpmsg_chrdev driver, with the above
> > extention, should be used.
> >  
> 
> Yes the rpmsg_chrdev should be the default one to use for basic communication.

Perfect, we are on the same page.

> The main purpose of the RPMSG_TTY (from ST company POW) is to easy the
> transition in term of communication between an external and an internal
> processor based on a serial link. It provides an abstraction layer that the
> application does not have to manage the transport layer.
> 

Ok

> Both seem to me interesting to implement, but let's continue to focus on
> rpmsg_chrdev first.
> 
> Thanks,
> Arnaud
> 
> >>
> >> Then, we can come back to patches 4, 5 and 6 depending on the feedback from the
> >> users.
> >>
> >> Does this proposition would be OK for you?
> >>
> >> Thanks,
> >> Arnaud
> >>
> >>
> >>>> The application will probably has to scan the /sys/bus/rpmsg/devices/ folder to
> >>>> determine the services and associated remote address.
> >>>>
> >>>> I don't think the QCOM drivers have the same problem because they seems to
> >>>> initiate the communication and work directly with the RPMsg endpoints ( new
> >>>> channel creation on endpoint creation) while Virtio works with the RPMsg channel.
> >>>>
> >>>> By introducing the ability to instantiate rpmsg_chrdevs through the NS
> >>>> announcement, we make this easy for applications to use.
> >>>>
> >>>> And without rpmsg_chrdevs instantiation, It also means that we can't create an
> >>>> RPMsg channel for the rpmsg_chrdevs using a new RPMSG_CREATE_DEV_IOCTL control,
> >>>> right?
> >>>>
> >>>> That said, If we consider that the aim was only to extract the rpmsg_ctrl part,
> >>>> I'm not against leaving the rpmsg_char in this state and switching to the
> >>>> rpmsg_tty driver upstream including the work on the rpmsg_ctrl to create rpmsg
> >>>> channels.
> >>>>
> >>>> We could come back on this if requested by someone else.
> >>>>
> >>>> Thanks,
> >>>> Arnaud
> >>>>
> >>>>>
> >>>>> As such I suggest we don't go out of our way to expose rpmsg_chrdevs to the name
> >>>>> service.  That way patches 4, 5 and 6 of this set can be dropped.
> >>>>>
> >>>>> Thanks,
> >>>>> Mathieu
> >>>>>
> 
