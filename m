Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 358DE1DED40;
	Wed, 15 Apr 2026 06:50:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776235836; cv=none; b=E4Z3P1evSaELRqxTWMFVUnr5qqz+O+kfRjJQqSvFEGBU1xFW1e0XsLg1RSpmLq4Ux1KYgbgG0T3xU/SfCjRfOiFs3SIE8tKUbYK3uZTPjHso1Vd0v9LFnNuA5HBO9qIbzgVpLJGgtUa5d1WArFfRpVuHfomLOqpPU14HrkOZY7w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776235836; c=relaxed/simple;
	bh=VMsBoLHhYIV1HKVvlIVHKMnGf+X02Zf4nkTRpF9ABgA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XirAwrznFrSB+crHBd8FlI/6ujvcZm3UQVxkXEjpeTHHv24AI8gcq9vejIlqz/JdTgcZCkOyKCaRPD+d2JoPUTi9OCcxzQGx6r3waShFI+z16PNVdB+2A7WGf/EwNGnt58CvrBSL3TTHf2vaRpMtdMEl2qsfxyK0X2dFtA8zDkw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uf6STzNo; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uf6STzNo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE11CC19424;
	Wed, 15 Apr 2026 06:50:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776235836;
	bh=VMsBoLHhYIV1HKVvlIVHKMnGf+X02Zf4nkTRpF9ABgA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=uf6STzNoLtQ/PB/vp7RvJn5Yxl1Xr2hLXzHpLzgHvSSxTQuUz5SozAYlsJoZl+dHd
	 5U6OZlOiiT8rjUlxd9EpTa047UA+zjyUhU0biPk9xILqNKvXmQLkk8SE1Z8ebvKhjm
	 LPFGXeAEt15QUY/6SFVPQw5/cR8hzbE+lrBLySXeMVNurOYawv7uHUxKnqJyf1fCn/
	 iz3WrWyxI+VExZzUBiq147+zF86T/wX63aYhqZTYKnMyHLAFO0VbkE0cAX3KQGE846
	 mmoReb7yhi5OwuAlPPt9oR0kAEBUhfDEiTD/5MAEMdGguvqFwNAq/LyDC8rdOZ1BqH
	 dPpK4Fk38Fj4A==
Message-ID: <bf54faab-fac5-4c5c-89ea-04e328986760@kernel.org>
Date: Wed, 15 Apr 2026 08:50:31 +0200
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: remoteproc: add AMD MicroBlaze binding
To: Michal Simek <michal.simek@amd.com>, Ben Levinsky <ben.levinsky@amd.com>,
 andersson@kernel.org, mathieu.poirier@linaro.org
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, tanmay.shah@amd.com
References: <20260414161558.2579920-1-ben.levinsky@amd.com>
 <20260414161558.2579920-2-ben.levinsky@amd.com>
 <774a8e9f-cfd9-4584-aaf0-2fd1189f65e8@kernel.org>
 <e82faa64-22fa-4dba-8cde-f02cf9f95e25@amd.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <e82faa64-22fa-4dba-8cde-f02cf9f95e25@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 15/04/2026 08:16, Michal Simek wrote:
> 
> 
> On 4/14/26 19:53, Krzysztof Kozlowski wrote:
>> On 14/04/2026 18:15, Ben Levinsky wrote:
>>
>> A nit, subject: drop second/last, redundant "binding". The "dt-bindings"
>> prefix is already stating that these are bindings.
>> See also:
>> https://elixir.bootlin.com/linux/v6.17-rc3/source/Documentation/devicetree/bindings/submitting-patches.rst#L18
>>
>>> +---
>>> +$id: http://devicetree.org/schemas/remoteproc/amd,microblaze.yaml#
>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>> +
>>> +title: AMD MicroBlaze remote processor
>>> +
>>> +maintainers:
>>> +  - Ben Levinsky <ben.levinsky@amd.com>
>>> +
>>> +description:
>>> +  MicroBlaze remote processor controlled by Linux through the remoteproc
>>> +  framework.
>>
>> Describe hardware, not Linux frameworks. IOW, Linux framework is here
>> irrelevant.
>>
>>> +
>>> +  The executable firmware memory window is described in the
>>> +  MicroBlaze-local address space by the node's reg property and translated
>>> +  to the system physical address space with standard devicetree address
>>> +  translation provided by the parent bus node's ranges property.
>>> +
>>> +properties:
>>> +  $nodename:
>>> +    pattern: "^remoteproc@[0-9a-f]+$"
>>> +
>>> +  compatible:
>>> +    const: amd,microblaze
>>
>> microblaze is architecture, so this feels way too generic. You need SoC
>> specific compatibles and I suggest do not reference architecture, but
>> name or the function of the processor, if there are such.
> 
> I have been arguing internally that I think when you look at driver itself it 
> can be pretty much generic loader for any firmware and doesn't really matter if 

Luckily I don't speak about driver :)

> target subsystem is Microblaze/Risc-V/whatever based. And I was suggesting them 
> to use more generic name.

So the binding is for drivers - generic loader? Then simply no. Not
suitable for DT.

> 
> Because at the end of day reg property is pointing to location where firmware 
> should be loaded and gpio is a way how to start that subsystem and there is 
> nothing Microblaze specific.
> 
> I can also imagine that the same driver could be extended with optional power 
> domain, power regulator and clock properties if there is a need to drive them 
> before subsystem gets out of reset.
> 
> Does it make sense?

Yes, drop from DT. No need for generic stuff. Or describe the hardware.

Best regards,
Krzysztof
