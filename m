Received: from delivery.antispam.mailspamprotection.com (delivery.antispam.mailspamprotection.com [185.56.87.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A61C032B102;
	Thu, 15 Oct 2026 20:36:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=185.56.87.4
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792096573; cv=pass; b=ndjtEgfzgvcRp5IIG7qxrgHp+//CAxtonldfXzAIlwzUCwflGlnswBl/2IDfCNQG39v63QGQWB8lnyXnSBQP4ckzyfuWamILNjLzTlb+2oBaUyNulOUxBJeqJjg/i4z9d1Khdi3u+C6akGZ/uRGnrGGvO2PpqyMTDXXhVkVsn60=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792096573; c=relaxed/simple;
	bh=Yj8ej3HBMwylXx0QuhOi40Co/oMLqb7i/qo+mVXTbS8=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=RX4V3s8dT+MFk/dgH6HkYPfo2rJNvddclvFWMOJtWp35m4r2Gn+O+AxrmQSkJ/r4N1w/RJ1JrHd56rcp0falw4fA2+uR7RLhwuP2sinTP/rWAetDOwhx21fsxzux8eTr4LAEmtsi1qJpgold1kp5qia7fJZn2Wk4508R9C1HqxI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valla.it; spf=pass smtp.mailfrom=valla.it; dkim=pass (1024-bit key) header.d=antispam.mailspamprotection.com header.i=@antispam.mailspamprotection.com header.b=hI4yO1Pc; dkim=pass (1024-bit key) header.d=valla.it header.i=@valla.it header.b=IR5/yIam; arc=pass smtp.client-ip=185.56.87.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valla.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=valla.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=antispam.mailspamprotection.com header.i=@antispam.mailspamprotection.com header.b="hI4yO1Pc";
	dkim=pass (1024-bit key) header.d=valla.it header.i=@valla.it header.b="IR5/yIam"
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=outgoing.instance-europe-west4-wc7t.prod.antispam.mailspamprotection.com; s=arckey; t=1792096567;
	 b=c4WlbN2un9IqTv6YbNPrXuniPFcdGFq6Km+CigQHjwDcD0fC5GereLy0Za3syVg9GvM6xWHjP3
	  cLnztuhURuD0hzYlfOSQKMIkTRG0TOng23w7bcOsxVMGsXHyBwhYy3H4NuEeLUlbbBAMf9iOgS
	  yfH3W27V9gAqBfd3uTTN+xsoQ3Km3V6aQ1ORVEvNI+NY4miRm/ASIIu7OY7TOQJbuAFtfXNAa7
	  t1R8BlxxwjmXgpkpWXiR52qWwYRyASg+/hxONudXDt2+55pBf0MUuCmh3rW40rb9JCJAulKJkW
	  Ejb++qQTOMbBmGrhuKV7E/NVqSEjbnk4ER5vUGw0zn2Etw==;
ARC-Authentication-Results: i=1; outgoing.instance-europe-west4-wc7t.prod.antispam.mailspamprotection.com; smtp.remote-ip=35.214.173.214;
	iprev=pass (214.173.214.35.bc.googleusercontent.com) smtp.remote-ip=35.214.173.214;
	auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
	dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
	arc=none
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed; d=outgoing.instance-europe-west4-wc7t.prod.antispam.mailspamprotection.com; s=arckey; t=1792096567;
	bh=Yj8ej3HBMwylXx0QuhOi40Co/oMLqb7i/qo+mVXTbS8=;
	h=Message-ID:Date:References:In-Reply-To:Cc:To:From:Subject:
	  Content-Transfer-Encoding:Content-Type:MIME-Version:DKIM-Signature:
	  DKIM-Signature;
	b=iojzPfkTb7XvHLA7SCVzDHVy1QRVjXkk2+7/vhBPM+YZ5Q7G07sSmX2XsvelU0FtbAA7KuzBUY
	  vedQs6QO4BFoeYyr0AfefOSGQUKMJKuHhONA+YUjmPxcj9xGSMEVoxBYGKxGPnWLBON4xgXtZb
	  S5NNKaMla1MUYQbKUrDnesBhwyYYbf8HkQ1SzCReqc1bRXymec87LJm8VFO7+4wRWn84UfakdB
	  cbPbG0PNtcqh2XJLnOCmneIEwCN/yNAOWiT47OUZ9M8Zxhb8Pf77xQ71LufUWV6hV/67cHNRwN
	  qhg/RwLWFjGSK7Tq909Gr+F5sGfAwEQu0cp5fRMfyU+WjA==;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=antispam.mailspamprotection.com; s=default; h=CFBL-Feedback-ID:CFBL-Address
	:Message-Id:Date:Cc:To:From:Subject:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Reply-To:List-Unsubscribe;
	bh=9EM0isG1R2tZbZPOEASuzPFyGqzGhpBbd9nur44vny0=; b=hI4yO1PcDjHMDgKlrZyaAsvYMv
	MJ5HLsy2EBsmQcAlz9K03V3vNH2k+/S14BJ5k0lYVqw/KZGWqNJ9jO5F9SQRWifE1/esCW+hb9mAV
	PIkGpp4qbHm1K1knQNqxKe67EIISYrxd5NU5L1bA9g4lfeVvL1BKrAULJ+PQHmXUNd+I=;
Received: from 214.173.214.35.bc.googleusercontent.com ([35.214.173.214] helo=esm19.siteground.biz)
	by instance-europe-west4-wc7t.prod.antispam.mailspamprotection.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <francesco@valla.it>)
	id 1xHS2e-0000000Ch3f-1BIu;
	Thu, 15 Oct 2026 20:27:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=valla.it;
	s=default; h=Date:Cc:To:From:Subject:list-help:list-unsubscribe:
	list-subscribe:list-post:list-owner:list-archive;
	bh=9EM0isG1R2tZbZPOEASuzPFyGqzGhpBbd9nur44vny0=; b=IR5/yIam9SRLwaZzPBIrk6qjNc
	lw49C0/GBY/dgfo3XEngJyFDBhM1eMrF0dBZYXdjAxHcqYQJhi9vM+v/mf6JqhL/vrCQDRcq4hZzl
	YcC6I3bVytXQj9cNjbe8Nn4zGoNSr7JIgpGmG++y0XtKYweu+9kuPcP0vDCY/3OfhwL4=;
Received: from [82.89.62.246] (port=63238 helo=[192.168.178.158])
	by esm19.siteground.biz with essmtpa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <francesco@valla.it>)
	id 1xHS2Y-00000000KBz-4A5Q;
	Thu, 15 Oct 2026 20:27:03 +0000
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v5 2/3] remoteproc: imx_rpoc: use memory-region-names
 to avoid hidden ABI
