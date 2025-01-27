Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D23A11FCFE6
	for <linux-remoteproc@vger.kernel.org>; Mon, 27 Jan 2025 09:25:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737969912; cv=none; b=lYzWxxOn4SQVo+8ifLltbQSIqW3fe8nNDjsAXW8m/CUyS6h0aDTPEU6jE7FEKv2WRpcn/dgUEHCq3sxOayBIqiUzpsSTmDYR7+JIqENeJdLvHe7QbH7QVMamAykWu7VjI9mUUIR8TeZUSE1BlPUktrIYss6P5REeY/YWjTEH8Pw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737969912; c=relaxed/simple;
	bh=56tDzFIXEtGdOtC9F0MtvNxSVAr7SnGQwGbOoV+MHFM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IOW5EpJ+8cGQM4B2CAyFl0+uINqeA0oMzIt5hVY9ze79p+dMdQSU4O1c8SL6IFA8OArT7v2l3lHTSQcu58yFTDdWFiO8kPvGiQI+bCtuNhhDIQE6+UnexNQuYeaWPB4XmrP5H/W5ZNLPDLXMt4jeseb2YX6vhTJqwTllvce7QFw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=OOxTlSu+; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OOxTlSu+"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-aa684b6d9c7so752132266b.2
        for <linux-remoteproc@vger.kernel.org>; Mon, 27 Jan 2025 01:25:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737969908; x=1738574708; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=hIYVqZqrG/5LtvA8vm5og/V+cG1TdUFNI7a3hbvY91Q=;
        b=OOxTlSu+0HFi/tKKRF91XtJ5KuTQj+AXAtQeGBp1HXSe4n2O64g95cXyMBfRns7joL
         CUyWAxQMbBxLUP1sFYIni4XGqwH8tnItX5nVYrEwHo3XLf27B9onOPj30oqKOrWuTMRC
         SFZptmII6UMeR8xIq2whPq1M/7UzSbGjZ9e0Uh/R/IMv2zdKV4CB/B9bHTO6XIMobbv0
         ePU9xjfYZ24xYM/0OXM1cqMcuF4HpuFHjYnwx6us3+uTYtGJqQ78vxiQ0CxZgoiDyGCH
         HbSy2hbtP3bwljz1jwKaWf/H4z7tWV5QtHigUUBh4DxkAIYqEJsLPnqVvWuMGmfhtp3M
         YvXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737969908; x=1738574708;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hIYVqZqrG/5LtvA8vm5og/V+cG1TdUFNI7a3hbvY91Q=;
        b=WHhYJDp+BBT0D8SROy2hK2MSJG52k3+FfAJq2ixKNGWRsvYFn/QWcMqHi/Qn+Ldha4
         0/F3ogODsEp3x6gY4QB8QbdcZJH2BrDqQaH+sMv/r90fbKKs5IggQXR/nNju5Vgp0u8o
         MRcHKEI/Bm5CE+XBtABcknar4ATuN8uVEq4/dNOvdjrslVsE26v3qRCap5Nsy6y/FoF2
         iTX+aGwoed5nlalOGcgvtJQo9QvqJiy6fAIl7KP/8QZuHipNgYj3uIAR3u08s/D4UaOj
         Cg8Pi1Ddk3NJN/qLKcr9AQUT0RVQBVY8+GxcCuYB+7KN0ayV3a7r7X9D1GmOrx6S1R3Z
         CX3A==
X-Forwarded-Encrypted: i=1; AJvYcCXppcorR8wqCZLDSx1MESUPwADibsu68ptt2jrgoYLcYYB+qasnieFcyQ2tMtSgYZQld6ywCrJ5CPYpqBRYm1u7@vger.kernel.org
X-Gm-Message-State: AOJu0YzP1x7GONkGWmFnjD+WdHdO44XyjSYYWRrc35O7J3WfNMVNS5Yf
	OBRBYh/jB0Z/n4hG5rYu/pKjxp/kIqDlN0/VzPjPwTz70rqsKY/Fc1ZCXQ+aCW8=
X-Gm-Gg: ASbGncsftMXduiuE06BZ5Hi2523N9SahHdXbhkrZVeRZX27BY/uExLg4tVlOvWvztX3
	gsCwcJvtk0nixSplV1srvDc+D8b2tR86hy8WGH3d3KId7sWomQIKsi1jC49e7xDYwo6sRNvWXnm
	/UvF9/MYb52F0ahPXJBINyoE+pIBIDcTpWzK0X5tujCzYa7BNpeP64kBEVwgQyhNqOxJJpSiYfP
	ErF9j5HTLmoRCUEsNDe2hGc+WtJZbDiMczFuqu+yQ2sdQYXBdeJ1TEFf8jZLnj1Lkxe8dGJRSSe
	dr7wBtR6C9XQaAdQ
