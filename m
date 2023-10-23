Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 068A7C25B46
	for <linux-remoteproc@archiver.kernel.org>; Mon, 23 Oct 2023 17:24:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229662AbjJWRYf (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 23 Oct 2023 13:24:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59716 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229537AbjJWRYe (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 23 Oct 2023 13:24:34 -0400
Received: from mail-pg1-x530.google.com (mail-pg1-x530.google.com [IPv6:2607:f8b0:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 40AC0AF
        for <linux-remoteproc@vger.kernel.org>; Mon, 23 Oct 2023 10:24:32 -0700 (PDT)
Received: by mail-pg1-x530.google.com with SMTP id 41be03b00d2f7-5ab94fc098cso1921730a12.1
        for <linux-remoteproc@vger.kernel.org>; Mon, 23 Oct 2023 10:24:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1698081872; x=1698686672; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=BbbHD0YVJk9RufSxoYcq0y3n5cPhLMIwtkNHWUlAfWQ=;
        b=dSOslNcwyAix9UllTlLTRabeAZh85m57t8Mj7ws5bhMzQd+pUnOYxujudcsnJuhJzl
         KnsX1oxZ6VYQXsaBa2QcAW7/WhRFOGxo8nuY8LbAK4J0VFjI0AMHF6ZqwpzpXeDf4K5h
         SqT9kItDb82gSUU7CouIpZMMWrRsf5dwARIzd+7aZJyF6RIFgB0GPusNyPGcXTOpE1i+
         6Oownm+XphIZpUoZg96uZrgqh91bh17MVALhQvYDGrG95bXicAvhVqoe2v2TAqciL8xU
         69WIv2GOzKxPojIllusOYKRbt4DP8etEqczpOMGF5Ajxb/jR5UOk6mov+fsOPUM0mAdJ
         1FsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698081872; x=1698686672;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BbbHD0YVJk9RufSxoYcq0y3n5cPhLMIwtkNHWUlAfWQ=;
        b=U587ozl4E6BaUYTg2SxtEiP78uCUvUXxx2Mb/e+YVo1/DsaUaDQ8+YD5hV3VHaeY+D
         c4op3+Sc1RCZ4FqTP9ruFf8GB1mojO+hgpp18Xi3t5zA44SKusM7Y9ONa+V1tHYVt6PD
         Pf3K6hhO13joU00PluePoKAhTeICZpZo5Jfjzr6G3yy3PjrYTbiWMYPt521ldxFHrvtE
         hkQ4X7acT8wiMV8u7m7FhpNV41i0lJI2PNCYuvzoAEx9514a/M6Pa+c5objwKbSP1W6S
         Oonfk70H2M+51YU0mo5gtgjZkVcV8B0hDIcP4CHi2/1qsK/1rPJuLIy4+LqsX7ry7C4W
         GJ4g==
X-Gm-Message-State: AOJu0Yx0Xi5hyNUAy3u/IQ1s484al0flGuU7X1UhWgljR9WjellnfdDX
        uHPbYkO2i2lTXDR7+JBkRz0B9A==
X-Google-Smtp-Source: AGHT+IH5zn+p2FocGpHxAFS8gSDBMs+R8rkPa0KF41+FQfuasRuzkg4dmkOhZbI85fDx40K/Hlwn2w==
X-Received: by 2002:a05:6a21:498b:b0:17b:d39c:1d6 with SMTP id ax11-20020a056a21498b00b0017bd39c01d6mr239194pzc.30.1698081871694;
        Mon, 23 Oct 2023 10:24:31 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:85b7:8283:12b2:30f8])
        by smtp.gmail.com with ESMTPSA id cx3-20020a17090afd8300b0027d1366d113sm7419661pjb.43.2023.10.23.10.24.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Oct 2023 10:24:31 -0700 (PDT)
Date:   Mon, 23 Oct 2023 11:24:28 -0600
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     "Iuliana Prodan (OSS)" <iuliana.prodan@oss.nxp.com>
Cc:     robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        conor+dt@kernel.org, Shawn Guo <shawnguo@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        alexander.stein@ew.tq-group.com,
        "S.J. Wang" <shengjiu.wang@nxp.com>,
        Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
        Daniel Baluta <daniel.baluta@nxp.com>,
        Mpuaudiosw <Mpuaudiosw@nxp.com>,
        Iuliana Prodan <iuliana.prodan@nxp.com>,
        linux-imx <linux-imx@nxp.com>, linux-remoteproc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        LnxRevLi <LnxRevLi@nxp.com>
Subject: Re: [PATCH v4 2/2] arm64: dts: imx8mp: add reserve-memory nodes for
 DSP
Message-ID: <ZTasTEvw4//SEMlW@p14s>
References: <20231013152731.23471-1-iuliana.prodan@oss.nxp.com>
 <20231013152731.23471-3-iuliana.prodan@oss.nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231013152731.23471-3-iuliana.prodan@oss.nxp.com>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Hey guys,

On Fri, Oct 13, 2023 at 06:27:31PM +0300, Iuliana Prodan (OSS) wrote:
> From: Iuliana Prodan <iuliana.prodan@nxp.com>
> 
> Add the reserve-memory nodes used by DSP when the rpmsg
> feature is enabled.
> 
> Signed-off-by: Iuliana Prodan <iuliana.prodan@nxp.com>
> ---
>  arch/arm64/boot/dts/freescale/imx8mp-evk.dts | 22 ++++++++++++++++++++
>  1 file changed, 22 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/freescale/imx8mp-evk.dts b/arch/arm64/boot/dts/freescale/imx8mp-evk.dts
> index fa37ce89f8d3..b677ad8ef042 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mp-evk.dts
> +++ b/arch/arm64/boot/dts/freescale/imx8mp-evk.dts
> @@ -125,6 +125,28 @@
>  		};
>  
>  	};
> +
> +	reserved-memory {
> +		#address-cells = <2>;
> +		#size-cells = <2>;
> +		ranges;
> +
> +		dsp_vdev0vring0: vdev0vring0@942f0000 {
> +			reg = <0 0x942f0000 0 0x8000>;
> +			no-map;
> +		};
> +
> +		dsp_vdev0vring1: vdev0vring1@942f8000 {
> +			reg = <0 0x942f8000 0 0x8000>;
> +			no-map;
> +		};
> +
> +		dsp_vdev0buffer: vdev0buffer@94300000 {
> +			compatible = "shared-dma-pool";
> +			reg = <0 0x94300000 0 0x100000>;
> +			no-map;
> +		};
> +	};

Alexander: Are you good with the refactoring?

Rob and Krzysztof: I'm not sure if you want to ack this patch but giving you the
benefit of the doubt.

Shawn and Sascha: Did you plan on picking up this patch or shoud I?

Thanks,
Mathieu

>  };
>  
>  &flexspi {
> -- 
> 2.17.1
> 
