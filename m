Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 810E21465AE;
	Mon, 13 Jan 2025 08:25:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.132.182.106
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736756732; cv=none; b=NYQXZMwo5c+GKgWnB7PKqdUElkfWV6d35V0911RVTUfosFW0U1hQ+mc120c2bzkc4/7myrZLJW7gFJzFwG0OGc0YSwfK5lsJsrqjowo65Bft6woI5huEuLXxEWjAKdE1nV2dHmChXdOIxE6luVl+7PV+IJmgJ30ePcwLTtBQ2cI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736756732; c=relaxed/simple;
	bh=iK4B0+IJ0EvGlMlgE8kVWu25SGNoBtvZIp3+UZVGb0o=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=pzPINmj7A2zgaOhTZVT3JRZ5cErpudggxGHKj64fEdxHhnYmoDmOt06tXz4GuwbPoG0h167+zegDFOQRcvP7lOcBqw21Stn4VpyHqZ2byve78/XT0rYw3XJZ0ADnMYMVTRUY/ZxYFvGsEEg49Qb0PVmiVnNLYdTWgihHLZoJUTI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=RSWIZTmr; arc=none smtp.client-ip=185.132.182.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="RSWIZTmr"
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50D5nWlh026600;
	Mon, 13 Jan 2025 09:25:05 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	lTvijDpe0+9dsCs3BTNBSBTmfxJ/q0zTpQ4GnoSlcsg=; b=RSWIZTmresEmufVo
	A+0rYK5fd83+7wbwXbty79TKSeiiBgWBwvkjjF9/wU3lh3SEIEzlRrRSZYxmQwB0
	j0ggAQYPpQTv2On3hkGyHd3u1tF6K9UFWF1i8iEKAe3g756GWZF1xgPnujUSQylj
	0qov0hj1E6SO7Kz0itHy8qHS9jrmEUvM9vVeaOdPsXkUsP2cDDsQYCuuwJls3m9B
	ZLCVcJMpzvo95WcEpkhpczZXOnxSVZnEDQycy26wHEO92iOQEBZ85Ky+nIxCcONn
	At18/nyzn/n282eAS4XJBVsKdR5LfKU+Wrab0BJwM+27E7QoE+DD9zIZvKVhG7Uq
	UCmkYA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 444w17ghmp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 13 Jan 2025 09:25:05 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 4339C40053;
	Mon, 13 Jan 2025 09:24:10 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 840E22303C4;
	Mon, 13 Jan 2025 09:23:46 +0100 (CET)
Received: from [10.48.87.62] (10.48.87.62) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Mon, 13 Jan
 2025 09:23:46 +0100
Message-ID: <5209f7b9-0e72-492f-bd5d-93726a9e1c41@foss.st.com>
Date: Mon, 13 Jan 2025 09:23:45 +0100
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/5] remoteproc: st: Simplify with dev_err_probe
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
CC: <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>
References: <20250111-b4-syscon-phandle-args-remoteproc-v1-0-73ed6fafa1e3@linaro.org>
 <20250111-b4-syscon-phandle-args-remoteproc-v1-3-73ed6fafa1e3@linaro.org>
Content-Language: en-US
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <20250111-b4-syscon-phandle-args-remoteproc-v1-3-73ed6fafa1e3@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01



