Return-Path: <SRS0=OpIw=7V=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA01BC433E0
	for <linux-remoteproc@archiver.kernel.org>; Mon,  8 Jun 2020 09:07:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 87FE0206C3
	for <linux-remoteproc@archiver.kernel.org>; Mon,  8 Jun 2020 09:07:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="KHG7wDv1"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726157AbgFHJHt (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 8 Jun 2020 05:07:49 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:59709 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725965AbgFHJHs (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 8 Jun 2020 05:07:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1591607267;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=KW/u7+sIzl6SxOPTJDolQGOqqIlqXGa7CmHi/BcPCHs=;
        b=KHG7wDv1ocJkPaSi0sFMpD5Ds2uC0wOr5i+4dkMfoZFcaHDL2jc0wUHgoovsLu9aoi1s5P
        /k06XRxpSMJ0u5NT2PiLFBR9GTPQBwBjjt7pTfjawRz6ZSmaDg8mq85k4oLGsiiwXL8WHg
        05KRHgpEuQH8g3wB5xetqr1frHALPX4=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-322-RaosTgxUOqmNMLpKNlmYdg-1; Mon, 08 Jun 2020 05:07:44 -0400
X-MC-Unique: RaosTgxUOqmNMLpKNlmYdg-1
Received: by mail-wr1-f70.google.com with SMTP id o1so6846854wrm.17
        for <linux-remoteproc@vger.kernel.org>; Mon, 08 Jun 2020 02:07:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=KW/u7+sIzl6SxOPTJDolQGOqqIlqXGa7CmHi/BcPCHs=;
        b=oOqCBH7Y3CKhNA+iLmzOxeX33DTc6RPNLC9Dzn2SU5L/+hF1UNhjW9yKkEmdBwP+89
         scqrZjMO5ur0vaoZfsl2lTOLzt85QRMYt7WwFCuKAFJjPWRInv6UzvkH3mRFAdHq4vu9
         T9WooaMNKbbfT/n+UVgboUaoZgNDKGV1TewNr6YpEz/CBpvhFQHhJriWtXP6GRKRIaML
         cFhSXyEJPXV5yjo391cCxAGlr7sdSyRykllV1bfesj7kMaVBBKTx9cE4/jVtdIiooaV1
         AX8cVrWPAnDJ/Ndzx4gpfY52GpuLdgVazbm47O1HYew4AI6Jej1PArz7Ml/pchCQT6bc
         bdOg==
X-Gm-Message-State: AOAM532l+mQjZYZk/CFYzxuoWOwlxZoUvAKHsVfwfzrt3rm5YdvLFLOb
        aeO7W+ZtIyvGSGOawXra5APnzTRiKKOYQa6o9wmOUCLS1FLvgIBUYZ/kxiSBw39Sy5c5HnK2xAa
        BQPqJSYxbPQzsbnEzQEZPWbZso0wgwg==
X-Received: by 2002:a05:600c:2110:: with SMTP id u16mr15157980wml.26.1591607262900;
        Mon, 08 Jun 2020 02:07:42 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxClkOYf+0gRlqCWdbZ99+alT6bdzxfMX70igp8hM/UINwFM9C1OOBToQHPRrFrjggGQjepBg==
X-Received: by 2002:a05:600c:2110:: with SMTP id u16mr15157968wml.26.1591607262749;
        Mon, 08 Jun 2020 02:07:42 -0700 (PDT)
Received: from redhat.com (bzq-109-64-41-91.red.bezeqint.net. [109.64.41.91])
        by smtp.gmail.com with ESMTPSA id n204sm22406435wma.5.2020.06.08.02.07.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2020 02:07:42 -0700 (PDT)
Date:   Mon, 8 Jun 2020 05:07:40 -0400
From:   "Michael S. Tsirkin" <mst@redhat.com>
To:     Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
Cc:     Ohad Ben-Cohen <ohad@wizery.com>, linux-remoteproc@vger.kernel.org
Subject: Re: VirtIO RPMsg VirtQ endianness
Message-ID: <20200608050633-mutt-send-email-mst@kernel.org>
References: <20200608075113.GB10562@ubuntu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200608075113.GB10562@ubuntu>
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Mon, Jun 08, 2020 at 09:51:13AM +0200, Guennadi Liakhovetski wrote:
> Hi Ohad,
> 
> In his comments to my recent vhost RPMsg API patch-set update Michael 
> Tsirkin commented [1], that messages in the RPMsg over VirtIO case 
> should be sent in the LE format.

At least when VIRTIO_F_VERSION_1 has been negotiated.


> Could you please confirm that you agree 
> with this comment? I'll then go ahead and patch virtio_rpmsg_bus.c firat 
> and then also update my patch-set. In fact you can just reply to the 
> original thread - you're on CC for it too.
> 
> Thanks
> Guennadi
> 
> [1] https://www.spinics.net/lists/kvm/msg217704.html

