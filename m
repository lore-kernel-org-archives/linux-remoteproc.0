Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81A3140DFA1;
	Sat, 11 Apr 2026 03:04:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775876698; cv=none; b=fC3S+RmZSgwpBGtcd1zEYmH9gPaq87Qwldnx6dF0sUXmkZUBoo9zVu11j//QbW5B3wDArhOEDoUm3BmZkmFHbOWDJ8d1QhSLF9BhnQSkDIznz9hhU4wmYDgUrcMcVmcRJXOecPlDrQCaSRA8e9znnlqFozWHmLYph3S9syp4T8I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775876698; c=relaxed/simple;
	bh=V2ZILMX/p1oNZIi2ItoaXn+8Uc/hwLMsXf8VNamhx3c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Tlhtm2EtFxcwRha/PeN86ytvZf/ANN83Tl5Avb4gC5dhSOfKFK5hcxFUehPuDRxOMVfDqo8PuHTsCXzLJrMYN7CNrcoFuzV0dKVSk5tR/HdAPpTxRRa3gwA7b1DJu0HMmt8gxHc2TjjF8oNpbSiPk4cPOVpFYJWs330jdNQplVc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=k2Dsp8/k; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="k2Dsp8/k"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0E00C19421;
	Sat, 11 Apr 2026 03:04:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775876698;
	bh=V2ZILMX/p1oNZIi2ItoaXn+8Uc/hwLMsXf8VNamhx3c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=k2Dsp8/k4eYR+QuBLlvvJSYydSsJCifyoR3EUrPA0gLinV584O3wzcYHolAFEOq5W
	 94fXeH62BwlaATz5qdBBNm2mpPItO79/bsNeQU5y9I1Cy2Z2xRY9w01CJ43Uca2j+B
	 ljItjdW+dMA2VTYYqoFCrcNBg/tqI5AwFb/T3+zWYu9D0EPQvUtdMAGljLvV7vrvDb
	 soM9krwk9djirpFRcbvuHvN6S8rPji/ZH+xZ/Z+3k/+ToTu7BBNOp07jThicP+yq0i
	 qKzwHFg/XZrLmjhc1wXYlEDquehdJtRjtN20JxsPaDVbYI19Q7/jso5l0FU7E3qJg6
	 uWO3Yb1gZPbnw==
Date: Fri, 10 Apr 2026 22:04:54 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>, 
	Luca Weiss <luca.weiss@fairphone.com>, Bartosz Golaszewski <brgl@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com, 
	trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com, linux-arm-msm@vger.kernel.org, 
	linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Gokul Krishna Krishnakumar <gokul.krishnakumar@oss.qualcomm.com>
Subject: Re: [PATCH v5 4/5] remoteproc: qcom: pas: Add late attach support
 for subsystems
Message-ID: <adm56u_cDoKnuPob@baldur>
References: <20260409-knp-soccp-v5-0-805a492124da@oss.qualcomm.com>
 <20260409-knp-soccp-v5-4-805a492124da@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260409-knp-soccp-v5-4-805a492124da@oss.qualcomm.com>

On Thu, Apr 09, 2026 at 01:52:27AM -0700, Jingyi Wang wrote:
[..]
> diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
> index da27d1d3c9da..34b54cf832d0 100644
> --- a/drivers/remoteproc/qcom_q6v5_pas.c
> +++ b/drivers/remoteproc/qcom_q6v5_pas.c
> @@ -60,6 +60,7 @@ struct qcom_pas_data {
>  	int region_assign_count;
>  	bool region_assign_shared;
>  	int region_assign_vmid;
> +	bool early_boot;
>  };
>  
>  struct qcom_pas {
> @@ -423,9 +424,15 @@ static int qcom_pas_stop(struct rproc *rproc)
>  
>  	qcom_pas_unmap_carveout(rproc, pas->mem_phys, pas->mem_size);
>  
> -	handover = qcom_q6v5_unprepare(&pas->q6v5);
> -	if (handover)
> -		qcom_pas_handover(&pas->q6v5);
> +	/*
> +	 * qcom_q6v5_prepare is not called in qcom_pas_attach, skip unprepare to
> +	 * avoid mismatch.

Can you confirm that no load_state should be sent to AOSS for SoCCP?
(I.e. from the skipped qcom_q6v5_prepare())

Regards,
Bjorn
