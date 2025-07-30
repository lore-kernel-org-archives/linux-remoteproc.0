Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com [136.143.188.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DBB720E6;
	Wed, 30 Jul 2025 09:28:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753867724; cv=pass; b=G3g7adDYIGRJLgu+IxOC8wY81ojTG7wY4bgdvv21oxdadKDjgW3NET5ifaD7ZbT3IwisR9o14IFGxTbroy+CSw2k8kex8ovsOWIxXz4PzwHKKFPg1JPp0egROraeq2W+eB1wc6BpZRCIhUJXU6k9GOIFFzP1ijhPryhZneXFjMs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753867724; c=relaxed/simple;
	bh=t3c7ApzZHOMiKIf3qYga0AK7Hlk1UGv35rVUccyTIV8=;
	h=MIME-Version:From:To:In-Reply-To:Cc:Subject:Message-ID:Date:
	 Content-Type; b=fGbjPYfNcBIfdd8I/6758yA6+6owW0iinQLjqTTRZizbY+iO0y0MFpmBa64P5Tokf512GuCIFB64Va0/GISvDazIs4LwtHu9lqUW/bJeKNATE/CMgyo/5iv8i0IEL1demuVeu0keSuggKVHP5Rxapnelw5Fc3rMYJaXLhNqVsxY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pigmoral.tech; spf=pass smtp.mailfrom=pigmoral.tech; dkim=pass (1024-bit key) header.d=pigmoral.tech header.i=junhui.liu@pigmoral.tech header.b=ofTCsuO9; arc=pass smtp.client-ip=136.143.188.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pigmoral.tech
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pigmoral.tech
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=pigmoral.tech header.i=junhui.liu@pigmoral.tech header.b="ofTCsuO9"
ARC-Seal: i=1; a=rsa-sha256; t=1753867687; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=nddlrO4R71yX3djJdv0vnzDk2yDBK552d6TsBN0yiSBexeMJAAVdQY7UyR9lwQ7jsA5C2zQbVfYd8GnBaiNQR21tXMF/sepZi2LbrpvDna+jLoxIP+NYcqtJ0yIoM0JZFPZoAkKTdBuYyvjzYl4Dbj8W/p6TSGL5NJgiIhbj4d8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1753867687; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=JM3444/P86FR1Z2gUwUAcrgLuv1NTNO1qEqDAd2ngac=; 
	b=j5hBgeS8On3qEOG7n8tsZvtaIbCQvY507MKEQikPquJ5fURIeYnhZL89+VNzjoYe8eajqzB0PNVWYK/gBGeeHQ5IwjrxN0g8Moy1PmCoi5P6e3ZInP7IHHdfR8NXpW25PtEFLps9Zi/d8fYdcxogzVZNp1U+kts/6b6jreEV1w4=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=pigmoral.tech;
	spf=pass  smtp.mailfrom=junhui.liu@pigmoral.tech;
	dmarc=pass header.from=<junhui.liu@pigmoral.tech>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1753867687;
	s=zmail; d=pigmoral.tech; i=junhui.liu@pigmoral.tech;
	h=MIME-Version:From:From:To:To:In-Reply-To:Cc:Cc:Subject:Subject:Message-ID:Date:Date:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=JM3444/P86FR1Z2gUwUAcrgLuv1NTNO1qEqDAd2ngac=;
	b=ofTCsuO9zgQI/w44cuB+/P49sCcqePfZSEnRJyi43ey2KjwkBgxEJt/AY4d/ae5L
	1E2uaI0nzua2mxogo3GpvOotYE8RXWAZdKnhdf13oCxFMEqWWFftvAxvDA5XbZtTkJT
	5Wzq2Z2SAKOHcRnHSVFi0fbdBTNPsfUdv4Gnooyg=
Received: by mx.zohomail.com with SMTPS id 1753867684529441.77053887820284;
	Wed, 30 Jul 2025 02:28:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Junhui Liu" <junhui.liu@pigmoral.tech>
To: "Krzysztof Kozlowski" <krzk@kernel.org>, 
	"Bjorn Andersson" <andersson@kernel.org>, 
	"Mathieu Poirier" <mathieu.poirier@linaro.org>, 
	"Rob Herring" <robh@kernel.org>, 
	"Krzysztof Kozlowski" <krzk+dt@kernel.org>, 
	"Conor Dooley" <conor+dt@kernel.org>, 
	"Chen Wang" <unicorn_wang@outlook.com>, 
	"Inochi Amaoto" <inochiama@gmail.com>, 
	"Philipp Zabel" <p.zabel@pengutronix.de>, 
	"Paul Walmsley" <paul.walmsley@sifive.com>, 
	"Palmer Dabbelt" <palmer@dabbelt.com>, "Albert Ou" <aou@eecs.berkeley.edu>, 
	"Alexandre Ghiti" <alex@ghiti.fr>
In-Reply-To: <8a4ba1b1-0960-4433-b183-59c99157b0e2@kernel.org>
Cc: <linux-remoteproc@vger.kernel.org>, <devicetree@vger.kernel.org>, 
	<sophgo@lists.linux.dev>, <linux-kernel@vger.kernel.org>, 
	<linux-riscv@lists.infradead.org>
Subject: Re: [PATCH v2 2/2] drivers: remoteproc: Add C906L controller for Sophgo
	 CV1800B SoC
Message-ID: <1856fd5bd24fbc18.7164ab65bf64e5c2.99b72db93ceee539@Jude-Air.local>
Date: Wed, 30 Jul 2025 09:27:55 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-ZohoMailClient: External

On 30/07/2025 08:46, Krzysztof Kozlowski wrote:
> On 28/07/2025 13:03, Junhui Liu wrote:
>> +
>> +static int cv1800b_c906l_mem_alloc(struct rproc *rproc,
>> +				   struct rproc_mem_entry *mem)
>> +{
>> +	void __iomem *va;
>> +
>> +	va =3D ioremap_wc(mem->dma, mem->len);
>> +	if (!va)
>> +		return -ENOMEM;
>> +
>> +	/* Update memory entry va */
>> +	mem->va =3D (void *)va;
>> +
>> +	return 0;
>> +}
>> +
>> +static int cv1800b_c906l_mem_release(struct rproc *rproc,
>> +				     struct rproc_mem_entry *mem)
>> +{
>> +	iounmap((void __iomem *)mem->va);
>> +	return 0;
>> +}
>> +
>> +static int cv1800b_c906l_add_carveout(struct rproc *rproc)
>> +{
>> +	struct device *dev =3D rproc->dev.parent;
>> +	struct device_node *np =3D dev->of_node;
>> +	struct of_phandle_iterator it;
>> +	struct rproc_mem_entry *mem;
>> +	struct reserved_mem *rmem;
>> +	int i =3D 0;
>> +
>> +	/* Register associated reserved memory regions */
>> +	of_phandle_iterator_init(&it, np, "memory-region", NULL, 0);
>> +	while (of_phandle_iterator_next(&it) =3D=3D 0) {
>> +		rmem =3D of_reserved_mem_lookup(it.node);
>> +		if (!rmem) {
>> +			of_node_put(it.node);
>> +			return -EINVAL;
>> +		}
>> +
>> +		if (!strcmp(it.node->name, "vdev0buffer")) {
>=20
> Why are you adding undocumented ABI? And so hidden, not even using
> standard OF API!
>=20
> How does this behaves when I change your DTS to call it
> "whateverbuffer"? Does it work? Obviously not.
>=20
> No, stop doing that.

Yes, you're right. I will consider introducing a "memory-region-names"
property in the bindings, instead of relying on the node labels directly.

--=20
Best regards,
Junhui Liu