On 1/11/25 19:42, Krzysztof Kozlowski wrote:
> Use dev_err_probe() to make error code handling simpler and handle
> deferred probe.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  drivers/remoteproc/st_remoteproc.c | 44 +++++++++++++++++---------------------
>  1 file changed, 20 insertions(+), 24 deletions(-)
> 
> diff --git a/drivers/remoteproc/st_remoteproc.c b/drivers/remoteproc/st_remoteproc.c
> index 5df99bae7131a832c0c03c9bf8619812d9eb570d..d1f35e8a83ba525613ed4e54d2269b7e9f427e46 100644
> --- a/drivers/remoteproc/st_remoteproc.c
> +++ b/drivers/remoteproc/st_remoteproc.c
> @@ -290,26 +290,23 @@ static int st_rproc_parse_dt(struct platform_device *pdev)
>  	if (ddata->config->sw_reset) {
>  		ddata->sw_reset = devm_reset_control_get_exclusive(dev,
>  								   "sw_reset");
> -		if (IS_ERR(ddata->sw_reset)) {
> -			dev_err(dev, "Failed to get S/W Reset\n");
> -			return PTR_ERR(ddata->sw_reset);
> -		}
> +		if (IS_ERR(ddata->sw_reset))
> +			return dev_err_probe(dev, PTR_ERR(ddata->sw_reset),
> +					     "Failed to get S/W Reset\n");
>  	}
>  
>  	if (ddata->config->pwr_reset) {
>  		ddata->pwr_reset = devm_reset_control_get_exclusive(dev,
>  								    "pwr_reset");
> -		if (IS_ERR(ddata->pwr_reset)) {
> -			dev_err(dev, "Failed to get Power Reset\n");
> -			return PTR_ERR(ddata->pwr_reset);
> -		}
> +		if (IS_ERR(ddata->pwr_reset))
> +			return dev_err_probe(dev, PTR_ERR(ddata->pwr_reset),
> +					     "Failed to get Power Reset\n");
>  	}
>  
>  	ddata->clk = devm_clk_get(dev, NULL);
> -	if (IS_ERR(ddata->clk)) {
> -		dev_err(dev, "Failed to get clock\n");
> -		return PTR_ERR(ddata->clk);
> -	}
> +	if (IS_ERR(ddata->clk))
> +		return dev_err_probe(dev, PTR_ERR(ddata->clk),
> +				     "Failed to get clock\n");
>  
>  	err = of_property_read_u32(np, "clock-frequency", &ddata->clk_rate);
>  	if (err) {
> @@ -318,10 +315,9 @@ static int st_rproc_parse_dt(struct platform_device *pdev)
>  	}
>  
>  	ddata->boot_base = syscon_regmap_lookup_by_phandle(np, "st,syscfg");
> -	if (IS_ERR(ddata->boot_base)) {
> -		dev_err(dev, "Boot base not found\n");
> -		return PTR_ERR(ddata->boot_base);
> -	}
> +	if (IS_ERR(ddata->boot_base))
> +		return dev_err_probe(dev, PTR_ERR(ddata->boot_base),
> +				     "Boot base not found\n");
>  
>  	err = of_property_read_u32_index(np, "st,syscfg", 1,
>  					 &ddata->boot_offset);
> @@ -395,32 +391,32 @@ static int st_rproc_probe(struct platform_device *pdev)
>  		 */
>  		chan = mbox_request_channel_byname(&ddata->mbox_client_vq0, "vq0_rx");
>  		if (IS_ERR(chan)) {
> -			dev_err(&rproc->dev, "failed to request mbox chan 0\n");
> -			ret = PTR_ERR(chan);
> +			ret = dev_err_probe(&rproc->dev, PTR_ERR(chan),
> +					    "failed to request mbox chan 0\n");
>  			goto free_clk;
>  		}
>  		ddata->mbox_chan[ST_RPROC_VQ0 * MBOX_MAX + MBOX_RX] = chan;
>  
>  		chan = mbox_request_channel_byname(&ddata->mbox_client_vq0, "vq0_tx");
>  		if (IS_ERR(chan)) {
> -			dev_err(&rproc->dev, "failed to request mbox chan 0\n");
> -			ret = PTR_ERR(chan);
> +			ret = dev_err_probe(&rproc->dev, PTR_ERR(chan),
> +					    "failed to request mbox chan 0\n");
>  			goto free_mbox;
>  		}
>  		ddata->mbox_chan[ST_RPROC_VQ0 * MBOX_MAX + MBOX_TX] = chan;
>  
>  		chan = mbox_request_channel_byname(&ddata->mbox_client_vq1, "vq1_rx");
>  		if (IS_ERR(chan)) {
> -			dev_err(&rproc->dev, "failed to request mbox chan 1\n");
> -			ret = PTR_ERR(chan);
> +			ret = dev_err_probe(&rproc->dev, PTR_ERR(chan),
> +					    "failed to request mbox chan 1\n");
>  			goto free_mbox;
>  		}
>  		ddata->mbox_chan[ST_RPROC_VQ1 * MBOX_MAX + MBOX_RX] = chan;
>  
>  		chan = mbox_request_channel_byname(&ddata->mbox_client_vq1, "vq1_tx");
>  		if (IS_ERR(chan)) {
> -			dev_err(&rproc->dev, "failed to request mbox chan 1\n");
> -			ret = PTR_ERR(chan);
> +			ret = dev_err_probe(&rproc->dev, PTR_ERR(chan),
> +					    "failed to request mbox chan 1\n");
>  			goto free_mbox;
>  		}
>  		ddata->mbox_chan[ST_RPROC_VQ1 * MBOX_MAX + MBOX_TX] = chan;
> 

Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>

Thanks
Patrice
