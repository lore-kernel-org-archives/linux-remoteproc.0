Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71C7C233133;
	Mon, 13 Jan 2025 08:26:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.132.182.106
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736756797; cv=none; b=BbHxVYAsIFrwVjwDsiW8O4Jn6bj9qEzUJK//onSF5e2pgf7I8H0CKFAslMImG486iHHtvcSvvj0Jyhlg3CzoK/2fg247NpVTDQSIHp808tEU5rY1gIEg5Leia146qU/v0kY8unEmGXoPkQsULfUhUwyY/ekCq7TZDQSyFBRFalU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736756797; c=relaxed/simple;
	bh=m84jvO0rdal587kKNBUPhKhIP0tlv/WEzZKh2910lOk=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=WeAXtvRMeJwWVTbhvG76nEqhg86RsDlu0zgtyjw6FGO0iML3vNJA9b5NiZkzH6q1Eo+cNCs8Kb1TUVaB6mLg9unrDC6CYV8PUiOCLSUB4W7mSU0R7f/kdPq3JJbpK7KuJpREBLNIAzMVDQNK5n2GoigEM6knwCmIuUVzdnS9svc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=v3qXUr84; arc=none smtp.client-ip=185.132.182.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="v3qXUr84"
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50D42hhD027884;
	Mon, 13 Jan 2025 09:26:25 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	ThkkJKTTX74TQWWYMtmGXpSmJrmOyZWtE8fBolmgsds=; b=v3qXUr84NCv3u8hH
	axs1Tikhj2ZNgoL8/kvKMbMlh2ixDJvDVRsqd3hMR1kfgCEcfpV3WJMgJfJ83CrV
	3aqhXJtLER6pN0lfh1Sjueg22D2JPWYcx9BFIM3uKFvqyUcm0Do24AkUk8TY+iYc
	Ud2HNp6XKbZ2ZJ6oSXcmglHJuxnod4YBmjNS8MPPyOxP7shzul66keQShKELHcpl
	A61yJeI78hFcNnTGMEL2ttSPILQrH+eIg+MzmZzwRAiDaOatvAgRrJ957Hrx198M
	OgGMgK6QS74DGAhxKFyUnvdXa1WNIo5TrFvsbyP9OscVWFmtDjuf2PUxGp6zi0+h
	Zw2ztg==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 444333kf4q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 13 Jan 2025 09:26:25 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id ECCFB4005B;
	Mon, 13 Jan 2025 09:25:31 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 4427D2303D4;
	Mon, 13 Jan 2025 09:25:08 +0100 (CET)
Received: from [10.48.87.62] (10.48.87.62) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Mon, 13 Jan
 2025 09:25:07 +0100
Message-ID: <06b8e94f-0724-4a8e-bdcd-83e08faa7673@foss.st.com>
Date: Mon, 13 Jan 2025 09:25:07 +0100
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/5] remoteproc: st: Use
 syscon_regmap_lookup_by_phandle_args
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
CC: <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>
References: <20250111-b4-syscon-phandle-args-remoteproc-v1-0-73ed6fafa1e3@linaro.org>
 <20250111-b4-syscon-phandle-args-remoteproc-v1-5-73ed6fafa1e3@linaro.org>
Content-Language: en-US
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <20250111-b4-syscon-phandle-args-remoteproc-v1-5-73ed6fafa1e3@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01



On 1/11/25 19:42, Krzysztof Kozlowski wrote:
> Use syscon_regmap_lookup_by_phandle_args() which is a wrapper over
> syscon_regmap_lookup_by_phandle() and getting the argument.  Except
> simpler code this annotates within one line that given phandle has
> arguments, so grepping for code would be easier.
> 
> There is also no real benefit in printing errors on missing syscon
> argument, because this is done just too late: runtime check on
> static/build-time data.  Dtschema and Devicetree bindings offer the
> static/build-time check for this already.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  drivers/remoteproc/st_remoteproc.c | 10 ++--------
>  1 file changed, 2 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/remoteproc/st_remoteproc.c b/drivers/remoteproc/st_remoteproc.c
> index d1f35e8a83ba525613ed4e54d2269b7e9f427e46..e6566a9839dc5ffc83d907a3076fc4b0a644138a 100644
> --- a/drivers/remoteproc/st_remoteproc.c
> +++ b/drivers/remoteproc/st_remoteproc.c
> @@ -314,18 +314,12 @@ static int st_rproc_parse_dt(struct platform_device *pdev)
>  		return err;
>  	}
>  
> -	ddata->boot_base = syscon_regmap_lookup_by_phandle(np, "st,syscfg");
> +	ddata->boot_base = syscon_regmap_lookup_by_phandle_args(np, "st,syscfg",
> +								1, &ddata->boot_offset);
>  	if (IS_ERR(ddata->boot_base))
>  		return dev_err_probe(dev, PTR_ERR(ddata->boot_base),
>  				     "Boot base not found\n");
>  
> -	err = of_property_read_u32_index(np, "st,syscfg", 1,
> -					 &ddata->boot_offset);
> -	if (err) {
> -		dev_err(dev, "Boot offset not found\n");
> -		return -EINVAL;
> -	}
> -
>  	err = clk_prepare(ddata->clk);
>  	if (err)
>  		dev_err(dev, "failed to get clock\n");
> 

Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>

Thanks
Patrice
