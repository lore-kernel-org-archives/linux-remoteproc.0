Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4B911E008B
	for <linux-remoteproc@vger.kernel.org>; Tue,  7 Jan 2025 12:24:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736252655; cv=none; b=rauIbVfs4on+5ZkBgWwUkiVLYHLa7o5RpF95ttmdWoEQFEUrD1xLx05oPLo9iMyt6p/0GpiKx+iKZbtvfJkXL+PkszpTqv4N9eG9HN6DuIYkW3q0aTQjOjNUGO+YD/Ka2/i4Dh+F6bP3x0EtAJQOUxz4lVmGu85RYB8IZBnxS3c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736252655; c=relaxed/simple;
	bh=Ved/w3Cr0aHwMmUTUkkgr8gzvnQZRWZmvxRkeCXncjs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fvO1yRrHUBuf4RGfuUkPgO5F57pufWT+yW9X7qtCWXOIbSTViO+tQdXD9S0d4kFb+P65BjfOtKYXa4sJlbEbucU2UB/x5PM3hENBJrE/ZIhoO9vcxshJmjQxGqApltgc/Qd91N/7s0APUbphcNLdEBRNZMOGQtgU1AWk8CpRuRs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=RFhuSr//; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RFhuSr//"
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-304d760f12aso42411931fa.2
        for <linux-remoteproc@vger.kernel.org>; Tue, 07 Jan 2025 04:24:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736252649; x=1736857449; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=CcK4pPUzky+xJBm/oJEKASVPPcaYHKT+Z8OSXvJ3HBM=;
        b=RFhuSr//nSpCWlVNGeLmIQUZSrDHTBenVELmtWVReXcyyEm4+DMK9BQPP5o9u1EeeI
         YTRs6JpAX8c8Z3f+Jfwykxfp6TBMazhC/EpvVXIgsESqO/WcXPmHa15cokzKHdj6WcpM
         +c9oR3bVOiWo1vE7V/0qZr4wSRMax+iSbCeVpv+9sZa/JdsNZ3qIumUW0Y0Sf+68KLTu
         GHLWABGSklUK/Qm3ssKJHZYqB882edwXkvzpzYRtJKvdDQlUb8v2yABfrK99noWhdY+U
         PFsAFwwVmlEhFEXUC/liNVtxuam48UBWraIHsDERE4YYNd0h7CVVHMVkv/UUv6Raw2IY
         pYUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736252649; x=1736857449;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CcK4pPUzky+xJBm/oJEKASVPPcaYHKT+Z8OSXvJ3HBM=;
        b=Z8RW3KsiAdC/ylo0tjunUjr+bVX+fqOfmYaARnnCkAIZo8i4TBjMlTWwhhgVWBkDg3
         SvhaoA5/ULV1Yb5mGJ9vW7u+9BVkfgm/56nFjiJi+4IPB9z8T7rusDOmwdfDobRUgfEm
         a3EJ202AI1Z1cqt52PE9ztSNrwYoCy5uw2qAKjxzg0dRRxb5o4eK25WaDF9vxq8UGs1S
         zVTxJp7KR2ZvzhmcpPpjUP1FnMmmY7I3XsdWxw0v0rjKxsUVLv8TF8nADdHAiikWqVfB
         0mUxbJQNsU1AhE3Feki84I7t6KNPNsY+4q/l+8E80lPHU+vDrVDZgDee1QCzAwD7xmeM
         Uhjg==
X-Forwarded-Encrypted: i=1; AJvYcCXuP1gBvhlgUDAGHsgqeb6WstGL4AqSNCBaK2PTyh/lrN2O/7cgI7lnGHpFTxd57r+lVRJjWFb2aKuizwF6odIW@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5zSg9ip3HcB73980uzY3/xCI+v3HgUJT+sJDEcfoo1UVREkAS
	M7iK/LKNIDDvB54pw4LIXAtWIkWbGrKFL2tqw2VBEBFPGI9mTvcJ7rYiliNwmjU=
X-Gm-Gg: ASbGnctCtGjZ47r7/MWnTUunwWFLo25pfml2ibcCEbUEtM6YDYxvYO+pwPjZvhJcFl/
	uAzc7zcU5kz5Oe3lh9yeaq4W1ck+lDJMgJSM0OQ9qgiQyal/jfU1kHM64vrufGYa5Z01uflkDxk
	587AD9xy/ugQb0pOhJoAcqmZTv/heatxrky51RjKVZ+ZXwMQ+MLFY02IhXn09A1KyB2N+Ve/CY3
	Kuhs9MpF+oZhPMFyMtxkG4arSXzN7cC51UXmsEfQsSBDY/U2ALYWxse8tbA6GT82CMdO5hu15H3
	75Buaw32smD2bT26lJgmF2zq1zDc0L6FGNdu