X-Google-Smtp-Source: AGHT+IHaEZMeqHr5SVpC9d6i67wUVow77h2AjUw0E2EtYt8mel2FDSwOAFgQY8C9TalXT4MhrOnaHw==
X-Received: by 2002:a17:907:1b1d:b0:aa6:834b:d138 with SMTP id a640c23a62f3a-ab38b1122e8mr3658238866b.19.1737969908146;
        Mon, 27 Jan 2025 01:25:08 -0800 (PST)
Received: from linaro.org ([2a02:2454:ff21:ef30:f64e:7d70:e55f:6da8])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab693f51ed8sm306255866b.53.2025.01.27.01.25.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jan 2025 01:25:07 -0800 (PST)
Date: Mon, 27 Jan 2025 10:25:05 +0100
From: Stephan Gerhold <stephan.gerhold@linaro.org>
To: Luca Weiss <luca@lucaweiss.eu>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
	Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Stephan Gerhold <stephan@gerhold.net>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Matti =?iso-8859-1?Q?Lehtim=E4ki?= <matti.lehtimaki@gmail.com>,
	linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 8/9] ARM: dts: qcom: msm8226: Add BAM DMUX Ethernet/IP
 device
Message-ID: <Z5dQ8Zu3zlSlkJj_@linaro.org>
References: <20250126-msm8226-modem-v2-0-e88d76d6daff@lucaweiss.eu>
 <20250126-msm8226-modem-v2-8-e88d76d6daff@lucaweiss.eu>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250126-msm8226-modem-v2-8-e88d76d6daff@lucaweiss.eu>

On Sun, Jan 26, 2025 at 09:57:27PM +0100, Luca Weiss wrote:
> BAM DMUX is used as the network interface to the modem.
> 
> Signed-off-by: Luca Weiss <luca@lucaweiss.eu>

Reviewed-by: Stephan Gerhold <stephan.gerhold@linaro.org>

> ---
>  arch/arm/boot/dts/qcom/qcom-msm8226.dtsi | 26 ++++++++++++++++++++++++++
>  1 file changed, 26 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/qcom/qcom-msm8226.dtsi b/arch/arm/boot/dts/qcom/qcom-msm8226.dtsi
> index f7f57c3f583557830c0a6dc9f0eebc2ddebbbe3c..5e82d871b81019d2f4f84d1228e8e9278ac44be3 100644
> --- a/arch/arm/boot/dts/qcom/qcom-msm8226.dtsi
> +++ b/arch/arm/boot/dts/qcom/qcom-msm8226.dtsi
> @@ -914,6 +914,18 @@ spmi_bus: spmi@fc4cf000 {
>  			#interrupt-cells = <4>;
>  		};
>  
> +		bam_dmux_dma: dma-controller@fc834000 {
> +			compatible = "qcom,bam-v1.4.0";
> +			reg = <0xfc834000 0x7000>;
> +			interrupts = <GIC_SPI 29 IRQ_TYPE_LEVEL_HIGH>;
> +			#dma-cells = <1>;
> +			qcom,ee = <0>;
> +
> +			num-channels = <6>;
> +			qcom,num-ees = <1>;
> +			qcom,powered-remotely;
> +		};
> +
>  		modem: remoteproc@fc880000 {
>  			compatible = "qcom,msm8226-mss-pil";
>  			reg = <0xfc880000 0x100>,
> @@ -949,6 +961,20 @@ modem: remoteproc@fc880000 {
>  
>  			status = "disabled";
>  
> +			bam_dmux: bam-dmux {
> +				compatible = "qcom,bam-dmux";
> +
> +				interrupt-parent = <&modem_smsm>;
> +				interrupts = <1 IRQ_TYPE_EDGE_BOTH>, <11 IRQ_TYPE_EDGE_BOTH>;
> +				interrupt-names = "pc", "pc-ack";
> +
> +				qcom,smem-states = <&apps_smsm 1>, <&apps_smsm 11>;
> +				qcom,smem-state-names = "pc", "pc-ack";
> +
> +				dmas = <&bam_dmux_dma 4>, <&bam_dmux_dma 5>;
> +				dma-names = "tx", "rx";
> +			};
> +
>  			smd-edge {
>  				interrupts = <GIC_SPI 25 IRQ_TYPE_EDGE_RISING>;
>  
> 
> -- 
> 2.48.1
> 
