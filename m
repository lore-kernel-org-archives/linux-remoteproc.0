Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 461FC146593;
	Mon,  7 Apr 2025 13:40:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.246
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744033247; cv=none; b=m/oGt7pC4WHh4dmN7OhZTiBdWSOnJDoybLBu4ArPBC4qOJOc/bH4zLdtrZrTZ2niPF3Z4h1rDk5VS5H7T0hYdE5NE9osSgG+Hlp9FbaW4bZpNtBVlEIVD44e/DzEZH/F5Ai4AD2TGg7VjRFvbj2ZKkfqnbQ2wCA7Mobz+bQbLRI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744033247; c=relaxed/simple;
	bh=yhJDUT6i8ppDfwz9xG5uv5Ef5Hweg7g9o6Vj3vOKbH0=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=BoD1sNPQO7r1Ip/kHoETI3b/DiJfaqTRZu57dWmfg5TFcXkz02jvn7sFMy/WFquBYMJqm7SHT4vtUXceGF7pR/L2Mqdqu3zsgquN1gnOyRFAEuYedCyZsjcgRC4BcVtjWSQteEaD70iQqxTlp+c9cvz9Ijpdye29BVpWsu+LkAQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=Ce8vo0fX; arc=none smtp.client-ip=198.47.19.246
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="Ce8vo0fX"
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 537Deacr933749
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 7 Apr 2025 08:40:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1744033236;
	bh=PPo/y7Y2uwnTf2TG0pRIGClz00gQc/+SAgwtVytYIHI=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=Ce8vo0fX2XRuVFzukO87i1a/1oT4B5+pvWA8fHIAKszpHeV3+JkRynjhb/rmn0ZzP
	 Xzpb9F/8BUfo/zolaWVd1/aCF9Zn4PJ9P+vgWJ9RyMi450wfTfRprMYQKXMsseJUGU
	 X6qw5HG3HKzIwIOn0+JTvbk/n9DwpQQAmToN9W7M=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 537DeaGp076347
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 7 Apr 2025 08:40:36 -0500
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 7
 Apr 2025 08:40:35 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 7 Apr 2025 08:40:35 -0500
Received: from [10.249.42.149] ([10.249.42.149])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 537DeZtD067930;
	Mon, 7 Apr 2025 08:40:35 -0500
Message-ID: <4343a30e-074d-4d5f-8539-0ce9200d473c@ti.com>
Date: Mon, 7 Apr 2025 08:40:35 -0500
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 04/26] remoteproc: k3-{m4/dsp}: Align internal rproc
 data structure with R5
To: Beleswar Padhi <b-padhi@ti.com>, <andersson@kernel.org>,
        <mathieu.poirier@linaro.org>
CC: <hnagalla@ti.com>, <u-kumar1@ti.com>, <jm@ti.com>,
        <jan.kiszka@siemens.com>, <christophe.jaillet@wanadoo.fr>,
        <jkangas@redhat.com>, <eballetbo@redhat.com>,
        <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20250317120622.1746415-1-b-padhi@ti.com>
 <20250317120622.1746415-5-b-padhi@ti.com>
Content-Language: en-US
From: Andrew Davis <afd@ti.com>
In-Reply-To: <20250317120622.1746415-5-b-padhi@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

On 3/17/25 7:06 AM, Beleswar Padhi wrote:
> Introduce a void pointer in the k3_{m4/dsp}_rproc internal data
> structure which can be used to point to any private data needed by the
> driver. Currently, the M4/DSP drivers do not have any private data, so
> the pointer can be left pointing to NULL. Additionally, add a pointer to
> the rproc struct within k3_m4_rproc internal struct. This is done to
> align the data structures with R5 driver which can be factored out at a
> later stage.
> 

This does two things, even if trivial things, just make this into two patches.

Andrew

> Signed-off-by: Beleswar Padhi <b-padhi@ti.com>
> ---
>   drivers/remoteproc/ti_k3_dsp_remoteproc.c | 2 ++
>   drivers/remoteproc/ti_k3_m4_remoteproc.c  | 5 +++++
>   2 files changed, 7 insertions(+)
> 
> diff --git a/drivers/remoteproc/ti_k3_dsp_remoteproc.c b/drivers/remoteproc/ti_k3_dsp_remoteproc.c
> index a695890254ff..31e43e49f1e4 100644
> --- a/drivers/remoteproc/ti_k3_dsp_remoteproc.c
> +++ b/drivers/remoteproc/ti_k3_dsp_remoteproc.c
> @@ -76,6 +76,7 @@ struct k3_dsp_dev_data {
>    * @ti_sci_id: TI-SCI device identifier
>    * @mbox: mailbox channel handle
>    * @client: mailbox client to request the mailbox channel
> + * @priv: Remote processor private data
>    */
>   struct k3_dsp_rproc {
>   	struct device *dev;
> @@ -91,6 +92,7 @@ struct k3_dsp_rproc {
>   	u32 ti_sci_id;
>   	struct mbox_chan *mbox;
>   	struct mbox_client client;
> +	void *priv;
>   };
>   
>   /**
> diff --git a/drivers/remoteproc/ti_k3_m4_remoteproc.c b/drivers/remoteproc/ti_k3_m4_remoteproc.c
> index a16fb165fced..d0ee7a8d460d 100644
> --- a/drivers/remoteproc/ti_k3_m4_remoteproc.c
> +++ b/drivers/remoteproc/ti_k3_m4_remoteproc.c
> @@ -50,6 +50,7 @@ struct k3_m4_rproc_mem_data {
>   /**
>    * struct k3_m4_rproc - k3 remote processor driver structure
>    * @dev: cached device pointer
> + * @rproc: remoteproc device handle
>    * @mem: internal memory regions data
>    * @num_mems: number of internal memory regions
>    * @rmem: reserved memory regions data
> @@ -60,9 +61,11 @@ struct k3_m4_rproc_mem_data {
>    * @ti_sci_id: TI-SCI device identifier
>    * @mbox: mailbox channel handle
>    * @client: mailbox client to request the mailbox channel
> + * @priv: Remote processor private data
>    */
>   struct k3_m4_rproc {
>   	struct device *dev;
> +	struct rproc *rproc;
>   	struct k3_m4_rproc_mem *mem;
>   	int num_mems;
>   	struct k3_m4_rproc_mem *rmem;
> @@ -73,6 +76,7 @@ struct k3_m4_rproc {
>   	u32 ti_sci_id;
>   	struct mbox_chan *mbox;
>   	struct mbox_client client;
> +	void *priv;
>   };
>   
>   /**
> @@ -578,6 +582,7 @@ static int k3_m4_rproc_probe(struct platform_device *pdev)
>   	rproc->recovery_disabled = true;
>   	kproc = rproc->priv;
>   	kproc->dev = dev;
> +	kproc->rproc = rproc;
>   	platform_set_drvdata(pdev, rproc);
>   
>   	kproc->ti_sci = devm_ti_sci_get_by_phandle(dev, "ti,sci");
