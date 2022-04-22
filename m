Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CAECDC433EF
	for <linux-remoteproc@archiver.kernel.org>; Fri, 22 Apr 2022 15:22:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1449392AbiDVPZY (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Fri, 22 Apr 2022 11:25:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38258 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1449390AbiDVPZV (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 22 Apr 2022 11:25:21 -0400
Received: from mail-oi1-x233.google.com (mail-oi1-x233.google.com [IPv6:2607:f8b0:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0B8C956208
        for <linux-remoteproc@vger.kernel.org>; Fri, 22 Apr 2022 08:22:28 -0700 (PDT)
Received: by mail-oi1-x233.google.com with SMTP id w194so9355919oiw.11
        for <linux-remoteproc@vger.kernel.org>; Fri, 22 Apr 2022 08:22:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=zRM02qIQxQfC70nTBUvBA4m5fQ3xcQpnV7vq3c9440w=;
        b=h/3IuuXkxgBlAc78SVN4gUgu/c8KG7pLgEH8c0fOYV68W85jMLSA+lPPcBKsKjg4QC
         PqjIFSUHCosr0MyofPXkQCHfN90WQktRP53EDIzL1GES+d5gSpUOd0wF+JOyrWb2e+Si
         kXbYBXHhSZ38Ta3vl9kMiBQ+9eEGuISje9Q1v9F62QBoYS0OKlwi34wIACZ+UvyupUdQ
         2ha8AnWEw1/Mi4RmdfrlIcfzGrCz1LRPJbjcNBqr9GtuAIo7JxhE+gIlT/jdTcZlB0oj
         cygYWKZ5WeOzAgqBjCz3cfyLkzh5Exoe1dmgnP4Zb2oH+kWXYp6obf0iua+0rrKvfcda
         puGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=zRM02qIQxQfC70nTBUvBA4m5fQ3xcQpnV7vq3c9440w=;
        b=tUrGxfGB7VQn+37SVJ0zqvoguIfIL/FB+BFgdjX537/TLBB6CUMWQq7IDhHXG3fowF
         nJVKlBtBJ6Ziu9t8yPPz70Esx3V/HAPL70H6J2TWQaKsoqQr/1Y1GNLpwXW1+8Ywh27e
         of0VXRAoV4E6lGQPtWjwmUARimCRss0BHgecyBC2v3hWltksAYLZcllHcIv9vyknbW1F
         4GLT/mbDgHrEsVhHMkMQoYow1RWrs/8sl96rZFH0aEc6QV1aXmWnRdnIFQ0MI+Dr4OM+
         XUikighNQll5p4lg6GrwE2ThTpSNraJs+/sFy9AjhOi8V0YtypQiw3GDxDwSxZ/Y0nIW
         dg6w==
X-Gm-Message-State: AOAM533FLUU8uuj3aSIogsBscoKZh+YNo2LM8u0aN0+ZJhXhIC9P0RAo
        KA8uJsGM5uxT6gkQVtiZMJUh5g==
X-Google-Smtp-Source: ABdhPJztX0pQAZNJhW4p1LHgjp7sVpM+w9Sq/Ow7PUaSzKnmgvwmZgkuX3dtlQ6yhTJ4zFgxKXGdsQ==
X-Received: by 2002:a05:6808:e8c:b0:322:4b82:d33d with SMTP id k12-20020a0568080e8c00b003224b82d33dmr6802331oil.21.1650640947329;
        Fri, 22 Apr 2022 08:22:27 -0700 (PDT)
Received: from builder.lan ([2600:1700:a0:3dc8:3697:f6ff:fe85:aac9])
        by smtp.gmail.com with ESMTPSA id u20-20020a4a9e94000000b003291f6ac4b2sm894365ook.28.2022.04.22.08.22.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Apr 2022 08:22:26 -0700 (PDT)
Date:   Fri, 22 Apr 2022 10:22:24 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Yogesh Lal <quic_ylal@quicinc.com>
Cc:     quic_sibis@quicinc.com, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] remoteproc: qcom: Add fallback mechanism for full
 coredump collection
Message-ID: <YmLIMG62vPv4qtVe@builder.lan>
References: <1649269662-20338-1-git-send-email-quic_ylal@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1649269662-20338-1-git-send-email-quic_ylal@quicinc.com>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Wed 06 Apr 13:27 CDT 2022, Yogesh Lal wrote:

> In case remoteproc's firmware missing minidump support, during crash
> scenario coredump does not collected. This change adds a fallback
> mechanism for full coredump collection in the event of a crash.
> 
> Signed-off-by: Yogesh Lal <quic_ylal@quicinc.com>
> ---
>  drivers/remoteproc/qcom_common.c   | 11 ++++++++---
>  drivers/remoteproc/qcom_q6v5_pas.c |  1 +
>  2 files changed, 9 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/remoteproc/qcom_common.c b/drivers/remoteproc/qcom_common.c
> index 4b91e3c..68bd0bc 100644
> --- a/drivers/remoteproc/qcom_common.c
> +++ b/drivers/remoteproc/qcom_common.c
> @@ -162,13 +162,18 @@ void qcom_minidump(struct rproc *rproc, unsigned int minidump_id)
>  	 * is initialized in memory and encryption status is set.
>  	 */
>  	if (subsystem->regions_baseptr == 0 ||
> -	    le32_to_cpu(subsystem->status) != 1 ||
> -	    le32_to_cpu(subsystem->enabled) != MD_SS_ENABLED ||
> -	    le32_to_cpu(subsystem->encryption_status) != MD_SS_ENCR_DONE) {
> +		le32_to_cpu(subsystem->status) != 1 ||
> +		le32_to_cpu(subsystem->enabled) != MD_SS_ENABLED) {
> +			return rproc_coredump(rproc);
> +		}
> +
> +	if (le32_to_cpu(subsystem->encryption_status) != MD_SS_ENCR_DONE) {
>  		dev_err(&rproc->dev, "Minidump not ready, skipping\n");
>  		return;
>  	}
>  
> +	rproc_coredump_cleanup(rproc);

The patch looks good, but could you please explain in the commit message
why this needs to be added? If the thing described in the message
happens this code path wouldn't be taken.

Should it be a separate patch, or is it needed because of the fallback
etc?

Thanks,
Bjorn

> +
>  	ret = qcom_add_minidump_segments(rproc, subsystem);
>  	if (ret) {
>  		dev_err(&rproc->dev, "Failed with error: %d while adding minidump entries\n", ret);
> diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
> index 1ae47cc..40bf747 100644
> --- a/drivers/remoteproc/qcom_q6v5_pas.c
> +++ b/drivers/remoteproc/qcom_q6v5_pas.c
> @@ -293,6 +293,7 @@ static const struct rproc_ops adsp_minidump_ops = {
>  	.start = adsp_start,
>  	.stop = adsp_stop,
>  	.da_to_va = adsp_da_to_va,
> +	.parse_fw = qcom_register_dump_segments,
>  	.load = adsp_load,
>  	.panic = adsp_panic,
>  	.coredump = adsp_minidump,
> -- 
> 2.7.4
> 
