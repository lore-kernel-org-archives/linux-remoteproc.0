Received: from mickerik.phytec.de (mickerik.phytec.de [91.26.50.163])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35ECE15B54B
	for <linux-remoteproc@vger.kernel.org>; Mon, 19 Aug 2024 08:49:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.26.50.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724057397; cv=none; b=By5Y6bI6eSypxBqr4zjjEyIRjDC4YphjmCcJG6fapKiP/ECI0+hOQXyGd7xP/Ze2P/aQhdNL621jewFehwsn6eXR/vKFQoikp/nhzxrK6WToAfIcBx6yIQdgZcscgb2H4dq6qGCGKanHbg3JflklNY5QVt8I4eiF7VMpiIXiiwE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724057397; c=relaxed/simple;
	bh=/qAUwM+GqYjEl6z2RGdxbVW5CHdC1JX2843MSUGR9ZI=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=aZ+xHj+30dlSl1cEiyX2zj5Tw0djWwBv6AAw3e3veRCzUV266s+eS3wTO7Wy6bBypVXNdt3vxuvvx/edLL4oXy3hQWYf6TH61ZQAbnLHa9GK7/46o7yesDf97NktHb51Bb0AijxVARG7VS98mQGFtflNZ2Lfx+deFhn0GfA1a6U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=phytec.de; spf=pass smtp.mailfrom=phytec.de; dkim=pass (1024-bit key) header.d=phytec.de header.i=@phytec.de header.b=M6EsVpkH; arc=none smtp.client-ip=91.26.50.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=phytec.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=phytec.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=phytec.de header.i=@phytec.de header.b="M6EsVpkH"
DKIM-Signature: v=1; a=rsa-sha256; d=phytec.de; s=a4; c=relaxed/simple;
	q=dns/txt; i=@phytec.de; t=1724057380; x=1726649380;
	h=From:Sender:Reply-To:Subject:Date:Message-ID:To:CC:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=/qAUwM+GqYjEl6z2RGdxbVW5CHdC1JX2843MSUGR9ZI=;
	b=M6EsVpkHzpdBckEgfU0l8o+HCZJxTyPhsK66C4njhYCyPPaqeUNmpup6KcRjvSWy
	kRctJ4OfxCz4b/mQ/FLHSywlCU/cZDC+keMv371xJ5xrt54TqSuSZRbErKCmaRQF
	FF7bJjY8BlSwB+V4UAZDeCGCdrUgWB9qO78ShdCwRUk=;
X-AuditID: ac14000a-03e52700000021bc-74-66c307248dd9
Received: from berlix.phytec.de (Unknown_Domain [172.25.0.12])
	(using TLS with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client did not present a certificate)
	by mickerik.phytec.de (PHYTEC Mail Gateway) with SMTP id 56.57.08636.42703C66; Mon, 19 Aug 2024 10:49:40 +0200 (CEST)
Received: from [172.25.39.28] (172.25.0.11) by Berlix.phytec.de (172.25.0.12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.6; Mon, 19 Aug
 2024 10:49:38 +0200
Message-ID: <da62f142-cf93-4d64-bb1e-71fa5270c09a@phytec.de>
Date: Mon, 19 Aug 2024 10:49:37 +0200
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 2/9] remoteproc: k3: Factor out TI-SCI processor
 control OF get function
To: Andrew Davis <afd@ti.com>, Bjorn Andersson <andersson@kernel.org>, Mathieu
 Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, Tero
 Kristo <kristo@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, Hari
 Nagalla <hnagalla@ti.com>
CC: <linux-remoteproc@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <20240802152109.137243-1-afd@ti.com>
 <20240802152109.137243-3-afd@ti.com>
