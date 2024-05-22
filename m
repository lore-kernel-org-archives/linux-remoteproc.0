Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0B278287F
	for <linux-remoteproc@vger.kernel.org>; Wed, 22 May 2024 13:06:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716383204; cv=none; b=PskkbJeTbflseFfGDn0DS+P/6BGXUumLJBXAIJkOOIcrGU3ww9Gppf8LxR7tNpyw/FQiv5giZqgCSeu0sxgrm+8jLHUeXI4u7a3zHPrKuFysPUIboRBmyXp3B/TnjoHQupX4kwf2CxBBgdQQsKS7qt3EKcQGHOJb0m0GSP0gN8w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716383204; c=relaxed/simple;
	bh=eCw2iXIxZvZ4hdXnwCeU0//1RJ8cFUohcuV/vFYGTmE=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=bFyIg1pYzhsNiTHVQH1v6P7IlcQWFMby5AyAkLqTX4M6CaCX30iejAIp4eZu5gdOeAHZ8glM0cpL+8lWsRLkeLEGToH1DdmJ9PrTnqSffJRr9i3ANfGjl+ZxAm/xibhDnD3Mw7HhJceFP0aqSvjhENgoPbLxC+sIpi9CVwgHXfo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=P3OtvXoW; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="P3OtvXoW"
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-51f74fa2a82so6609190e87.0
        for <linux-remoteproc@vger.kernel.org>; Wed, 22 May 2024 06:06:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716383201; x=1716988001; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IHQs81pS5e/M8Ft067yAZNFQ01IZ5xjkXQeMA4zm/pc=;
        b=P3OtvXoWEagyM1xLMdbHscmyw5lRg3JAAbhkBOe1DICZ7xuGM+8GANu7Mik53jl6tc
         7mYeubiJrhAOItWBBsyovysAw5Jbo04+iugxoXQsipxHWcRDL7sd7R9GWCrXhtxwWR4u
         8AeWC31JLpEWCQ/wzVVqdxG/nC1zlypzCBrycwyKsAVMxPAi2L9tk85QxLZu6d1YZFjZ
         +Gelq6DavPXDmNKiyhK6YASi+67iCjqgNtxBKDZxdVPkAiK3tNebNON4b+jwRkQ/g/Vp
         azDIfLVbSE2gLDKz/dAvJbxNGM2DLYomRsCkN87cFn9zLJ/fniS82QZOnISv5BDRKH6R
         cYcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716383201; x=1716988001;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=IHQs81pS5e/M8Ft067yAZNFQ01IZ5xjkXQeMA4zm/pc=;
        b=FcCIYu8rIskW42X4CQGlLz2sSKBxq93EWpgj3CXkiA+9Ay9utf1TcNkW2dqr7lnHfs
         Dvf/ixhBqNdu5cVo0i+EUkH7qR7UAZK09tOlGfzW5T5GSfeRmDD8fAAXWk9wB+LaAANO
         imWsTtiQQysGR4B1e/eLISfiDaeE9C8U4xc0mhciIaMhyfypLzqQvRw7nymtQf3WUfWh
         QIdOH6xMqxFL7a8UMbWj87/atzKkDo0F6B6+GLbLTNfS7iyGDjYyUDttKVJ6Xg3CVMpE
         WICzFGiQr3uxnTdYTzckzmHk1XGqmauF3VNcwI085ggtydgGifXcURfye5ZV1A+hrKMX
         XpvA==
X-Forwarded-Encrypted: i=1; AJvYcCXB7pignXHoMCnVS16w6Ep388AYFGuaIjcQSYFQeG4J2kqfcZVsf0L2oKvY6XatHLJteJlhZeSUKUYk74bj6Z2hZ8p1qKNwdxKYk3vhKy8umA==
X-Gm-Message-State: AOJu0YxPDL99jwxz7tTuU28RuxC1g/wAY4AFCGOZEtGHumc9wGE2YGV1
	f8eP0oSQHrvaTn6dO97Ft5QoyYnz3j3u+Cozd2QHTFgldXhjbWjIVCKFW+T9nMY=