From: Francesco Valla <francesco@valla.it>
To: Frank.Li@oss.nxp.com
Cc: Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>, 
 linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, 
 Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>, 
 Frank Li <Frank.Li@nxp.com>
In-Reply-To: <20261015-memory-region-name-v5-2-abc358b39a96@nxp.com>
References: <20261015-memory-region-name-v5-0-abc358b39a96@nxp.com>
 <20261015-memory-region-name-v5-2-abc358b39a96@nxp.com>
Date: Thu, 15 Oct 2026 22:26:51 +0200
Message-Id: <179209601177.660553.12335999939165725188.b4-review@b4>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3455; i=francesco@valla.it;
 h=from:subject:message-id; bh=Yj8ej3HBMwylXx0QuhOi40Co/oMLqb7i/qo+mVXTbS8=;
 b=owGbwMvMwCX2aH1OUIzHTgbG02pJDFkXzQV8zrGv3qFZvuHfdcavcw5JyGvE3t2hvkJCM9fhb
 +PzUNfHHaUsDGJcDLJiiiwh627c2zPX/FvaBsZHMHNYmUCGMHBxCsBEek4yMpxxmVPFv+RHypGZ
 qkITFfPtpv8Nsglj8Te+cLinoCd7zQVGhp+Pr93cETK5eUfDuh3JS/e7fTi2Yds144OXmJpNHho
 dMeACAA==
X-Developer-Key: i=francesco@valla.it; a=openpgp;
 fpr=CC70CBC9AA13257C6CCED8669601767CA07CA0EA
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - esm19.siteground.biz
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - valla.it
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-SGantispam-id: 210fbe4598e097f8a46d319f7126ebaa
X-AntiAbuse: ID - 210fbe4598e097f8a46d319f7126ebaa
AntiSpam-DLS: false
AntiSpam-DLSP: 
AntiSpam-DLSRS: 
AntiSpam-TS: 1.0
CFBL-Address: feedback@antispam.mailspamprotection.com; report=arf
CFBL-Feedback-ID: 1xHS2e-0000000Ch3f-1BIu-feedback@antispam.mailspamprotection.com
Authentication-Results: outgoing.instance-europe-west4-wc7t.prod.antispam.mailspamprotection.com;
	iprev=pass (214.173.214.35.bc.googleusercontent.com) smtp.remote-ip=35.214.173.214;
	auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
	dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
	arc=none

