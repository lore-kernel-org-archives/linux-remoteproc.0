Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com [209.85.167.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F60F19D8A8
	for <linux-remoteproc@vger.kernel.org>; Wed, 17 Dec 2025 05:02:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765947725; cv=none; b=bWSzuxaIng3mKyGX40Yhdzx3bjZIYEJonGvBOLY34ZHHP6KeuDNkPBDo4cKrcplUL4uvp7UraM0LXunYKFuYjZUJpaV/qHlG6YUERD6TUSkiXZHyI5azY1iBuD+wIhhFlXl8wrmpxbEWKKNB+YDBgqZTpedi5HgaGyG2ykvwrfc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765947725; c=relaxed/simple;
	bh=P4V9g9fEbj03wmssY3rOO+JbbzmJq8CL0UXKfdH2WfU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CUpjQe1VFjKbhuTFt4Y+zHTO16kSSN+6E4LAjRXETU+UvhVmU65F4klCi70GboCjJFSLilwyCaJQuCcuZzTnVRA8CBxIaKrV7EYa3538BpY1NDxGOBiK5+F27+TxckhX2tMZd6NiD3AldH+bhEBbY3RbKmq7ihpGswn3/VZK36o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lKv0di5l; arc=none smtp.client-ip=209.85.167.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lKv0di5l"
Received: by mail-oi1-f179.google.com with SMTP id 5614622812f47-450063be247so2438350b6e.2
        for <linux-remoteproc@vger.kernel.org>; Tue, 16 Dec 2025 21:02:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765947722; x=1766552522; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=s0nHwlGDJHrsW0ilipRlp/PLGvL6Mnw9v3ivWnF4YFA=;
        b=lKv0di5l1hs59TH9Q+LnUE8505R5IwrM6YuOd08GQKKRyXJQd9Vwx5DNjJ9ZU5QRcY
         sjvQFBxzlEPKqbNRtDPbsdNygbiFSgGhjIjOWvsnzoWcPYJMYh3rQ/pX7HHeuVudmbjd
         cxjuHalScyxzVV2SmBidJ1d0clqW9vAZXOkQVVoK2I+mLB0mS6yTgBIlbRvKBuD+dsOe
         TfV4srm+EcshEO2HS85/2s3ZLhyMmbkZPPc4dnEiCGVZ4zer2m2pxRqauXvakHjqfMsM
         CAkMYPsn8DTJx9R67e9L33Tk8hHPiRaTiFMPQ+kkzzp54Y8NTzQaVVcDzkxTKK9q/Ddb
         kAuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765947722; x=1766552522;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=s0nHwlGDJHrsW0ilipRlp/PLGvL6Mnw9v3ivWnF4YFA=;
        b=KpZFgJ0JcmdtrL14WP04/8RUa7++ql4Of5LlGFhO6tD7837rcApbUF5h80b0LCgrDd
         A58EuDUTZs/tPecDp3m91lqOOeiGar+f0vcG/HbOWlCdliJlbKJca6DlMXBXk8dT9ERk
         qUIc/gvaUv0ItvazN8psS+vHw++2pj1VTmT6rDhfNJbV+5/Q9rUQ8hJd3b+3OvjhtJP0
         eClcD5eZ4EOt1WoMWY+b7k3z6kQ8KHSnmCqCskc7LquMc6lczlkNzn6mBAzfzn2DLYea
         J6spe4IAynq2uuOS5lR3JlZ9YZBguHnotEZjF8+Y7/o3B4XOE5slL72R2JyHKcDnz/Mq
         uJdA==
X-Forwarded-Encrypted: i=1; AJvYcCVajBrl1epuRhfMZq0ACIfDklUW1xQ+eAOEm+saZOyRKVfKrsoGEpD8CCWJkrB+rrjBsdZ6V8S5HvdSoSr4f9vm@vger.kernel.org
X-Gm-Message-State: AOJu0YwF87KCexlYnMMixs/BLX7I1FtJJjNMHgwJ5h9C/TH1C8O4OpOo
	vTKy5q875vp8bRjiPam+vkGKFb0mwJaDPWLpAORxNekendJtBsY8drTp
X-Gm-Gg: AY/fxX5/wjAbKPLQ89YL4bDV451FuQAtCOGVenInUd3a7jKcULZmDRpSRhG4hllB6fQ
	NNClJTFGFTIUCE7QExFquNFfGKN+/56cYhFVFPMyOCoDLquqhjKQpQs8mbExBcck5PT8ahNX5tO
	yEPCB+LdCFpQcDvYp32TGvKHq4ZuWPh6Y0/CZ3fQy0hcqa/+bWGfc/bnL79gCPvrh932A5sNP/m
	2YuyiK0Q/dNbgvO7P/k4NuuxCqtfqjcNv/hrsoqOhy16sraRDrc905s4DdhNtwAjixruw8j3Pc6
	GVsx5eWpqGWGx3pmFcuym6KV1jPMMUHS5V4uSoe5vZVG1UrtVPkQgZDY9I/e4aenZh2AgXHEQPs
	AFlduh+EPvJve8IpaMDqewhuIt7LYcjTqpnKJhZrAj24dyHV9aYwCAguNi5jchesaamipb6nhGs
	P+U1KLouHwQ6Y+bJNGp+DhvzKenuddYaTEzs5nWdJtBlEOSPis+Y+C9mogA3oTz3SamqwUP3Z1X
	XDa2LwInr+5r6Nc6nPQq267ZKIJI+Lyww==
X-Google-Smtp-Source: AGHT+IHoxKuD9P6Tzk3NV4TEr+YzF8CTdR9Nb71h2V9w5FH0uv7iEEuObY1MNVcOAvD0qfQHcKmPYQ==
X-Received: by 2002:a05:6808:138b:b0:442:5fa:290d with SMTP id 5614622812f47-455ac957d9emr8102596b6e.43.1765947721958;
        Tue, 16 Dec 2025 21:02:01 -0800 (PST)
Received: from [192.168.7.229] (c-98-57-15-22.hsd1.tx.comcast.net. [98.57.15.22])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-3f61480cdf2sm7446963fac.0.2025.12.16.21.01.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Dec 2025 21:02:00 -0800 (PST)
Message-ID: <f38764d7-9d7d-47f4-a099-b6ac6b12be6e@gmail.com>
Date: Tue, 16 Dec 2025 23:01:54 -0600
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 1/3] dt-bindings: remoteproc: qcom,ipq8074-wcss-pil:
 convert to DT schema
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 devicetree@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>, konradybcio@kernel.org,
 linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20251210003729.3909663-1-mr.nuke.me@gmail.com>
 <20251210003729.3909663-2-mr.nuke.me@gmail.com>
 <20251216-notorious-omniscient-frog-caceaf@quoll>
