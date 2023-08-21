Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E45B4EE49A5
	for <linux-remoteproc@archiver.kernel.org>; Mon, 21 Aug 2023 21:22:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229969AbjHUVWC (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 21 Aug 2023 17:22:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53426 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229546AbjHUVWC (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 21 Aug 2023 17:22:02 -0400
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com [IPv6:2607:f8b0:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DFBB910E
        for <linux-remoteproc@vger.kernel.org>; Mon, 21 Aug 2023 14:21:59 -0700 (PDT)
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-1bf7a6509deso9073775ad.3
        for <linux-remoteproc@vger.kernel.org>; Mon, 21 Aug 2023 14:21:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692652919; x=1693257719;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=tcTmaZoH/rBrAySmZRmKvOUFt5gsFhqZhDqNoBjjOkI=;
        b=ryyr15nK6BSkD0W/5g0kLa7rw6tLmc1YJb1pCYOCSvZ7uLPMXXxg2hB9LsN0psxHj1
         9qz73l3ONVKthAcOpXrLZEC6w4DE6luzWtSDTrS0jmAKmcVhoWJW1EGMitd7hHL2HNZY
         78svKsUXbgFR2u1cxdV4sivrlCxpe8Zq65xv2deJ6xwcnkTSbXl5vjwh5yqoRwBXOFkJ
         5ft8LhESxhLxxARdCiE3ZYpZpu3SI1A9OECdAXJKGSO8KzW/7iyiqvSg3nhVl6Zcq8rd
         Ix9tBOKeFbdWloDJsvp/Rp1sMPu+EncU1uJsGYx8/5sN4Rq8zJwiSItsoZSVzqksADEq
         XQng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692652919; x=1693257719;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tcTmaZoH/rBrAySmZRmKvOUFt5gsFhqZhDqNoBjjOkI=;
        b=HpyQSzlvHa2E1VKj/IjYIlzPH3U8Bn9IC+FKvWiR4ym2xwV3JO6IA8BOpFf1O0y6xS
         UYf816PdlSQh/JN/MhnZ3pTqJeNOiXl9QMoi6Z+TrQEgUTlKnj/lKoEHRCqPOgm0PKMd
         qO2qP0Q2AXgnQv4tXIKUys46fx1tQhgdXbzWOsZ7/q1q8ExZkuhy/0aukTD2pZJkTE4X
         0e+KmNGTE8S6rCxNacBpGMHdXd/zE9tJn8BdhZxWZctBq3lmO0AhOAoaFlKt1as55Wrh
         5JNcbyvL/sTwfkCPQlPyFxoHhnonFHdFV6yUhJMjY66wYo5qpM9GSQLD3dVo6Z46r8S6
         mRKg==
X-Gm-Message-State: AOJu0YyLLav8z8pCU0N2enpwPqA5WVUcrtkWgzGXXOTnmygR/2o8hojQ
        l9N5MKqIlmaqWWnJwYjdH6SKsg==
X-Google-Smtp-Source: AGHT+IHlt09Bw/4WEWhF5qIVWJXIp8E77sl4ZB49rI52RbloGG+SAcXB03+H2pmgL9lJ339feC86Xw==
X-Received: by 2002:a17:903:2346:b0:1bb:a941:d940 with SMTP id c6-20020a170903234600b001bba941d940mr5983936plh.15.1692652919291;
        Mon, 21 Aug 2023 14:21:59 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:2289:93a7:5faa:cd11])
        by smtp.gmail.com with ESMTPSA id x17-20020a170902ec9100b001bf35144a18sm7396939plg.221.2023.08.21.14.21.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Aug 2023 14:21:58 -0700 (PDT)
Date:   Mon, 21 Aug 2023 15:21:56 -0600
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     MD Danish Anwar <danishanwar@ti.com>
Cc:     Bjorn Andersson <andersson@kernel.org>,
        linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        srk@ti.com, rogerq@kernel.org, vigneshr@ti.com
Subject: Re: [PATCH] remoteproc: pru: add support for configuring GPMUX based
 on client setup
Message-ID: <ZOPVdFMmUxT+wp8n@p14s>
References: <20230802064925.1895750-1-danishanwar@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230802064925.1895750-1-danishanwar@ti.com>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Wed, Aug 02, 2023 at 12:19:25PM +0530, MD Danish Anwar wrote:
> From: Tero Kristo <t-kristo@ti.com>
> 
> The GPMUX config value for a PRU device can now be configured by client
> by specifying it in the device node ti,pruss-gp-mux-sel.
> 
> Signed-off-by: Tero Kristo <t-kristo@ti.com>
> Signed-off-by: Suman Anna <s-anna@ti.com>
> Signed-off-by: MD Danish Anwar <danishanwar@ti.com>
> ---
>  drivers/remoteproc/pru_rproc.c | 22 ++++++++++++++++++++++
>  1 file changed, 22 insertions(+)
>

Applied.

Thanks,
Mathieu

> diff --git a/drivers/remoteproc/pru_rproc.c b/drivers/remoteproc/pru_rproc.c
> index 5b2dc75836fc..327f0c7ee3d6 100644
> --- a/drivers/remoteproc/pru_rproc.c
> +++ b/drivers/remoteproc/pru_rproc.c
> @@ -110,6 +110,7 @@ struct pru_private_data {
>   * @dbg_single_step: debug state variable to set PRU into single step mode
>   * @dbg_continuous: debug state variable to restore PRU execution mode
>   * @evt_count: number of mapped events
> + * @gpmux_save: saved value for gpmux config
>   */
>  struct pru_rproc {
>  	int id;
> @@ -128,6 +129,7 @@ struct pru_rproc {
>  	u32 dbg_single_step;
>  	u32 dbg_continuous;
>  	u8 evt_count;
> +	u8 gpmux_save;
>  };
>  
>  static inline u32 pru_control_read_reg(struct pru_rproc *pru, unsigned int reg)
> @@ -229,6 +231,7 @@ struct rproc *pru_rproc_get(struct device_node *np, int index,
>  	struct device *dev;
>  	const char *fw_name;
>  	int ret;
> +	u32 mux;
>  
>  	rproc = __pru_rproc_get(np, index);
>  	if (IS_ERR(rproc))
> @@ -253,6 +256,23 @@ struct rproc *pru_rproc_get(struct device_node *np, int index,
>  	if (pru_id)
>  		*pru_id = pru->id;
>  
> +	ret = pruss_cfg_get_gpmux(pru->pruss, pru->id, &pru->gpmux_save);
> +	if (ret) {
> +		dev_err(dev, "failed to get cfg gpmux: %d\n", ret);
> +		goto err;
> +	}
> +
> +	/* An error here is acceptable for backward compatibility */
> +	ret = of_property_read_u32_index(np, "ti,pruss-gp-mux-sel", index,
> +					 &mux);
> +	if (!ret) {
> +		ret = pruss_cfg_set_gpmux(pru->pruss, pru->id, mux);
> +		if (ret) {
> +			dev_err(dev, "failed to set cfg gpmux: %d\n", ret);
> +			goto err;
> +		}
> +	}
> +
>  	ret = of_property_read_string_index(np, "firmware-name", index,
>  					    &fw_name);
>  	if (!ret) {
> @@ -291,6 +311,8 @@ void pru_rproc_put(struct rproc *rproc)
>  
>  	pru = rproc->priv;
>  
> +	pruss_cfg_set_gpmux(pru->pruss, pru->id, pru->gpmux_save);
> +
>  	pru_rproc_set_firmware(rproc, NULL);
>  
>  	mutex_lock(&pru->lock);
> -- 
> 2.34.1
> 
