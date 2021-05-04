Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A58CBC433B4
	for <linux-remoteproc@archiver.kernel.org>; Tue,  4 May 2021 17:05:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 84A4C613C1
	for <linux-remoteproc@archiver.kernel.org>; Tue,  4 May 2021 17:05:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231961AbhEDRGb (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 4 May 2021 13:06:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36786 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231962AbhEDRG2 (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 4 May 2021 13:06:28 -0400
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com [IPv6:2607:f8b0:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C7236C061761
        for <linux-remoteproc@vger.kernel.org>; Tue,  4 May 2021 10:05:33 -0700 (PDT)
Received: by mail-pf1-x431.google.com with SMTP id m11so8292716pfc.11
        for <linux-remoteproc@vger.kernel.org>; Tue, 04 May 2021 10:05:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=+bVzPOaiGSpT9fPHodrAVpiteIe5e+Ae3qWhGcxKKAU=;
        b=kcQjh8UyCfHGDomwiT3CD9fJ4Uv6ynvJ7yVxBkSenSh8/4pBwX/ns1e1cqz5XvCt/J
         /X4r5KTma3914e56sEW0xfNH34HnbCTLcPEzZ9r7is5j1IwB1+pAPOPz5gZE99F7gCvA
         cmmJJlz3vPjEvTlna0gqbOGhjr6wyeKFP62zoJqbJ8weQppTiyYcolnZchUtGL8d2C3k
         0eSZ8sCHZHpI6ZSH5PnWrhBEPlvPaaQvYHF2rl8AORhX2pHVCzlOY9wpSdRX115Q262l
         vDWP34a0V73sWmZYN06/h8xDekYUalDNee9IxYJvQLy9a3OtYWkM12efk+irjATRNXQZ
         fGew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=+bVzPOaiGSpT9fPHodrAVpiteIe5e+Ae3qWhGcxKKAU=;
        b=WH3Q2WCZk1Sd4F3tywMBfuTKQ5Ij06DSvb3fIqUNMCb5diCgd/bFkrwJXPDGT9gpKz
         COUCHI9NUk+nRWMlLf2AUPaUabCVXrm14KyHENRlNj9P0hoXlB2eaJ4bW853gNLJSDjW
         +ulvlUgnR1Mg4Ooo11FJqdHGPiovzkkWqqf1C9NYhKbQP16Bcv7KSxg3ZwbGASrm5Zym
         1vWOtAL3vNsziAy+qUHlMtRvlPkpkr3G9GdDg4cHX3jBX6BkLxgorzj9eCIdNv+A6a0+
         BV3R+eVjJU/3CrySVV4Ix/NlEHmEhjmBwvjxYw7MzW6siVXDsQuUvHHfq7XDI2cof8HO
         3FYQ==
X-Gm-Message-State: AOAM531wLEtdWgZse/WZz8VJwr/r1MR2rbVx52eTuIDCJ3srYKT8YiJc
        lXw5Xd5dGpp/quPIEKZfX2hxjg==
X-Google-Smtp-Source: ABdhPJwrzlIkkQtOwdmep59o++iyB2NlituPGYpI1BN/yYBGd2NSCYsW91QD+1JkXKZU8+AcR+A8qQ==
X-Received: by 2002:a63:5c41:: with SMTP id n1mr2160215pgm.333.1620147933177;
        Tue, 04 May 2021 10:05:33 -0700 (PDT)
Received: from xps15 (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
        by smtp.gmail.com with ESMTPSA id x9sm13848080pfq.197.2021.05.04.10.05.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 May 2021 10:05:32 -0700 (PDT)
Date:   Tue, 4 May 2021 11:05:30 -0600
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH] rpmsg: char: Remove useless includes
Message-ID: <20210504170530.GD1734971@xps15>
References: <20210429080639.6379-1-arnaud.pouliquen@foss.st.com>
 <20210503174238.GD1699665@xps15>
 <b2f6b9ca-9dc2-920b-941d-175779bc1034@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b2f6b9ca-9dc2-920b-941d-175779bc1034@foss.st.com>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Hi Arnaud,

[...]

> 
> I started by this one and then I got carried away tested the other include...
> You are right, I just don't follow her the first rule of the "submit checklist"
> 
> "If you use a facility then #include the file that defines/declares that
> facility. Don’t depend on other header files pulling in ones that you use."
> 
> That said I just have a doubt for uapi/linux/rpmsg.h that will be include
> by rpmsg.h[2], as these includes are part of the rpmsg framework API, should we
> keep both, considering the rule as strict?

I red the last paragraph several times I can't understand what you are
trying to convey.  Please rephrase, provide more context or detail exactly where
you think we have a problem.

Thanks,
Mathieu


> 
> [1] https://www.kernel.org/doc/html/latest/process/submit-checklist.html
> [2]
> https://patchwork.kernel.org/project/linux-remoteproc/patch/20210311140413.31725-3-arnaud.pouliquen@foss.st.com/
> 
> Thanks,
> Arnaud
> 
> > 
> > Thanks,
> > Mathieu
> > 
> >>  
> >>  #define RPMSG_DEV_MAX	(MINORMASK + 1)
> >>  
> >> -- 
> >> 2.17.1
> >>
