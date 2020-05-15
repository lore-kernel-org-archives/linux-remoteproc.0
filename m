Return-Path: <SRS0=tiv6=65=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 460D6C433DF
	for <linux-remoteproc@archiver.kernel.org>; Fri, 15 May 2020 21:10:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 228372065C
	for <linux-remoteproc@archiver.kernel.org>; Fri, 15 May 2020 21:10:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qfIyYrNn"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726980AbgEOVKn (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Fri, 15 May 2020 17:10:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41198 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726183AbgEOVKn (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 15 May 2020 17:10:43 -0400
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com [IPv6:2607:f8b0:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6DE43C061A0C
        for <linux-remoteproc@vger.kernel.org>; Fri, 15 May 2020 14:10:43 -0700 (PDT)
Received: by mail-pl1-x643.google.com with SMTP id q16so1418578plr.2
        for <linux-remoteproc@vger.kernel.org>; Fri, 15 May 2020 14:10:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=y1I+UKL+S9RIToBCTfDZkoeewbB2eUT2boKx9t2Bbw4=;
        b=qfIyYrNnt5F1ERWHO/RjTURyMAmjIDaNeEnqrvy9nNQRINucfLSqSbVlDez082XVMd
         h1wSiFEzcf9f5/5xvVB+byyPuhMp785Lf7EgE1BVrO2Sipxe0AnTE7N3Oj6HZRdGief0
         FdMSQdZIopNnwL/8bYHlDPPse2Zmx/xCSb007AV+ouY/9EER+EMjTNlE1UsTQsRkgIuE
         CDWxj1sC5xNLx7FEWXgkpj/oGf9KCLI9pDfvzyfkn5W/28N++7gt3AlRE/BQ/TFtObTT
         Mb9j1N+ozbht3bpBUmcCT9drDP+LaBJwG4dq1OKyhTPxRf5c9xzgI9uyMv7TwIlaRJNS
         SqCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=y1I+UKL+S9RIToBCTfDZkoeewbB2eUT2boKx9t2Bbw4=;
        b=SMv+9bcgb2X8loFRfddWVSIWucMcNBdyv7JlGw63F+2EOMaXIEXoi8MA7mg7IYLUHy
         yKxHwuPWJVTlH5napenXdeejqWydWlZi9QQJKFb1gQHIvQ+zRF/BiisTPRr03rqri9Tx
         qfK9NWLBNIJltYYDIDJdMWFGC9yWsbd1ymXLRVmfPHs0y8Mf48WJmbxeo95e/yF5FuDw
         D69p/CfNEKkLCaIF1+J0sOYsf54KJuld4hbVco3nvqOlClDYB0uDO4GTMFGtU5Xa77Wp
         jkOPzUF24W3EjjV8WRXEidam2d6hvPTtTjvz0wI6wbt0c/q5FTdG4H+Yodrn97vKi4za
         /rHQ==
X-Gm-Message-State: AOAM531BOUEVstxdmCVEfaO+f5b93cMNAfpjFr9HbEXTwy1H1/4vB/Wm
        XqBW/7WeIT/cRvJwlr3WV6ah0g==
X-Google-Smtp-Source: ABdhPJxM3uFamD7cT3IoJIFOJUgTBrJbOx0dOs+bvU643+PNKH5jhK1WEf+BioK/CwyCuY3G0/JEMw==
X-Received: by 2002:a17:902:326:: with SMTP id 35mr4975654pld.188.1589577042796;
        Fri, 15 May 2020 14:10:42 -0700 (PDT)
Received: from builder.lan (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id a2sm2646525pfl.12.2020.05.15.14.10.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2020 14:10:42 -0700 (PDT)
Date:   Fri, 15 May 2020 14:09:14 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Mathieu Poirier <mathieu.poirier@linaro.org>
Cc:     ohad@wizery.com, arnaud.pouliquen@st.com, s-anna@ti.com,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 0/3] rpmsg: core: Add support for name extension
Message-ID: <20200515210914.GA408178@builder.lan>
References: <20200515205642.13529-1-mathieu.poirier@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200515205642.13529-1-mathieu.poirier@linaro.org>
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Fri 15 May 13:56 PDT 2020, Mathieu Poirier wrote:

> This patchset adds the capability to supplement the base definition
> published by an rpmsg_driver with a postfix description so that it
> is easy to differentiate entities that use the same name service.
> 
> Applies cleanly on rpmsg-next (4f05fc33bebd).
> 

Thanks Mathieu, this series does look good.


But before merging this, can someone show me a real example where this
is being/would be used? What are some real channel names and extensions?

Regards,
Bjorn

> New for V6:
> - Added example on how to use the new API.
> 
> Thanks,
> Mathieu
> 
> 
> Mathieu Poirier (3):
>   rpmsg: core: Add wildcard match for name service
>   rpmsg: core: Add support to retrieve name extension
>   sample/rpmsg: Print out RPMSG device name extension
> 
>  drivers/rpmsg/rpmsg_core.c          | 115 +++++++++++++++++++++++++++-
>  include/linux/rpmsg.h               |  13 ++++
>  samples/rpmsg/rpmsg_client_sample.c |   5 ++
>  3 files changed, 132 insertions(+), 1 deletion(-)
> 
> -- 
> 2.20.1
> 
