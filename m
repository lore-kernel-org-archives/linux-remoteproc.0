Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F40047A4C;
	Sun, 22 Sep 2024 20:21:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727036477; cv=none; b=Ie6AerpWHtu3smACqgHE1KCLSRDm4ok6ZbW8HSxUpYjkvNESDt+4xR4W8BI+tafGZFvjtEegoy+uly9DHxLiTeBdBaBy9mO9TyYpwrwdNwp+K3dYrxk/Ew40SNVSX7boCvGIVuURkPqbodr4agcuLGd/kLwO+RhMUbtxU3xd6E8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727036477; c=relaxed/simple;
	bh=InhEVXvKe00XKGjJ0zyePEOYAcKMa68cdzla8J9zOr4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hfov7v4qb8b1SfC8yWBVSWeTIL1Hcjp9hoQXEeVKOLIsOzlZ5nYybiSWbQJxyXYEzpIkNtt9FTaL864X6i0QFYV2u+NRmE5mQWumyNvynjw4oQ0u0clhgFDgoJoyyw0NUtCgSqNPta3onQQX+zSyE/Rlxn2aP+oQiKZ26V4qs7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HIPOxPFV; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HIPOxPFV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3EC5C4CEC3;
	Sun, 22 Sep 2024 20:21:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727036477;
	bh=InhEVXvKe00XKGjJ0zyePEOYAcKMa68cdzla8J9zOr4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=HIPOxPFV4y2v+s1byS7VmY+eMlF/84VYPCP3JDSGlXXYyhEvszRdYsjepLXXo7W7j
	 95IGNKnpZJZzKmk/50ysSe1L0MBcdDts2KP322kwtHRH13qsvjnPFXsAMxa807VDtb
	 lg7nOV7V6mYwraZVhy1r2gEuDqAbXki60IIpRtAty39YNkrsaJ/JhvXipMT3nENJyv
	 KRf2ubFSuSmrTRiWveeQkIGl3O057SLtVopYM/PooHJHRPqG7aUVKEM0UWJZZpMrYT
	 Dr0fjiosjI38ldD2KX9ARq+tZr0dliXT3xQP9MclAhA24A6+iah7VQnEPB3LH/pxEw
	 kRpbzOEN0EtlA==
Message-ID: <275b1b46-4ed0-44d8-a240-93a422e96bbf@kernel.org>
Date: Sun, 22 Sep 2024 22:21:08 +0200
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 5/5] remoteproc: add support for Microchip IPC
 remoteproc platform driver
To: Valentina.FernandezAlanis@microchip.com, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, peterlin@andestech.com,
 dminus@andestech.com, Conor.Dooley@microchip.com, conor+dt@kernel.org,
 ycliang@andestech.com, jassisinghbrar@gmail.com, robh@kernel.org,
 krzk+dt@kernel.org, andersson@kernel.org, mathieu.poirier@linaro.org
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-remoteproc@vger.kernel.org
References: <20240912170025.455167-1-valentina.fernandezalanis@microchip.com>
 <20240912170025.455167-6-valentina.fernandezalanis@microchip.com>
 <6f1fa401-e9ca-466f-990a-52bc37899bf4@kernel.org>
 <1ece2f4b-6f2d-452f-b2af-18d0895f9443@microchip.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <1ece2f4b-6f2d-452f-b2af-18d0895f9443@microchip.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 18/09/2024 17:51, Valentina.FernandezAlanis@microchip.com wrote:
> On 16/09/2024 21:18, Krzysztof Kozlowski wrote:
>> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
>>
>> On 12/09/2024 19:00, Valentina Fernandez wrote:
>>> The Microchip family of RISC-V SoCs typically has one or more clusters.
>>> These clusters can be configured to run in Asymmetric Multi-Processing
>>> (AMP) mode.
>>>
>>> Add a remoteproc platform driver to be able to load and boot firmware
>>> to the remote processor(s).
>>
>> ...
>>
>>> +
>>> +static int mchp_ipc_rproc_prepare(struct rproc *rproc)
>>> +{
>>> +     struct mchp_ipc_rproc *priv = rproc->priv;
>>> +     struct device_node *np = priv->dev->of_node;
>>> +     struct rproc_mem_entry *mem;
>>> +     struct reserved_mem *rmem;
>>> +     struct of_phandle_iterator it;
>>> +     u64 device_address;
>>> +
>>> +     reinit_completion(&priv->start_done);
>>> +
>>> +     of_phandle_iterator_init(&it, np, "memory-region", NULL, 0);
>>> +     while (of_phandle_iterator_next(&it) == 0) {
>>> +             /*
>>> +              * Ignore the first memory region which will be used vdev
>>> +              * buffer. No need to do extra handlings, rproc_add_virtio_dev
>>> +              * will handle it.
>>> +              */
>>> +             if (!strcmp(it.node->name, "vdev0buffer"))
>>
>> What? If you ignore the first, then why are you checking names? This
>> does not make sense. Especially that your binding did not say anything
>> about these phandles being somehow special.
> 
> The idea in the code above is to skip the vdev buffer allocation and 
> carveout registration. Later, when the remoteproc virtio driver 
> registers the virtio device (rproc_add_virtio_dev), it will attempt to 
> find the carveout. Since the carveout wasn’t registered, it will use the 
> first memory region from the parent by calling 
> of_reserved_mem_device_init_by_idx.
> 
> This behavior is based on some existing platform drivers. However, upon 
> further inspection, it seems that some newer drivers use 
> rproc_of_resm_mem_entry_init to allocate vdev buffers.
> 
> I will restructure this section and rephase/drop the comment.
> 
> With regards the bindings, I'll explain better all the memory regions 
> for v2.
> 
> Just for everyone’s information, we have the following use cases:
> 
> Early boot: Remote processors are booted by another entity before Linux, 
> so we only need to attach. For this mode, we require the resource table 
> as a memory region in the device tree.
> 
> Late boot - Linux is responsible for loading the firmware and starting 
> it on the remote processors. For this, we need the region used for the 
> firmware image.
> 
> In both cases, rpmsg communication is optional. This means that the vdev 
> buffers and vrings memory regions are also optional.
> 
> There could also be a mixed case where we start with early boot mode by 
> attaching to an existing remoteproc, and then stop, start, and load 
> another firmware once Linux has booted. In this case, we would require 
> the resource table and firmware image region, and optionally, vdev 
> buffers and vrings.
> 
>>
>>> +                     continue;
>>> +
>>> +             if (!strcmp(it.node->name, "rsc-table"))
>>
>> Nope.
> Since the resource table is only needed for early boot mode and does not 
> need to be a carveout region, we are skipping that.
> 
> I will work on making the resource table a fixed index in the 
> memory-region property so that it doesn't have a fixed name.

The list of memory-regions already HAS fixed indices. All this is not
only confusing, but incorrect. I commented that if I call the node
"rsc-not-a-table" your code will stop working.

Best regards,
Krzysztof