Content-Language: en-US
From: Wadim Egorov <w.egorov@phytec.de>
In-Reply-To: <20240802152109.137243-3-afd@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: Florix.phytec.de (172.25.0.13) To Berlix.phytec.de
 (172.25.0.12)
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrKIsWRmVeSWpSXmKPExsWyRpKBR1eF/XCawdmf/BbvT01kt9jWYWOx
	Zu85Jov5R86xWmw/0MlusfzzbHaLl7PusVlsenyN1eLyrjlsFs3nlSy27jnAZPHmx1kmi7v3
	TrBY/N+zg93i/9kP7A78HptWdbJ53Lm2h81j85J6j/6/Bh7Hb2xn8vi8SS6ALYrLJiU1J7Ms
	tUjfLoEr48ibc8wFi1Uqbj2YxNbA2C7bxcjJISFgInH2zy62LkYuDiGBJUwS044vYoJw7jJK
	vNm2GMjh4OAVsJG4Mq0GpIFFQFVi48rPTCA2r4CgxMmZT1hAbFEBeYn7t2awg9jCAkkSpzd2
	soLMERGYxixxduYUsA3MAn2MEt0TP7CCVAkJhEt8urQSrJtZQFzi1pP5YFPZBNQl7mz4BlbD
	KWAo8ffya6gaC4nFbw6yQ9jyEtvfzmGGmCMv8eLSchaId+Qlpp17zQxhh0oc2bSaaQKj8Cwk
	x85Csm4WkrGzkIxdwMiyilEoNzM5O7UoM1uvIKOyJDVZLyV1EyMoKkUYuHYw9s3xOMTIxMF4
	iFGCg1lJhLf75cE0Id6UxMqq1KL8+KLSnNTiQ4zSHCxK4ryrO4JThQTSE0tSs1NTC1KLYLJM
	HJxSDYzyC1L/Pgw7c2WFl5P3tO/cPe8b9LddVJnc3W6eFeOe8/rhnTvcb5tF6ysOPbVqvX9b
	9Y7W+9Xsmk2T2xUecZ33vr+2guFQ2h6G23M+NlbMjvXbor60Sr/izVTu/R5TlIQ/xq0KMkma
	W9j3RYOL92/oOt5bH1Svr7srKTH12Kc5xwv5P02fF/JBiaU4I9FQi7moOBEAA52mlLgCAAA=



Am 02.08.24 um 17:21 schrieb Andrew Davis:
> Building the TSP structure is common for users of the TI-SCI processor
> control interface. Factor out this function and put it with the rest
> of the TI-SCI processor control functions.
> 
> Signed-off-by: Andrew Davis <afd@ti.com>
Tested-by: Wadim Egorov <w.egorov@phytec.de>

