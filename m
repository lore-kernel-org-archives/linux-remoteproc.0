Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E920EDEC43
	for <linux-remoteproc@archiver.kernel.org>; Wed, 13 Sep 2023 11:35:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240388AbjIMLfY (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 13 Sep 2023 07:35:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33418 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240492AbjIMLfM (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 13 Sep 2023 07:35:12 -0400
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com [IPv6:2a00:1450:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ACFC51FF2
        for <linux-remoteproc@vger.kernel.org>; Wed, 13 Sep 2023 04:34:52 -0700 (PDT)
Received: by mail-ed1-x532.google.com with SMTP id 4fb4d7f45d1cf-52a250aa012so8665945a12.3
        for <linux-remoteproc@vger.kernel.org>; Wed, 13 Sep 2023 04:34:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694604891; x=1695209691; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=86DQ4dbXO3ltBvM0+Xx3eqvo5Kea0JEzESAZn6J7D1g=;
        b=GO4qH7Px50FMG3XikTCe/PkfJTl+q0yQUNFDr4JG9QJeuviyTapdHEH+jtPuGkQVEK
         d6B9BiZKEQYWp1qDldHu3xPxrUNfLQODL0QXI59sEcE4Me4G5SeK48aAV6b6Z8gvVyeh
         Y874CPbgCgXf3BIRicjUCogzVl5ruJiW6/ulBvYWTxcv334pGLgw2js0l8bMfPzZegsC
         e2KTgmEsuCmoXHHTckZgt2P8nt5ei1Aqsq59l+fqT+7pk4HmrsF5p2Hp4gnNJlZMtWgL
         b0tgCAk2EDmN5iVY7oUFxMEQngjmqI3n+8MhnJPoqIjmhGJZNqqNv+Nel7LCK2+IKrmi
         K0eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694604891; x=1695209691;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=86DQ4dbXO3ltBvM0+Xx3eqvo5Kea0JEzESAZn6J7D1g=;
        b=I0ciWcIy8IDKU29mrRS9rroLTzLaHNJs9qK66/TgTb8GdB/5NokgpQhgap41LSQGvq
         GWvDHcpTkupnE2hGdb46y5qKFnbcuUdmBK9H8UnZ3nn8xrfjcP6kBUesQssu1HSCcv3v
         GokGEgg/bf2u9w0/2RHWUVx80NZXAQ4fech6sZNSMZ+jvh1/oMhXOo+jxlJAxnzGwv84
         02kKC8h89p9zq64uez6tdRomywlqeMdi6AXHDtxGJwN1WTQXrUdUgHdBtu3YM5DkuG2e
         YzqaQyd/T20Te2tnE2BgFGYtG9Aa706yrcz5Rgk9PzSF1QhSzkfzIpETcfVmjt5JBC3x
         oG1w==
X-Gm-Message-State: AOJu0YxYq6BgD8sizDrAWg/yZFl0e3qBkqamMGD+V0g6gkYGYB4dCDqp
        EtB6f75UXvr03mZaN0Qa/UsRwQ==
X-Google-Smtp-Source: AGHT+IHi5PfiV1i8W1FVPsm2gMd9DnF1UJBCVdqq2qVQD6JwR4/8C2dGtRLWDlARgmhxaq1wkdWzVQ==
X-Received: by 2002:aa7:d349:0:b0:52f:a6e4:28c6 with SMTP id m9-20020aa7d349000000b0052fa6e428c6mr1990355edr.12.1694604891138;
        Wed, 13 Sep 2023 04:34:51 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.214.188])
        by smtp.gmail.com with ESMTPSA id s8-20020a056402164800b0052ea03b9d05sm7154232edx.85.2023.09.13.04.34.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 Sep 2023 04:34:50 -0700 (PDT)
Message-ID: <1b3e6111-b2fe-b652-6208-e33bca863159@linaro.org>
Date:   Wed, 13 Sep 2023 13:34:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH v6 4/4] remoteproc: k3-m4: Add a remoteproc driver for M4F
 subsystem
Content-Language: en-US
To:     Hari Nagalla <hnagalla@ti.com>, andersson@kernel.org,
        mathieu.poirier@linaro.org, p.zabel@pengutronix.de,
        martyn.welch@collabora.com, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org
