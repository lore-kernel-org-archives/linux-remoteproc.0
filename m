Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12BD52C69A
	for <linux-remoteproc@vger.kernel.org>; Wed, 20 Mar 2024 07:41:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710920465; cv=none; b=Xkw/+x27Dn+KEVvnTtUIWPa/7dCtovD+A2OeXHfxloFs7lQJaXrDZRskIWlVcKp5frz7OoHEYgsZCFW8NjTcyWZGfPeOkeALfzce6X19/3WOCJtaQ5i6dbbW6dsOj/1wtXqG/tXdv460StW8qS0AguQaVnrTc7kLEPKlcw1Mk+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710920465; c=relaxed/simple;
	bh=z09uYNetoJlG6Qu6w84y4RmSjwiOD/AIU0NxKvx8KPk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=U1DUGbtYZWD22n1Fgv/GFTnorSAyTWiOYPcJyBCV4dBBzekiyGzdzlMDSPccKJcOxIgQlRaz9H7QGXdMpZs6gW033GMZon9EQHS0RxynbhkL57xfn1veGMyx1pOTEXujGBu8kRLMMvg2u8ZQpYjy8Oh7527djmNUmWN8cxBQDxw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=kyiAipYY; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kyiAipYY"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-56a9f5694dcso3284383a12.1
        for <linux-remoteproc@vger.kernel.org>; Wed, 20 Mar 2024 00:41:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710920461; x=1711525261; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Cr7htSzCFkClIpdgKH59ksEZHuRQfkmuVUuqqnpC51Q=;
        b=kyiAipYYypQSDpBAhpATJu4seMTPfNsduVr8ElmjxhNJ0AqamWj7OjNatdssfj2g71
         dINLM2cvR2g5Uslq6Opckrf+RxrggnIsTj9S+QMtvE721bi3jdRvUwFss9m4qteuxfMA
         YgymMWm96Nn9jBqvMNegOPAJ+dDue+d02nsYuqAVFB1LhdFJ5VHADlxs68+UnNIzs+tj
         K5JiChSndpNq/fx5S/j9Dn1QnvvU9CGCRbE3VltFJB7EbrbzU4czfPdGDlP1tZzKb9Mu
         B9BVWUxWom11DmbPIR5lz0pkwJWKx0vKhHIWJN3yiHg5NM/uvdp5OQbK4RKa7/EaJ1zN
         YwoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710920461; x=1711525261;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Cr7htSzCFkClIpdgKH59ksEZHuRQfkmuVUuqqnpC51Q=;
        b=aypFmPbZUAU+E4DJUVDq20gYvNb5OhT3sjf7r/tSM6SMqscT5g0YsfkoqdSMYXITag
         2aRhm4eAjiQMm+4Cqg4DSDrjPXjMjOc/qt5rTvqTh3R/ROtykEDzvW950bwADVWVRyRi
         D88OP51bA0UNVwxLFKB88DIxgNpgu/QX7zp4vITJ24o66kSH7Udf+PZOnj+ONnb9BsRV
         S0RVinQq1Ec/OB0G5+jqjXVVzTdPybH+bW49EvqpTy5tFDL1JHeMkODoj6wl8CtF6KuX
         QatyrOTDq05p2/SKpx6QE6i3BP583Dvy8kcOz1zfZVQToRHB8wMtUsM/vpD+eSjvhz/F
         9qQA==
X-Gm-Message-State: AOJu0Yw2x1LG00i+TAUxaNZ0DP2mrkhYL0mCHnJMziWThnakxmIWQY1r
	0xLTM9+ygAJL7WtdCXrmTRSL5YKpU6sf5y4YTGe1tTxpWdGgY/GVOhPQ8tJN7aQ=