Hello Frank,

> The driver currently derives the memory region type from the referenced
> memory node name, creating a hidden DT ABI. Since memory node names are
> not constrained by the binding, incorrect names can silently pass DT
> validation, as seen in examples using "vdevbuffer" instead of
> "vdev0buffer" ([1] and [2]).
> 
> Parse memory-region-names to identify the expected memory regions and avoid
> relying on memory node names as ABI.
> 
> Link: https://lore.kernel.org/imx/a3602ef8-2b77-4cc3-adef-2c4cba08a5d9@nabladev.com/ [1]
> Link: https://lore.kernel.org/imx/alexXTYQHUs76J7v@SMW015318/T/#mb9dc709ff3adc24d9db6d30c973f37b580f6f1f9 [2]
> 
> Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
> Reviewed-by: Peng Fan <peng.fan@nxp.com>
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
>
> diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
> index 745ce52cd822..ce9bdfc1fa98 100644
> --- a/drivers/remoteproc/imx_rproc.c
> +++ b/drivers/remoteproc/imx_rproc.c
> @@ -643,7 +643,7 @@ static int imx_rproc_prepare(struct rproc *rproc)
>  		int err;
>  		struct resource res;
>  
> -		err = of_reserved_mem_region_to_resource(np, i++, &res);
> +		err = imx_rproc_rmem_to_resource(np, i++, &res);
>  		if (err)
>  			break;
>  
> @@ -818,11 +818,20 @@ static int imx_rproc_addr_init(struct imx_rproc *priv,
>  	if (nph <= 0)
>  		return 0;
>  
> +	if (!of_property_present(np, "memory-region-names")) {
> +		dev_warn(dev, "using node names for carveouts should be avoided\n");
> +	} else {
> +		if (nph != of_property_count_strings(np, "memory-region-names")) {
> +			dev_err(dev, "invalid reserved memory name count\n");
> +			return -EINVAL;
> +		}
> +	}
> +
>  	/* remap optional addresses */
>  	for (a = 0; a < nph; a++) {
>  		struct resource res;
>  
> -		err = of_reserved_mem_region_to_resource(np, a, &res);
> +		err = imx_rproc_rmem_to_resource(np, a, &res);
>  		if (err) {
>  			dev_err(dev, "unable to resolve memory region\n");
>  			return err;
> diff --git a/drivers/remoteproc/imx_rproc.h b/drivers/remoteproc/imx_rproc.h
> index 0d7d48352a10..3632bc375c71 100644
> --- a/drivers/remoteproc/imx_rproc.h
> +++ b/drivers/remoteproc/imx_rproc.h
> @@ -7,6 +7,8 @@
>  #ifndef _IMX_RPROC_H
>  #define _IMX_RPROC_H
>  
> +#include <linux/of_reserved_mem.h>
> +
>  /* address translation table */
>  struct imx_rproc_att {
>  	u32 da;	/* device address (From Cortex M4 view)*/
> @@ -45,4 +47,23 @@ struct imx_rproc_dcfg {
>  	u32				reset_vector_mask;
>  };
>  
> +static inline int imx_rproc_rmem_to_resource(struct device_node *np,
> +					     int index,
> +					     struct resource *res)
> +{
> +	int ret;
> +
> +	ret = of_reserved_mem_region_to_resource(np, index, res);
> +	if (ret)
> +		return ret;
> +
> +	/* "memory-region-names" is optional */
> +	ret = of_property_read_string_index(np, "memory-region-names",
> +					    index, &res->name);
> +	if (ret == -EINVAL)
> +		return 0;
> +
> +	return ret;
> +}
> +

Shouldn't this be a regular function in imx_rproc.c instead of being
defined as inline here? Keeping it in the driver source file would
probably make the logic easier to follow, also considering that the
presence of memory-region-names is evaluated there in
imx_rproc_addr_init().

>  #endif /* _IMX_RPROC_H */

Regards,
Francesco

-- 
Francesco Valla <francesco@valla.it>
