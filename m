Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 827F4C433DB
	for <linux-remoteproc@archiver.kernel.org>; Wed,  6 Jan 2021 18:48:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5A5032312E
	for <linux-remoteproc@archiver.kernel.org>; Wed,  6 Jan 2021 18:48:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726551AbhAFSs1 (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 6 Jan 2021 13:48:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41206 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726701AbhAFSs1 (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 6 Jan 2021 13:48:27 -0500
Received: from mail-ot1-x334.google.com (mail-ot1-x334.google.com [IPv6:2607:f8b0:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E4DD5C06135A
        for <linux-remoteproc@vger.kernel.org>; Wed,  6 Jan 2021 10:47:46 -0800 (PST)
Received: by mail-ot1-x334.google.com with SMTP id q25so3904582otn.10
        for <linux-remoteproc@vger.kernel.org>; Wed, 06 Jan 2021 10:47:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=J0CKR6Kvio5VLoFKyFYozSwJdmAW6MNkG97LTeNyQO4=;
        b=x6ZtD3djxA3EXsoZpK5TZ+kc00ltci4hhEOW+Qm8RiGoDpGdXgYKaBiGQf0bqdlpbK
         /Gim9u2G9fgMa1d7p2dh4I/c6WYS/CdSXiiuLCxIiFop2eCT68Kis+3bmRsr38KmgBX9
         gyT5vKfZa+OTfdP/DsMFUgcJb9YELqdc6vppwxfubmcG4TbOs/uBZthCBeXtJgnrDAbG
         /dTym/N7szfEWbh+khzEFJmXYFoO/D+81+77Utbl+6E7Dw0HY1zirbP9gLf/V8aZ0BI+
         PwDx2P1i+KBzjByczxnU9pdpbKbA6zCFZv+5tgNFDrdbtrw5Khp28Xg1WWL1qDAzm5v/
         dHeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=J0CKR6Kvio5VLoFKyFYozSwJdmAW6MNkG97LTeNyQO4=;
        b=hEzFlFkdP/kD//UIpI+Q/JQ/Zpab3bH1MZ8u0oOWiGqYP5LL/CUu58hDe2BXw0IIlg
         6n0Si8IfI7E9PNnJb42itxZzpPLayRlfhK7PUGvTtCNNogcEJ+rmMACQWK6efU5zyy04
         LmD5iO6MM45karIjnFqd7BurIQoP5y9aqIG3VkF/keTtEyWEZdbysiyNMWTTvimrJb82
         uFiZauGD16ufqeB11EdPnOFFzPkimH+Vw9YfCBBOyTTWIj4C5HKUID7gZeNYxfmmjpNh
         dyzl2m8xKJOYbj1Y63HXrAHudpFszPF82f+Ngd11xQeXOcenlrVOsLU+jDgwRGjKxVf7
         bkiA==
X-Gm-Message-State: AOAM533rBytZT4/hOt2cQt9wEYs2sHfslbEVHQfraHcP2SU5CEfMiMBW
        BNKs9CYJb/OsIS1WbS4rZkowFQ==
X-Google-Smtp-Source: ABdhPJx1RKYVVyX0rPMoRSLuDstfkFwfSI1CmVBfV/H5xwF4Pl9d36cFHlDBFyLG7qY8igqtQCicOw==
X-Received: by 2002:a05:6830:19da:: with SMTP id p26mr4102160otp.80.1609958866345;
        Wed, 06 Jan 2021 10:47:46 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id r13sm662109oti.49.2021.01.06.10.47.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Jan 2021 10:47:45 -0800 (PST)
Date:   Wed, 6 Jan 2021 12:47:43 -0600
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Alex Elder <elder@linaro.org>
Cc:     agross@kernel.org, davem@davemloft.net, kuba@kernel.org,
        ohad@wizery.com, evgreen@chromium.org, cpratapa@codeaurora.org,
        subashab@codeaurora.org, netdev@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next 2/3] soc: qcom: mdt_loader: define stubs for
 COMPILE_TEST
Message-ID: <X/YFzz1FCWUJn8lN@builder.lan>
References: <20210106023812.2542-1-elder@linaro.org>
 <20210106023812.2542-3-elder@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210106023812.2542-3-elder@linaro.org>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Tue 05 Jan 20:38 CST 2021, Alex Elder wrote:

> Define stub functions for the exposed MDT functions in case
> QCOM_MDT_LOADER is not configured.  This allows users of these
> functions to link correctly for COMPILE_TEST builds without
> QCOM_SCM enabled.
> 

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

@Jakub, @Dave, as with patch 1, please take this through your tree as
well.

Regards,
Bjorn

> Signed-off-by: Alex Elder <elder@linaro.org>
> ---
>  include/linux/soc/qcom/mdt_loader.h | 35 +++++++++++++++++++++++++++++
>  1 file changed, 35 insertions(+)
> 
> diff --git a/include/linux/soc/qcom/mdt_loader.h b/include/linux/soc/qcom/mdt_loader.h
> index e600baec68253..afd47217996b0 100644
> --- a/include/linux/soc/qcom/mdt_loader.h
> +++ b/include/linux/soc/qcom/mdt_loader.h
> @@ -11,6 +11,8 @@
>  struct device;
>  struct firmware;
>  
> +#if IS_ENABLED(CONFIG_QCOM_MDT_LOADER)
> +
>  ssize_t qcom_mdt_get_size(const struct firmware *fw);
>  int qcom_mdt_load(struct device *dev, const struct firmware *fw,
>  		  const char *fw_name, int pas_id, void *mem_region,
> @@ -23,4 +25,37 @@ int qcom_mdt_load_no_init(struct device *dev, const struct firmware *fw,
>  			  phys_addr_t *reloc_base);
>  void *qcom_mdt_read_metadata(const struct firmware *fw, size_t *data_len);
>  
> +#else /* !IS_ENABLED(CONFIG_QCOM_MDT_LOADER) */
> +
> +static inline ssize_t qcom_mdt_get_size(const struct firmware *fw)
> +{
> +	return -ENODEV;
> +}
> +
> +static inline int qcom_mdt_load(struct device *dev, const struct firmware *fw,
> +				const char *fw_name, int pas_id,
> +				void *mem_region, phys_addr_t mem_phys,
> +				size_t mem_size, phys_addr_t *reloc_base)
> +{
> +	return -ENODEV;
> +}
> +
> +static inline int qcom_mdt_load_no_init(struct device *dev,
> +					const struct firmware *fw,
> +					const char *fw_name, int pas_id,
> +					void *mem_region, phys_addr_t mem_phys,
> +					size_t mem_size,
> +					phys_addr_t *reloc_base)
> +{
> +	return -ENODEV;
> +}
> +
> +static inline void *qcom_mdt_read_metadata(const struct firmware *fw,
> +					   size_t *data_len)
> +{
> +	return ERR_PTR(-ENODEV);
> +}
> +
> +#endif /* !IS_ENABLED(CONFIG_QCOM_MDT_LOADER) */
> +
>  #endif
> -- 
> 2.20.1
> 
