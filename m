Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EEA8BC43461
	for <linux-remoteproc@archiver.kernel.org>; Wed, 14 Apr 2021 15:01:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BFA2D610CE
	for <linux-remoteproc@archiver.kernel.org>; Wed, 14 Apr 2021 15:01:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232468AbhDNPBz (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 14 Apr 2021 11:01:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41340 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232373AbhDNPBx (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 14 Apr 2021 11:01:53 -0400
Received: from mail-ot1-x32e.google.com (mail-ot1-x32e.google.com [IPv6:2607:f8b0:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 468C6C06175F
        for <linux-remoteproc@vger.kernel.org>; Wed, 14 Apr 2021 08:01:32 -0700 (PDT)
Received: by mail-ot1-x32e.google.com with SMTP id i16-20020a9d68d00000b0290286edfdfe9eso8975657oto.3
        for <linux-remoteproc@vger.kernel.org>; Wed, 14 Apr 2021 08:01:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=pWUtMV31lAE/hyg87N7iEfJU2y6qay0uOr7HTCluXiQ=;
        b=weX1bUpjRw6wuytQJlFfHNsn28nJPkkHmgBmJw8yPf3L2dHbbM5kfw3GHxlJBh1DyO
         BJkCg2eP4j3uyTHTdQaKSyyrOp+Fdowe+89rwe7wEGQbQm73jyYQTJ7L9wx49d6igFYd
         vbmQpzTiwPwqdGDeylnvV3vHpL+PWpFnvnzhRJ+IDnGQvkvXtwuLb+d5yUV9tHJCFx7s
         bOw6rogRUZEzwOFKIQ91VGxbwbpZd7+mDC+GgCrvp1IoZyasKbedKt0fyfNtq6M1NaxO
         7QzGAS3TRRrj5hg+1RxcPnAG82mKMruMgDVEaVQhzyw4zOZpmht7sd/ADU718gXGHYFJ
         +Udg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=pWUtMV31lAE/hyg87N7iEfJU2y6qay0uOr7HTCluXiQ=;
        b=GZkG2bdbX46LKOp3ivgyf6FwvvIri8hax5uHUtU6SDY+U7tfZzhYVQB83NNcmT8xyk
         TTDaDKb/WHEJaRL6EjHgUTOfphvRf0tuTdFGpYIyFdD+Wi3oUtKh0dp14i888prmfffh
         kxeeKL9zoFD3zmma6BGvZcGEIvvDyGM1Cn2KQ8Bh9LCFTtnElIrAUn2LeVSYPca+0rhs
         vwL9I7IZkiEYGvyAWfVGh92cXpd0wW+VhK3iTGhegJW1GkKtF/L441m7HtPwV3mKO0qQ
         fLTFaFLrIBcRABB+9S+14tii7/OPR8q9pDwjgTivPWTRvvpaouEwSSlcRs+2h1TvimpY
         7azQ==
X-Gm-Message-State: AOAM531GEAMH54y5mwzS+ztJ6fFiJoQnI5f26A/+AtpmbEZ+YKveQqAg
        DJRM/qqKD6UkhFqH8AYPVcI57g==
X-Google-Smtp-Source: ABdhPJxDtOsCeDQQ/deHM1lftmwj2WSD1eWrJZcD1R9B4e21VGSd2wMo678cp9rC6umgF66U/MAcWg==
X-Received: by 2002:a9d:7f9a:: with SMTP id t26mr2801371otp.363.1618412491567;
        Wed, 14 Apr 2021 08:01:31 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id z25sm337558otm.34.2021.04.14.08.01.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Apr 2021 08:01:31 -0700 (PDT)
Date:   Wed, 14 Apr 2021 10:01:29 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
Cc:     Ohad Ben-Cohen <ohad@wizery.com>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        devicetree@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 2/2] remoteproc: stm32: add capability to detach
Message-ID: <YHcDyUap4cU8WNh6@builder.lan>
References: <20210331073347.8293-1-arnaud.pouliquen@foss.st.com>
 <20210331073347.8293-3-arnaud.pouliquen@foss.st.com>
 <YHYOd/vqeZCiqkpJ@builder.lan>
 <3df5317b-d28a-9362-6876-99442fdb8ef5@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3df5317b-d28a-9362-6876-99442fdb8ef5@foss.st.com>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Wed 14 Apr 02:23 CDT 2021, Arnaud POULIQUEN wrote:
> On 4/13/21 11:34 PM, Bjorn Andersson wrote:
> > On Wed 31 Mar 02:33 CDT 2021, Arnaud Pouliquen wrote:
[..]
> >> +		err = mbox_send_message(ddata->mb[idx].chan,
> >> +					&dummy_data);
> > 
> > Seems I posted my comment on v1, rather than this latest version. Please
> > let me know if we should do anything about this dummy_data.
> 
> Thanks for pointing this out, you are right, the mailbox driver is stm32_ipcc
> and it only sends a signal to the remote processor.
> 
> As message can be queued by the mailbox framework using a local variable seems
> not a good option. As this code is a copy/past of the kick and stop?
> I propose to get this one and I will send a new patch to fix the usage in the
> whole driver.
> 

That works for me, I've merged the two patches.

Thanks,
Bjorn