Content-Language: en-US
From: "Alex G." <mr.nuke.me@gmail.com>
In-Reply-To: <20251216-notorious-omniscient-frog-caceaf@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/15/25 11:53 PM, Krzysztof Kozlowski wrote:
> On Tue, Dec 09, 2025 at 06:37:23PM -0600, Alexandru Gagniuc wrote:
>> Convert the QCS404 and IPQ WCSS Peripheral Image Loader bindings to DT
>> schema. The text bindngs incorrectly implied that IPQ8074 needs only
>> one qcom,smem-states entry. This is only true for QCS404. IPQ8074
>> requires both "stop" and "shutdown".
>>
>> Signed-off-by: Alexandru Gagniuc <mr.nuke.me@gmail.com>
> 
> Don't add fake addresses to CC. I could not respond to this email
> because of that!

Okay.

>> ---
>>   .../remoteproc/qcom,ipq9574-wcss-pil.yaml     | 167 ++++++++++++++++++
>>   .../bindings/remoteproc/qcom,q6v5.txt         | 102 -----------
>>   2 files changed, 167 insertions(+), 102 deletions(-)
>>   create mode 100644 Documentation/devicetree/bindings/remoteproc/qcom,ipq9574-wcss-pil.yaml
>>   delete mode 100644 Documentation/devicetree/bindings/remoteproc/qcom,q6v5.txt
>>
>> diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,ipq9574-wcss-pil.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,ipq9574-wcss-pil.yaml
>> new file mode 100644
>> index 0000000000000..d28f42661d084
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/remoteproc/qcom,ipq9574-wcss-pil.yaml
> 
> Filename based on the compatible, so for example:
> qcom,ipq8074-wcss-pil.yaml
Okay.
>> @@ -0,0 +1,167 @@
>> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/remoteproc/qcom,ipq9574-wcss-pil.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Qualcomm IPQ WCSS Peripheral Image Loader
>> +
>> +maintainers:
>> +  - Placeholder Maintainer <placeholder@kernel.org>
> 
> This must be a real person. Fallback is your SoC maintainer.

I can't find an official maintainer for IPQ8074 or IPQ9574. I could list 
myself, but you know a lot about these bindings. Is it okay if I list 
you as the maintainer of this binding, Krzysztof?

>> +
>> +  reg-names:
>> +    items:
>> +      - const: qdsp6
>> +      - const: rmb
>> +
>> +  interrupts-extended:
> 
> No, you only need interrupts. Please look at other bindings - how they
> write this.

I thought I needed interrupts-extended if the interrupts use more than 
one interrupt controller. Is that not the case?

>> +    minItems: 5
> 
> Drop
> 
>> +    maxItems: 5
>> +
>> +  interrupt-names:
>> +    items:
>> +      - const: wdog
>> +      - const: fatal
>> +      - const: ready
>> +      - const: handover
>> +      - const: stop-ack
>> +
>> +  resets:
>> +    minItems: 3
> 
> Drop
I will drop all the items you identified as excessive.>
>> +    maxItems: 3
>> +
>> +  reset-names:
>> +    items:
>> +      - const: wcss_aon_reset
>> +      - const: wcss_reset
>> +      - const: wcss_q6_reset
>> +
>> +  clocks:
>> +    minItems: 10
>> +    maxItems: 13
> 
> Why is this flexible? Wasn't in the old binding and nothing in the
> commit msg explained a change in the binding.

