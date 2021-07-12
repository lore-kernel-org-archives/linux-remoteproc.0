Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52AAEC07E99
	for <linux-remoteproc@archiver.kernel.org>; Mon, 12 Jul 2021 17:41:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2E06F61241
	for <linux-remoteproc@archiver.kernel.org>; Mon, 12 Jul 2021 17:41:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233964AbhGLRoO (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 12 Jul 2021 13:44:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44684 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233603AbhGLRoO (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 12 Jul 2021 13:44:14 -0400
Received: from mail-pg1-x530.google.com (mail-pg1-x530.google.com [IPv6:2607:f8b0:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0E3E2C0613DD
        for <linux-remoteproc@vger.kernel.org>; Mon, 12 Jul 2021 10:41:25 -0700 (PDT)
Received: by mail-pg1-x530.google.com with SMTP id s18so19027494pgg.8
        for <linux-remoteproc@vger.kernel.org>; Mon, 12 Jul 2021 10:41:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=uqLVf9jFGk+1f+g2Qau+OmoyomGseMPgNO/ujeZKXUY=;
        b=ve1CxIC5BSdNYQei6+kS3Kyd98AiedijdpRaaFVrdy8lcpXLlwNQvRZHHWypvaL2yD
         7bisZEXESa0lKupNZdgMSjao0NJZfXHEUAyC8FRV9FrXZ6xCHUxZgGETCYU5U3Pfynfn
         EH3sE/J5Sb4DyLko4BMGpMKYvQuo25L5GgcmbycFI+fn2AJYuzTlt3xWV1D+VN4+Hq+u
         UtX/UeJpWa+5nLJEzmTml9C4SIlP2DzADsUPeXFakGTi1+OVxIeO+0tOgJyCf61/uvIj
         bzFAhyjJ6613uezhQN6Xiz3EepsP6+trYq19ALAn+FoWQQgU1NRZVzjhfZ3YE5BMgm+r
         k8NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=uqLVf9jFGk+1f+g2Qau+OmoyomGseMPgNO/ujeZKXUY=;
        b=T4J/ii+iKVzzKYktPh2m2DJsgRcFtOZMv8m9iCmM11vPmR0QRNDbI+OsTQWnoUR0IL
         0dgkACmuue3G8L6XfLoEVuZELErVHzzluVPWhOH8AYdkVmOMMcHyTMC8Auu/AuRIb4Zd
         FwoEPOkwimcfnBy1IOevZopk1PUUki8b71ad5NqN4VKFebgSkUStIV5KJoBslSE0/Nff
         bMgt5PfTNNhAUomaluj+OULjWNu1o3V3bM4qHvM0IvMJNv3eMzQMgA6GF+RThYUS7Ce1
         XAcPrIo4AIw6fknV2Kc+7ZRxUwJ3lyg4LHAtMXAawOcrVyYV1gJOtbGBS+/ShAjRdOBB
         KDPw==
X-Gm-Message-State: AOAM533/e3V1ytNYqbajxFzJAYWNrZlK6OAJTmjKv08l+1rL7QhnJvxP
        UNP0WB6y5zCAKoxung6b+JMdfQ==
X-Google-Smtp-Source: ABdhPJzDEFvi8D2Jt5d+FNLjCw6wI1lNhs4F6LoMUzmtT7GFpyvrDYDwVK8jRFaJwvwwDuimuNlH1Q==
X-Received: by 2002:a05:6a00:815:b029:307:4ad0:8638 with SMTP id m21-20020a056a000815b02903074ad08638mr360995pfk.9.1626111684525;
        Mon, 12 Jul 2021 10:41:24 -0700 (PDT)
Received: from p14s (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
        by smtp.gmail.com with ESMTPSA id t37sm5454481pfg.14.2021.07.12.10.41.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jul 2021 10:41:23 -0700 (PDT)
Date:   Mon, 12 Jul 2021 11:41:21 -0600
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Dong Aisheng <aisheng.dong@nxp.com>
Cc:     linux-remoteproc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, ohad@wizery.com,
        dongas86@gmail.com, bjorn.andersson@linaro.org, cleger@kalray.eu
Subject: Re: [PATCH 2/2] remoteproc: fix kernel doc for struct rproc_ops
Message-ID: <20210712174121.GB1779922@p14s>
References: <20210706142156.952794-1-aisheng.dong@nxp.com>
 <20210706142156.952794-2-aisheng.dong@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210706142156.952794-2-aisheng.dong@nxp.com>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Tue, Jul 06, 2021 at 10:21:56PM +0800, Dong Aisheng wrote:
> The load_rsc_table was removed since the
> commit c1d35c1ab424 ("remoteproc: Rename "load_rsc_table" to "parse_fw"")
> but got added back again by mistake in the below commit:
> commit b1a17513a2d6 ("remoteproc: add vendor resources handling").
> 
> The patch fixed a small code indent issue which not worth
> a separate patch.
> 
> Fixes: b1a17513a2d6 ("remoteproc: add vendor resources handling")
> Signed-off-by: Dong Aisheng <aisheng.dong@nxp.com>
> ---
>  include/linux/remoteproc.h | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
>

Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>

Bjorn - checkpatch gets confused with the two double quotes in the changelog.  I
checked the syntax and everything is conformant to the guidelines.

> diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
> index a5b37bc10865..83c09ac36b13 100644
> --- a/include/linux/remoteproc.h
> +++ b/include/linux/remoteproc.h
> @@ -369,9 +369,8 @@ enum rsc_handling_status {
>   * @da_to_va:	optional platform hook to perform address translations
>   * @parse_fw:	parse firmware to extract information (e.g. resource table)
>   * @handle_rsc:	optional platform hook to handle vendor resources. Should return
> - * RSC_HANDLED if resource was handled, RSC_IGNORED if not handled and a
> - * negative value on error
> - * @load_rsc_table:	load resource table from firmware image
> + *		RSC_HANDLED if resource was handled, RSC_IGNORED if not handled
> + *		and a negative value on error
>   * @find_loaded_rsc_table: find the loaded resource table from firmware image
>   * @get_loaded_rsc_table: get resource table installed in memory
>   *			  by external entity
> -- 
> 2.25.1
> 
