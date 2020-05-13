Return-Path: <SRS0=SCme=63=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF843C433DF
	for <linux-remoteproc@archiver.kernel.org>; Wed, 13 May 2020 22:13:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D63D420659
	for <linux-remoteproc@archiver.kernel.org>; Wed, 13 May 2020 22:13:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LGDhXSd0"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730805AbgEMWNq (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 13 May 2020 18:13:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52818 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1730064AbgEMWNq (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 13 May 2020 18:13:46 -0400
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com [IPv6:2607:f8b0:4864:20::1043])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DBD76C061A0C
        for <linux-remoteproc@vger.kernel.org>; Wed, 13 May 2020 15:13:45 -0700 (PDT)
Received: by mail-pj1-x1043.google.com with SMTP id l73so2101233pjb.1
        for <linux-remoteproc@vger.kernel.org>; Wed, 13 May 2020 15:13:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=e6RXpgluKwXPp3KRCdiHCqL2rdUeYjnysCP7SSKxBOM=;
        b=LGDhXSd0LFpWl0o4hxng7L0J/q4lMorH0G9DAzNLEG6GsWcHLUtoAH9bXfmTzMvKRa
         MisrArcyuTh1Bsi5exkoTVN7yPz3JxQZ7ZmU2nWMe1VMvRBilgdpvx+CZ0zvuHMO0Ff5
         NFroCGOcnA/3y1zhVVW/FjOG2/QonmXAuEaIRFDjjofin1chGunmrkyLBuz1/KgOVJmP
         G0JVlbFeyvOhfPfxuEHvNmMd0b7BfVwAlbHyBl2Rqfh8LlvooW/O/KR4lZVNFGOhamDm
         MSrZef83Fqmuwe5ckDlVz19PjhbP1SGvTVLwScfx/1jq9n4OQ4m0pp94Yi+2AxVEI2sa
         U/xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=e6RXpgluKwXPp3KRCdiHCqL2rdUeYjnysCP7SSKxBOM=;
        b=XonSj4gI7NweliDPt77/8yiL0Nk2tdUly9oWxCWkQjr7DRt92Up/G8op7t6BoFh9r3
         oRENCUPTeU+0Qgy9tcNcs5refNXCLgPwd9iSyR6d/DApWNXjsalDm60GfZKLPuF7U6pd
         EAQ6SyD3bMnCB1ZL08gvVhl+FtVltugVmciHHF/hnzClYF9lMjQA01CnfOGZ8FDvH0+x
         EduTFicBDKZSQTLR3UDsKFmqvBiJmgLsZeeVX34gAHNdRCVvd2jHlD2+FLuHj9sedCAT
         o9GM1xhZ+JqqNIWUU0LBM6JkaR8inO+7v3MEGmY/ppys2htnY+P37SgZh0MOj1CoSYEC
         ZcYQ==
X-Gm-Message-State: AOAM533EdRXYjtN1BMhKF6YTvcCe9wI5BJU+081SbrpLtDG/TUDYM9rV
        OXaNTXkHsaBRIcYvmsP5l9IACWXsHRM=
X-Google-Smtp-Source: ABdhPJyplZyfECUA4JUBp4ymP477fQ0nX0LINWjlkQLJAuqkagunu2xqRi+StBi4BXbgxBkDbzGzgg==
X-Received: by 2002:a17:902:fe8d:: with SMTP id x13mr1277189plm.198.1589408025407;
        Wed, 13 May 2020 15:13:45 -0700 (PDT)
Received: from xps15 (S0106002369de4dac.cg.shawcable.net. [68.147.8.254])
        by smtp.gmail.com with ESMTPSA id y24sm456127pfn.211.2020.05.13.15.13.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2020 15:13:44 -0700 (PDT)
Date:   Wed, 13 May 2020 16:13:42 -0600
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Arun Kumar Neelakantam <aneela@codeaurora.org>
Cc:     ohad@wizery.com, bjorn.andersson@linaro.org, clew@codeaurora.org,
        sricharan@codeaurora.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org, Andy Gross <agross@kernel.org>,
        "open list:ARM/QUALCOMM SUPPORT" <linux-arm-msm@vger.kernel.org>
Subject: Re: [PATCH V5 5/5] rpmsg: glink: unregister rpmsg device during
 endpoint destroy
Message-ID: <20200513221342.GC8328@xps15>
References: <1589346606-15046-1-git-send-email-aneela@codeaurora.org>
 <1589346606-15046-6-git-send-email-aneela@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1589346606-15046-6-git-send-email-aneela@codeaurora.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Wed, May 13, 2020 at 10:40:06AM +0530, Arun Kumar Neelakantam wrote:
> Rpmsg device unregister is not happening if channel close is triggered
> from local side and causing re-registration of device failures.
> 
> Unregister rpmsg device for local close in endpoint destroy path.
> 
> Signed-off-by: Arun Kumar Neelakantam <aneela@codeaurora.org>
> ---
>  drivers/rpmsg/qcom_glink_native.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/drivers/rpmsg/qcom_glink_native.c b/drivers/rpmsg/qcom_glink_native.c
> index 0e8a28c0..fc8ef66 100644
> --- a/drivers/rpmsg/qcom_glink_native.c
> +++ b/drivers/rpmsg/qcom_glink_native.c
> @@ -1207,6 +1207,7 @@ static void qcom_glink_destroy_ept(struct rpmsg_endpoint *ept)
>  {
>  	struct glink_channel *channel = to_glink_channel(ept);
>  	struct qcom_glink *glink = channel->glink;
> +	struct rpmsg_channel_info chinfo;
>  	unsigned long flags;
>  
>  	spin_lock_irqsave(&channel->recv_lock, flags);
> @@ -1214,6 +1215,13 @@ static void qcom_glink_destroy_ept(struct rpmsg_endpoint *ept)
>  	spin_unlock_irqrestore(&channel->recv_lock, flags);
>  
>  	/* Decouple the potential rpdev from the channel */
> +	if (channel->rpdev) {

If we proceed this way no other channel can have an rpdev.  I would hope that
unregistration of rpdev would be more symetrical to what is done in patch 03.

Thanks,
Mathieu

> +		strncpy(chinfo.name, channel->name, sizeof(chinfo.name));
> +		chinfo.src = RPMSG_ADDR_ANY;
> +		chinfo.dst = RPMSG_ADDR_ANY;
> +
> +		rpmsg_unregister_device(glink->dev, &chinfo);
> +	}
>  	channel->rpdev = NULL;
>  
>  	qcom_glink_send_close_req(glink, channel);
> @@ -1477,6 +1485,7 @@ static void qcom_glink_rx_close(struct qcom_glink *glink, unsigned int rcid)
>  
>  		rpmsg_unregister_device(glink->dev, &chinfo);
>  	}
> +	channel->rpdev = NULL;
>  
>  	qcom_glink_send_close_ack(glink, channel->rcid);
>  
> -- 
> 2.7.4
