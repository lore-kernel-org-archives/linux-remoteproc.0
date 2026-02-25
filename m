Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CFDB3D7D9C
	for <linux-remoteproc@vger.kernel.org>; Wed, 25 Feb 2026 16:40:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772037659; cv=none; b=mZu5p8HvM/ct1GAVrMbv8/wEHac0q4b/f75wliYwadzBEB8Ru58uG6Yki+L3eokDk8yR1SNMpIBU/CtnHdg/Pl1eWhBl2+GqXvtdnum7t/YvFXFsSRuh3tHgeLbOEtxqfexhlYrn33PdXiDsOxPjRILJ6r2BYRJsGGDkLQyMZzM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772037659; c=relaxed/simple;
	bh=fg1onnz8md+No8HrMWJrdd2FjHskuWmMxJA94664OhU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QEoMglEqLZtaQO66xW4Pl2GA7V+qXx0hAYgC2GNlCCDpfVjyilJnvVoHRUFuvxRetqf5SK3r9irxvekSsLEk5AIjzxzfUxBbd2/tuduTAtZ9XC1pcTmiTE78b4OIyshEvq5I8KBCR0LS9Ahs1Kc4nlhv78mJMMy+89jTQX9zLZw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=J14VdoBo; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J14VdoBo"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-48375f10628so44898745e9.1
        for <linux-remoteproc@vger.kernel.org>; Wed, 25 Feb 2026 08:40:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772037654; x=1772642454; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=eBqFP7Hzw46CSYhpPo7qadiVR6MSgoNAqRWTUg+WnDg=;
        b=J14VdoBosU5AeEkY/WzZRFy8/YwhENoIPXSaN0nCSgNdQQZhuzCzMspWExbTOM4T+Y
         sN9ZNcmdGdh4Gw5T64Kpx3FzQ/ML3F5PK2Cjs+YkMFK6WLmYmOTz747nTluZR/qHVbe4
         Y7MpgsTidkb4DUMyWTXvewoycSaN8ZzT9c1iuYr59aMs8ne3bd1PQduFC4mu1GWMkiZL
         M2EHE9C33nqojymfGlZyS1xrKaX0kqYL+3nmwFx0gRpBPQLHdpkbOS+wIJPNR1/YattK
         mJkFlIL+9uShYhwk6HBYKnMdeb1DjTwJtGZ8Q1fYUg9xF+rDxK+kywmD/vxlWL9rfmMg
         IfoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772037654; x=1772642454;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eBqFP7Hzw46CSYhpPo7qadiVR6MSgoNAqRWTUg+WnDg=;
        b=MGom5vrwlslpknghOV+yaBAPlt+n7OS9qVtLnhcobykFVNxY9ivQ3Lt6nM5bIjNo5O
         QWbQJwWxdmqYc5JPSNuJsRBhq7RviLBxSHvuLai17zDl2JemPtxsljNhWr6WCL8E4xjR
         Da80VlDpTDb4Gxto8fpFzi3pfjZpwY2ksreyrokqXa88LTIB/2cOzT0I27jAVNL2MMSV
         12kFCE4cnhtr5Juom7ZE3nGrOppDIfbJe0BGMqr1WVw+f8w7lXldzr9PLzGX0wytzg4q
         KPA7Z3XCq7ITuH0y3H+Cwsgu91VSG5ihUfnZBAwztg5UQR6xodIUdbs2zOzPZWtQW4CZ
         zAVQ==
X-Gm-Message-State: AOJu0Yzc5xs2HdXg0xoU8YCxbI1weHmsfbFS07EwZ5HE3Wg7tpgL1LYG
	TxslZhbpa4uA8mytFINBHD+9hiYhA4sD+VJe5Hf9AKbo5L91aolKEzYfK5pAYK3MAkQ=
