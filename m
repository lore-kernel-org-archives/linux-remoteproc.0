Return-Path: <SRS0=OpIw=7V=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3CEA4C433E0
	for <linux-remoteproc@archiver.kernel.org>; Mon,  8 Jun 2020 09:19:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1C3B8206C3
	for <linux-remoteproc@archiver.kernel.org>; Mon,  8 Jun 2020 09:19:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="DYZmdeq+"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729156AbgFHJTP (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 8 Jun 2020 05:19:15 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:34607 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729138AbgFHJTO (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 8 Jun 2020 05:19:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1591607952;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=kn8BcOVPI4dKLlZEoUFeNJgnO3vX7kKpRZZKwDzWCM4=;
        b=DYZmdeq+XEvc3zv2k64kxIo1IeAWn+0gO4yehgr++7tWxXpF/zhZ9WWTu1DadWEHdissvL
        mEzijFzMt0ZaNBj4oLXa7zptU26yQ936q6NHN74VWPFrb8v/76yEOXlAq7Zt6gIjODe4LD
        0wJn0fA/MpJjP/yOOXHjaNXcM3E2P0g=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-11-1xaevFGcPfqg-cNvI6k-jQ-1; Mon, 08 Jun 2020 05:19:11 -0400
X-MC-Unique: 1xaevFGcPfqg-cNvI6k-jQ-1
Received: by mail-wm1-f71.google.com with SMTP id h25so5163186wmb.0
        for <linux-remoteproc@vger.kernel.org>; Mon, 08 Jun 2020 02:19:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=kn8BcOVPI4dKLlZEoUFeNJgnO3vX7kKpRZZKwDzWCM4=;
        b=eXYqKdyiWS4H9sdck//0AZd+vth2e8olWPt957TFypDk4ekXjcRagRQ/kCOXtlK33V
         nd8r4BvoX3+Rp1f6+nfi+zPHHOXlsZfdUyrMRdBkI7o2hNm3ycLGBGX3NwLRtKxnIVja
         4PHgVFlZNGZsFRg+I3aWS8c3PoPPZO4JF/rPamFG6y30XViZVWSHMFa6wKxDO8xqZ8Le
         i6zo7Kgnoq1YoYURUYVh87yVh3tcW7+mo1ceXMtJ1QttnZmGeOjevFigsRV6iIh2aiIC
         QsE+jHjV7u5Ueg7dNhWcllSJ1sIlUpjkT4j1C9HVN5HrKIphmoblkfBluuV2A9unipvl
         rkxw==
X-Gm-Message-State: AOAM530AAgHtINitGHEvh1hCg9sBJS1nNXtCVTz4FyGGpT+LGFpxdHsA
        BrdQcecuVi6bVeaSzBX+wsTWNsZ0VK34QASv1bNGpNHM1EcZneZzAWmBOd0UD2TmadnKp5VOe4C
        GFD7pnbvXQ53qXVL8hOwIjdCRCKWh+A==
X-Received: by 2002:a1c:4c8:: with SMTP id 191mr15166581wme.14.1591607950358;
        Mon, 08 Jun 2020 02:19:10 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJysGO90rYrCc3hVq6L5tbawFDDHDFTwffBp9oo0zw0IemSE9gTXzCwg+wtmvYkRO//psgripw==
X-Received: by 2002:a1c:4c8:: with SMTP id 191mr15166561wme.14.1591607950184;
        Mon, 08 Jun 2020 02:19:10 -0700 (PDT)
Received: from redhat.com (bzq-109-64-41-91.red.bezeqint.net. [109.64.41.91])
        by smtp.gmail.com with ESMTPSA id o15sm23050690wrv.48.2020.06.08.02.19.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2020 02:19:09 -0700 (PDT)
Date:   Mon, 8 Jun 2020 05:19:06 -0400
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
Message-ID: <20200608051358-mutt-send-email-mst@kernel.org>
References: <20200527180541.5570-1-guennadi.liakhovetski@linux.intel.com>
 <20200604151917-mutt-send-email-mst@kernel.org>
 <20200605063435.GA32302@ubuntu>
 <20200608073715.GA10562@ubuntu>
 <20200608091100.GC10562@ubuntu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200608091100.GC10562@ubuntu>
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Mon, Jun 08, 2020 at 11:11:00AM +0200, Guennadi Liakhovetski wrote:
> Update: I looked through VirtIO 1.0 and 1.1 specs, data format their, 
> including byte order, is defined on a per-device type basis. RPMsg is 
> indeed included in the spec as device type 7, but that's the only 
> mention of it in both versions. It seems RPMsg over VirtIO isn't 
> standardised yet.

Yes. And it would be very good to have some standartization before we
keep adding things. For example without any spec if host code breaks
with some guests, how do we know which side should be fixed?

> Also it looks like newer interface definitions 
> specify using "guest native endianness" for Virtual Queue data.

They really don't or shouldn't. That's limited to legacy chapters.
Some definitions could have slipped through but it's not
the norm. I just quickly looked through the 1.1 spec and could
not find any instances that specify "guest native endianness"
but feel free to point them out to me.

> So 
> I think the same should be done for RPMsg instead of enforcing LE?
> 
> Thanks
> Guennadi

That makes hardware implementations as well as any cross-endian
hypervisors tricky.

-- 
MST

