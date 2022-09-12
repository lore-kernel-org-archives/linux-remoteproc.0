Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4B07C6FA83
	for <linux-remoteproc@archiver.kernel.org>; Mon, 12 Sep 2022 14:20:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230133AbiILOUX (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 12 Sep 2022 10:20:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51856 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230117AbiILOUW (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 12 Sep 2022 10:20:22 -0400
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com [IPv6:2a00:1450:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1558D1A384
        for <linux-remoteproc@vger.kernel.org>; Mon, 12 Sep 2022 07:20:20 -0700 (PDT)
Received: by mail-wm1-x331.google.com with SMTP id n35-20020a05600c502300b003b4924c6868so586182wmr.1
        for <linux-remoteproc@vger.kernel.org>; Mon, 12 Sep 2022 07:20:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile-fr.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=OokCHQqZcXfv+VBYvmBm8VEVxvtBPrE2ziQe6Vmeo8k=;
        b=SQAjEfgDj3vgH3TWm1UumNl8W6G6AREWNYpOngCqSrgCAfYQRZ1W1iIN+jzMgE1j/F
         grbfRGIbmXzuj2+/Nyd4Gn9m3k+jm3jXr3xmBJH1+nKMnl1ANiC8cuQ+PsDdJfzkraCy
         UEs/lbtLdkTeKCvn5rRJ5wO+ACysS9kXz6Bx6+9NGEafq/LnE5w0hyhPtXK29ToPOxPk
         nXAaHAqPmXsFs/xluJidI4LQPG1lq3K4iVO5rwQhuEcxtKJI/5UPs9Y4T7jm3lf/6BKU
         4K7IpK1va/DeNLaz9mBFhtqbZpFI6KB98K58IT5ZXWcDzB3fgjNngQzFVOABphk+7PZM
         cNPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=OokCHQqZcXfv+VBYvmBm8VEVxvtBPrE2ziQe6Vmeo8k=;
        b=aPKmjrgBtlhqwG7KVexEO/Xl+EkToernVyJPxUz8PWXPwm7lB+XadaVAKnMvvKq85M
         PUG5tUhH0iDUBBXEtPkbmpSaKLzLEVg/iKpdT37onsJihywldzV/tv5TqV75yNpzTU0W
         l2MzQGkz9TJLWgKd5peNv69QxPN5fW3Y1mlMh384xlhu0Y6C0SufzPVEYCHTVWWnOZUJ
         8WO31xshep4jl7fxn+36K82OtN7/QUi0VSfMqx8c2jcWXtaOKP85qmTK92plfWuWr/0a
         mbc1imgSYPvBWTx+MGc/t+4zh1GeXzUab/z08BTvoIyy/w9zKKHFCq5bV7uEUwLs6z4O
         uvqg==
X-Gm-Message-State: ACgBeo3vH8gghJ1XM2DRfAzK1UsxhpP/tQM6y8Bs7jJnK9D8du9O/ts+
        enGadKSVbUX79HAb5xF0ykoa5g==
X-Google-Smtp-Source: AA6agR6yP/ytBFmYGPx+E+UKmma5WNAO5gv2l61F6pZovdpQlogCT4obLRcHpd7/YTYwciAuz6tx6g==
X-Received: by 2002:a05:600c:2e52:b0:3b4:622c:1b4b with SMTP id q18-20020a05600c2e5200b003b4622c1b4bmr9550486wmf.153.1662992418510;
        Mon, 12 Sep 2022 07:20:18 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:8f8a:1800:1c97:b8d1:b477:d53f? (2a01cb058f8a18001c97b8d1b477d53f.ipv6.abo.wanadoo.fr. [2a01:cb05:8f8a:1800:1c97:b8d1:b477:d53f])
        by smtp.gmail.com with ESMTPSA id q3-20020adff783000000b0021f15514e7fsm8937693wrp.0.2022.09.12.07.20.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Sep 2022 07:20:18 -0700 (PDT)
Message-ID: <94b57cbc-b865-e0b4-0d52-3da72f2dd026@smile.fr>
Date:   Mon, 12 Sep 2022 16:20:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v2 6/6] soc: ti: pruss: Add helper functions to get/set
 PRUSS_CFG_GPMUX
Content-Language: en-US
To:     linux-kernel@vger.kernel.org, Md Danish Anwar <danishanwar@ti.com>
Cc:     bjorn.andersson@linaro.org, mathieu.poirier@linaro.org,
        krzysztof.kozlowski+dt@linaro.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        nm@ti.com, ssantosh@kernel.org, s-anna@ti.com,
        linux-arm-kernel@lists.infradead.org, rogerq@kernel.org,
        grygorii.strashko@ti.com, vigneshr@ti.com, kishon@ti.com
References: <20220418123004.9332-1-p-mohan@ti.com>
 <20220418123004.9332-7-p-mohan@ti.com>
From:   Romain Naour <romain.naour@smile.fr>
In-Reply-To: <20220418123004.9332-7-p-mohan@ti.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

+Danish

Hi Danish,

(Removed Puranjay (as he is no longer with TI) and adding Danish.)

Le 18/04/2022 à 14:30, Puranjay Mohan a écrit :
> From: Tero Kristo <t-kristo@ti.com>
> 
> Add two new helper functions pruss_cfg_get_gpmux() & pruss_cfg_set_gpmux()
> to get and set the GP MUX mode for programming the PRUSS internal wrapper
> mux functionality as needed by usecases.

Actually I'm curious about how the GP MUX mode are supposed to work in some
cases. The register mapping in the AM57xx TRM seems confusing.

See the "PRU-ICSS I/O Interface" part about the "PRU-ICSS Internal Wrapper
Multiplexing" [1].

The commit "ARM: dts: am57xx-idk: Add prueth on ICSS" [2] (only in the
TI kernel tree) adds pruss1 and pruss2 for the am571x-idk board.

But this commit doesn't really explain the ti,pruss-gp-mux-sel setting
from pruss1_eth and pruss2_eth:

    /* Dual mac ethernet application node on icss1 */
    pruss1_eth {
    	status = "okay";
    	compatible = "ti,am57-prueth";

    	ti,pruss-gp-mux-sel = <0>,	/* GP, default */
    			      <4>;	/* MII2, needed for PRUSS1_MII1 */
    }

    &pruss2_eth {
    	ti,pruss-gp-mux-sel = <4>,	/* MII2, needed for PRUSS1_MII0 */
    			      <4>;	/* MII2, needed for PRUSS1_MII1 */
    };

At the first look, the two comments in pruss2_eth node about PRUSS1_MIIx seems
dubious. Indeed, it would means that the PRUSS2 setting (ti,pruss-gp-mux-sel) is
required to makes PRUSS1 work.

In my use case, only the pruss1 is expected to be used with the prueth driver.

Actually, the prueth on PRUSS1 partially works with only pruss1_eth's gp-mux
initialized:

    pruss1_eth {
            status = "okay";
            compatible = "ti,am57-prueth";

            ti,pruss-gp-mux-sel = <0>,      /* GP, default */
                                  <4>;      /* MII2, needed for PRUSS1_MII1 */
    }

    pruss2_eth {
            status = "disabled";
    }

(Tests done with the ti-linux-kernel 5.10.y)

On wireshark I noticed ethernet frames (ping) sent from the board but the reply
from the remote PC is never received on the board.

It really seems we need pruss2_eth's gp-mux initialized.
The problem here is that I don't want to enable PRUSS2 just to
configure pruss2_eth's gp-mux for the sake of pruss1.

I had to write manually (using devmem2) the "good" value (0x10002003) in
PRUSS2_CFG0 and PRUSS2_CFG1 to configure entirely the PRUSS1_MII1.

I'm not sure how the driver should handle this register mapping properly.

[1] https://www.ti.com/lit/ds/symlink/am5749.pdf

[2]
https://git.ti.com/cgit/ti-linux-kernel/ti-linux-kernel/commit/?h=linux-5.10.y&id=2a3b089f5697fe2f9a9875b2fba1bef88d196a53

Best regards,
Romain

> 
> Co-developed-by: Suman Anna <s-anna@ti.com>
> Signed-off-by: Suman Anna <s-anna@ti.com>
> Signed-off-by: Tero Kristo <t-kristo@ti.com>
> Co-developed-by: Grzegorz Jaszczyk <grzegorz.jaszczyk@linaro.org>
> Signed-off-by: Grzegorz Jaszczyk <grzegorz.jaszczyk@linaro.org>
> Signed-off-by: Puranjay Mohan <p-mohan@ti.com>
> ---
>  include/linux/pruss_driver.h | 44 ++++++++++++++++++++++++++++++++++++
>  1 file changed, 44 insertions(+)
> 
> diff --git a/include/linux/pruss_driver.h b/include/linux/pruss_driver.h
> index e2d5477225c6..3312281ef4c1 100644
> --- a/include/linux/pruss_driver.h
> +++ b/include/linux/pruss_driver.h
> @@ -35,4 +35,48 @@ struct pruss {
>  	struct clk *iep_clk_mux;
>  };
>  
> +/**
> + * pruss_cfg_get_gpmux() - get the current GPMUX value for a PRU device
> + * @pruss: pruss instance
> + * @pru_id: PRU identifier (0-1)
> + * @mux: pointer to store the current mux value into
> + *
> + * Return: 0 on success, or an error code otherwise
> + */
> +static inline int pruss_cfg_get_gpmux(struct pruss *pruss,
> +				      enum pruss_pru_id pru_id, u8 *mux)
> +{
> +	int ret = 0;
> +	u32 val;
> +
> +	if (pru_id < 0 || pru_id >= PRUSS_NUM_PRUS)
> +		return -EINVAL;
> +
> +	ret = pruss_cfg_read(pruss, PRUSS_CFG_GPCFG(pru_id), &val);
> +	if (!ret)
> +		*mux = (u8)((val & PRUSS_GPCFG_PRU_MUX_SEL_MASK) >>
> +			    PRUSS_GPCFG_PRU_MUX_SEL_SHIFT);
> +	return ret;
> +}
> +
> +/**
> + * pruss_cfg_set_gpmux() - set the GPMUX value for a PRU device
> + * @pruss: pruss instance
> + * @pru_id: PRU identifier (0-1)
> + * @mux: new mux value for PRU
> + *
> + * Return: 0 on success, or an error code otherwise
> + */
> +static inline int pruss_cfg_set_gpmux(struct pruss *pruss,
> +				      enum pruss_pru_id pru_id, u8 mux)
> +{
> +	if (mux >= PRUSS_GP_MUX_SEL_MAX ||
> +	    pru_id < 0 || pru_id >= PRUSS_NUM_PRUS)
> +		return -EINVAL;
> +
> +	return pruss_cfg_update(pruss, PRUSS_CFG_GPCFG(pru_id),
> +				PRUSS_GPCFG_PRU_MUX_SEL_MASK,
> +				(u32)mux << PRUSS_GPCFG_PRU_MUX_SEL_SHIFT);
> +}
> +
>  #endif	/* _PRUSS_DRIVER_H_ */

