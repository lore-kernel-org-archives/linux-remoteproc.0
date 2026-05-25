Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5958B1CAA7D
	for <linux-remoteproc@vger.kernel.org>; Mon, 25 May 2026 12:31:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779712292; cv=none; b=L4Q7d2Q822ddjxZg8Ne0Oqq/6lXQLFqRxBrTEy5ReCr8QapiauDSAU1alVRnVBmSnNlaOayHv3b6jLnS4IZ/PgMS+oCKoxuDqgwvRYWKiGHm5PhC303k+8zw9Z8H8dUsgP+LnsBaHRHwDUpLwKy9MyHoJr6cZfIVtgUzlyLbvoo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779712292; c=relaxed/simple;
	bh=qpbNNT9LTg/BQrpX4c+/wUPqtP5MSqmpILKrnhojHyI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=b316QOCyQjQdSsv2UvXutUmT/UuGirssa4t0JoLecBfVJiTvZo6BOdI+avkwEUGUbsHJQH93P5BHijOcKiXXc63xdV6MF93IPXBVSnwpFIPFrCIqougO+mzwxIGw4XYfB6R71Jkd9cMScGc380bZB7qjfeY/9fBD3qsY5XnrP+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c2Km1n4E; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c2Km1n4E"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4903974854dso34416545e9.3
        for <linux-remoteproc@vger.kernel.org>; Mon, 25 May 2026 05:31:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779712290; x=1780317090; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zrIDVk+3CslyJkUrNGl34AIpYDsI+Gmqf4gQKToWHJM=;
        b=c2Km1n4EqS2KLiF8/aD/TOQ6BMa15NRDAYhTmh3epjc6mGYfSNE55qzGliy+SPhYc+
         7IHQ6lkTJ6dSEzgH9XnWMpxSC5E+NeSpxiKZIwep90j7F9HMspamzLSOnhqDZms6D2+z
         bJAKVoS3525EKJzgIHLprLyFgRsxDe+sjBV8Ld71pOA9ufg/hMKzEXK5uhkSrsLwvXsB
         6VmNU8YATKyKEOk9XLQtrru00ECQUMErzE4moxPHDr7kobDXwhOatt6VLWO3VEaZHl4h
         lbkB56fuPwy1v1Ot6hFAsJJKinkCDcEbuTySFPZH12JGZUg4/IJv/f4jyKMi4w9WEFe/
         WnLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779712290; x=1780317090;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zrIDVk+3CslyJkUrNGl34AIpYDsI+Gmqf4gQKToWHJM=;
        b=lp0bQ4fWUgGn8q7FfBkKSZP5ZCfm3YlCy/zoxg0kuJ3AjhQGiIHxHCw6x5QwGzUUIH
         k2UdiVHM74KFO5Ex/we9t28aqzuP9jGqwvJdXoQGBiLiWXanmH+QRpJU4JJCf09fnbPZ
         6kEop7PyFipxzGelmNvy3SQQ+0TC0N8n6+0NsHfnzo2bobWAy8LpvN2G6HwScIjyPD4l
         888TupezwfaYDFxgO1QCswWXpmB/UQFFSNXIjdH1D7ZQBNav5SlPt88nKXvZH6tfFMER
         1GKo8JTjSKbzD6d0rI8/f+/9vLSxzNjxvIIUvRfMSudAgxYLUU/vC5G1Pq9XNQVE/GDu
         A7eQ==
X-Forwarded-Encrypted: i=1; AFNElJ94B76i4SN3cHG9YMftDBK61QsKWYJsxC51fV26EEH6/wTfFXALkxZmTxcOv4xgSsE+vh50WFjQVvkZypOdME0w@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3ZJHCSaeeflMh+pkTsNRqWMiloBezcN2u43MueVPnw2Bc/BmC
	3YKnnV9I3Mukb2HxoGugnzyyCro2W2eW86gmqN/rb4M8DomGZm2tUlP5