X-Google-Smtp-Source: AGHT+IF5qKv7UruRy7oBLP8sQOBvZCH9oB3wHTijgo+xIDX3Mq8ff5or65N1qYLdZ5YnzEz5rE/e5g==
X-Received: by 2002:ac2:5548:0:b0:51d:9808:6645 with SMTP id 2adb3069b0e04-526c0a68dd6mr1569386e87.50.1716383200660;
        Wed, 22 May 2024 06:06:40 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:8b9d:52bd:4757:6b10? ([2a01:e0a:982:cbb0:8b9d:52bd:4757:6b10])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a5a179c7d2bsm1759195266b.120.2024.05.22.06.06.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 May 2024 06:06:40 -0700 (PDT)
Message-ID: <42ba8472-9d63-4125-b538-39d8090203b4@linaro.org>
Date: Wed, 22 May 2024 15:06:38 +0200
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH 1/5] dt-bindings: remoteproc: qcom,sm8550-pas: Document
 the SA8775p ADSP, CDSP and GPDSP
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Bjorn Andersson <andersson@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 Jassi Brar <jassisinghbrar@gmail.com>,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Tengfei Fan <quic_tengfan@quicinc.com>,
 Srini Kandagatla <srinivas.kandagatla@linaro.org>,
 Alex Elder <elder@kernel.org>
References: <20240522-topic-lemans-iot-remoteproc-v1-0-af9fab7b27f0@linaro.org>
 <20240522-topic-lemans-iot-remoteproc-v1-1-af9fab7b27f0@linaro.org>
 <e89c3270-e51f-4d5b-87db-09ff8f0961e6@linaro.org>
 <CAMRc=MczvfcXnEae__LJh47T=vCTbCz9EHOrNP+QmpTDvdarZw@mail.gmail.com>
