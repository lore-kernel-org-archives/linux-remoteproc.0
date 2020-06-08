Return-Path: <SRS0=OpIw=7V=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F34B8C433DF
	for <linux-remoteproc@archiver.kernel.org>; Mon,  8 Jun 2020 13:08:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CA9EB2078C
	for <linux-remoteproc@archiver.kernel.org>; Mon,  8 Jun 2020 13:08:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="RnImqbY2"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729230AbgFHNIn (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 8 Jun 2020 09:08:43 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:32070 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1729040AbgFHNIm (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 8 Jun 2020 09:08:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1591621720;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=dqBwBX1iWxa0YmZVaEODhc8PGLo2VfdKn86FOfgmR1g=;
        b=RnImqbY2zCdhTc8uG5KaCKBtyA2QUWBP3+0tN1Kf6awKg2MTJG8kx0pUYd+SW0hgDlU7ty
        SELEzOIynYlaY6JAzYUj1VUxfcNrpxjFAbRGZ5hEHizMR3iKc+ugxCND1+y9M2WTeDqylZ
        +iT+6gD1kONPlIqWIkfqRgqYY7Svrbo=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-439-IqZCTBFcPM2hBoZG3npvOg-1; Mon, 08 Jun 2020 09:08:38 -0400
X-MC-Unique: IqZCTBFcPM2hBoZG3npvOg-1
Received: by mail-wr1-f72.google.com with SMTP id m14so7126513wrj.12
        for <linux-remoteproc@vger.kernel.org>; Mon, 08 Jun 2020 06:08:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=dqBwBX1iWxa0YmZVaEODhc8PGLo2VfdKn86FOfgmR1g=;
        b=ssv/olMspMYYbpyS6PG7zidFSPOLEsFqNOwxhXOz242WJ77bkDELKiQXXCIezOCUiA
         Zv1VOrFFagKIoYFRwfpotdfaJsNhECgbe4rfjyFFokKt2fuDzwwwOiJjyUQXPs7u4/vj
         kyzgp5JLycipkjgt1cpvoX7jUfhvyEsF6mqFL17njttODYkrqebuRb7fgVSRh7kQO8Rn
         389ITGThtQEhdM4LCwd2wzCNhTgHH8pBL83Vg132vJNqCuXIvfllKBYyI2QJuXtFou+/
         UOGZCj+JQBIbsvMSK04W3jMo8L2VBy6RBj12NfbazkpNohULHe9uf6EgV+NcjGSlR95/
         gB+Q==
X-Gm-Message-State: AOAM531FUL5dOK0dl6We2Xv6AyIeIFrn1jJepFihp4co79sjnN9KA0dz
        hLDrIir8WGdSZKv4qCbBTt5RrRP/mURUQBc51DDaW6kT+jpAMI+OFKzVzF+UTWdSf+8bgpSMxol
        lWKUKP5EmCQcb+2GIuf8FW4RXoPSiOw==
X-Received: by 2002:a5d:6789:: with SMTP id v9mr25040816wru.124.1591621716993;
        Mon, 08 Jun 2020 06:08:36 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxMOU/wtRvJJc/E+tmpBswF5Ul40bkOzM0HliSRv4EENKFeQzLuZVeBr361vAI3C5zdXVwJig==
X-Received: by 2002:a5d:6789:: with SMTP id v9mr25040787wru.124.1591621716746;
        Mon, 08 Jun 2020 06:08:36 -0700 (PDT)
Received: from redhat.com (bzq-109-64-41-91.red.bezeqint.net. [109.64.41.91])
        by smtp.gmail.com with ESMTPSA id b8sm24159773wrs.36.2020.06.08.06.08.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2020 06:08:36 -0700 (PDT)
Date:   Mon, 8 Jun 2020 09:08:33 -0400
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
Message-ID: <20200608090145-mutt-send-email-mst@kernel.org>
References: <20200527180541.5570-1-guennadi.liakhovetski@linux.intel.com>
 <20200604151917-mutt-send-email-mst@kernel.org>
 <20200605063435.GA32302@ubuntu>
 <20200608073715.GA10562@ubuntu>
 <20200608091100.GC10562@ubuntu>
 <20200608051358-mutt-send-email-mst@kernel.org>
 <20200608101526.GD10562@ubuntu>
 <20200608111637.GE10562@ubuntu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200608111637.GE10562@ubuntu>
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Mon, Jun 08, 2020 at 01:16:38PM +0200, Guennadi Liakhovetski wrote:
> On Mon, Jun 08, 2020 at 12:15:26PM +0200, Guennadi Liakhovetski wrote:
> > On Mon, Jun 08, 2020 at 05:19:06AM -0400, Michael S. Tsirkin wrote:
> > > On Mon, Jun 08, 2020 at 11:11:00AM +0200, Guennadi Liakhovetski wrote:
> > > > Update: I looked through VirtIO 1.0 and 1.1 specs, data format their, 
> > > > including byte order, is defined on a per-device type basis. RPMsg is 
> > > > indeed included in the spec as device type 7, but that's the only 
> > > > mention of it in both versions. It seems RPMsg over VirtIO isn't 
> > > > standardised yet.
> > > 
> > > Yes. And it would be very good to have some standartization before we
> > > keep adding things. For example without any spec if host code breaks
> > > with some guests, how do we know which side should be fixed?
> > > 
> > > > Also it looks like newer interface definitions 
> > > > specify using "guest native endianness" for Virtual Queue data.
> > > 
> > > They really don't or shouldn't. That's limited to legacy chapters.
> > > Some definitions could have slipped through but it's not
> > > the norm. I just quickly looked through the 1.1 spec and could
> > > not find any instances that specify "guest native endianness"
> > > but feel free to point them out to me.
> > 
> > Oh, there you go. No, sorry, my fault, it's the other way round: "guest 
> > native" is for legacy and LE is for current / v1.0 and up.
> > 
> > > > So 
> > > > I think the same should be done for RPMsg instead of enforcing LE?
> > > 
> > > That makes hardware implementations as well as any cross-endian
> > > hypervisors tricky.
> > 
> > Yes, LE it is then. And we need to add some text to the spec.
> 
> I found the protocol and the message format definition: 
> https://github.com/OpenAMP/open-amp/wiki/RPMsg-Messaging-Protocol#transport-layer---rpmsg 
> Don't know what the best way for referencing it in the VirtIO standard 
> would be: just a link to the source or a quote.
> 
> Thanks
> Guennadi

I wasn't aware of that one, thanks!
OK so that's good.

Ideally we'd have RPMsg Header Definition, RPMsg Channel and RPMsg
Endppint in the spec proper.

This link is informal so can't be copied into spec as is but can be used as a basis.

We'd also need approval from authors for inclusion in the spec,
sent to the TC mailing list.

-- 
MST

