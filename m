Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71DE9C74A5B
	for <linux-remoteproc@archiver.kernel.org>; Thu, 23 Mar 2023 22:45:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231264AbjCWWph (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Thu, 23 Mar 2023 18:45:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41392 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231263AbjCWWpg (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 23 Mar 2023 18:45:36 -0400
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com [IPv6:2607:f8b0:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C4FC47ED3
        for <linux-remoteproc@vger.kernel.org>; Thu, 23 Mar 2023 15:45:35 -0700 (PDT)
Received: by mail-pf1-x433.google.com with SMTP id cu12so161729pfb.13
        for <linux-remoteproc@vger.kernel.org>; Thu, 23 Mar 2023 15:45:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679611535;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=xkke7lO7zfECbcdNUQ9AlvqUsiQvQ5+YaugutlTNtBQ=;
        b=zIYsK8NxxtJbOXGPswHLWVUeMHQd4OFgrF1cyiq4Iuz8Y3bcwFnDXOL0o57KW6+JeC
         F0uoKvKGVgLCpN4WIpOZ4d3UJTF0l35NXDi+Jg8WJwDa0Ics0NJGyFDN30nHT6wmkA/P
         duow8DOw++TcAMQ/UkEKHRDlq4CphgUkeNSgaapwbQRBhD9lkcVbYZk+1k4LNHsNCAD3
         4ddhR3CevCTPn2inzJrl4QBj57bkOn9JDidQ3lW9KeHtR/cJGiT91380AQkvhTlQc6qL
         KxPnH3qELGNpPq0npNDrUa0M9vI9Pn9YwpACsa7xtOW5dq4wlqmBxWmFERVnxhHMRmHs
         X9rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679611535;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xkke7lO7zfECbcdNUQ9AlvqUsiQvQ5+YaugutlTNtBQ=;
        b=bN68BCKtkyZCAPNT+ZyIwcc2nZaZlSyALVaOYDAdKGoWpK+chQoFKMNC56lJhol1tn
         4o3zHfMXJL/gAe0kbKq0T74esbRGCZyjapQyLN6WffY0WFN3kd+hFu36VnL9N3ZF7fky
         8Lm7p1W51LbJ6sCtoXyhYlbcBYA5/iRN7p2J0P9/WBeg7V9hmk0QTqcOZtKN88toBIDX
         snANJy8ls8fwOFdEKnzePApMtvua4SGa8CxEol5mItEp6RMVkl7H3z4xktLvswjz68OY
         2OTywZpVoIdtu8980MVyvqV0yNmyDL5qvzuvxcXhI4VYs4MDCWDcfrSWx6J9e1+smEkA
         BcmA==
X-Gm-Message-State: AAQBX9fuoX946vHkJiLprO337SQGMcFgQ5f2RR/UD8HKtotr6x9uRx9W
        gNJALQ5PsHHnQUUn5AC7CvuWEobFboqQpuN9aGg=
X-Google-Smtp-Source: AKy350buOjOVDaQRGHLB+sBmZfv9Wb0zHrxC/aDpbwhkP6ilJkmBXq+Z9rXT6O8CRTczid6e/PZ/Pw==
X-Received: by 2002:a62:5254:0:b0:625:febb:bc25 with SMTP id g81-20020a625254000000b00625febbbc25mr881257pfb.11.1679611535254;
        Thu, 23 Mar 2023 15:45:35 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:e403:39f9:7f9f:340b])
        by smtp.gmail.com with ESMTPSA id e15-20020a62ee0f000000b0058bacd6c4e8sm12302051pfi.207.2023.03.23.15.45.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Mar 2023 15:45:34 -0700 (PDT)
Date:   Thu, 23 Mar 2023 16:45:32 -0600
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Tanmay Shah <tanmay.shah@amd.com>
Cc:     andersson@kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org, Tarak Reddy <tarak.reddy@amd.com>
Subject: Re: [PATCH v2 2/2] remoteproc: enhance rproc_put() for clusters
Message-ID: <20230323224532.GB2905636@p14s>
References: <20230322040933.924813-1-tanmay.shah@amd.com>
 <20230322040933.924813-3-tanmay.shah@amd.com>
 <20230322160537.GB2821487@p14s>
 <830db03c-ec6e-b4aa-834a-e67622e5a41f@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <830db03c-ec6e-b4aa-834a-e67622e5a41f@amd.com>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Wed, Mar 22, 2023 at 10:34:57AM -0700, Tanmay Shah wrote:
> 
> On 3/22/23 9:05 AM, Mathieu Poirier wrote:
> > Hi Tanmay,
> > 
> > On Tue, Mar 21, 2023 at 09:09:36PM -0700, Tanmay Shah wrote:
> > > This patch enhances rproc_put() to support remoteproc clusters
> > > with multiple child nodes as in rproc_get_by_phandle().
> > > 
> > > Signed-off-by: Tarak Reddy <tarak.reddy@amd.com>
> > > Signed-off-by: Tanmay Shah <tanmay.shah@amd.com>
> > > ---
> > >   drivers/remoteproc/remoteproc_core.c | 13 +++++++++++++
> > >   1 file changed, 13 insertions(+)
> > > 
> > > diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
> > > index a3e7c8798381..e7e451012615 100644
> > > --- a/drivers/remoteproc/remoteproc_core.c
> > > +++ b/drivers/remoteproc/remoteproc_core.c
> > > @@ -2560,6 +2560,19 @@ EXPORT_SYMBOL(rproc_free);
> > >   void rproc_put(struct rproc *rproc)
> > >   {
> > >   	module_put(rproc->dev.parent->driver->owner);
> > There is something wrong here - this should have been removed.
> 
> 
> Thanks Mathieu. Sure this needs to be fixed.
> 
> This is result of manually picking up patch from my side.
> 
> I will try to find better automated way to pick-up patches not available on
> mailing list.
>

That would certainly help avoid problems such as this one.

> 
> > 
> > > +	struct platform_device *cluster_pdev;
> > > +
> > > +	if (rproc->dev.parent) {
> > This condition is not needed, please remove.
> Ack.
> > 
> > > +		if (rproc->dev.parent->driver) {
> > > +			module_put(rproc->dev.parent->driver->owner);
> > > +		} else {
> > > +			cluster_pdev = of_find_device_by_node(rproc->dev.parent->of_node->parent);
> > > +			if (cluster_pdev) {
> > > +				module_put(cluster_pdev->dev.driver->owner);
> > > +				put_device(&cluster_pdev->dev);
> 
> I am not sure if cluster_pdev->dev should be dropped here.
>

It needs to be done here.

> Should we drop it in platform driver after rproc_free() ?
> 
> > > +			}
> > > +		}
> > > +	}
> > Some in-lined documentation, the way I did in patch 1/2 would be appreciated.
> > Otherwize I think the above enhancement make sense.
> Ack I will document in next revision.
> > 
> > Thanks,
> > Mathieu
> > 
> > >   	put_device(&rproc->dev);
> 
> 
> Also, if we decide to drop cluster->dev here  then,
> 
> should we drop reference of rproc->dev before cluster->dev ?
> 
> 
> > >   }
> > >   EXPORT_SYMBOL(rproc_put);
> > > -- 
> > > 2.25.1
> > > 
