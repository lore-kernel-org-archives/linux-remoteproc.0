Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE4D3C433F5
	for <linux-remoteproc@archiver.kernel.org>; Fri, 11 Mar 2022 18:08:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348702AbiCKSJL (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Fri, 11 Mar 2022 13:09:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40472 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239544AbiCKSJJ (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 11 Mar 2022 13:09:09 -0500
Received: from mail-oi1-x22e.google.com (mail-oi1-x22e.google.com [IPv6:2607:f8b0:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4E2C843AFE
        for <linux-remoteproc@vger.kernel.org>; Fri, 11 Mar 2022 10:08:05 -0800 (PST)
Received: by mail-oi1-x22e.google.com with SMTP id o83so2769162oif.0
        for <linux-remoteproc@vger.kernel.org>; Fri, 11 Mar 2022 10:08:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=T6tAfBDIbeqr2rX5cz/+B+v+oAUesU8ImGhC1rDQ7lA=;
        b=Z23fpFSaOFDv2bKo6jNWklXN739Cp5FIq+rKAF+f2uye3T6qd45lxtGWLM/KHr1A+w
         0jpfmf4dCqsY0o9ZAn03Un97WioX6gA2ouqXcnilV+2DhZkw2rX6Fa4dZgrhLAKEWl2L
         mfC0SSPKQ/sn/zxCCusOjW8hXykq3TE1MP3WS5Msq5AjKy5H/MaP7JjEbAwBOwt3Rjyq
         S9+m1Mbqptwe7EUvJIWFT5NDCI3aHF7c0EaAaryPQHMlF70HJCb8lzo9BX6eI3/D1ut/
         6s4ZO9WFX0sMAHFvYv7ZMIz6JC6lpjE+qwwCALoBPNdI36phi3oV9I+w5wq1/Gkz0qfi
         /M4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=T6tAfBDIbeqr2rX5cz/+B+v+oAUesU8ImGhC1rDQ7lA=;
        b=6yQv77DgnS3aw4tFWy9rJAJ1ONgsxCtsyOPJs8BIrZWYUrzh9UMwJevzyaZP7DguNw
         JnLdsjNYrNSP1Rc+TVbE0NCaH12G+s0Va1y8+89DI0mI6dOcaVbrQusT3NtkbBOEuXVR
         DDBtFwFmWJ2dy9PZxK1h9Oqbc+QP17NPwnuGJRjE4lR3DkmM1SFhMQ8K2GB1vn6qz/Hu
         s84zlfO3RMF76r5Xa4LS9tW7cHXBJKUkLGx4ItC5lvo5gN4pkl1VnR8bJiNM59nCoxZS
         acS3gkGWWZflB2mCDMg8qHDKGRWHKOls9THX1tba6yoCMYkTiDJ4HNksDTVxcRsygc2M
         N9uA==
X-Gm-Message-State: AOAM5311OJh7rxT1rBjx6cNvnMvFronbw0w7Wyx8EPHiAClJsSFNzR97
        YIDDJoG0g6CYhvq+R56y7anZ4w==
X-Google-Smtp-Source: ABdhPJzVOnqSRL/7lmpX9k7aXHuUAUBSzyGrOLOd3DPralQG3Til5oHsTJ3SVVxCCZ+IxCKYIg4WMw==
X-Received: by 2002:a05:6808:8ce:b0:2ec:a7ff:4925 with SMTP id k14-20020a05680808ce00b002eca7ff4925mr863487oij.122.1647022084653;
        Fri, 11 Mar 2022 10:08:04 -0800 (PST)
Received: from builder.lan ([2600:1700:a0:3dc8:3697:f6ff:fe85:aac9])
        by smtp.gmail.com with ESMTPSA id h11-20020a9d6f8b000000b005b230ab0461sm3851009otq.64.2022.03.11.10.08.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Mar 2022 10:08:03 -0800 (PST)
Date:   Fri, 11 Mar 2022 12:08:02 -0600
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Drew Fustini <dfustini@baylibre.com>
Cc:     Mathieu Poirier <mathieu.poirier@linaro.org>,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Suman Anna <s-anna@ti.com>, Dave Gerlach <d-gerlach@ti.com>
Subject: Re: [PATCH] remoteproc: move rproc_da_to_va declaration to
 remoteproc.h
Message-ID: <YiuQAvnbBIdWhy2l@builder.lan>
References: <20220308172515.29556-1-dfustini@baylibre.com>
 <YiedlvZWpHd8HP40@ripper>
 <YijeDirNSJ6bpRMj@x1>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YijeDirNSJ6bpRMj@x1>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Wed 09 Mar 11:04 CST 2022, Drew Fustini wrote:

> On Tue, Mar 08, 2022 at 10:16:54AM -0800, Bjorn Andersson wrote:
> > On Tue 08 Mar 09:25 PST 2022, Drew Fustini wrote:
> > 
> > > From: Suman Anna <s-anna@ti.com>
> > > 
> > > The rproc_da_to_va() API is an exported function, so move its
> > > declaration from the remoteproc local remoteproc_internal.h
> > > to the public remoteproc.h file.
> > > 
> > > This will allow drivers outside of the remoteproc folder to be
> > > able to use this API.
> > > 
> > 
> > Can you explain why drivers outside of the remoteproc folder should be
> > able to poke straight into the memory of the remoteproc?
> > 
> > Your reasoning makes sense, but we've on purpose kept it out of
> > remoteproc.h because no one has had a proper reason for it and I sense
> > that we might open the door for some new creative solutions...
> 
> rproc_da_to_va() is used in a patch for drivers/soc/ti/wkup_m3_ipc.c
> that adds support for i2c voltage scaling [1].
> 
> wkup_m3_copy_aux_data() will copy auxiliary data to special region of
> the Cortex M3 memory. It calls rproc_da_to_va() to get aux_data_addr
> which is then used as a memcpy destination.
> 

So in essence it's an essential part for the "communication protocol"
used to communicate with the remoteproc...

> Does that seem like a reasonable way to do it?
> 

I have a concern about the life cycle of the pointer acquired by this
"independent" driver. But this is an extension of my existing concern
where the wkup driver uses the remoteproc core as a "firmware loader",
but it's not a standalone remoteproc driver.

I think it would have been nicer to model the remoteproc driver as the
parent of the wkup device, so we probe/remove the wkup device based on
the state of the remoteproc.

This would remove concerns about races between the remoteproc
starting/stopping/restarting and the other driver and it would help
clarify that the life cycle of the pointer returned by rproc_da_to_va()
lives from start to stop of the remoteproc.


This does however not change the need for exporting the symbol, so I'm
merging this patch.

Regards,
Bjorn

> I was going to submit the i2c voltage scaling patches later. However,
> I could combine them into a series with this remoteproc patch if that
> helps to justify the remoteproc.h change.
> 
> Thanks,
> Drew
> 
> [1] https://lore.kernel.org/linux-omap/20220219215328.485660-9-dfustini@baylibre.com/