X-Gm-Gg: ATEYQzyuoG39n7U6ouLZMR4dPpMmne+SqsSog0H7DTONfBJk+EloazKOFpf7htrjU5q
	M23HCWEL4eWpdGLfRbpG0GS/f0FCiRdJyVyrOpRd9wqQQjAU4qpAimcWP+NCed5aEswcL9gRfPl
	/Re6poR/9lhcMeq38BkgK2IUNtwqHCY6xwgK93cMaP1hAaKDR30ClQrvszljHUxOb6+zNXW5AwU
	/nEC8ebP/VD4HXMcGqXBNTClg8iR7cgLcPLk0LReCAWlLiDTJ00HTNFYFXVGLuhL2DWrHq162/N
	lkB5spCXdFt40euwmE8b+EkkwM8FOriRj+q1KC2D5kWymnpVgpy3IA0akBlT6y0jK3O7I+8GVyb
	lWEZEM+I33la/SDK+K92FowkAi/9IFwHzfrD9YXroZifOoYBdbu8YWScHRmRwQCLb+Y1Y8WqicV
	ggqcD68FP9lLLUrkfl0cMuviIuHhDZUy1elg7gZD0MDNQW+hKMDeQYjkkedJtedUYKocTm7piXv
	Qhm/PjZnlwmeJtfajNniQ==
X-Received: by 2002:a05:600c:638d:b0:480:1e40:3d2 with SMTP id 5b1f17b1804b1-483a95f5a62mr252604165e9.29.1772037653504;
        Wed, 25 Feb 2026 08:40:53 -0800 (PST)
Received: from [10.0.1.128] (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483bd6854c7sm183843845e9.0.2026.02.25.08.40.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Feb 2026 08:40:52 -0800 (PST)
Message-ID: <4307232b-1df1-412c-8105-d9eab181b493@gmail.com>
Date: Wed, 25 Feb 2026 17:40:51 +0100
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] remoteproc: imx_rproc: Fix unreachable platform
 prepare_ops
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>, Frank Li <Frank.Li@nxp.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Daniel Baluta <daniel.baluta@nxp.com>
Cc: linux-remoteproc@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Peng Fan <peng.fan@nxp.com>, Dan Carpenter <dan.carpenter@linaro.org>
References: <20260208-imx-rproc-fix-v1-1-ad74555eb9a4@nxp.com>
Content-Language: en-US
From: Emanuele Ghidoli <ghidoliemanuele@gmail.com>
In-Reply-To: <20260208-imx-rproc-fix-v1-1-ad74555eb9a4@nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 2/8/26 12:30, Peng Fan (OSS) wrote:
> From: Peng Fan <peng.fan@nxp.com>
> 
> Smatch reports unreachable code in imx_rproc_prepare(), where an early
> return inside the reserved-memory parsing loop prevents platform
> prepare_ops from being executed.
> 
> When of_reserved_mem_region_to_resource() fails, imx_rproc_prepare()
> returns immediately, so the platform-specific prepare callback is never
> called. As a result, prepare_ops such as imx_rproc_sm_lmm_prepare() on
> i.MX95 have no chance to run.
> 
> This is problematic when Linux controls the M7 Logical Machine and is
> responsible for preparing resources such as TCM. Without running the
> platform prepare callback, loading the M7 ELF into TCM may fail if the
> bootloader did not power up and initialize TCM.
> 
> Fix this by breaking out of the reserved-memory loop instead of
> returning, allowing the platform prepare_ops to be executed as intended.
> 
> Fixes: edd2a9956055 ("remoteproc: imx_rproc: Introduce prepare ops for imx_rproc_dcfg")
> Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> Closes: https://lore.kernel.org/linux-remoteproc/aYYXAa2Fj36XG4yQ@p14s/T/#t
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
>  drivers/remoteproc/imx_rproc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
> index f5f916d6790519360f446f063e09d018c5654953..8c8ddbf995a46b01627d15a2eb3da0b72eee6285 100644
> --- a/drivers/remoteproc/imx_rproc.c
> +++ b/drivers/remoteproc/imx_rproc.c
> @@ -617,7 +617,7 @@ static int imx_rproc_prepare(struct rproc *rproc)
>  
>  		err = of_reserved_mem_region_to_resource(np, i++, &res);
>  		if (err)
> -			return 0;
> +			break;
>  
>  		/*
>  		 * Ignore the first memory region which will be used vdev buffer.
> 
> ---
> base-commit: 9845cf73f7db6094c0d8419d6adb848028f4a921
> change-id: 20260208-imx-rproc-fix-843dd1031b5b
> 
> Best regards,

Tested-by: Emanuele Ghidoli <emanuele.ghidoli@toradex.com>

