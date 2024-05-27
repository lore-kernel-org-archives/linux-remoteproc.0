Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE83613A24D
	for <linux-remoteproc@vger.kernel.org>; Mon, 27 May 2024 09:29:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716802163; cv=none; b=INqG515Z+HOjG7srOqqCkYOdmBYbFe5vu3cbelsc7KhoSaAKyiY3COT7hkKZ2bABP/7xows14M8Bc45NUPVuOoEkgpC6HyF9/nkH4uZRuTLwxpZ3RHxgWOSWL10kXIprYu/gqtseWjDE1+BFvfS+jqrzlCE99IBughSzWA/MMlc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716802163; c=relaxed/simple;
	bh=kvVFdGrNcegGGGe43bP7T/2vXbXZD1tWa+/RduW+LMo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nL3kxArXJGRqv8UMgX1H6kJ11EpJr909zMWrOiRyl43KzrGL9tHq2HWFgXe/3DLyQJXO9wHgdf8mPMyT8cACDM7UKv1WfQZVMmzUNQSQ3y5gkbeBHeCt62khODSL8+rzW0l80rqOdiyspcQzciwAHqNivQkfoYZYOtKkKV3H5IE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jJ3zRkc0; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jJ3zRkc0"
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5295dada905so2443172e87.1
        for <linux-remoteproc@vger.kernel.org>; Mon, 27 May 2024 02:29:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716802159; x=1717406959; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ChcvXVThIVG5TbcAKCOtU8ihiPd2mzmq71DfR9Nr0H0=;
        b=jJ3zRkc0hm78tZOlN35Ri/K7Z9nKz+iySihdLsLTT40pnP41keMhP6OD2Gn2KLDt1r
         hRsPHVzGaee/xihE4eLBUOMPwxquaKjoQGzboKjQ5RJWMiwBaZDup/hzrpyQ4PSc3iSV
         ZC80O0Lpi0Z9ENHvf8DpG72kbj5sjw92UMtDda80KSykQhWFzR/9rxfg+jhkPEo+805p
         4q/t4cBYsHy0Znnh35oH4hW90Owrs1c60fApGMGNgvmSqiN+ULVJ4obno92VMJwnPPrg
         nID+CibQ77Hg80ksx9VhetChQrsIYxi3WULnpDlpRqiga1qdMkBdLj1f1NO/GKgrnvYn
         2DYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716802159; x=1717406959;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ChcvXVThIVG5TbcAKCOtU8ihiPd2mzmq71DfR9Nr0H0=;
        b=fQTFd7L0eqVkyu8Kll60AGQxd3RReSDP0lAcDUdC2FNCnpfoY9GT6bv60/w+DHlrJT
         wWqLghjaeOzOtxoNTWX89tRLA5mQyp9ROeocrQrrYHU4zy0XOerJ294t/9Hlv4Ddj0lM
         eJ9gbxiJKVT4dqfKOGzhBmvK9y9Uv+3z1tfLM9YL93qQxq+yaqrKUdQ/rl56dDakvuoK
         xYeokOYmIMD/mWygDVREXgZesC2QsRgJFVvmxGL9n16bLjNrcOs1yAkaBodWIZvUksMW
         32Apy/90WctLXER8kFCD+uoE4tHtaaNUCaFt4Niuoue6Uruis2FBlTcmKqaetfoD1dPV
         QiHw==
X-Forwarded-Encrypted: i=1; AJvYcCWC1PMJ+rUvEWozhLofiCe6RTReujG7//xitqqqR0+35Q5kk9q41d9zEHCtyJZADqcbqRP34Tq2p836aG6Sn8WHZ23T8xrgUemEPtXY7sBrNg==
X-Gm-Message-State: AOJu0YxdfeeHfqJvW850YahzgQPb+NgEUJtMX6QE3lN4Vm5unC8hnPqJ
	i8KG0HDB0D6uJxM3IoGlYoq0cIQKHDgsB2buhcBktVN2a/xpvvGtTkRNRacpkMs=
