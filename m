Return-Path: <SRS0=E3rE=ID=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3EB9FC433DB
	for <linux-remoteproc@archiver.kernel.org>; Fri,  5 Mar 2021 16:56:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0FE4965092
	for <linux-remoteproc@archiver.kernel.org>; Fri,  5 Mar 2021 16:56:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229690AbhCEQz1 (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Fri, 5 Mar 2021 11:55:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37448 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229573AbhCEQzN (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 5 Mar 2021 11:55:13 -0500
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com [IPv6:2607:f8b0:4864:20::1030])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A2BBDC061574
        for <linux-remoteproc@vger.kernel.org>; Fri,  5 Mar 2021 08:55:13 -0800 (PST)
Received: by mail-pj1-x1030.google.com with SMTP id l18so2415396pji.3
        for <linux-remoteproc@vger.kernel.org>; Fri, 05 Mar 2021 08:55:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=5oX7JDjpyFM6sShOZapWIE6sOYsNksokkCB2Em8FcMw=;
        b=EqxN9e8rDjI2I2gJOSPPG/q05JnU5yymLBDDd9p6ny16eovxkKkAUbrCkuQSTOB2WH
         g6zlxso1OMmg9Ebdk6Nbnx5o4aQNreFt48edMlEaavtiJJ7mCrS65A3BOLEdjVhSZ+mg
         svQQmF4n7dUqon7+f5JiNK/WxfI40+U7YPB4bBRw/Kp+EaQmtNgMxtI9sp7A7OxE3EjE
         o7KtladbbuHryn65Vt1m/aXtqDmcRDiV/Bass2bcD0rWOKHvsdb54zCUGsLPAeLZK2Qu
         kwjtxw9epGtY+6puNn5zLVMj+37z++zRhGSFrBWhgb8EC2qCS0sCjNMal2DihjLtBYY/
         lBDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=5oX7JDjpyFM6sShOZapWIE6sOYsNksokkCB2Em8FcMw=;
        b=V8Di5ddNfxXx+kxQ65xeyC5PkwlJT2FjPAp3pJMvK9pCs79m3ZmG1zz93D00uZFQHo
         t3Gdsm8ex5KVvOEqhRVkRQAH1LZkZWBno0Z+PCldRO6oi/f6w6xwRXvPaDN/87O2TEuC
         SLw8UGXI79QQQ+WeYWHDBaSvPU6WAWY6jMNduGKaneEwWQR4jMbKbbJdUe40NG9fjhr/
         IQBPPcaYxsaG37UaJhKWlcCj29vG8Asx90ETOsZnfzbWC8i/xBFCq82ps3d/j/HwBnBX
         A6qntVaViV4IpO5D/u63y59xsxA6pjCcrLjSXdrZuR/geUx9Wycwik6/WwCTPxvgw+uC
         nAog==
X-Gm-Message-State: AOAM532bvfJ+Cw2TFbcaBV5U9Otulnrg3W77/TiVvFCNbD2hnLtKI/bm
        vxnCAHCp4KutLnaVKBUTDSEBoQ==
X-Google-Smtp-Source: ABdhPJxstzqvocrEH0wIvecZMQR/AbxctNSmn+OMgpLPNverTVBu8owjd2rr+kRGcTeQBx+lLo4/RQ==
X-Received: by 2002:a17:90a:4d07:: with SMTP id c7mr11296018pjg.104.1614963313231;
        Fri, 05 Mar 2021 08:55:13 -0800 (PST)
Received: from xps15 (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
        by smtp.gmail.com with ESMTPSA id mw13sm2794442pjb.42.2021.03.05.08.55.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Mar 2021 08:55:12 -0800 (PST)
Date:   Fri, 5 Mar 2021 09:55:10 -0700
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        Andy Gross <agross@kernel.org>,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v5 08/16] rpmsg: glink: add sendto and trysendto ops
Message-ID: <20210305165510.GA3885132@xps15>
References: <20210219111501.14261-1-arnaud.pouliquen@foss.st.com>
 <20210219111501.14261-9-arnaud.pouliquen@foss.st.com>
 <20210304191129.GE3854911@xps15>
 <e0f60693-3184-55c1-db67-1725a5f9c24d@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e0f60693-3184-55c1-db67-1725a5f9c24d@foss.st.com>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

[...]

> >>  }
> >>  
> >> +static int qcom_glink_sendto(struct rpmsg_endpoint *ept, void *data, int len, u32 dst)
> >> +{
> >> +	struct glink_channel *channel = to_glink_channel(ept);
> >> +
> >> +	return __qcom_glink_send(channel, data, len, true);
> >> +}
> >> +
> >> +static int qcom_glink_trysendto(struct rpmsg_endpoint *ept, void *data, int len, u32 dst)
> >> +{
> >> +	struct glink_channel *channel = to_glink_channel(ept);
> >> +
> >> +	return __qcom_glink_send(channel, data, len, false);
> >> +}
> > 
> > Just rename send() to sendto() and trysend() to trysendto() and ignore the
> > destination address.  
> 

Apologies for not being clear.

> Function prototypes have to match with rpmsg_endpoint_ops structure defined
> below. So seems to me not possible to just rename the functions.
> Please could you clarify if i missed something?

I don't think rproc_ops::send() and rproc_ops::trysend() are used anywhere else.
So replace them with rproc_ops::sendto() and rproc_ops::trysendto() where the
destination address would be ingnored.

> 
> > The same goes for the next patch.  I would fold patch 08
> > and 09 into 10 to help get the big picture.
> 
> I'm going to squash all in one.

Perfect

> 
> Thanks,
> Arnaud
> 
> > 
> >> +
> >>  /*
> >>   * Finds the device_node for the glink child interested in this channel.
> >>   */
> >> @@ -1364,7 +1378,9 @@ static const struct rpmsg_device_ops glink_device_ops = {
> >>  static const struct rpmsg_endpoint_ops glink_endpoint_ops = {
> >>  	.destroy_ept = qcom_glink_destroy_ept,
> >>  	.send = qcom_glink_send,
> >> +	.sendto = qcom_glink_sendto,
> >>  	.trysend = qcom_glink_trysend,
> >> +	.trysendto = qcom_glink_trysendto,
> >>  };
> >>  
> >>  static void qcom_glink_rpdev_release(struct device *dev)
> >> -- 
> >> 2.17.1
> >>
