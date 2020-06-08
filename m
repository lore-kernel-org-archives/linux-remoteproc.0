Return-Path: <SRS0=OpIw=7V=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7142C433E0
	for <linux-remoteproc@archiver.kernel.org>; Mon,  8 Jun 2020 09:09:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A729C206C3
	for <linux-remoteproc@archiver.kernel.org>; Mon,  8 Jun 2020 09:09:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Uoy0/gCQ"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725927AbgFHJJT (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 8 Jun 2020 05:09:19 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:31990 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726038AbgFHJJS (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 8 Jun 2020 05:09:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1591607357;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=1qzz8q0RXIAT8maH8NVpFy7idcd6AVSk1M7/8bU7JLI=;
        b=Uoy0/gCQcTsr6RVEwMJM6w50jlIV+0Z1PxYOcA2qh1phSlPna+aisHOWozXHM91V/Kgpld
        KUG17yeJqGOYlNH5gsFTYMcSkU1lMEPaMJieQSvE4PvtR+WPBGDiYfI3ptrOz5GUW4Hg1z
        UrYqusaAUIV61fTzqeSjkBW5Y7vRBhk=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-239-LGlwPgqePGe5PoY18t5Pww-1; Mon, 08 Jun 2020 05:09:15 -0400
X-MC-Unique: LGlwPgqePGe5PoY18t5Pww-1
Received: by mail-wm1-f69.google.com with SMTP id t145so5004241wmt.2
        for <linux-remoteproc@vger.kernel.org>; Mon, 08 Jun 2020 02:09:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=1qzz8q0RXIAT8maH8NVpFy7idcd6AVSk1M7/8bU7JLI=;
        b=E6aRUUXSG2a/dBY1PIbCI06Io146++N37R8XRBX+RHP8hDxBj0CTZMA8Or1VYvmmvF
         i2laWG3RxmaDPL8w7Gq0HRs6f+vNcZm996E7ombpALW3I+a+PUgNpKOYNTGpnpPbDiDI
         Iph88k3rsgUUXgt3pE02rE3GpHL5qiupvf8LBnaISrvhD01kqcNGjp2jVptsqKw1k4SK
         J6zfx5wHOY5r79ms6babdNb+mrCaWbtKOFFIJTr6M/xmuJDKCNBZY9U/N5MzX/Q9s1TJ
         o4Uy0ay97MXpo8W4QhWYpY0EgVCK1ahGm2eDDS7GeasSTdZ5BLrBvlg+3AWBxUZ8N+aF
         I4dg==
X-Gm-Message-State: AOAM532tTzoIqQGv8w5u4R5VrHmpSVu5X8+8A0FxHXAmGM1qwiqwKzA0
        lLqfuUQv+4cn5qo7fY8PC0/F447ahiExC3KC5bu30WTrkT4QLW7NMEZLssrxAwu5fC/1kPJgvBa
        TvyObtrE7/tU/ydpjevF7+JnyJE72WQ==
X-Received: by 2002:adf:a41a:: with SMTP id d26mr23153877wra.324.1591607354005;
        Mon, 08 Jun 2020 02:09:14 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxk4C2kFKYGkG3pOjWAb4BdA7+bim0qD4WM5BHVhr/1qFiireNP/Iu0BJQYaiwNrt1nr7CEGA==
X-Received: by 2002:adf:a41a:: with SMTP id d26mr23153862wra.324.1591607353853;
        Mon, 08 Jun 2020 02:09:13 -0700 (PDT)
Received: from redhat.com (bzq-109-64-41-91.red.bezeqint.net. [109.64.41.91])
        by smtp.gmail.com with ESMTPSA id u12sm23301667wrq.90.2020.06.08.02.09.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2020 02:09:13 -0700 (PDT)
Date:   Mon, 8 Jun 2020 05:09:10 -0400
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
Message-ID: <20200608050757-mutt-send-email-mst@kernel.org>
References: <20200527180541.5570-1-guennadi.liakhovetski@linux.intel.com>
 <20200604151917-mutt-send-email-mst@kernel.org>
 <20200605063435.GA32302@ubuntu>
 <20200608073715.GA10562@ubuntu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200608073715.GA10562@ubuntu>
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Mon, Jun 08, 2020 at 09:37:15AM +0200, Guennadi Liakhovetski wrote:
> Hi Michael,
> 
> On Fri, Jun 05, 2020 at 08:34:35AM +0200, Guennadi Liakhovetski wrote:
> > 
> > On Thu, Jun 04, 2020 at 03:23:37PM -0400, Michael S. Tsirkin wrote:
> 
> [snip]
> 
> > > Another it's out of line with 1.0 spec passing guest
> > > endian data around. Won't work if host and guest
> > > endian-ness do not match. Should pass eveything in LE and
> > > convert.
> > 
> > Yes, I have to fix this, thanks.
> 
> Just to make sure my understanding is correct: this would involve also 
> modifying the current virtio_rpmsg_bus.c implementation to add 
> endianness conversions. That's what you meant, right?
> 
> Thanks
> Guennadi

right and if there are legacy compat considerations, using _virtio16 and
friends types, as well as virtio16_to_cpu and friends functions.

-- 
MST

