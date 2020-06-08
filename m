Return-Path: <SRS0=OpIw=7V=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5CA80C433E0
	for <linux-remoteproc@archiver.kernel.org>; Mon,  8 Jun 2020 13:01:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 36C00206C3
	for <linux-remoteproc@archiver.kernel.org>; Mon,  8 Jun 2020 13:01:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="D6juwpCg"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728245AbgFHNBm (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 8 Jun 2020 09:01:42 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:41292 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1729272AbgFHNBm (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 8 Jun 2020 09:01:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1591621301;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=N4tYRK/0WF4gJ3sPDYLn/EAB8Y9lZ28vccHh6mfdyZY=;
        b=D6juwpCg6uKMuVCoYnLnLCvvpGQhGo/joXBH50rQm/b8OJMn+HOAvxlnfwzWl124SfDBBL
        n6Oia9ckSzOneFyrcCrASLU5q9reW4EaZxdRuAm9kkGL9qMZRZ4I/9nttX55yGD9OExgnA
        9cZxRplGWxWPJ1jUJt67+5+FnkZhIKA=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-420-fqiBYGSoNsaP_MLRpRiMtA-1; Mon, 08 Jun 2020 09:01:29 -0400
X-MC-Unique: fqiBYGSoNsaP_MLRpRiMtA-1
Received: by mail-wm1-f72.google.com with SMTP id a18so430838wmm.3
        for <linux-remoteproc@vger.kernel.org>; Mon, 08 Jun 2020 06:01:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=N4tYRK/0WF4gJ3sPDYLn/EAB8Y9lZ28vccHh6mfdyZY=;
        b=CutIhZ216eRAEMSmUM3FNjYNZQSV/uKE7lvVodF51hYHN17EXxFOcS7HNG0Ptd54gO
         sLj9wcwtdJLpgg9YdXvI6IY1IlOXTv4xx4MxgkOksBJ0ca5mensYsMdvCYDIklkwttEc
         7VGlxsTbB/Vn962mSVVZSOACypcyGkwas3AhsA1JjLJ8aV2/I0LLxkTv387voLv4wCIa
         z/xQthpejpRBM6O3EUkF9na9SOpyQw2A+VYnKwEoj5BDp1HQALBi/7r7IoJStRQTWS4a
         Wu21XhI6G7UojY5mVpOH1xyuh5fPm2qLstlr5YlSdHOLNKu0wwJYjsjTft6Dzf7J96Ar
         mOKg==
X-Gm-Message-State: AOAM53253s31J0h1U3gO7sVAmhNWpj1+gYiog0JyWyODuEpMQF7VzFxo
        fpdRZiu1avHAjPbWjrIZrFQAga34ERx6zIQR11LMp2KymvetjKrdkAjv+RTQ59jpNmDDw/Oh8YX
        LRDHnDCbw5l7vEAQ5DK/OY6XHThgZ9Q==
X-Received: by 2002:adf:d851:: with SMTP id k17mr23165022wrl.30.1591621288325;
        Mon, 08 Jun 2020 06:01:28 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz+ZpeCIIHsXHsXp7F2is1vc7M7N6GxGrFprOEl+lRsTOD0+vtXz9a5XQCm3jC3ps0vzgeTJg==
X-Received: by 2002:adf:d851:: with SMTP id k17mr23164991wrl.30.1591621288062;
        Mon, 08 Jun 2020 06:01:28 -0700 (PDT)
Received: from redhat.com (bzq-109-64-41-91.red.bezeqint.net. [109.64.41.91])
        by smtp.gmail.com with ESMTPSA id z25sm22048079wmf.10.2020.06.08.06.01.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2020 06:01:27 -0700 (PDT)
Date:   Mon, 8 Jun 2020 09:01:24 -0400
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
        Mathieu Poirier <mathieu.poirier@linaro.org>
Subject: Re: [PATCH v3 0/5] Add a vhost RPMsg API
Message-ID: <20200608090010-mutt-send-email-mst@kernel.org>
References: <20200527180541.5570-1-guennadi.liakhovetski@linux.intel.com>
 <20200604151917-mutt-send-email-mst@kernel.org>
 <20200605063435.GA32302@ubuntu>
 <20200608073715.GA10562@ubuntu>
 <20200608091100.GC10562@ubuntu>
 <20200608051358-mutt-send-email-mst@kernel.org>
 <20200608101526.GD10562@ubuntu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200608101526.GD10562@ubuntu>
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Mon, Jun 08, 2020 at 12:15:27PM +0200, Guennadi Liakhovetski wrote:
> On Mon, Jun 08, 2020 at 05:19:06AM -0400, Michael S. Tsirkin wrote:
> > On Mon, Jun 08, 2020 at 11:11:00AM +0200, Guennadi Liakhovetski wrote:
> > > Update: I looked through VirtIO 1.0 and 1.1 specs, data format their, 
> > > including byte order, is defined on a per-device type basis. RPMsg is 
> > > indeed included in the spec as device type 7, but that's the only 
> > > mention of it in both versions. It seems RPMsg over VirtIO isn't 
> > > standardised yet.
> > 
> > Yes. And it would be very good to have some standartization before we
> > keep adding things. For example without any spec if host code breaks
> > with some guests, how do we know which side should be fixed?
> > 
> > > Also it looks like newer interface definitions 
> > > specify using "guest native endianness" for Virtual Queue data.
> > 
> > They really don't or shouldn't. That's limited to legacy chapters.
> > Some definitions could have slipped through but it's not
> > the norm. I just quickly looked through the 1.1 spec and could
> > not find any instances that specify "guest native endianness"
> > but feel free to point them out to me.
> 
> Oh, there you go. No, sorry, my fault, it's the other way round: "guest 
> native" is for legacy and LE is for current / v1.0 and up.
> 
> > > So 
> > > I think the same should be done for RPMsg instead of enforcing LE?
> > 
> > That makes hardware implementations as well as any cross-endian
> > hypervisors tricky.
> 
> Yes, LE it is then. And we need to add some text to the spec.
> 
> In theory there could be a backward compatibility issue - in case someone 
> was already using virtio_rpmsg_bus.c in BE mode, but I very much doubt 
> that...
> 
> Thanks
> Guennadi

It's probably easiest to use virtio wrappers and then we don't need to
worry about it.

-- 
MST