Cc:     linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
References: <20230913111644.29889-1-hnagalla@ti.com>
 <20230913111644.29889-5-hnagalla@ti.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230913111644.29889-5-hnagalla@ti.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On 13/09/2023 13:16, Hari Nagalla wrote:
> From: Martyn Welch <martyn.welch@collabora.com>
> 
> The AM62x and AM64x SoCs of the TI K3 family has a Cortex M4F core in
> the MCU domain. This core is typically used for safety applications in a
> stand alone mode. However, some application (non safety related) may
> want to use the M4F core as a generic remote processor with IPC to the
> host processor. The M4F core has internal IRAM and DRAM memories and are
> exposed to the system bus for code and data loading.
> 
> A remote processor driver is added to support this subsystem, including
> being able to load and boot the M4F core. Loading includes to M4F
> internal memories and predefined external code/data memories. The
> carve outs for external contiguous memory is defined in the M4F device
> node and should match with the external memory declarations in the M4F
> image binary. The M4F subsystem has two resets. One reset is for the
> entire subsystem i.e including the internal memories and the other, a
> local reset is only for the M4F processing core. When loading the image,
> the driver first releases the subsystem reset, loads the firmware image
> and then releases the local reset to let the M4F processing core run.
> 
> Signed-off-by: Martyn Welch <martyn.welch@collabora.com>
> Signed-off-by: Hari Nagalla <hnagalla@ti.com>
> ---
> Changes since v1:
>  - Addressed minor review comments (refactoring completed in separate
>    patch)
> 
> Changes since v2:
>  - Refactoring completed first, thus smaller change
> 
> Changes since v3:
>  - Removed 'ipc_only' flag and made changes in probe() to enact right
>    operations
>  - Fixed spelling mistakes in commit message
>  - Changed some 'dev_err' messages to 'dev_info'
>  - Removed unnecessary checks rproc state
> 
> Changes since v4:
>  - None
> 
> Changes since v5:
>  - None
> 
>  drivers/remoteproc/Kconfig               |  13 +
>  drivers/remoteproc/Makefile              |   1 +
>  drivers/remoteproc/ti_k3_m4_remoteproc.c | 331 +++++++++++++++++++++++
>  3 files changed, 345 insertions(+)
>  create mode 100644 drivers/remoteproc/ti_k3_m4_remoteproc.c
> 
> diff --git a/drivers/remoteproc/Kconfig b/drivers/remoteproc/Kconfig
> index 48845dc8fa85..85c1a3a2b987 100644
> --- a/drivers/remoteproc/Kconfig
> +++ b/drivers/remoteproc/Kconfig
> @@ -339,6 +339,19 @@ config TI_K3_DSP_REMOTEPROC
>  	  It's safe to say N here if you're not interested in utilizing
>  	  the DSP slave processors.
>  
> +config TI_K3_M4_REMOTEPROC
> +	tristate "TI K3 M4 remoteproc support"
> +	depends on ARCH_K3
> +	select MAILBOX
> +	select OMAP2PLUS_MBOX
> +	help
> +	  Say m here to support TI's M4 remote processor subsystems
> +	  on various TI K3 family of SoCs through the remote processor
> +	  framework.
> +
> +	  It's safe to say N here if you're not interested in utilizing
> +	  a remote processor.
> +
>  config TI_K3_R5_REMOTEPROC
>  	tristate "TI K3 R5 remoteproc support"
>  	depends on ARCH_K3
> diff --git a/drivers/remoteproc/Makefile b/drivers/remoteproc/Makefile
> index 55c552e27a45..e30908ca4bfc 100644
> --- a/drivers/remoteproc/Makefile
> +++ b/drivers/remoteproc/Makefile
> @@ -37,5 +37,6 @@ obj-$(CONFIG_ST_REMOTEPROC)		+= st_remoteproc.o
>  obj-$(CONFIG_ST_SLIM_REMOTEPROC)	+= st_slim_rproc.o
>  obj-$(CONFIG_STM32_RPROC)		+= stm32_rproc.o
>  obj-$(CONFIG_TI_K3_DSP_REMOTEPROC)	+= ti_k3_dsp_remoteproc.o ti_k3_common.o
> +obj-$(CONFIG_TI_K3_M4_REMOTEPROC)	+= ti_k3_m4_remoteproc.o ti_k3_common.o

Nope, please compile your code and fix all the warnings. There is a big
fat warning about including objects twice.

Best regards,
Krzysztof