I was thinking ahead to the next patch in the series that adds IPQ9574 
binding. It makes more sense to keep it at 10 fot this patch, like you 
suggest.

>> +
>> +  clock-names:
>> +    minItems: 10
>> +    maxItems: 13
>> +
>> +  cx-supply:
>> +    description:
>> +      reference to the regulators used for the booting of the Hexagon core
>> +
>> +  memory-region:
>> +    description: Reference to wcss reserved-memory region
> 
> Drop description. Missing maxItems, please look at other bindings. Don't
> write your own style, but look how we already wrote remoteproc bindings
> (the latest).

Is "maxItems: 1" the correct thing to add here?
>> +
>> +  qcom,halt-regs:
>> +    $ref: /schemas/types.yaml#/definitions/phandle-array
>> +    description:
>> +      A phandle reference to a syscon representing TCSR followed by the three
>> +      offsets within syscon for q6, wcss and nc halt registers.
>> +    items:
>> +      - items:
>> +          - description: phandle to TCSR_MUTEX registers
>> +          - description: offset to the Q6 halt register
>> +          - description: offset to the wcss halt register
>> +          - description: offset to the nc halt register
>> +
>> +  qcom,smem-states:
>> +    $ref: /schemas/types.yaml#/definitions/phandle-array
> 
> That's incomplete - missing constraints. Are you sure you wrote this
> code the same way we already did for other devices?

I am not sure. It seems to match qcom,qcs404-cdsp-pil.yaml or 
qcom,wcnss.yaml. What constraints are you expecting here?

>> +    description: States used by the AP to signal the remote processor
>> +
>> +  qcom,smem-state-names:
>> +    description:
>> +      Names of the states used by the AP to signal the remote processor
>> +
>> +  glink-edge:
>> +    $ref: /schemas/remoteproc/qcom,glink-edge.yaml#
>> +    description:
>> +      Qualcomm G-Link subnode which represents communication edge, channels
>> +      and devices related to the Modem.
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +  - reg-names
>> +  - interrupts-extended
>> +  - interrupt-names
>> +  - memory-region
>> +  - qcom,halt-regs
>> +  - qcom,smem-states
>> +  - qcom,smem-state-names
>> +
>> +allOf:
> 
> Seems you do not reference other schemas. I am going to repeat myself
> for 10th time: are you sure you followed other devices?

It's the sixth time, but I see your point. Comparing to 
qcom,qcs404-cdsp-pil.yaml or qcom,wcnss.yaml, I can't see what's 
missing. What do I need here?

> 
>> +  - if:
>> +      properties:
>> +        compatible:
>> +          contains:
>> +            enum:
>> +              - qcom,ipq8074-wcss-pil
>> +    then:
>> +      properties:
>> +        qcom,smem-states:
>> +          items:
>> +            - description: Shutdown Q6
>> +            - description: Stop Q6
>> +        qcom,smem-state-names:
>> +          items:
>> +            - const: shutdown
>> +            - const: stop
> 
> Missing clocks

The text binding that this replaces implies no clocks for IPQ8074. What 
would you like me to add instead?

> Missing blank line
> 
>> +  - if:
>> +      properties:
>> +        compatible:
>> +          contains:
>> +            enum:
>> +              - qcom,qcs404-wcss-pil
>> +    then:
>> +      properties:
>> +        qcom,smem-states:
>> +          maxItems: 1
>> +        qcom,smem-state-names:
>> +          items:
>> +            - const: stop
> 
>> +
>> +  - if:
>> +      properties:
>> +        compatible:
>> +          contains:
>> +            enum:
>> +              - qcom,qcs404-wcss-pil
>> +    then:
>> +      properties:
>> +        clocks:
>> +          minItems: 10
>> +          maxItems: 10
>> +        clock-names:
>> +          items:
>> +            - const: xo
>> +            - const: gcc_abhs_cbcr
>> +            - const: gcc_axim_cbcr
>> +            - const: lcc_ahbfabric_cbc
>> +            - const: tcsr_lcc_cbc
>> +            - const: lcc_abhs_cbc
>> +            - const: lcc_tcm_slave_cbc
>> +            - const: lcc_abhm_cbc
>> +            - const: lcc_axim_cbc
>> +            - const: lcc_bcr_sleep
> 
> All this goes to previous if.

Okay

>> +      required:
>> +        - clocks
>> +        - clock-names
>> +        - cx-supply
>> +
>> +additionalProperties: false
> 
> Missing example.

I plan to add the example in the next patch in the series that adds 
IPQ9547 binding. I don't have the resources to test IPQ8074 or QCS404, 
and I want to be sure that the example I add is tested.

Alex