> ---
>   drivers/remoteproc/ti_k3_dsp_remoteproc.c | 28 +----------------------
>   drivers/remoteproc/ti_k3_r5_remoteproc.c  | 28 +----------------------
>   drivers/remoteproc/ti_sci_proc.h          | 26 +++++++++++++++++++++
>   3 files changed, 28 insertions(+), 54 deletions(-)
> 
> diff --git a/drivers/remoteproc/ti_k3_dsp_remoteproc.c b/drivers/remoteproc/ti_k3_dsp_remoteproc.c
> index a22d41689a7d2..1585769092924 100644
> --- a/drivers/remoteproc/ti_k3_dsp_remoteproc.c
> +++ b/drivers/remoteproc/ti_k3_dsp_remoteproc.c
> @@ -636,32 +636,6 @@ static void k3_dsp_release_tsp(void *data)
>   	ti_sci_proc_release(tsp);
>   }
>   
> -static
> -struct ti_sci_proc *k3_dsp_rproc_of_get_tsp(struct device *dev,
> -					    const struct ti_sci_handle *sci)
> -{
> -	struct ti_sci_proc *tsp;
> -	u32 temp[2];
> -	int ret;
> -
> -	ret = of_property_read_u32_array(dev->of_node, "ti,sci-proc-ids",
> -					 temp, 2);
> -	if (ret < 0)
> -		return ERR_PTR(ret);
> -
> -	tsp = devm_kzalloc(dev, sizeof(*tsp), GFP_KERNEL);
> -	if (!tsp)
> -		return ERR_PTR(-ENOMEM);
> -
> -	tsp->dev = dev;
> -	tsp->sci = sci;
> -	tsp->ops = &sci->ops.proc_ops;
> -	tsp->proc_id = temp[0];
> -	tsp->host_id = temp[1];
> -
> -	return tsp;
> -}
> -
>   static int k3_dsp_rproc_probe(struct platform_device *pdev)
>   {
>   	struct device *dev = &pdev->dev;
> @@ -711,7 +685,7 @@ static int k3_dsp_rproc_probe(struct platform_device *pdev)
>   		return dev_err_probe(dev, PTR_ERR(kproc->reset),
>   				     "failed to get reset\n");
>   
> -	kproc->tsp = k3_dsp_rproc_of_get_tsp(dev, kproc->ti_sci);
> +	kproc->tsp = ti_sci_proc_of_get_tsp(dev, kproc->ti_sci);
>   	if (IS_ERR(kproc->tsp))
>   		return dev_err_probe(dev, PTR_ERR(kproc->tsp),
>   				     "failed to construct ti-sci proc control\n");
> diff --git a/drivers/remoteproc/ti_k3_r5_remoteproc.c b/drivers/remoteproc/ti_k3_r5_remoteproc.c
> index 39a47540c5900..dd6294ab81e2e 100644
> --- a/drivers/remoteproc/ti_k3_r5_remoteproc.c
> +++ b/drivers/remoteproc/ti_k3_r5_remoteproc.c
> @@ -1533,32 +1533,6 @@ static int k3_r5_core_of_get_sram_memories(struct platform_device *pdev,
>   	return 0;
>   }
>   
> -static
> -struct ti_sci_proc *k3_r5_core_of_get_tsp(struct device *dev,
> -					  const struct ti_sci_handle *sci)
> -{
> -	struct ti_sci_proc *tsp;
> -	u32 temp[2];
> -	int ret;
> -
> -	ret = of_property_read_u32_array(dev_of_node(dev), "ti,sci-proc-ids",
> -					 temp, 2);
> -	if (ret < 0)
> -		return ERR_PTR(ret);
> -
> -	tsp = devm_kzalloc(dev, sizeof(*tsp), GFP_KERNEL);
> -	if (!tsp)
> -		return ERR_PTR(-ENOMEM);
> -
> -	tsp->dev = dev;
> -	tsp->sci = sci;
> -	tsp->ops = &sci->ops.proc_ops;
> -	tsp->proc_id = temp[0];
> -	tsp->host_id = temp[1];
> -
> -	return tsp;
> -}
> -
>   static int k3_r5_core_of_init(struct platform_device *pdev)
>   {
>   	struct device *dev = &pdev->dev;
> @@ -1633,7 +1607,7 @@ static int k3_r5_core_of_init(struct platform_device *pdev)
>   		goto err;
>   	}
>   
> -	core->tsp = k3_r5_core_of_get_tsp(dev, core->ti_sci);
> +	core->tsp = ti_sci_proc_of_get_tsp(dev, core->ti_sci);
>   	if (IS_ERR(core->tsp)) {
>   		ret = PTR_ERR(core->tsp);
>   		dev_err(dev, "failed to construct ti-sci proc control, ret = %d\n",
> diff --git a/drivers/remoteproc/ti_sci_proc.h b/drivers/remoteproc/ti_sci_proc.h
> index 778558abcdcc5..f3911ce75252e 100644
> --- a/drivers/remoteproc/ti_sci_proc.h
> +++ b/drivers/remoteproc/ti_sci_proc.h
> @@ -28,6 +28,32 @@ struct ti_sci_proc {
>   	u8 host_id;
>   };
>   
> +static inline
> +struct ti_sci_proc *ti_sci_proc_of_get_tsp(struct device *dev,
> +					   const struct ti_sci_handle *sci)
> +{
> +	struct ti_sci_proc *tsp;
> +	u32 temp[2];
> +	int ret;
> +
> +	ret = of_property_read_u32_array(dev_of_node(dev), "ti,sci-proc-ids",
> +					 temp, 2);
> +	if (ret < 0)
> +		return ERR_PTR(ret);
> +
> +	tsp = devm_kzalloc(dev, sizeof(*tsp), GFP_KERNEL);
> +	if (!tsp)
> +		return ERR_PTR(-ENOMEM);
> +
> +	tsp->dev = dev;
> +	tsp->sci = sci;
> +	tsp->ops = &sci->ops.proc_ops;
> +	tsp->proc_id = temp[0];
> +	tsp->host_id = temp[1];
> +
> +	return tsp;
> +}
> +
>   static inline int ti_sci_proc_request(struct ti_sci_proc *tsp)
>   {
>   	int ret;