Content-Language: en-US, fr
Autocrypt: addr=neil.armstrong@linaro.org; keydata=
 xsBNBE1ZBs8BCAD78xVLsXPwV/2qQx2FaO/7mhWL0Qodw8UcQJnkrWmgTFRobtTWxuRx8WWP
 GTjuhvbleoQ5Cxjr+v+1ARGCH46MxFP5DwauzPekwJUD5QKZlaw/bURTLmS2id5wWi3lqVH4
 BVF2WzvGyyeV1o4RTCYDnZ9VLLylJ9bneEaIs/7cjCEbipGGFlfIML3sfqnIvMAxIMZrvcl9
 qPV2k+KQ7q+aXavU5W+yLNn7QtXUB530Zlk/d2ETgzQ5FLYYnUDAaRl+8JUTjc0CNOTpCeik
 80TZcE6f8M76Xa6yU8VcNko94Ck7iB4vj70q76P/J7kt98hklrr85/3NU3oti3nrIHmHABEB
 AAHNKk5laWwgQXJtc3Ryb25nIDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPsLAkQQTAQoA
 OwIbIwULCQgHAwUVCgkICwUWAgMBAAIeAQIXgBYhBInsPQWERiF0UPIoSBaat7Gkz/iuBQJk
 Q5wSAhkBAAoJEBaat7Gkz/iuyhMIANiD94qDtUTJRfEW6GwXmtKWwl/mvqQtaTtZID2dos04
 YqBbshiJbejgVJjy+HODcNUIKBB3PSLaln4ltdsV73SBcwUNdzebfKspAQunCM22Mn6FBIxQ
 GizsMLcP/0FX4en9NaKGfK6ZdKK6kN1GR9YffMJd2P08EO8mHowmSRe/ExAODhAs9W7XXExw
 UNCY4pVJyRPpEhv373vvff60bHxc1k/FF9WaPscMt7hlkbFLUs85kHtQAmr8pV5Hy9ezsSRa
 GzJmiVclkPc2BY592IGBXRDQ38urXeM4nfhhvqA50b/nAEXc6FzqgXqDkEIwR66/Gbp0t3+r
 yQzpKRyQif3OwE0ETVkGzwEIALyKDN/OGURaHBVzwjgYq+ZtifvekdrSNl8TIDH8g1xicBYp
 QTbPn6bbSZbdvfeQPNCcD4/EhXZuhQXMcoJsQQQnO4vwVULmPGgtGf8PVc7dxKOeta+qUh6+
 SRh3vIcAUFHDT3f/Zdspz+e2E0hPV2hiSvICLk11qO6cyJE13zeNFoeY3ggrKY+IzbFomIZY
 4yG6xI99NIPEVE9lNBXBKIlewIyVlkOaYvJWSV+p5gdJXOvScNN1epm5YHmf9aE2ZjnqZGoM
 Mtsyw18YoX9BqMFInxqYQQ3j/HpVgTSvmo5ea5qQDDUaCsaTf8UeDcwYOtgI8iL4oHcsGtUX
 oUk33HEAEQEAAcLAXwQYAQIACQUCTVkGzwIbDAAKCRAWmrexpM/4rrXiB/sGbkQ6itMrAIfn
 M7IbRuiSZS1unlySUVYu3SD6YBYnNi3G5EpbwfBNuT3H8//rVvtOFK4OD8cRYkxXRQmTvqa3
 3eDIHu/zr1HMKErm+2SD6PO9umRef8V82o2oaCLvf4WeIssFjwB0b6a12opuRP7yo3E3gTCS
 KmbUuLv1CtxKQF+fUV1cVaTPMyT25Od+RC1K+iOR0F54oUJvJeq7fUzbn/KdlhA8XPGzwGRy
 4zcsPWvwnXgfe5tk680fEKZVwOZKIEuJC3v+/yZpQzDvGYJvbyix0lHnrCzq43WefRHI5XTT
 QbM0WUIBIcGmq38+OgUsMYu4NzLu7uZFAcmp6h8g
Organization: Linaro
In-Reply-To: <CAMRc=MczvfcXnEae__LJh47T=vCTbCz9EHOrNP+QmpTDvdarZw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 22/05/2024 15:04, Bartosz Golaszewski wrote:
> On Wed, May 22, 2024 at 2:42 PM <neil.armstrong@linaro.org> wrote:
>>
>> On 22/05/2024 14:08, Bartosz Golaszewski wrote:
>>> From: Tengfei Fan <quic_tengfan@quicinc.com>
>>>
>>> Document the compatibles for the components used to boot the ADSP, CDSP0,
>>> CDSP1, GPDSP0 and GPDSP1 on the SA8775p SoC.
>>>
>>> Signed-off-by: Tengfei Fan <quic_tengfan@quicinc.com>
>>> Co-developed-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>>> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>>> ---
>>>    .../bindings/remoteproc/qcom,sm8550-pas.yaml       | 76 +++++++++++++++++++++-
>>>    1 file changed, 75 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
>>> index 73fda7565cd1..9d3a862c39e1 100644
>>> --- a/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
>>> +++ b/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
>>> @@ -16,6 +16,11 @@ description:
>>>    properties:
>>>      compatible:
>>>        enum:
>>> +      - qcom,sa8775p-adsp-pas
>>> +      - qcom,sa8775p-cdsp0-pas
>>> +      - qcom,sa8775p-cdsp1-pas
>>> +      - qcom,sa8775p-gpdsp0-pas
>>> +      - qcom,sa8775p-gpdsp1-pas
>>>          - qcom,sm8550-adsp-pas
>>>          - qcom,sm8550-cdsp-pas
>>>          - qcom,sm8550-mpss-pas
>>> @@ -44,12 +49,13 @@ properties:
>>>
>>>      firmware-name:
>>>        $ref: /schemas/types.yaml#/definitions/string-array
>>> +    minItems: 1
>>
>> This will allow a single firmware name for all compatible,
>> which is wrong
>>
> 
> So increasing the limit from the default under allOf doesn't seem to
> work, should I instead keep this and make the lower limit stricter for
> all other models?