X-Google-Smtp-Source: AGHT+IEUQfcVQur+d8EXVuV+Z6FnGa6g3dG1LyX/QDfvUkdTANYheRA0kp5x4fUXbjvtAWsLpazd/A==
X-Received: by 2002:a05:6512:12cc:b0:529:a76f:e172 with SMTP id 2adb3069b0e04-529a76fe18cmr1964113e87.14.1716802159079;
        Mon, 27 May 2024 02:29:19 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::227])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-529716df1fasm519782e87.308.2024.05.27.02.29.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 May 2024 02:29:18 -0700 (PDT)
Date: Mon, 27 May 2024 12:29:17 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
	Jassi Brar <jassisinghbrar@gmail.com>, Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
	linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Tengfei Fan <quic_tengfan@quicinc.com>, 
	Srini Kandagatla <srinivas.kandagatla@linaro.org>, Alex Elder <elder@kernel.org>
Subject: Re: [PATCH v2 3/5] remoteproc: qcom_q6v5_pas: Add support for
 SA8775p ADSP, CDSP and GPDSP
Message-ID: <jb2ug4gabow7v3kjxo5aszyjpsyh7nvnmsvrn57vpnvmkkr6fp@d6atdj2suaff>
References: <20240527-topic-lemans-iot-remoteproc-v2-0-8d24e3409daf@linaro.org>
 <20240527-topic-lemans-iot-remoteproc-v2-3-8d24e3409daf@linaro.org>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240527-topic-lemans-iot-remoteproc-v2-3-8d24e3409daf@linaro.org>

