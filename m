Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com [136.143.188.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D64B19DFB4;
	Wed, 30 Jul 2025 10:00:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753869661; cv=pass; b=ljoHOlOCceHU28gcFFseqMu5lSd6vATxymuGQ5o59+uxNzlWUpYbmkZGKA9aL4Bh4kXxJC6YSWV+gqls+XiGEEXclnLlmCVsStWhqPTgSN0bsCS11TdDQf98ueWTiJdp7QqJ5wX8untYVFSFRB6kEJggrWJDiCGk6lJJZDUTBPA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753869661; c=relaxed/simple;
	bh=P8CQgssKSIaGk0xRCqs4CM81zbWzC1LUae6FEPLRlOw=;
	h=MIME-Version:From:To:In-Reply-To:Cc:Subject:Message-ID:Date:
	 Content-Type; b=Igo+HioG6TVKaLsmHLqti6/SPDr6gemEd2iVFMlsdEkHSAU51BGES8tMEfDGfFI1AYayD/CEH4eHqY1uZR6qKjTKmxx5fDc5MGBq50CeQyhkZGM9k6ynFNHYFts2rgAKtXBQVE7NMYsTLRfhigVd0UCxZCn2XZFGcFqL+GvcxIY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pigmoral.tech; spf=pass smtp.mailfrom=pigmoral.tech; dkim=pass (1024-bit key) header.d=pigmoral.tech header.i=junhui.liu@pigmoral.tech header.b=RNigQPZE; arc=pass smtp.client-ip=136.143.188.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pigmoral.tech
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pigmoral.tech
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=pigmoral.tech header.i=junhui.liu@pigmoral.tech header.b="RNigQPZE"
ARC-Seal: i=1; a=rsa-sha256; t=1753869630; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=mVHba9e1imXwc9oD9l4XIa6BmxmDyMn1i5zBQhdL1EHhgFhOCoBjMS6p+Xu6+AkQKrV+UiyEtdDfxgKxFhbhJuAJ07U4rSgoxmkmTPKKt/AuJ0hLKaJF4t2L7K4AOvfdp5EFnu3Mj78fsV//6cDdVQ/R+0zfY2aSIcJWLNPg064=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1753869630; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=dJCJxzbcOMXSmaYqhU1ZQU8GEIkWpngcSTaDLY085mc=; 
	b=a7B0WqvQuQRZzbOpb3be2Pa+L+PzdEu8xYwPWcO6HkgCKYmILU3RZp45NltHPZawUXfOoiVL2gGFbfIGBOuRQyqp/8nDcjzKKujEF3/WCYOSRDyjdyTuE+QykeXoPO7sWkXinJFG4qWslKA+/ID9pfd8F8cNK04TUMyk5iNHLtc=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=pigmoral.tech;
	spf=pass  smtp.mailfrom=junhui.liu@pigmoral.tech;
	dmarc=pass header.from=<junhui.liu@pigmoral.tech>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1753869630;
	s=zmail; d=pigmoral.tech; i=junhui.liu@pigmoral.tech;
	h=MIME-Version:From:From:To:To:In-Reply-To:Cc:Cc:Subject:Subject:Message-ID:Date:Date:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=dJCJxzbcOMXSmaYqhU1ZQU8GEIkWpngcSTaDLY085mc=;
	b=RNigQPZElgWg3b6atXoHhURBwH86YwWzXDl8JABOLq9JHNgbWcJ2FaPCBqfDiCvw
	zg6hxEpoZubFOrlUmDDlsKGESC3cp2rK7SMFWwf+lqONIOk4DwGwOsroZryDclFHl/o
	+ASps9v37kbVzoihpWNMHbSJR2M3FX147xXFh/58=
Received: by mx.zohomail.com with SMTPS id 17538696277121019.2099092907802;
	Wed, 30 Jul 2025 03:00:27 -0700 (PDT)
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
In-Reply-To: <9dd2af04-5109-43e4-b097-d6b1b4c45dbd@kernel.org>
Cc: <linux-remoteproc@vger.kernel.org>, <devicetree@vger.kernel.org>, 
	<sophgo@lists.linux.dev>, <linux-kernel@vger.kernel.org>, 
	<linux-riscv@lists.infradead.org>
Subject: Re: [PATCH v2 2/2] drivers: remoteproc: Add C906L controller for Sophgo
	 CV1800B SoC
Message-ID: <1856ff20ba2bf450.56ed58d65d21d4ef.5a222480fa1019f2@Jude-Air.local>
Date: Wed, 30 Jul 2025 10:00:20 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-ZohoMailClient: External

On 30/07/2025 11:35, Krzysztof Kozlowski wrote:
> On 30/07/2025 11:27, Junhui Liu wrote:
>> On 30/07/2025 08:46, Krzysztof Kozlowski wrote:
>>> On 28/07/2025 13:03, Junhui Liu wrote:
>>>> +
>>>> +static int cv1800b_c906l_mem_alloc(struct rproc *rproc,
>>>> +				   struct rproc_mem_entry *mem)
>>>> +{
>>>> +	void __iomem *va;
>>>> +
>>>> +	va =3D ioremap_wc(mem->dma, mem->len);
>>>> +	if (!va)
>>>> +		return -ENOMEM;
>>>> +
>>>> +	/* Update memory entry va */
>>>> +	mem->va =3D (void *)va;
>>>> +
>>>> +	return 0;
>>>> +}
>>>> +
>>>> +static int cv1800b_c906l_mem_release(struct rproc *rproc,
>>>> +				     struct rproc_mem_entry *mem)
>>>> +{
>>>> +	iounmap((void __iomem *)mem->va);
>>>> +	return 0;
>>>> +}
>>>> +
>>>> +static int cv1800b_c906l_add_carveout(struct rproc *rproc)
>>>> +{
>>>> +	struct device *dev =3D rproc->dev.parent;
>>>> +	struct device_node *np =3D dev->of_node;
>>>> +	struct of_phandle_iterator it;
>>>> +	struct rproc_mem_entry *mem;
>>>> +	struct reserved_mem *rmem;
>>>> +	int i =3D 0;
>>>> +
>>>> +	/* Register associated reserved memory regions */
>>>> +	of_phandle_iterator_init(&it, np, "memory-region", NULL, 0);
>>>> +	while (of_phandle_iterator_next(&it) =3D=3D 0) {
>>>> +		rmem =3D of_reserved_mem_lookup(it.node);
>>>> +		if (!rmem) {
>>>> +			of_node_put(it.node);
>>>> +			return -EINVAL;
>>>> +		}
>>>> +
>>>> +		if (!strcmp(it.node->name, "vdev0buffer")) {
>>>
>>> Why are you adding undocumented ABI? And so hidden, not even using
>>> standard OF API!
>>>
>>> How does this behaves when I change your DTS to call it
>>> "whateverbuffer"? Does it work? Obviously not.
>>>
>>> No, stop doing that.
>>=20
>> Yes, you're right. I will consider introducing a "memory-region-names"
>> property in the bindings, instead of relying on the node labels directly.=

>=20
>=20
> You don't need it. First, you use some old code as template, but you
> should look how or re-use Rob's code rewriting this completely.

Sorry, I didn't catch up with that patch. I will look into it and update
my implementation accordingly.

>=20
> Second, list has strict order, so you know exactly where the vdev0
> buffer is. It cannot be on any other position of the list.

Thanks for the advice, I will use the order in the list to identify the
memory region.

>=20
> This is why you define the ABI. Use then the ABI.
>=20

Understood, I will reconsider this.

--=20
Best regards,
Junhui Liu