Yes add minItems in all the allOf:if: and add the missing allOf:if: for
the new compatibles to set the minItems, same for memory-region.

Or you may simply spin off a new yaml, this one is getting quite large.

Neil

> 
> Bart
> 
>>>        items:
>>>          - description: Firmware name of the Hexagon core
>>>          - description: Firmware name of the Hexagon Devicetree
>>>
>>>      memory-region:
>>> -    minItems: 2
>>> +    minItems: 1
>>
>> Same here
>>
>>>        items:
>>>          - description: Memory region for main Firmware authentication
>>>          - description: Memory region for Devicetree Firmware authentication
>>> @@ -81,6 +87,21 @@ allOf:
>>>              maxItems: 5
>>>            memory-region:
>>>              maxItems: 2
>>> +  - if:
>>> +      properties:
>>> +        compatible:
>>> +          enum:
>>> +            - qcom,sa8775p-adsp-pas
>>> +            - qcom,sa8775p-cdsp0-pas
>>> +            - qcom,sa8775p-cdsp1-pas
>>> +            - qcom,sa8775p-gpdsp0-pas
>>> +            - qcom,sa8775p-gpdsp1-pas
>>> +    then:
>>> +      properties:
>>> +        interrupts:
>>> +          maxItems: 5
>>> +        interrupt-names:
>>> +          maxItems: 5
>>>      - if:
>>>          properties:
>>>            compatible:
>>> @@ -128,6 +149,7 @@ allOf:
>>>          properties:
>>>            compatible:
>>>              enum:
>>> +            - qcom,sa8775p-adsp-pas
>>>                - qcom,sm8550-adsp-pas
>>>                - qcom,sm8650-adsp-pas
>>>                - qcom,x1e80100-adsp-pas
>>> @@ -177,6 +199,58 @@ allOf:
>>>                - const: cx
>>>                - const: mxc
>>>                - const: nsp
>>> +  - if:
>>> +      properties:
>>> +        compatible:
>>> +          enum:
>>> +            - qcom,sa8775p-cdsp-pas
>>> +    then:
>>> +      properties:
>>> +        power-domains:
>>> +          items:
>>> +            - description: CX power domain
>>> +            - description: MXC power domain
>>> +            - description: NSP0 power domain
>>> +        power-domain-names:
>>> +          items:
>>> +            - const: cx
>>> +            - const: mxc
>>> +            - const: nsp0
>>> +
>>> +  - if:
>>> +      properties:
>>> +        compatible:
>>> +          enum:
>>> +            - qcom,sa8775p-cdsp1-pas
>>> +    then:
>>> +      properties:
>>> +        power-domains:
>>> +          items:
>>> +            - description: CX power domain
>>> +            - description: MXC power domain
>>> +            - description: NSP1 power domain
>>> +        power-domain-names:
>>> +          items:
>>> +            - const: cx
>>> +            - const: mxc
>>> +            - const: nsp1
>>> +
>>> +  - if:
>>> +      properties:
>>> +        compatible:
>>> +          enum:
>>> +            - qcom,sa8775p-gpdsp0-pas
>>> +            - qcom,sa8775p-gpdsp1-pas
>>> +    then:
>>> +      properties:
>>> +        power-domains:
>>> +          items:
>>> +            - description: CX power domain
>>> +            - description: MXC power domain
>>> +        power-domain-names:
>>> +          items:
>>> +            - const: cx
>>> +            - const: mxc
>>>
>>>    unevaluatedProperties: false
>>>
>>>
>>