X-Google-Smtp-Source: AGHT+IEV5bUCaH/tirUXBo3Gg3ZrZZ9xhb9hq+JFjW19TixgsnKJ/bjfZlwlXb/bpuvcxI0EZhd4xw==
X-Received: by 2002:a05:651c:150b:b0:302:1c90:58f5 with SMTP id 38308e7fff4ca-3046851fa66mr181197271fa.1.1736252649075;
        Tue, 07 Jan 2025 04:24:09 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3045ad6c632sm59101751fa.21.2025.01.07.04.24.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jan 2025 04:24:08 -0800 (PST)
Date: Tue, 7 Jan 2025 14:24:06 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Gokul Sriram Palanisamy <quic_gokulsri@quicinc.com>
Cc: jassisinghbrar@gmail.com, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, andersson@kernel.org, mathieu.poirier@linaro.org, 
	konradybcio@kernel.org, quic_mmanikan@quicinc.com, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
	quic_viswanat@quicinc.com, quic_srichara@quicinc.com
Subject: Re: [PATCH V3 6/8] arm64: dts: qcom: ipq5332: add nodes to bringup q6
Message-ID: <devb6nhgkshbrtiosrc34zwojvamhy75pb3n7poml4qkj2sq5l@wh4dx5uai2pk>
References: <20250107101647.2087358-1-quic_gokulsri@quicinc.com>
 <20250107101647.2087358-7-quic_gokulsri@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250107101647.2087358-7-quic_gokulsri@quicinc.com>

On Tue, Jan 07, 2025 at 03:46:45PM +0530, Gokul Sriram Palanisamy wrote:
> From: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
> 
> Enable nodes required for q6 remoteproc bring up.
> 
> Signed-off-by: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
> Signed-off-by: Gokul Sriram Palanisamy <quic_gokulsri@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/ipq5332.dtsi | 64 ++++++++++++++++++++++++++-
>  1 file changed, 63 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/ipq5332.dtsi b/arch/arm64/boot/dts/qcom/ipq5332.dtsi
> index d3c3e215a15c..85e10b20342a 100644
> --- a/arch/arm64/boot/dts/qcom/ipq5332.dtsi
> +++ b/arch/arm64/boot/dts/qcom/ipq5332.dtsi
> @@ -2,7 +2,7 @@
>  /*
>   * IPQ5332 device tree source
>   *
> - * Copyright (c) 2022-2023 Qualcomm Innovation Center, Inc. All rights reserved.
> + * Copyright (c) 2022-2025 Qualcomm Innovation Center, Inc. All rights reserved.
>   */
>  
>  #include <dt-bindings/clock/qcom,apss-ipq.h>
> @@ -146,6 +146,11 @@ smem@4a800000 {
>  
>  			hwlocks = <&tcsr_mutex 3>;
>  		};
> +
> +		q6_region: wcss@4a900000 {
> +			reg = <0x0 0x4a900000 0x0 0x2b00000>;
> +			no-map;
> +		};
>  	};
>  
>  	soc@0 {
> @@ -479,6 +484,39 @@ frame@b128000 {
>  				status = "disabled";
>  			};
>  		};
> +
> +		q6v5_wcss: remoteproc@d100000 {
> +			compatible = "qcom,ipq5332-wcss-sec-pil";
> +			reg = <0xd100000 0x4040>;
> +			firmware-name = "ath12k/IPQ5332/hw1.0/q6_fw0.mdt";

If the device is fused to use vendor keys, will the same firmware image
work? If not, the remoteproc should be disabled by default and the
firmware-name should go to the board file.

And anyway, please use .mbn

> +			interrupts-extended = <&intc GIC_SPI 421 IRQ_TYPE_EDGE_RISING>,
> +					      <&wcss_smp2p_in 0 IRQ_TYPE_NONE>,
> +					      <&wcss_smp2p_in 1 IRQ_TYPE_NONE>,
> +					      <&wcss_smp2p_in 2 IRQ_TYPE_NONE>,
> +					      <&wcss_smp2p_in 3 IRQ_TYPE_NONE>;
> 

-- 
With best wishes
Dmitry
