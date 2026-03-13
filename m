Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20CE730E82D;
	Fri, 13 Mar 2026 15:49:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773416961; cv=none; b=bpwpH3ujzmrpofhAse9m21ylCruxH1z8Ycw4jCfKO72Dk8/e1ZwECBQMn4579lOTw3epWTW1XCLNNZ5/lfNAu8WSuwjxM0+5jX9stzk7cUrsGSSEpKmiTBwRpOvjyG7SCCoKDeZLv1ROKI8bD9ZQ7YeJuAMrXI/EwYgqH7hXsHI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773416961; c=relaxed/simple;
	bh=z57Tf7Z7/AgkJp5BlAyT2BBV9PYTgl6tC4lbtgL5PU0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oVMdJwewtgvS8g6CLnHhmB4GcYv3uxluw6EoKIFa1/13/2mOcn6hAg6lEi0MFB97dCbfdcoQrMXoK30I7pO0c2FxJua38N4zX3111yPZ+k/xwZBbpjA9KCnTqcBOKer0dYB9QZadd95NXooyuyL9f8MqWhHzVGDP1IJsyOsmYjE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=K3+rHyjs; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="K3+rHyjs"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38AA3C19425;
	Fri, 13 Mar 2026 15:49:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773416960;
	bh=z57Tf7Z7/AgkJp5BlAyT2BBV9PYTgl6tC4lbtgL5PU0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=K3+rHyjs+IrOar126hgYD5L/iPUGP/H5gTLYu6YSk0MvWeTwDcf4bDlNu2XGDBtT7
	 zRxW+Ta2ufkwk3XxtnNGVORAPRmoiNKStSHMv27RuqpEY71PnpRCN78OBCSKG+G5ye
	 zsfXqWd05cRwBMjzWDe/x6NSBHNTyPTrm2bF9Yei9Le1ds1a8wYQOSLcjSdRYEvrAF
	 c6NZ6YOLGf2YPcAvHdtQhbvxdCx+UIrclCrpLwLV02TGpCNW8CAYoUJEV1LnITX+2g
	 WeIKPD/RQ8nDdruth2piW2Jt46qq5NaXt6cJu74OO7/RTufDVH6xd+bxm0JqFE2N7V
	 QJiT4tFhzedhQ==
Message-ID: <849c07bd-2f8d-4982-b5cf-c336807ab8ed@kernel.org>
Date: Fri, 13 Mar 2026 16:49:14 +0100
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 8/8] dt-bindings: remoteproc: k3-r5f: Require
 memory-region-names
To: Markus Schneider-Pargmann <msp@baylibre.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Suman Anna <s-anna@ti.com>, Nishanth Menon
 <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tero Kristo <kristo@kernel.org>, Vishal Mahaveer <vishalm@ti.com>,
 Kevin Hilman <khilman@baylibre.com>, Dhruva Gole <d-gole@ti.com>,
 Sebin Francis <sebin.francis@ti.com>, Kendall Willis <k-willis@ti.com>,
 Akashdeep Kaur <a-kaur@ti.com>, linux-remoteproc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20260312-topic-am62a-ioddr-dt-v6-19-v2-0-37cb7ceec658@baylibre.com>
 <20260312-topic-am62a-ioddr-dt-v6-19-v2-8-37cb7ceec658@baylibre.com>
 <20260313-quantum-modest-prawn-896bde@quoll>
 <DH1P27ZP9QYQ.2IP3X8G218GR8@baylibre.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <DH1P27ZP9QYQ.2IP3X8G218GR8@baylibre.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 13/03/2026 14:38, Markus Schneider-Pargmann wrote:
> Hi Krzysztof,
> 
> On Fri Mar 13, 2026 at 2:13 PM CET, Krzysztof Kozlowski wrote:
>> On Thu, Mar 12, 2026 at 04:49:02PM +0100, Markus Schneider-Pargmann (TI) wrote:
>>> If memory-region is used, require memory-region-names.
>>
>> Why?
> 
> This was a suggestion/comment from Conor in the last version:
> 
>     Is this really optional? Shouldn't it be made mandatory so that it is
>     easy to tell the difference between the two configurations?

Then write it in commit msg. You have entire commit msg to explain why
you are doing things, instead of obvious what. We can read the diff.

> 
> https://lore.kernel.org/all/20260303-hesitate-preoccupy-5e311cbd3e58@spud/
> 
>>
>> I don't understand also why this is a separate change, but maybe answer
>> to "Why are you doing it" would cover it as well.
> 
> I made this a separate patch so the git tree never has any
> binding/devicectree warnings for memory-region-names even in-between
> patches. That's why I created these patches in this order:
> 
> 1. Add the memory-region-names as an optional property.
> 2. Add memory-region-names to all users of memory-region.

So what is the point of this if it is optional? IOW, what does this
commit achieve? Almost nothing.

> 3. Make the property required if memory-region exists.

but only required here? You need to organize your work in logical hunks.

> Markus


Best regards,
Krzysztof
