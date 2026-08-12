Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8065D358399;
	Wed, 12 Aug 2026 10:03:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786528987; cv=none; b=VcLksElZVVVSpdpeS5P4XLc1XsfDEw0m1CUXkTD7YLxSWxPHhyf9KXc43Me2F1aJ6OAnSaEA+ojapr7m7s8FHTh7wfQhyO4RdW1Wzz+kn7iedAEt6x7+YveKELa6A52oDr8Ky+DXz/4Adv06Ry1MYBU3TC0XelaqG/dgrXAUqyU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786528987; c=relaxed/simple;
	bh=wssolmgJd/cBFSr8Zocs0/SA81bRmq+iJzXTmINeuoE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZOr9TJ5/U2OSlH7FQwfGbyM8EmQaQZgMIaE5XOdmZb5wUTq6i76OYiN2qkCQM40pDlKsrtNj4vtfaa4T45vj/7sinZUnvAmIzr3Wh/I7IIfPJLQjmNRTd1XOaqY3jX69efg1UYbpQuJ6I+n7Xm2zvMx5E4VGa+SmnvJOcRhE4o8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Z8F/fftD; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Z8F/fftD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E4CA31F000E9;
	Wed, 12 Aug 2026 10:03:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786528986;
	bh=VUCfF1UAtrr5Sz4037NGCH3ZcjKNMv5UJ6wXb/uvgGE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=Z8F/fftDf17dt8VMfG82K31UoEYpifag2Gyi7U0w7Yuwig7vvuUyhvkOCdpBvnFFX
	 dkedhhx8vCot3G+jTLeTXk2hvnWTyGTkefYL1SvjktZE0RELs5p95FVPnhjrEk9r8j
	 J1gtfw1ED2MDkEF3tMiBBGt0OygTcnEtrKStDFWAoRz6I1QpcPT466wvD6RjipjTWL
	 2eOB+YWwPkh9Rcv7Tm2JKb1IwZs5Ug5+sJyx1eAFCq8ib3OsxpqRuXB/xQNO0bZVbF
	 MSxftiofDrGViSeKOocIxOZH0eeOQ9sa2/7tjjo6VhrAy+9IrV/HSpmGTBoSlIvWgb
	 G/eQ0rqSOmXZA==
Message-ID: <9557331b-8d7e-4235-93c5-f8b799df6fff@kernel.org>
Date: Wed, 12 Aug 2026 12:02:58 +0200
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/4] dt-bindings: remoteproc: add imx-rproc-psci
To: Jiafei Pan <jiafei.pan@nxp.com>
Cc: "andersson@kernel.org" <andersson@kernel.org>,
 "mathieu.poirier@linaro.org" <mathieu.poirier@linaro.org>,
 Peng Fan <peng.fan@nxp.com>, Frank Li <frank.li@nxp.com>,
 "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
 "kernel@pengutronix.de" <kernel@pengutronix.de>,
 "festevam@gmail.com" <festevam@gmail.com>,
 "imx@lists.linux.dev" <imx@lists.linux.dev>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "Z.Q. Hou" <zhiqiang.hou@nxp.com>, Mingkai Hu <mingkai.hu@nxp.com>,
 "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
References: <20260511023928.39640-1-Jiafei.Pan@nxp.com>
 <20260511023928.39640-2-Jiafei.Pan@nxp.com>
 <20260514-omniscient-futuristic-macaque-af0718@quoll>
 <MRWPR04MB1227740CFAD4D4AAF1758F8A48ADC2@MRWPR04MB12277.eurprd04.prod.outlook.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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
In-Reply-To: <MRWPR04MB1227740CFAD4D4AAF1758F8A48ADC2@MRWPR04MB12277.eurprd04.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 12/08/2026 11:19, Jiafei Pan wrote:
> 
> NXP Confidential
> On Wed, May 14, 2026 at 11:38:13AM +0000, Krzysztof Kozlowski wrote:
>>> +description:
>>> +  This binding provides support for managing Cortex-A cores as remote
>>> +  processors on i.MX platforms using the PSCI (Power State Coordination
>>> +  Interface) for CPU power management operations. This allows single
>>> +  Cortex-A core or multiple Cortex-A cores to be controlled by Linux as
>>> +  a remote processor, enabling them to run RTOS or bare-metal applications.
>>
>> Describe the hardware, not the binding.
> 
> Will fix. Updated to describe the hardware:
> 
>   NXP i.MX SoCs integrate multiple Cortex-A cores. On certain i.MX
>   platforms, one or more of these cores can be offloaded to run RTOS
>   or bare-metal firmware as a remote processor, while the remaining
>   cores run Linux. The cores are powered on and off via PSCI (Power
>   State Coordination Interface) CPU_ON/CPU_OFF calls to the firmware.
> 
>>> +  compatible:
>>> +    const: fsl,imx-rproc-psci
>>
>> Why isn't the compatible specific?
> 
> Will fix. Updated to use a SoC-specific compatible with a generic
> fallback:
> 
>   compatible:
>     - items:
>       - enum:
>           - fsl,imx93-ca53-rproc-
>       - const: fsl,imx-rproc-psci

Don't do generic fallbacks. Works poor, as visible in multiple cases now.


> 
>>> +  fsl,cpus-mask:
>>> +    $ref: /schemas/types.yaml#/definitions/uint32
>>> +    description:
>>> +      Bitmask indicating which CPU cores are assigned to this remote
>>> +      processor instance. Each bit represents a CPU core, where bit N
>>> +      corresponds to CPU N. For example, 0x2 (0b10) assigns CPU core 1,
>>> +      while 0x6 (0b110) assigns CPU cores 1 and 2.
>>
>> So you partition existing Cortex-A cores? Or how exactly? Why isn't this
>> deducible from the compatible (I assume you read carefully writing
>> bindings)?
> 
> Yes, we partition existing Cortex-A cores. On i.MX93 for example,
> there are 2 Cortex-A55 cores. Core 0 runs Linux as the primary OS,
> while core 1 (or any subset of the remaining cores on SoCs with more
> cores, e.g. 4x A55) can be assigned to a remoteproc instance to run
> RTOS or bare-metal firmware.
> 
> The reason fsl,cpus-mask cannot be deduced from the compatible is
> that the assignment is flexible and board/use-case specific. On a
> 4-core SoC, the user may assign core 1 only, cores 1+2, cores 2+3,
> or all non-primary cores to one or more remoteproc instances. This
> runtime flexibility cannot be encoded in the compatible string.
> 
> We considered using a `cpus` phandle list instead, but the CPU nodes
> in the DT are already claimed by the Linux CPU topology and do not
> naturally represent "remote processor" assignments. The bitmask
> approach directly maps to the PSCI CPU_ON/CPU_OFF MPIDR-based
> interface used by the firmware.
You replied three months after my comment. Well, you have such right but
so you know entire context is gone and I am not going to put my time to
read the binding again.

Just for you know - if you partition the cpus, they are gone from the
cpus list as well. Not sure how this affects the bitmask but remember to
model only available CPUs properly in DT.

Best regards,
Krzysztof