On Mon, May 27, 2024 at 10:43:50AM +0200, Bartosz Golaszewski wrote:
> From: Tengfei Fan <quic_tengfan@quicinc.com>
> 
> Add support for PIL loading on ADSP, CDSP0, CDSP1, GPDSP0 and GPDSP1 on
> SA8775p SoCs.
> 
> Signed-off-by: Tengfei Fan <quic_tengfan@quicinc.com>
> Co-developed-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---
>  drivers/remoteproc/qcom_q6v5_pas.c | 92 ++++++++++++++++++++++++++++++++++++++
>  1 file changed, 92 insertions(+)
> 
> diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
> index 54d8005d40a3..16053aa99298 100644
> --- a/drivers/remoteproc/qcom_q6v5_pas.c
> +++ b/drivers/remoteproc/qcom_q6v5_pas.c
> @@ -820,6 +820,23 @@ static const struct adsp_data adsp_resource_init = {
>  	.ssctl_id = 0x14,
>  };
>  
> +static const struct adsp_data sa8775p_adsp_resource = {
> +	.crash_reason_smem = 423,
> +	.firmware_name = "adsp.mdt",

mbn please.

Other than that LGTM

> +	.pas_id = 1,
> +	.minidump_id = 5,
> +	.auto_boot = true,
> +	.proxy_pd_names = (char*[]){
> +		"lcx",
> +		"lmx",
> +		NULL
> +	},
> +	.load_state = "adsp",
> +	.ssr_name = "lpass",
> +	.sysmon_name = "adsp",
> +	.ssctl_id = 0x14,
> +};
> +
>  static const struct adsp_data sdm845_adsp_resource_init = {
>  	.crash_reason_smem = 423,
>  	.firmware_name = "adsp.mdt",
> @@ -933,6 +950,42 @@ static const struct adsp_data cdsp_resource_init = {
>  	.ssctl_id = 0x17,
>  };
>  
> +static const struct adsp_data sa8775p_cdsp0_resource = {
> +	.crash_reason_smem = 601,
> +	.firmware_name = "cdsp0.mdt",
> +	.pas_id = 18,
> +	.minidump_id = 7,
> +	.auto_boot = true,
> +	.proxy_pd_names = (char*[]){
> +		"cx",
> +		"mxc",
> +		"nsp0",
> +		NULL
> +	},
> +	.load_state = "cdsp",
> +	.ssr_name = "cdsp",
> +	.sysmon_name = "cdsp",
> +	.ssctl_id = 0x17,
> +};
> +
> +static const struct adsp_data sa8775p_cdsp1_resource = {
> +	.crash_reason_smem = 633,
> +	.firmware_name = "cdsp1.mdt",
> +	.pas_id = 30,
> +	.minidump_id = 20,
> +	.auto_boot = true,
> +	.proxy_pd_names = (char*[]){
> +		"cx",
> +		"mxc",
> +		"nsp1",
> +		NULL
> +	},
> +	.load_state = "nsp",
> +	.ssr_name = "cdsp1",
> +	.sysmon_name = "cdsp1",
> +	.ssctl_id = 0x20,
> +};
> +
>  static const struct adsp_data sdm845_cdsp_resource_init = {
>  	.crash_reason_smem = 601,
>  	.firmware_name = "cdsp.mdt",
> @@ -1074,6 +1127,40 @@ static const struct adsp_data sm8350_cdsp_resource = {
>  	.ssctl_id = 0x17,
>  };
>  
> +static const struct adsp_data sa8775p_gpdsp0_resource = {
> +	.crash_reason_smem = 640,
> +	.firmware_name = "gpdsp0.mdt",
> +	.pas_id = 39,
> +	.minidump_id = 21,
> +	.auto_boot = true,
> +	.proxy_pd_names = (char*[]){
> +		"cx",
> +		"mxc",
> +		NULL
> +	},
> +	.load_state = "gpdsp0",
> +	.ssr_name = "gpdsp0",
> +	.sysmon_name = "gpdsp0",
> +	.ssctl_id = 0x21,
> +};
> +
> +static const struct adsp_data sa8775p_gpdsp1_resource = {
> +	.crash_reason_smem = 641,
> +	.firmware_name = "gpdsp1.mdt",
> +	.pas_id = 40,
> +	.minidump_id = 22,
> +	.auto_boot = true,
> +	.proxy_pd_names = (char*[]){
> +		"cx",
> +		"mxc",
> +		NULL
> +	},
> +	.load_state = "gpdsp1",
> +	.ssr_name = "gpdsp1",
> +	.sysmon_name = "gpdsp1",
> +	.ssctl_id = 0x22,
> +};
> +
>  static const struct adsp_data mpss_resource_init = {
>  	.crash_reason_smem = 421,
>  	.firmware_name = "modem.mdt",
> @@ -1315,6 +1402,11 @@ static const struct of_device_id adsp_of_match[] = {
>  	{ .compatible = "qcom,qcs404-adsp-pas", .data = &adsp_resource_init },
>  	{ .compatible = "qcom,qcs404-cdsp-pas", .data = &cdsp_resource_init },
>  	{ .compatible = "qcom,qcs404-wcss-pas", .data = &wcss_resource_init },
> +	{ .compatible = "qcom,sa8775p-adsp-pas", .data = &sa8775p_adsp_resource},
> +	{ .compatible = "qcom,sa8775p-cdsp0-pas", .data = &sa8775p_cdsp0_resource},
> +	{ .compatible = "qcom,sa8775p-cdsp1-pas", .data = &sa8775p_cdsp1_resource},
> +	{ .compatible = "qcom,sa8775p-gpdsp0-pas", .data = &sa8775p_gpdsp0_resource},
> +	{ .compatible = "qcom,sa8775p-gpdsp1-pas", .data = &sa8775p_gpdsp1_resource},
>  	{ .compatible = "qcom,sc7180-adsp-pas", .data = &sm8250_adsp_resource},
>  	{ .compatible = "qcom,sc7180-mpss-pas", .data = &mpss_resource_init},
>  	{ .compatible = "qcom,sc7280-adsp-pas", .data = &sm8350_adsp_resource},
> 
> -- 
> 2.43.0
> 

-- 
With best wishes
Dmitry