X-Google-Smtp-Source: AGHT+IEcS9PUMLYJdAKpoMnl02nlNrAkpygmdmkQJMzfrZSrRHV6oNwjabIjcEYlxPjxFjkOIzbsQQ==
X-Received: by 2002:a05:6402:4288:b0:567:504e:e779 with SMTP id g8-20020a056402428800b00567504ee779mr3516109edc.25.1710920461225;
        Wed, 20 Mar 2024 00:41:01 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.222.97])
        by smtp.gmail.com with ESMTPSA id i31-20020a0564020f1f00b0056ba017ca7fsm1068223eda.87.2024.03.20.00.40.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 Mar 2024 00:41:00 -0700 (PDT)
Message-ID: <6f2ebe09-8ce5-4388-a01a-84ebc271472e@linaro.org>
Date: Wed, 20 Mar 2024 08:40:59 +0100
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] dt-bindings: remoteproc: add Versal-NET platform
To: Tanmay Shah <tanmay.shah@amd.com>, andersson@kernel.org,
 mathieu.poirier@linaro.org, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 michal.simek@amd.com, ben.levinsky@amd.com
Cc: linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20240315211533.1996543-1-tanmay.shah@amd.com>
 <20240315211533.1996543-3-tanmay.shah@amd.com>
 <3ca1c419-d185-4318-92ed-3c4e40dcf5bb@linaro.org>
 <14be0aa6-49b7-4342-9ca6-750c30c8e1e9@amd.com>
 <b1320ddf-bacb-41e3-9709-e90df18cc1e3@linaro.org>
 <d112481b-4331-4c0c-9775-407ac4a601fb@amd.com>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 xsFNBFVDQq4BEAC6KeLOfFsAvFMBsrCrJ2bCalhPv5+KQF2PS2+iwZI8BpRZoV+Bd5kWvN79
 cFgcqTTuNHjAvxtUG8pQgGTHAObYs6xeYJtjUH0ZX6ndJ33FJYf5V3yXqqjcZ30FgHzJCFUu
 JMp7PSyMPzpUXfU12yfcRYVEMQrmplNZssmYhiTeVicuOOypWugZKVLGNm0IweVCaZ/DJDIH
 gNbpvVwjcKYrx85m9cBVEBUGaQP6AT7qlVCkrf50v8bofSIyVa2xmubbAwwFA1oxoOusjPIE
 J3iadrwpFvsZjF5uHAKS+7wHLoW9hVzOnLbX6ajk5Hf8Pb1m+VH/E8bPBNNYKkfTtypTDUCj
 NYcd27tjnXfG+SDs/EXNUAIRefCyvaRG7oRYF3Ec+2RgQDRnmmjCjoQNbFrJvJkFHlPeHaeS
 BosGY+XWKydnmsfY7SSnjAzLUGAFhLd/XDVpb1Een2XucPpKvt9ORF+48gy12FA5GduRLhQU
 vK4tU7ojoem/G23PcowM1CwPurC8sAVsQb9KmwTGh7rVz3ks3w/zfGBy3+WmLg++C2Wct6nM
 Pd8/6CBVjEWqD06/RjI2AnjIq5fSEH/BIfXXfC68nMp9BZoy3So4ZsbOlBmtAPvMYX6U8VwD
 TNeBxJu5Ex0Izf1NV9CzC3nNaFUYOY8KfN01X5SExAoVTr09ewARAQABzTRLcnp5c3p0b2Yg
 S296bG93c2tpIDxrcnp5c3p0b2Yua296bG93c2tpQGxpbmFyby5vcmc+wsGUBBMBCgA+FiEE
 m9B+DgxR+NWWd7dUG5NDfTtBYpsFAmI+BxMCGwMFCRRfreEFCwkIBwIGFQoJCAsCBBYCAwEC
 HgECF4AACgkQG5NDfTtBYptgbhAAjAGunRoOTduBeC7V6GGOQMYIT5n3OuDSzG1oZyM4kyvO
 XeodvvYv49/ng473E8ZFhXfrre+c1olbr1A8pnz9vKVQs9JGVa6wwr/6ddH7/yvcaCQnHRPK
 mnXyP2BViBlyDWQ71UC3N12YCoHE2cVmfrn4JeyK/gHCvcW3hUW4i5rMd5M5WZAeiJj3rvYh
 v8WMKDJOtZFXxwaYGbvFJNDdvdTHc2x2fGaWwmXMJn2xs1ZyFAeHQvrp49mS6PBQZzcx0XL5
 cU9ZjhzOZDn6Apv45/C/lUJvPc3lo/pr5cmlOvPq1AsP6/xRXsEFX/SdvdxJ8w9KtGaxdJuf
 rpzLQ8Ht+H0lY2On1duYhmro8WglOypHy+TusYrDEry2qDNlc/bApQKtd9uqyDZ+rx8bGxyY
 qBP6bvsQx5YACI4p8R0J43tSqWwJTP/R5oPRQW2O1Ye1DEcdeyzZfifrQz58aoZrVQq+innR
 aDwu8qDB5UgmMQ7cjDSeAQABdghq7pqrA4P8lkA7qTG+aw8Z21OoAyZdUNm8NWJoQy8m4nUP
 gmeeQPRc0vjp5JkYPgTqwf08cluqO6vQuYL2YmwVBIbO7cE7LNGkPDA3RYMu+zPY9UUi/ln5
 dcKuEStFZ5eqVyqVoZ9eu3RTCGIXAHe1NcfcMT9HT0DPp3+ieTxFx6RjY3kYTGLOwU0EVUNc
 NAEQAM2StBhJERQvgPcbCzjokShn0cRA4q2SvCOvOXD+0KapXMRFE+/PZeDyfv4dEKuCqeh0
 hihSHlaxTzg3TcqUu54w2xYskG8Fq5tg3gm4kh1Gvh1LijIXX99ABA8eHxOGmLPRIBkXHqJY
 oHtCvPc6sYKNM9xbp6I4yF56xVLmHGJ61KaWKf5KKWYgA9kfHufbja7qR0c6H79LIsiYqf92
 H1HNq1WlQpu/fh4/XAAaV1axHFt/dY/2kU05tLMj8GjeQDz1fHas7augL4argt4e+jum3Nwt
 yupodQBxncKAUbzwKcDrPqUFmfRbJ7ARw8491xQHZDsP82JRj4cOJX32sBg8nO2N5OsFJOcd
 5IE9v6qfllkZDAh1Rb1h6DFYq9dcdPAHl4zOj9EHq99/CpyccOh7SrtWDNFFknCmLpowhct9
 5ZnlavBrDbOV0W47gO33WkXMFI4il4y1+Bv89979rVYn8aBohEgET41SpyQz7fMkcaZU+ok/
 +HYjC/qfDxT7tjKXqBQEscVODaFicsUkjheOD4BfWEcVUqa+XdUEciwG/SgNyxBZepj41oVq
 FPSVE+Ni2tNrW/e16b8mgXNngHSnbsr6pAIXZH3qFW+4TKPMGZ2rZ6zITrMip+12jgw4mGjy
 5y06JZvA02rZT2k9aa7i9dUUFggaanI09jNGbRA/ABEBAAHCwXwEGAEKACYCGwwWIQSb0H4O
 DFH41ZZ3t1Qbk0N9O0FimwUCYDzvagUJFF+UtgAKCRAbk0N9O0Fim9JzD/0auoGtUu4mgnna
 oEEpQEOjgT7l9TVuO3Qa/SeH+E0m55y5Fjpp6ZToc481za3xAcxK/BtIX5Wn1mQ6+szfrJQ6
 59y2io437BeuWIRjQniSxHz1kgtFECiV30yHRgOoQlzUea7FgsnuWdstgfWi6LxstswEzxLZ
 Sj1EqpXYZE4uLjh6dW292sO+j4LEqPYr53hyV4I2LPmptPE9Rb9yCTAbSUlzgjiyyjuXhcwM
 qf3lzsm02y7Ooq+ERVKiJzlvLd9tSe4jRx6Z6LMXhB21fa5DGs/tHAcUF35hSJrvMJzPT/+u
 /oVmYDFZkbLlqs2XpWaVCo2jv8+iHxZZ9FL7F6AHFzqEFdqGnJQqmEApiRqH6b4jRBOgJ+cY
 qc+rJggwMQcJL9F+oDm3wX47nr6jIsEB5ZftdybIzpMZ5V9v45lUwmdnMrSzZVgC4jRGXzsU
 EViBQt2CopXtHtYfPAO5nAkIvKSNp3jmGxZw4aTc5xoAZBLo0OV+Ezo71pg3AYvq0a3/oGRG
 KQ06ztUMRrj8eVtpImjsWCd0bDWRaaR4vqhCHvAG9iWXZu4qh3ipie2Y0oSJygcZT7H3UZxq
 fyYKiqEmRuqsvv6dcbblD8ZLkz1EVZL6djImH5zc5x8qpVxlA0A0i23v5QvN00m6G9NFF0Le
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <d112481b-4331-4c0c-9775-407ac4a601fb@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 19/03/2024 15:42, Tanmay Shah wrote:
> 
> 
> On 3/19/24 12:30 AM, Krzysztof Kozlowski wrote:
>> On 19/03/2024 01:51, Tanmay Shah wrote:
>>> Hello Krzysztof,
>>>
>>> Thanks for reviews. Please find my comments below.
>>>
>>> On 3/17/24 1:53 PM, Krzysztof Kozlowski wrote:
>>>> On 15/03/2024 22:15, Tanmay Shah wrote:
>>>>> AMD-Xilinx Versal-NET platform is successor of Versal platform. It
>>>>> contains multiple clusters of cortex-R52 real-time processing units.
>>>>> Each cluster contains two cores of cortex-R52 processors. Each cluster
>>>>> can be configured in lockstep mode or split mode.
>>>>>
>>>>> Each R52 core is assigned 128KB of TCM memory. ATCM memory is 64KB, BTCM
>>>>> and CTCM memoreis are 32KB each. Each TCM memory has its own dedicated
>>>>> power-domain that needs to be requested before using it.
>>>>>
>>>>> Signed-off-by: Tanmay Shah <tanmay.shah@amd.com>
>>>>> ---
>>>>>  .../remoteproc/xlnx,zynqmp-r5fss.yaml         | 220 +++++++++++++++---
>>>>>  1 file changed, 184 insertions(+), 36 deletions(-)
>>>>>
>>>>> diff --git a/Documentation/devicetree/bindings/remoteproc/xlnx,zynqmp-r5fss.yaml b/Documentation/devicetree/bindings/remoteproc/xlnx,zynqmp-r5fss.yaml
>>>>> index 711da0272250..55654ee02eef 100644
>>>>> --- a/Documentation/devicetree/bindings/remoteproc/xlnx,zynqmp-r5fss.yaml
>>>>> +++ b/Documentation/devicetree/bindings/remoteproc/xlnx,zynqmp-r5fss.yaml
>>>>> @@ -18,7 +18,9 @@ description: |
>>>>>  
>>>>>  properties:
>>>>>    compatible:
>>>>> -    const: xlnx,zynqmp-r5fss
>>>>> +    enum:
>>>>> +      - xlnx,zynqmp-r5fss
>>>>> +      - xlnx,versal-net-r52fss
>>>>>  
>>>>>    "#address-cells":
>>>>>      const: 2
>>>>> @@ -64,7 +66,9 @@ patternProperties:
>>>>>  
>>>>>      properties:
>>>>>        compatible:
>>>>> -        const: xlnx,zynqmp-r5f
>>>>> +        enum:
>>>>> +          - xlnx,zynqmp-r5f
>>>>> +          - xlnx,versal-net-r52f
>>>>>  
>>>>>        reg:
>>>>>          minItems: 1
>>>>> @@ -135,9 +139,11 @@ required:
>>>>>  allOf:
>>>>>    - if:
>>>>>        properties:
>>>>> -        xlnx,cluster-mode:
>>>>> -          enum:
>>>>> -            - 1
>>>>> +        compatible:
>>>>> +          contains:
>>>>> +            enum:
>>>>> +              - xlnx,versal-net-r52fss
>>>>
>>>> Why do you touch these lines?
>>>>
>>>>> +
>>>>>      then:
>>>>>        patternProperties:
>>>>>          "^r5f@[0-9a-f]+$":
>>>>> @@ -149,16 +155,14 @@ allOf:
>>>>>                items:
>>>>>                  - description: ATCM internal memory
>>>>>                  - description: BTCM internal memory
>>>>> -                - description: extra ATCM memory in lockstep mode
>>>>> -                - description: extra BTCM memory in lockstep mode
>>>>> +                - description: CTCM internal memory
>>>>>  
>>>>>              reg-names:
>>>>>                minItems: 1
>>>>>                items:
>>>>> -                - const: atcm0
>>>>> -                - const: btcm0
>>>>> -                - const: atcm1
>>>>> -                - const: btcm1
>>>>> +                - const: atcm
>>>>> +                - const: btcm
>>>>> +                - const: ctcm
>>>>>  
>>>>>              power-domains:
>>>>>                minItems: 2
>>>>> @@ -166,33 +170,70 @@ allOf:
>>>>>                  - description: RPU core power domain
>>>>>                  - description: ATCM power domain
>>>>>                  - description: BTCM power domain
>>>>> -                - description: second ATCM power domain
>>>>> -                - description: second BTCM power domain
>>>>> +                - description: CTCM power domain
>>>>>  
>>>>>      else:
>>>>> -      patternProperties:
>>>>> -        "^r5f@[0-9a-f]+$":
>>>>> -          type: object
>>>>> -
>>>>> -          properties:
>>>>> -            reg:
>>>>> -              minItems: 1
>>>>> -              items:
>>>>> -                - description: ATCM internal memory
>>>>> -                - description: BTCM internal memory
>>>>> -
>>>>> -            reg-names:
>>>>> -              minItems: 1
>>>>> -              items:
>>>>> -                - const: atcm0
>>>>> -                - const: btcm0
>>>>> -
>>>>> -            power-domains:
>>>>> -              minItems: 2
>>>>> -              items:
>>>>> -                - description: RPU core power domain
>>>>> -                - description: ATCM power domain
>>>>> -                - description: BTCM power domain
>>>>> +      allOf:
>>>>> +        - if:
>>>>> +            properties:
>>>>> +              xlnx,cluster-mode:
>>>>> +                enum:
>>>>> +                  - 1
>>>>
>>>> Whatever you did here, is not really readable. You have now multiple
>>>> if:then:if:then embedded.
>>>
>>> For ZynqMP platform, TCM can be configured differently in lockstep mode
>>> and split mode.
>>>
>>> For Versal-NET no such configuration is available, but new CTCM memory
>>> is added.
>>>
>>> So, I am trying to achieve following representation of TCM for both:
>>>
>>> if: versal-net compatible
>>> then:
>>>   ATCM - 64KB
>>>   BTCM - 32KB
>>>   CTCM - 32KB
>>>
>>> else: (ZynqMP compatible)
>>>   if:
>>>     xlnx,cluster-mode (lockstep mode)
>>>   then:
>>>     ATCM0 - 64KB
>>>     BTCM0 - 64KB
>>>     ATCM1 - 64KB
>>>     BTCM1 - 64KB
>>>   else: (split mode)
>>>     ATCM0 - 64KB
>>>     BTCM0 - 64KB
>>>
>>>
>>> If bindings are getting complicated, does it make sense to introduce
>>> new file for Versal-NET bindings? Let me know how you would like me
>>> to proceed.
>>
>> All this is broken in your previous patchset, but now we nicely see.
>>
>> No, this does not work like this. You do not have entirely different
>> programming models in one device, don't you?
>>
> 
> I don't understand what do you mean? Programming model is same. Only number
> of TCMs are changing based on configuration and platform. I can certainly
> list different compatible for different platforms as requested. But other than
> that not sure what needs to be fixed.

You cannot have same programming model with different memory mappings.
Anyway, please follow writing bindings rules: all of your different
devices must have dedicated compatible. I really though we talked about
two IPs on same SoC...


Best regards,
Krzysztof

