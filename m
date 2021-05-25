Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CDCD5C2B9F8
	for <linux-remoteproc@archiver.kernel.org>; Tue, 25 May 2021 17:37:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id AB24D61157
	for <linux-remoteproc@archiver.kernel.org>; Tue, 25 May 2021 17:37:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231579AbhEYRik (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 25 May 2021 13:38:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33710 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232626AbhEYRie (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 25 May 2021 13:38:34 -0400
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com [IPv6:2607:f8b0:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CEEB9C06138A
        for <linux-remoteproc@vger.kernel.org>; Tue, 25 May 2021 10:37:03 -0700 (PDT)
Received: by mail-pl1-x630.google.com with SMTP id 69so16729492plc.5
        for <linux-remoteproc@vger.kernel.org>; Tue, 25 May 2021 10:37:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=FqZUbjadb1B4THcGJT5sMXZ3kEFu1j12y+rBCLr87MY=;
        b=T27uSRQxNqy9fkkvryO31BKVXnZBIeoDoL6szDZylEtfWg6MbZYdZxgeQUiU3FFx7G
         v4PTXry4wDjPXAQH6mXluKz9vO/m6Vdqn7HWF1Quznl4lvCQpi/GXgj3ml/xec0/xdFn
         74AoX2s+Ry4EG+rYyODpoPWeB97Iq7VURotSVUJGYZ9DlowL6e3kL7Z80LCQKdNeeQaD
         clM347VjOrzbATocIcWn7oSnlrwiXZxUD0mQHigG83IxsnyekS8DqeaNK9l48XUh0EF+
         9I0/QGqKpt2o/IdsRNT46/RvVifTtRaY7T/MqkBEMSFMx3SZHLBCU3l5PQYaCSBM2hCn
         uH+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=FqZUbjadb1B4THcGJT5sMXZ3kEFu1j12y+rBCLr87MY=;
        b=ihtU7uYYASMgab27L6dfi0d8mz/BbtIAqHWWFQIe1VDqtJBqEwSWP755ZpB7f6akJ0
         bdvF3raCl8Da09bBf1yhHzdD2O9GHGU5HzYzI+QT+hkVRURf2jDE6HJRk7Ue5PLcNj/2
         mAUh/1WHqms9nzoDAElVTYwhnIWe2Z8CT2BiMkWmNs0XPbFiqDmOFxojy0YPtwBP6p0S
         OcCNCzCypy3n4hd5Dcm4WytVx3D37ntrXIEmha1IYU1Jl6d9jIjTgHPwRDvqIEDj5/mb
         39lvAoka12PcGwixmwVXNa+a+SV3MM96SCMzr23g4RE5Dg/xMMLFOpTAbX33fJIPtGWn
         PBzQ==
X-Gm-Message-State: AOAM530XZ9/cZteiLpAAsY7qSvwO8MFkvn8IXC1HE4U5axrYLlqXTNeN
        jRYwkfVG03sZ3bUugSbCbVDxOA==
X-Google-Smtp-Source: ABdhPJxr3lPiVmDNhM/fjqq6u22sPHnIKPDXjlVFYzCAwPeQy3jR4MIHjJKDsw3YszpMmR4ZQPExXg==
X-Received: by 2002:a17:902:ecc4:b029:ef:8e98:3cb0 with SMTP id a4-20020a170902ecc4b02900ef8e983cb0mr31645764plh.50.1621964223320;
        Tue, 25 May 2021 10:37:03 -0700 (PDT)
Received: from xps15 (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
        by smtp.gmail.com with ESMTPSA id z125sm14029934pfz.218.2021.05.25.10.37.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 May 2021 10:37:02 -0700 (PDT)
Date:   Tue, 25 May 2021 11:37:00 -0600
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Suman Anna <s-anna@ti.com>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-remoteproc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] remoteproc: Add kernel-doc comment for is_iomem
Message-ID: <20210525173700.GC1113058@xps15>
References: <20210519180304.23563-1-s-anna@ti.com>
 <20210519180304.23563-2-s-anna@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210519180304.23563-2-s-anna@ti.com>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Wed, May 19, 2021 at 01:03:03PM -0500, Suman Anna wrote:
> Add a kernel-doc comment for the is_iomem function argument in
> rproc_da_to_va(). This fixes a warning generated when building
> the remoteproc_core with W=1,
>   warning: Function parameter or member 'is_iomem' not described in 'rproc_da_to_va'
> 
> Signed-off-by: Suman Anna <s-anna@ti.com>
> ---
>  drivers/remoteproc/remoteproc_core.c | 1 +
>  1 file changed, 1 insertion(+)
> 

Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>

> diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
> index 626a6b90fba2..8c279039b6a3 100644
> --- a/drivers/remoteproc/remoteproc_core.c
> +++ b/drivers/remoteproc/remoteproc_core.c
> @@ -165,6 +165,7 @@ EXPORT_SYMBOL(rproc_va_to_pa);
>   * @rproc: handle of a remote processor
>   * @da: remoteproc device address to translate
>   * @len: length of the memory region @da is pointing to
> + * @is_iomem: optional pointer filled in to indicate if @da is iomapped memory
>   *
>   * Some remote processors will ask us to allocate them physically contiguous
>   * memory regions (which we call "carveouts"), and map them to specific
> -- 
> 2.30.1
> 
