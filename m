Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 051DE22081;
	Mon, 10 Jun 2024 07:38:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718005084; cv=none; b=Q+PKJsEMR5hhM8otjPWee0mVKdc8cm0fmhMFGPOPIeVHMxb33pSw6Mr9oBeeK2CiNa0I/kCBYeRqhFHrh5eTO/F2F4pR9veDVSAsj+x6DIMQVMDytKJ6IjZZs4G6mRgxn3/Mk3yFQsQ/6dkiFO+O9ixULIaiUqGJ/+dZmUqG7uc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718005084; c=relaxed/simple;
	bh=JKT8jeUz+peHP9dNxGhf4e2EBO7WzNrYvduLRcI94GQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FDeQ3hKhI3k1l8/+7rV6n5sufJMGT3Q5BW4apyCLf6/8z1BTMadKhOhB8pBXdrqMJrYZTtBRx9nxojevQPLWuaUG6h95w6wO5ph+oOwmDnByuZDLv0jcBaBBe/IHdsCwFxKiJZwT/wSVWw63h+OIqXbEAYHoaNuNtcXoqS95rmA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Xq+M6SYo; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Xq+M6SYo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B69A3C2BBFC;
	Mon, 10 Jun 2024 07:37:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718005083;
	bh=JKT8jeUz+peHP9dNxGhf4e2EBO7WzNrYvduLRcI94GQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Xq+M6SYoiXTTgSBMjBLlIarHnOx21mTKAc77p3F/gX5OraHEk47d/6C25s+4a+ZW+
	 SwAba5UtfZ8nZRgTjBHOVAWJS/arx4aJ35R6ijq+lTvJNbRLFOe9Nrl99bN7JKhGGs
	 U2cuvYvom6JZYKoqHdEr6BSHZepKlbrreOvW6Znl18D8Kcosg/Gqd/+12PGsgRsOMk
	 WNJjh0BLPv0oHDwNlSkQPKoxcEdYkl69Exi7RuVb3/pttgYWhMNnqiz6juo8dAR3ZF
	 RsDURgHU8B79HiqfVnihSySRTaER3X1cxN+mczemkwnZhoTMIjDexJUSKnYexZUfIM
	 8tgteJvwX+U2A==
Message-ID: <d78b7a50-8f79-4733-bf2b-ee7d70501c47@kernel.org>
Date: Mon, 10 Jun 2024 09:37:56 +0200
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/1] dt-bindings: remoteproc: imx_rproc: add minItems
 for power-domain
To: Frank Li <Frank.li@nxp.com>
Cc: andersson@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org,
 festevam@gmail.com, imx@lists.linux.dev, kernel@pengutronix.de,
 krzk+dt@kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org,
 mathieu.poirier@linaro.org, peng.fan@nxp.com, robh@kernel.org,
 s.hauer@pengutronix.de, shawnguo@kernel.org
References: <20240606150030.3067015-1-Frank.Li@nxp.com>
 <19058054-5138-4d37-860f-dd430abd3a0f@kernel.org>
 <ZmMk/T3I1jNcxKOB@lizhi-Precision-Tower-5810>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <ZmMk/T3I1jNcxKOB@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 07/06/2024 17:19, Frank Li wrote:
> On Fri, Jun 07, 2024 at 09:32:26AM +0200, Krzysztof Kozlowski wrote:
>> On 06/06/2024 17:00, Frank Li wrote:
>>> "fsl,imx8qxp-cm4" and "fsl,imx8qm-cm4" need minimum 2 power domains. Keep
>>> the same restriction for other compatible string.
>>>
>>> Signed-off-by: Frank Li <Frank.Li@nxp.com>
>>> ---
>>>
>>> Notes:
>>>     Change from v1 to v2
>>>     - set minitem to 2 at top
>>>     - Add imx8qm compatible string also
>>>     - use not logic to handle difference compatible string restriction
>>>     - update commit message.
>>>     
>>>     pass dt_binding_check.
>>>     
>>>     make ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu- -j8  dt_binding_check DT_SCHEMA_FILES=fsl,imx-rproc.yaml
>>>       SCHEMA  Documentation/devicetree/bindings/processed-schema.json
>>>       CHKDT   Documentation/devicetree/bindings
>>>       LINT    Documentation/devicetree/bindings
>>>       DTEX    Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.example.dts
>>>       DTC_CHK Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.example.dtb
>>>
>>>  .../bindings/remoteproc/fsl,imx-rproc.yaml         | 14 ++++++++++++++
>>>  1 file changed, 14 insertions(+)
>>>
>>> diff --git a/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml b/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
>>> index df36e29d974ca..da108a39df435 100644
>>> --- a/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
>>> +++ b/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
>>> @@ -59,6 +59,7 @@ properties:
>>>      maxItems: 32
>>>  
>>>    power-domains:
>>> +    minItems: 2
>>>      maxItems: 8
>>>  
>>>    fsl,auto-boot:
>>> @@ -99,6 +100,19 @@ allOf:
>>>        properties:
>>>          fsl,iomuxc-gpr: false
>>>  
>>> +  - if:
>>> +      properties:
>>> +        compatible:
>>> +          not:
>>> +            contains:
>>> +              enum:
>>> +                - fsl,imx8qxp-cm4
>>> +                - fsl,imx8qm-cm4
>>> +    then:
>>> +      properties:
>>> +        power-domains:
>>> +          minItems: 8
>>
>> What happened with the "else:"? How many power domains is needed for
>> other devices?
> 
> So far, only fsl,imx8qxp-cm4 ind fsl,imx8qm-cm4 need power domain (2-8). 
> Power-domains is option property. 
> 
> Can I just remove whole "if"?

No, I rather expect else.

Best regards,
Krzysztof

