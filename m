Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86C34293B63;
	Wed, 30 Jul 2025 09:35:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753868159; cv=none; b=UoQGgYJd4spuOaP2fqNUICmmyzb8TV2AcuuQoy7+IeUYTJqiz6yrMLiq+wEwcalqRHoQ8q4oIbGi21tHfGHrtsh1GXBVqTO1sC8qmMyQaV11s3llqgWNtPGKoOzKRWSzqtOlmQOVmsJ+9CSICsndW+tafQeXPPrGQF+W7UNCg1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753868159; c=relaxed/simple;
	bh=PzvAqEp4SfY/LLfvCtZGeWxCRUZOK1mQy74OYoBIq0M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hZFHKyh5u9eMQXeE+q9cQMoIzP0ys1+v/xvdRTVhZaVIuGWMocnePDhv6v9QqUWJme1az2tSMqpObG/wdS9fGYLYCeuXk2zZ7q/SeYD3BN2r2HxYc5V6pvEFlLh2oxTw7UAMbLADxAl1OQsEdN9dpPWQsh5GdnGSret9JuIEKMA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WMdcWH+N; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WMdcWH+N"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CDC7DC4CEE7;
	Wed, 30 Jul 2025 09:35:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753868158;
	bh=PzvAqEp4SfY/LLfvCtZGeWxCRUZOK1mQy74OYoBIq0M=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=WMdcWH+N6qQJt2u91P+MJa1G3tWHMXvjLCifeiNyQSu0J9736TrRcRLEWXx4I27zy
	 wYdK2RutevXQVHB5ivqxrvkgUIp9ehpp9ufglTalMLH5gjZPIWoNQDVQfnOEM9JgyN
	 eimbZnO0YslNQxCuE1gp+cbhm60EuPz12ENwnAOTNqP7lAbl/t2ji9YUIRewWgmqhy
	 6rtth2fI6lPP1nUjpZPtlKFqN1feoMNgrNqg06torbpuxyQTaeW0tSpt/YAIuClU8o
	 uA5Bk0SFwYpcyKtISvFCYONoCKE3ROE4rO0Vk08e4WQ7mTCBUnqpxQn/wKTUjcP8mj
	 wUVyMoyUKF8IA==
Message-ID: <9dd2af04-5109-43e4-b097-d6b1b4c45dbd@kernel.org>
Date: Wed, 30 Jul 2025 11:35:52 +0200
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] drivers: remoteproc: Add C906L controller for
 Sophgo CV1800B SoC
To: Junhui Liu <junhui.liu@pigmoral.tech>,
 Bjorn Andersson <andersson@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Chen Wang <unicorn_wang@outlook.com>,
 Inochi Amaoto <inochiama@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
 sophgo@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org
References: <1856fd5bd24fbc18.7164ab65bf64e5c2.99b72db93ceee539@Jude-Air.local>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <1856fd5bd24fbc18.7164ab65bf64e5c2.99b72db93ceee539@Jude-Air.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 30/07/2025 11:27, Junhui Liu wrote:
> On 30/07/2025 08:46, Krzysztof Kozlowski wrote:
>> On 28/07/2025 13:03, Junhui Liu wrote:
>>> +
>>> +static int cv1800b_c906l_mem_alloc(struct rproc *rproc,
>>> +				   struct rproc_mem_entry *mem)
>>> +{
>>> +	void __iomem *va;
>>> +
>>> +	va = ioremap_wc(mem->dma, mem->len);
>>> +	if (!va)
>>> +		return -ENOMEM;
>>> +
>>> +	/* Update memory entry va */
>>> +	mem->va = (void *)va;
>>> +
>>> +	return 0;
>>> +}
>>> +
>>> +static int cv1800b_c906l_mem_release(struct rproc *rproc,
>>> +				     struct rproc_mem_entry *mem)
>>> +{
>>> +	iounmap((void __iomem *)mem->va);
>>> +	return 0;
>>> +}
>>> +
>>> +static int cv1800b_c906l_add_carveout(struct rproc *rproc)
>>> +{
>>> +	struct device *dev = rproc->dev.parent;
>>> +	struct device_node *np = dev->of_node;
>>> +	struct of_phandle_iterator it;
>>> +	struct rproc_mem_entry *mem;
>>> +	struct reserved_mem *rmem;
>>> +	int i = 0;
>>> +
>>> +	/* Register associated reserved memory regions */
>>> +	of_phandle_iterator_init(&it, np, "memory-region", NULL, 0);
>>> +	while (of_phandle_iterator_next(&it) == 0) {
>>> +		rmem = of_reserved_mem_lookup(it.node);
>>> +		if (!rmem) {
>>> +			of_node_put(it.node);
>>> +			return -EINVAL;
>>> +		}
>>> +
>>> +		if (!strcmp(it.node->name, "vdev0buffer")) {
>>
>> Why are you adding undocumented ABI? And so hidden, not even using
>> standard OF API!
>>
>> How does this behaves when I change your DTS to call it
>> "whateverbuffer"? Does it work? Obviously not.
>>
>> No, stop doing that.
> 
> Yes, you're right. I will consider introducing a "memory-region-names"
> property in the bindings, instead of relying on the node labels directly.


You don't need it. First, you use some old code as template, but you
should look how or re-use Rob's code rewriting this completely.

Second, list has strict order, so you know exactly where the vdev0
buffer is. It cannot be on any other position of the list.

This is why you define the ABI. Use then the ABI.


Best regards,
Krzysztof
