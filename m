Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C29CBC56201
	for <linux-remoteproc@archiver.kernel.org>; Thu, 19 Nov 2020 17:33:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 589DF221EB
	for <linux-remoteproc@archiver.kernel.org>; Thu, 19 Nov 2020 17:33:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xHfwpgtK"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728694AbgKSRdf (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Thu, 19 Nov 2020 12:33:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36054 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728672AbgKSRde (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 19 Nov 2020 12:33:34 -0500
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com [IPv6:2607:f8b0:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BAC09C0613CF
        for <linux-remoteproc@vger.kernel.org>; Thu, 19 Nov 2020 09:33:34 -0800 (PST)
Received: by mail-pg1-x542.google.com with SMTP id 81so4869243pgf.0
        for <linux-remoteproc@vger.kernel.org>; Thu, 19 Nov 2020 09:33:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=lTDVZu78sQRjzGc9f1m4SYFSbzIEF2W5wGuEGt9FlSM=;
        b=xHfwpgtKrk1Df4SjR7jUsrMdAFTDc7OgvNY6trictLf5Ln9RuV/h6HV5ooqXOHH9cT
         T7onq3l77JCiY18+f4dkMsWgy4IG1b3EDG2yVcHRXLjvGmigo6ve2YPgdrcksU/q0AQq
         URYaTadUQbkdGx+XtnT5fiE6KfwSlLclOmf/hvD3RCT4kQuy0YXFPv0qOP4tD0Agzs1U
         0l3Q5e1TMiKsNNt4ruCn72x/UPhf1G7Bbr06wOaYjJRUrhAVNiQ7p6/ShQzzmZZq7nIK
         pqGtMYbtUL/h5ArThLru1U9kFYsw/V6d/ETFNOz2ihLWoueSSYPsGMN3OjuzJwJrYcAq
         HJNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=lTDVZu78sQRjzGc9f1m4SYFSbzIEF2W5wGuEGt9FlSM=;
        b=OzkRbvEbIxg5NbYTVzc7tz8MOgBBZRPKRna5RiLG9jKtI+kDLED7c/Wh9J6ZhLJW/d
         dbL9qSdjBQw1kA9uKXeCNRXuuNNPwNl3oUn9GyV8HVlIMc16Wafmx44SqlRr8zSxozkf
         rlyoaAV9rR/DWpiHO27BVoOjudjG5+STj55zKv3aRkDi3KYk3br7Hj4k7LcUBy5wtDhP
         Ne8JNIZcUh+GTd8ZJ7Pg0qkopQzRW/iZANQ2jvmvPm2BgHSm0bA3EQj8w0u+uTCOKAU/
         GSDX2nfdO7QNI1UdeL+29/bWOmoE+xwOV7fmz126IejK7wkyQ/DGfr4ZZvvK7obLpcla
         Txnw==
X-Gm-Message-State: AOAM531lRZn0gpoVSKN/D/YckxOxntdyGoQWRhknedyr6Wv/kO7qh2xZ
        /Z5nAqsT0kEkbETLD7qngJXjww==
X-Google-Smtp-Source: ABdhPJyp+ND5pp7SrhY7dYPw47jJui8zSPlJCkdZ1E6KXwXexCgFwpH18AyjuAjnTeXgeuQnVHxUgw==
X-Received: by 2002:a17:90b:3789:: with SMTP id mz9mr5612540pjb.123.1605807214335;
        Thu, 19 Nov 2020 09:33:34 -0800 (PST)
Received: from xps15 (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
        by smtp.gmail.com with ESMTPSA id a123sm400557pfd.218.2020.11.19.09.33.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2020 09:33:33 -0800 (PST)
Date:   Thu, 19 Nov 2020 10:33:32 -0700
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
Cc:     Arnaud POULIQUEN <arnaud.pouliquen@st.com>,
        "ohad@wizery.com" <ohad@wizery.com>,
        "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>,
        "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v6 8/8] rpmsg: Turn name service into a stand alone driver
Message-ID: <20201119173332.GA94178@xps15>
References: <20201118213700.74106-1-mathieu.poirier@linaro.org>
 <20201118213700.74106-9-mathieu.poirier@linaro.org>
 <447fdbd6-2e3d-2786-c444-25148efcb9f8@st.com>
 <20201119171051.GA6464@ubuntu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201119171051.GA6464@ubuntu>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Thu, Nov 19, 2020 at 06:10:51PM +0100, Guennadi Liakhovetski wrote:
> Hi Mathieu,
> 
> I haven't tested it yet, but I've compared it to the previous version 
> and all the changed except the one, mentioned by Arnaud, seem to be 
> there! So, let's just fix this one and should be good to go!
>

Apologies for the brain bug - the code got lost in the thread...
 
> Thanks
> Guennadi
> 
> On Thu, Nov 19, 2020 at 03:52:50PM +0100, Arnaud POULIQUEN wrote:
> 
> [snip]
> 
> > As Guennadi mentionned in a previous mail
> > a kfree(vch) is missing on error
> > 
> > @@ -949,10 +949,11 @@ static int rpmsg_probe(struct virtio_device *vdev)
> >  	dev_info(&vdev->dev, "rpmsg host is online\n");
> > 
> >  	return 0;
> > 
> >  free_coherent:
> > +	kfree(vch);
> >  	dma_free_coherent(vdev->dev.parent, total_buf_space,
> >  			  bufs_va, vrp->bufs_dma);
> >  vqs_del:
> > 
> > Otherwise i tested this series successfully.
> > 
> > Thanks,
> > Arnaud
