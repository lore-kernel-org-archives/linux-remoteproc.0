Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01B0B373BFE;
	Thu, 13 Aug 2026 07:51:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786607501; cv=none; b=Lh1pAe4Ko2FTOadJfL4durCgQdlOYJRs7edCNE76rJRWdBh2MlivYDXU26qRQ26M7+SI54roKtX77yJ1T6x72XYja5x0NWA4Lopqc/i32ieJrlWK0ebJNb3FdXL+gRqb9BE4uxkJZS+/XGWdwlMhcsd9y9dIbd0FVbkc1KRxMyU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786607501; c=relaxed/simple;
	bh=3M4bP5YdwYlYzOi57R+lqJMq26KLUWXVwsuDknQZCZ8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EwiCcUPocxp9E4RWbjGZw2Qco5MLP6uuW8lZrnci7rPZ32e/6FTGS1q4WuPXWDG140SX9Tx/HQIWA729ECRy/QLh2kXzWmMsmWqki+ML62Rt8E7ouq2TX5WlmW8KGI6NPjf9Tke2DwrBIWkgwbDb5GcKLVLmb4rDz5a0amIAAcA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=H9pJm7oK; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="H9pJm7oK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B29881F000E9;
	Thu, 13 Aug 2026 07:51:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786607499;
	bh=3wuuODMHgyrByvTWu/ibKnUW8XtB70+kgrR0tvo8mUU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=H9pJm7oK2S0/YLM2cu+Ws7oMX1Qgt2NyE122ammj7QoomQ38XYWj6hkYOhI4xbmj0
	 i6MuOT9FInINzrBj6Hg5xMjuaav/0xPaxnS9UMXyJaQO7cvfO3KJZy6Im6V9rroap2
	 9+v5pyrYgO1aTem/03TEltA2fk2JKPyQdXb6okRinVON9isntC7Qt695roEz9UndH/
	 wfXyUVi0FY8QZF1as9b4V8r1Wah9U5myMcJommm5RB2MWIA+xO5P8qWKMGuFQYoCYe
	 E9+NkFCYRyriu/flUo/Ko++Y+L7NwN/hl5qdqE6oKS3XL0jUiEN2KtnzYr5D5jYCtt
	 7WPFsuPZC6kew==
Message-ID: <80dfac6e-3408-4f62-887d-9da39c827dd5@kernel.org>
Date: Thu, 13 Aug 2026 09:51:31 +0200
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/4] dt-bindings: remoteproc: add imx-rproc-psci
To: Jiafei Pan <Jiafei.Pan@nxp.com>
Cc: andersson@kernel.org, mathieu.poirier@linaro.org,
 krzysztof.kozlowski@linaro.org, peng.fan@nxp.com, Frank.Li@nxp.com,
 s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Zhiqiang.Hou@nxp.com, mingkai.hu@nxp.com
References: <20260511023928.39640-2-Jiafei.Pan@nxp.com>
 <20260812104633.22420-1-Jiafei.Pan@nxp.com>
 <20260812104633.22420-2-Jiafei.Pan@nxp.com>
 <20260813-imposing-blazing-gharial-fbb19c@quoll>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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
In-Reply-To: <20260813-imposing-blazing-gharial-fbb19c@quoll>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 13/08/2026 09:49, Krzysztof Kozlowski wrote:
> On Wed, Aug 12, 2026 at 06:46:30PM +0800, Jiafei Pan wrote:
>> Add compatible string "fsl,imx-rproc-psci" for i.MX Cortex-A Core's
>> remoteproc support.
>>
>> Signed-off-by: Jiafei Pan <Jiafei.Pan@nxp.com>
>>
>> ---
>> Changes in v4:
>> - Updated description to describe the hardware instead of the binding
>> - Changed compatible to SoC-specific "fsl,imx93-rproc-psci" with
>>   generic fallback "fsl,imx-rproc-psci"
>> - Fixed example node name from "remoteproc-ca55-1" to "remoteproc"
> 
> You need to start using b4 to send patches or send them correctly... Why
> is this response to some other thread?
> 
>>
>> ---
>>  .../remoteproc/fsl,imx-rproc-psci.yaml        | 54 +++++++++++++++++++
>>  1 file changed, 54 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc-psci.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc-psci.yaml b/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc-psci.yaml
>> new file mode 100644
>> index 000000000000..7d0d0da383a2
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc-psci.yaml
>> @@ -0,0 +1,54 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/remoteproc/fsl,imx-rproc-psci.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: NXP i.MX Cortex-A Core Remote Processor via PSCI
>> +
>> +maintainers:
>> +  - Jiafei Pan <Jiafei.Pan@nxp.com>
>> +
>> +description:
>> +  NXP i.MX SoCs integrate multiple Cortex-A cores. On certain i.MX
>> +  platforms, one or more of these cores can be offloaded to run RTOS
>> +  or bare-metal firmware as a remote processor, while the remaining
>> +  cores run Linux. The cores are powered on and off via PSCI (Power
>> +  State Coordination Interface) CPU_ON/CPU_OFF calls to the firmware.
>> +
>> +properties:
>> +  compatible:
>> +    items:
>> +      - enum:
>> +          - fsl,imx93-ca55-rproc
>> +      - const: fsl,imx-rproc-psci
> 
> Hm? So you just ignored the feedback?
> 


Ah, you just did not bother even to wait for my reply!

After three months after my review, you send reply to my comments and
IMMEDIATELY you send v4 without waiting for me to address them.

Srsly, if you have three months, then don't you think I deserve more
than 1 hour?

NAK

Best regards,
Krzysztof