X-Gm-Gg: Acq92OEn1J7vmHoe9JXsWAXM0+dz41o9C9X6fpY1lYc/SkH6Asxq1nmT1Pu1EyI89K6
	6vclEhoWGbgzPTGrUeRRY9TmkUSW7FBQJJPzrGFCiIfr3G3+RpwRQy/SELa8PUjTlkRlYPigcJh
	dA+Yfo+ejYVDZve9vt5fr6SVWbv048vW0NzsDAZa9V2E7zx1MRQdZSchC+9AZHvG/C6XEFRAmtU
	1hXFftpjit+o3Carl3bkSRj5EcpQ2JNbU8Jspksm71B+/lcEbVvjjAN2ATSP/5UukMpl0yTmwHI
	4iGBF0RlKr6ByPuq0yLkAdmHCRFWE04ZL4ki+M7/1ZKJDB54Zau/WMWLCf0jxNTcQpPFCvVzD/o
	2OQKsk4Qbs+gNHjpKTqbE/lYSsFFgHyQJ59YbwMD6Y3BaQRZsAFOPcuqhNlAniZ/I2NbrIRndph
	zMu9vtrdlde2g4MUgIfR47utkJ2Jru18jJSCBgy8zTWMuW+yrA8rK1Pd7w
X-Received: by 2002:a05:600c:3d96:b0:490:5429:1513 with SMTP id 5b1f17b1804b1-49054291bbamr158545285e9.6.1779712289494;
        Mon, 25 May 2026 05:31:29 -0700 (PDT)
Received: from [10.25.212.250] ([128.77.115.157])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490428e6d68sm85965215e9.22.2026.05.25.05.31.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 May 2026 05:31:28 -0700 (PDT)
Message-ID: <9fb59c65-8cee-4502-bc10-1375f276e25c@gmail.com>
Date: Mon, 25 May 2026 05:31:24 -0700
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/5] remoteproc: imx_rpoc: fix carveout name parsing
To: Peng Fan <peng.fan@oss.nxp.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
 Sascha Hauer <s.hauer@pengutronix.de>, Peng Fan <peng.fan@nxp.com>,
 Fabio Estevam <festevam@gmail.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20260522111849.783-1-laurentiumihalcea111@gmail.com>
 <20260522111849.783-3-laurentiumihalcea111@gmail.com>
 <ahOwO7LBXCYFIngw@shlinux89>
Content-Language: en-US
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
In-Reply-To: <ahOwO7LBXCYFIngw@shlinux89>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 5/24/2026 7:13 PM, Peng Fan wrote:
> On Fri, May 22, 2026 at 04:18:46AM -0700, Laurentiu Mihalcea wrote:
>> From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
>>
>> The imx remoteproc driver assumes that the names of the reserved memory
>> regions reflect their usage (e.g. "vdevbuffer", "vdev0vring0", etc.). This
>> conflicts with the devicetree specification's recommendation, which states
>> that the names of the devicetree nodes should be generic.
>>
>> Therefore, instead of relying on the node names, use the names passed via
>> the "memory-region-names" property if present. Otherwise, keep the old
>> behavior.
>>
>> The definition of imx_rproc_rmem_to_resource() is added to a common place
>> as imx_dsp_rproc.c can also use it given that it suffers from the same
>> aforementioned problem.
>>
>> Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
>> ---
>> drivers/remoteproc/imx_rproc.c |  7 +++++--
>> drivers/remoteproc/imx_rproc.h | 19 +++++++++++++++++++
>> 2 files changed, 24 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
>> index 7f54322244ac..1ee1c658dcc1 100644
>> --- a/drivers/remoteproc/imx_rproc.c
>> +++ b/drivers/remoteproc/imx_rproc.c
>> @@ -672,7 +672,7 @@ static int imx_rproc_prepare(struct rproc *rproc)
>> 		int err;
>> 		struct resource res;
>>
>> -		err = of_reserved_mem_region_to_resource(np, i++, &res);
>> +		err = imx_rproc_rmem_to_resource(np, i++, &res);
>> 		if (err)
>> 			break;
>>
>> @@ -850,11 +850,14 @@ static int imx_rproc_addr_init(struct imx_rproc *priv,
>> 	if (nph <= 0)
>> 		return 0;
>>
>> +	if (!of_property_present(np, "memory-region-names"))
>> +		dev_warn(dev, "using node names for carveouts should be avoided\n");
> 
> Please check 'memory-regions && !memory-region-names', some demos may not
> need to use memory regions.
> 
> Regards
> Peng
> 

What for? You'll not reach this check unless "memory-regions" is specified?
