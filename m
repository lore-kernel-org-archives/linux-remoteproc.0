Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E57A288C3D;
	Sat, 11 Apr 2026 03:01:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775876476; cv=none; b=uqGc9UvV0VWK91CtnkNbzsAmdl1NF30jUdz8GYDsrM7sYiAzlAmOmz/E4pP3maQOFBcoNLY8yd7TZFV0ojmgrL/rN94eX14nLhwTMbzl7WXCGoMoAwbOonxuGfj/F1L+BpfVdGGxOe7wngPDGg/9lBzTkGDA4peS4P3/s42EIOY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775876476; c=relaxed/simple;
	bh=1hOwTCTLviIdbhUA/wu6I+fdZfwSO9nCYxHp8cKmsog=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HoVE9X5GBaAhG9nRqVwDLt1CsGL5LbfRSDGyrwjQ+Iy/6mA8LFUMhHaX4ciSa3STL/oCxl5Af87BP+qT3xG6XHfAfHINaOktQpv2vwakrr7TK09CDEo8VVcuyaakJCctx7KYa8f/kqPq6D3xBY4g2OAK2pYAdxUNYHiC/oz2xy0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZaBgkScc; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZaBgkScc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B1B41C2BC9E;
	Sat, 11 Apr 2026 03:01:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775876475;
	bh=1hOwTCTLviIdbhUA/wu6I+fdZfwSO9nCYxHp8cKmsog=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZaBgkSccXu5bZR/4mlmKhoNEQrp7sY5rePTIiCSQQnxQkwKEmCFLI8V/3Ui87uaxf
	 gsT9c7yWyNP10y956QFWHQW8SxPUkz9ob3PIDj52DH5fsyUT1t75eWKoS8wLfHMZ02
	 tMpIQGJrxKiVnJ52xbkAL3nprYs1ORw8jTGsMEY6sZ19KYejyY2Gei1MlRxtwl7E5s
	 YSEFDoxqQ9/JIkHNC83g3VV7fZjoNBhvNxzKlYKjET9T/ufB8dK7N/f2czZui+7+fm
	 /yZGn/tLVOWwSjqC4HOJY9pP3DteGn3Hi08ilO18S3WB2pTHwmGnc3+3G30oqWA1pM
	 +BVr8uMUBPP3Q==
Date: Fri, 10 Apr 2026 22:01:11 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>, 
	Luca Weiss <luca.weiss@fairphone.com>, Bartosz Golaszewski <brgl@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com, 
	trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com, linux-arm-msm@vger.kernel.org, 
	linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: Re: [PATCH v5 5/5] remoteproc: qcom_q6v5_pas: Add SoCCP node on
 Kaanapali
Message-ID: <adm5M9oxm99UxmaS@baldur>
References: <20260409-knp-soccp-v5-0-805a492124da@oss.qualcomm.com>
 <20260409-knp-soccp-v5-5-805a492124da@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260409-knp-soccp-v5-5-805a492124da@oss.qualcomm.com>

On Thu, Apr 09, 2026 at 01:52:28AM -0700, Jingyi Wang wrote:
> The SoC Control Processor (SoCCP) is small RISC-V MCU that controls
> USB Type-C, battery charging and various other functions on Qualcomm SoCs.
> It provides a solution for control-plane processing, reducing per-subsystem
> microcontroller reinvention. Add support for SoCCP PAS loader on Kaanapali
> platform.
> 

Very nice commit message.

(Patch looks good as well)

Thank you,
Bjorn

> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
> ---
>  drivers/remoteproc/qcom_q6v5_pas.c | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
> 
> diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
> index 34b54cf832d0..1c81f22438cc 100644
> --- a/drivers/remoteproc/qcom_q6v5_pas.c
> +++ b/drivers/remoteproc/qcom_q6v5_pas.c
> @@ -1604,8 +1604,26 @@ static const struct qcom_pas_data sm8750_mpss_resource = {
>  	.region_assign_vmid = QCOM_SCM_VMID_MSS_MSA,
>  };
>  
> +static const struct qcom_pas_data kaanapali_soccp_resource = {
> +	.crash_reason_smem = 656,
> +	.firmware_name = "soccp.mbn",
> +	.dtb_firmware_name = "soccp_dtb.mbn",
> +	.pas_id = 51,
> +	.dtb_pas_id = 0x41,
> +	.proxy_pd_names = (char*[]){
> +		"cx",
> +		"mx",
> +		NULL
> +	},
> +	.ssr_name = "soccp",
> +	.sysmon_name = "soccp",
> +	.auto_boot = true,
> +	.early_boot = true,
> +};
> +
>  static const struct of_device_id qcom_pas_of_match[] = {
>  	{ .compatible = "qcom,eliza-adsp-pas", .data = &sm8550_adsp_resource },
> +	{ .compatible = "qcom,kaanapali-soccp-pas", .data = &kaanapali_soccp_resource },
>  	{ .compatible = "qcom,milos-adsp-pas", .data = &sm8550_adsp_resource },
>  	{ .compatible = "qcom,milos-cdsp-pas", .data = &milos_cdsp_resource },
>  	{ .compatible = "qcom,milos-mpss-pas", .data = &sm8450_mpss_resource },
> 
> -- 
> 2.34.1
> 
