Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43D1BEE4993
	for <linux-remoteproc@archiver.kernel.org>; Wed, 23 Aug 2023 15:23:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237154AbjHWPXc (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 23 Aug 2023 11:23:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34288 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237156AbjHWPXb (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 23 Aug 2023 11:23:31 -0400
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com [IPv6:2607:f8b0:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DA7D8173E
        for <linux-remoteproc@vger.kernel.org>; Wed, 23 Aug 2023 08:23:08 -0700 (PDT)
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-68a402c1fcdso2537718b3a.1
        for <linux-remoteproc@vger.kernel.org>; Wed, 23 Aug 2023 08:23:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692804185; x=1693408985;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=4jcjq5tQMjyXZ4EekHKM/b7uQYtJc57vmlwhbh+CZDs=;
        b=ZwRBeOagas9M9sXgaQrbrm+skvTJvLhNu69cLPRzcgsfIpv1NOzgqS0jh3k5rxP+nB
         qP6nafMwRquXr33jXe7/4agKa0IaYc4wd5WQMB+zc8orq9fkOj6+8GCz36MwChD9vNkv
         G82asc5wfwJVFgCpv9ZMHcROFuJOXop99JA3doQC2109PcD471fzoudvNs4h95LjUev1
         F3qW3gLluQV6Ns8yl4ZpnK92vyJC+gxXRroCP8TrYcOKvUOww5oSI1nkhUoAyW856ipV
         vEkJYbT+gMM9nzA9LA7w4YwjVq3t+10ZhtlADNqoHWcnywXLgn4iO4LRWpJfGWH/2S6W
         0q+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692804185; x=1693408985;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4jcjq5tQMjyXZ4EekHKM/b7uQYtJc57vmlwhbh+CZDs=;
        b=EYQqd1wphTg86PnIAu4dxeDCNTW1DD5Wko5eLjirAuAWo2BvS5jbfB7HqfcYWo2GC3
         J2cgyo3BSTYfUtzKts6PsyVhOzvcHXGslcWyL3ybiSS70Ms2emVOgJzoNi8moeIsOmoG
         uKHgiz4jB7JJaV7Eq7f4RkTeIJsQ8bByVzxTQZOYKm3mQdd3RwVEufj8sfWxg038JSZo
         i/bDwx1W+ZHs3V+sReNxkRI15IESx3Moyrsz9pCekmCS2jXbQjuljPpXeQw1xk+I9OME
         62w87Qrn10vUi9N9rbSr6nDYmhf0iM8IBXx81ovt3q52vj7jCp1DwBnCtoAeM6mrBF3O
         COow==
X-Gm-Message-State: AOJu0YwAjP7/Ma9peXpgN99dBNeyUQ0wXkm0RHexR4COIE4gRrpmguCX
        YvovI26gxNXHYXU57BcQvmwNCg==
X-Google-Smtp-Source: AGHT+IEiD/SBgLnjm91uUIfm5P3nzoyFIsHOxISHiMUMBgJfnBwYTYUx+bDZpBCVefCGz4SCm+RsYw==
X-Received: by 2002:a05:6a20:431c:b0:13e:1712:4c01 with SMTP id h28-20020a056a20431c00b0013e17124c01mr12683630pzk.42.1692804184763;
        Wed, 23 Aug 2023 08:23:04 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:3ae3:a477:fe1c:f18c])
        by smtp.gmail.com with ESMTPSA id i3-20020aa787c3000000b006877b0b31c2sm9889234pfo.147.2023.08.23.08.23.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Aug 2023 08:23:04 -0700 (PDT)
Date:   Wed, 23 Aug 2023 09:23:01 -0600
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Nishanth Menon <nm@ti.com>
Cc:     Bjorn Andersson <andersson@kernel.org>,
        linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Robert Nelson <robertcnelson@gmail.com>,
        Kevin Cahalan <kevinacahalan@gmail.com>
Subject: Re: [PATCH] remoteproc: core: Honor device tree /alias entries when
 assigning IDs
Message-ID: <ZOYkVec/aQSiCWxh@p14s>
References: <20230807140247.956255-1-nm@ti.com>
 <ZOULmFR51C+9kEhZ@p14s>
 <20230822201205.4csoj4kym2yhuyrf@decrease>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230822201205.4csoj4kym2yhuyrf@decrease>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Tue, Aug 22, 2023 at 03:12:05PM -0500, Nishanth Menon wrote:
> On 13:25-20230822, Mathieu Poirier wrote:
> > Hi Nishanth,
> > 
> > On Mon, Aug 07, 2023 at 09:02:47AM -0500, Nishanth Menon wrote:
> > > On many platforms, such as Beaglebone-AI64 with many remote
> > > processors, firmware configurations provided by the distributions can
> > > vary substantially depending on the distribution build's functionality
> > > and the specific remote cores enabled in that variant. Ensuring
> > > consistent udev rules mapping remoteproc nodes to constant remote
> > > proc device indices across distributions (yocto, ubuntu, debian and
> > > it's variants, ...) on a board basis can be challenging due to the
> > > various functions of these distributions. Varied device node paths
> > > create challenges for applications that operate on remote processors,
> > > especially in minimal embedded systems(initrd like) that may not
> > > have udev-like capabilities and rely on a more straightforward bare
> > > filesystem. This challenge is similar to that faced by I2C, RTC or the
> > > GPIO subsystems.
> > >
> > 
> > I'm puzzled by this patch.  I can see how using an alias can help in boards with
> > various HW configuration.  That said, and as written above, FW files for remote
> > processors can vary based on the build's functionality.  As such "remoteproc3"
> > will reference the same HW device on all distributions but the functionality
> > enacted by the FW may be different.  As such I don't see how an alias can help
> > here.  Can you provide a concrete example that highlights the benefits?
> 
> Correct - *if* remoteproc3 is the constant node reference.
> 
> To take a trivial example: We ran into this issue with:
> https://github.com/kaofishy/bbai64_cortex-r5_example/blob/main/Makefile#L28
> 
> remoteproc18 apparently changed numbering in a different build.
> 

We are going around in circles.  In the above link using an alias will
guarantee that "remoteproc18" is available but won't guarantee the
functionality enacted by the FW loaded in that remote processor, which is distro
dependent.

> If remoteproc18 remained the same between different distro builds that
> would have probably kept the userspace constant. but it does'nt. it
> dependent purely on probe order, which does'nt let userspace remain
> consistent.
> 
> Same reason and motivation to do the following:
> https://git.beagleboard.org/beagleboard/repos-arm64/-/blob/main/bb-customizations/suite/bookworm/debian/86-remoteproc-noroot.rules
> in one technique to do it - but that only works if all the distros
> follow the same udev rules - and there is no reasonable way to enforce
> that across distributions.



> 
> -- 
> Regards,
> Nishanth Menon
> Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D
