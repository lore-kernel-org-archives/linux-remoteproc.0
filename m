Return-Path: <SRS0=CXzu=7W=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A2CDC433E0
	for <linux-remoteproc@archiver.kernel.org>; Tue,  9 Jun 2020 16:26:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 23F0A20734
	for <linux-remoteproc@archiver.kernel.org>; Tue,  9 Jun 2020 16:26:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KsV/udHd"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728579AbgFIQ0t (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 9 Jun 2020 12:26:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56744 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726286AbgFIQ0t (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 9 Jun 2020 12:26:49 -0400
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com [IPv6:2607:f8b0:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4E483C05BD1E
        for <linux-remoteproc@vger.kernel.org>; Tue,  9 Jun 2020 09:26:48 -0700 (PDT)
Received: by mail-pg1-x541.google.com with SMTP id p21so10493287pgm.13
        for <linux-remoteproc@vger.kernel.org>; Tue, 09 Jun 2020 09:26:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=PD+qPdtMsGS1L01tmMHguU9Uu9Qedxbopt/Br3SoS40=;
        b=KsV/udHdF2omdWbVte24mOMgZevtOzz0zaEWYVJa1v0U2r6qQNsVbBvPOfDLMTIQyc
         yoHeHRHTdq2zxA1uJR8ZU9ciD9zHQxbIdqbMtgAe1Y/3pUqw806uGxq4w+HnpSnrWBND
         JskhhmnK5sfhKMDIpG1hy9s/XdDTV/VgptQRpB7nm2hdUXy/K5f3o0GLpCmriMsmAFYv
         IDNpD27hl0NLAwnTWm8PptYzKsTToDlhD+ebkJeR7iMSf/54pwYgWP1xBF4YTkO9e/eR
         DwHTdNQQizr7GiU++GBXVPSzRMSPGYMFgl76fbQ1BBZgrC7Na8myrM+mCnkoIscC3hd2
         xpBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=PD+qPdtMsGS1L01tmMHguU9Uu9Qedxbopt/Br3SoS40=;
        b=Cp4L5O8QTtGAuZ1YQAoX+dwfv7uJyHuo0u7yEJMgeNIRf6hOkWSFTDJpuRbC3LnstQ
         tkY9IclkIDFdQmV5S7dRlIWeYCF9QlaUlVMhcTPRyf6HzYcVodyf9j+ubyTOViIsJQ4x
         5ycU4ScO8yxbTB1yQDrvG6aawdDy+hw6maqG2LLvwCe2sVsPFQPw0v8FQFAN9AzTkXIo
         BfQmSon27gW592cpeXL9rcyKf0ijmlD7MrtEL30fqxD+w9KEOmOi6Crrrg4nUhkSmjq6
         8bGMfnZWbvq75J+kaVNs6zTGau03DSqIqOl+a0clC9xDpOkYU9Oo9mV0GTd2wu/9S/IJ
         jF2Q==
X-Gm-Message-State: AOAM532DR0k4fd/VzXYh6eh11oKhlsaci3jQTjw4ZuRoWehwi/2I/ISh
        z3PMZZgrPEgmKKhDUmxutUr12g==
X-Google-Smtp-Source: ABdhPJxMCqvoeQUNXti3JRrF9iZcD52gvFk7dXgkL+XY9nS435lRgDczRix/SqcEVYhAzx6b9x1cDw==
X-Received: by 2002:a63:e008:: with SMTP id e8mr24693556pgh.451.1591720007759;
        Tue, 09 Jun 2020 09:26:47 -0700 (PDT)
Received: from xps15 (S0106002369de4dac.cg.shawcable.net. [68.147.8.254])
        by smtp.gmail.com with ESMTPSA id z8sm8876098pgc.80.2020.06.09.09.26.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2020 09:26:47 -0700 (PDT)
Date:   Tue, 9 Jun 2020 10:26:45 -0600
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
Cc:     kvm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        virtualization@lists.linux-foundation.org,
        sound-open-firmware@alsa-project.org,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
        Liam Girdwood <liam.r.girdwood@linux.intel.com>,
        "Michael S. Tsirkin" <mst@redhat.com>,
        Jason Wang <jasowang@redhat.com>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [RFC 12/12] rpmsg: add a device ID to also bind to the ADSP
 device
Message-ID: <20200609162645.GA23371@xps15>
References: <20200529073722.8184-1-guennadi.liakhovetski@linux.intel.com>
 <20200529073722.8184-13-guennadi.liakhovetski@linux.intel.com>
 <20200604200156.GB26734@xps15>
 <20200605064659.GC32302@ubuntu>
 <20200608161757.GA32518@xps15>
 <20200608170227.GG10562@ubuntu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200608170227.GG10562@ubuntu>
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Mon, Jun 08, 2020 at 07:02:27PM +0200, Guennadi Liakhovetski wrote:
> Hi Mathieu,
> 
> On Mon, Jun 08, 2020 at 10:17:57AM -0600, Mathieu Poirier wrote:
> > On Fri, Jun 05, 2020 at 08:46:59AM +0200, Guennadi Liakhovetski wrote:
> > > Hi Mathieu,
> > > 
> > > On Thu, Jun 04, 2020 at 02:01:56PM -0600, Mathieu Poirier wrote:
> > > > On Fri, May 29, 2020 at 09:37:22AM +0200, Guennadi Liakhovetski wrote:
> > > > > The ADSP device uses the RPMsg API to connect vhost and VirtIO SOF
> > > > > Audio DSP drivers on KVM host and guest.
> > > > > 
> > > > > Signed-off-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
> > > > > ---
> > > > >  drivers/rpmsg/virtio_rpmsg_bus.c | 1 +
> > > > >  1 file changed, 1 insertion(+)
> > > > > 
> > > > > diff --git a/drivers/rpmsg/virtio_rpmsg_bus.c b/drivers/rpmsg/virtio_rpmsg_bus.c
> > > > > index f3bd050..ebe3f19 100644
> > > > > --- a/drivers/rpmsg/virtio_rpmsg_bus.c
> > > > > +++ b/drivers/rpmsg/virtio_rpmsg_bus.c
> > > > > @@ -949,6 +949,7 @@ static void rpmsg_remove(struct virtio_device *vdev)
> > > > >  
> > > > >  static struct virtio_device_id id_table[] = {
> > > > >  	{ VIRTIO_ID_RPMSG, VIRTIO_DEV_ANY_ID },
> > > > > +	{ VIRTIO_ID_ADSP, VIRTIO_DEV_ANY_ID },
> > > > 
> > > > I am fine with this patch but won't add an RB because of the (many) checkpatch
> > > > errors.  Based on the comment I made on the previous set seeing those was
> > > > unexpected.
> > > 
> > > Are you using "--strict?" Sorry, I don't see any checkpatch errors, only warnings. 
> > 
> > No, plane checkpatch on the rproc-next branch.
> > 
> > > Most of them are "over 80 characters" which as we now know is no more an issue,
> > 
> > There is a thread discussing the matter but I have not seen a clear resolution
> > yet.
> 
> I think the resolution is pretty clear as defined by Linus, but maybe it has changed 
> again since I last checked.
> 
> > > I just haven't updated my tree yet. Most others are really minor IMHO. Maybe one
> > 
> > Minor or not, if checkpatch complains then it is important enough to address.  I
> > am willing to overlook the lines over 80 characters but everything else needs to
> > be dealt with.
> 
> Sure, checkpatch should be run before each patch submission and whatever it reports 
> should be considered. As Documentation/process/submitting-patches.rst clearly 
> states:
> 
> "Check your patches with the patch style checker prior to submission
> (scripts/checkpatch.pl).  Note, though, that the style checker should be
> viewed as a guide, not as a replacement for human judgment.  If your code
> looks better with a violation then its probably best left alone."
> 
> So, yes, I checked all what checkepatch reported and used my judgement to decide 
> which recommendations to take and which to ignore.

I will let Michael and friends decide how to handle checkpatch warnings in the
vhost subsystem but as far as remoteproc/rpmsg are concerned, I will not review
patches that trigger warnings.

There is a patch in linux-next that deprecates warnings for lines over 80
characters, so those are no longer a problem.

> 
> Thanks
> Guennadi
> 
> > Thanks,
> > Mathieu
> >  
> > > of them I actually would want to fix - using "help" instead of "---help---" in 
> > > Kconfig. What errors are you seeing in your checks?
> > > 
> > > Thanks
> > > Guennadi
> > > 
> > > > Thanks,
> > > > Mathieu
> > > > 
> > > > >  	{ 0 },
> > > > >  };
> > > > >  
> > > > > -- 
> > > > > 1.9.3
> > > > > 
