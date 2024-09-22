Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A2C43D967
	for <linux-remoteproc@vger.kernel.org>; Sun, 22 Sep 2024 18:58:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727031504; cv=none; b=Tla60/zZB46rPtvLk0NmBqsAdJe0a2Sk3wPvInYA4pBmLfGODDr7IjnTaeDvKIdNjmXLFe92Cg0tuKXdRdow1IMqpE3Jt94g9RA1tSlbQFWuf++CjWlQwFFi30lFYW/pJVDb8SlQaYVrCivOySz32JPOVKS85ZCWsE6A6+F7Tlk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727031504; c=relaxed/simple;
	bh=h/YfGkHYHlLaaxOTb25/fnshKzd0TKyDfjJiM7H9D+g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GF2Noxe+I1CVsW23Z4steMxMUH+lXZ8vLy71lRldn1M1mPuTo15+VHaUHDDD/FwlhaIY4DmfZTmFsy/n3Jq29LDoaMkcU0Vd5/xPZJ+oXshW2F3FLZs5fRx/9SMNF4/hpblY5pz+J52snLYZ5pH9x75MMNtWEkdx8am2BrtklxA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ZtIMU4Bw; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZtIMU4Bw"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-42caeb4d671so5436485e9.2
        for <linux-remoteproc@vger.kernel.org>; Sun, 22 Sep 2024 11:58:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727031501; x=1727636301; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=srXCF3GjT+sML6K1TGBPeCTfqMEzivDKM+gZ5j0yqOM=;
        b=ZtIMU4BwfW8fTl+z6NzOre+cswYS5H/32Tn/8d8w2KMLMFpeSqWtIvsMd0N6s9h1mo
         kSQGDkggGuTw+VUuXmyADnw1sKBu9U8B+/AlwANaS4UVvvLeWWUOcMm6jBE6pK9iRBWP
         xLulA7q6nJxmPFdKL1586dyFt4z+4mkukPYwGLQpuSUBdGiDnYriO1H8OnsXhZaVhflg
         +9E3rXDfWaVSoWvUwSYPvQMzs1XnP0RuNwkrBYus5+5yMjY7DB4rCXJSyCN6j+cVJGNn
         nhBeuKc+Np1ubMOv/oXxbzBpVformkuOMTqEumcmswgfvC9XRhmlxbkvNqi3r//rcYzE
         kjQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727031501; x=1727636301;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=srXCF3GjT+sML6K1TGBPeCTfqMEzivDKM+gZ5j0yqOM=;
        b=IZQPtOvyjw3fv/z+X1CFwjobJ8eYVXewtQPH8CYoXzMBBYjMIjk1X2XXWLEZn8fVV7
         QSNlpQ6fTDNAA3Wx5WvFOHCy6VftGEeqOPX41dct+48a9MDktc/CNC1xh1IRlPSPpqDR
         d8Gxfb9m8+jnK7AxWzby8yuPskFHstNcQL+iOW/ufYLDHmgREvAP/xQZ64PdjE1OqQC6
         7/rY0sLB2d0B2ZHe5ntS9BGMuKJjYUAr2TPDY0+lxB9I1yeFXU0BkrWY6pFJVQcn+mrB
         ugT3GIt/SuznAYTe14U/zSTMBsevWw5cVsWcb9ILY6bR+zbxOysXHqBB3t2+eWGcIchU
         rp3A==
X-Forwarded-Encrypted: i=1; AJvYcCWRiAl6Cp/EGjCSC0BZsqTp7Yy05ubG/RzwAOrlR+HOOm7yG0usgQ0T/i9tMG0RTAyr3w/w0pJlT/jlqy1VdliY@vger.kernel.org
X-Gm-Message-State: AOJu0YzIZ+bG794QZtlbl7ThPb9wI5X5o3dLnV4UICYvTC+i/6YcgJ1C
	J1BYdxLl4GObP5/FAjpqkG2z8HFvUNan4qyO32+RL07y5CYPQksfCV0ei7aT8LD9exhQVE5MUzQ
	vu4epvw==
X-Google-Smtp-Source: AGHT+IHZquMeazYNyJPZMeSCNUX701wi0Xg7LwAbqqiU7ZiaJYTRA0ilROtSz9w2/YsISW1xDch0+Q==
X-Received: by 2002:a05:6000:1fa4:b0:374:bde8:3b46 with SMTP id ffacd0b85a97d-37a4225220dmr2728679f8f.2.1727031500580;
        Sun, 22 Sep 2024 11:58:20 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.211.167])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-378e73f62dasm22602370f8f.49.2024.09.22.11.58.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 22 Sep 2024 11:58:19 -0700 (PDT)
Message-ID: <082b7e7f-93b8-4b6f-b258-334ad50940cb@linaro.org>
Date: Sun, 22 Sep 2024 20:58:17 +0200
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/5] dt-bindings: remoteproc: sse710: Add the External
 Systems remote processors
To: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>,
 Krzysztof Kozlowski <krzk@kernel.org>
Cc: mathieu.poirier@linaro.org, Adam.Johnston@arm.com,
 Hugues.KambaMpiana@arm.com, Drew.Reed@arm.com, andersson@kernel.org,
 conor+dt@kernel.org, devicetree@vger.kernel.org,
 krzysztof.kozlowski+dt@linaro.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org,
 liviu.dudau@arm.com, lpieralisi@kernel.org, robh@kernel.org,
 sudeep.holla@arm.com, robin.murphy@arm.com
References: <CANLsYkwOrtXxObL5MKf30OrUYB_uT=DnGEXUtfjH503r_LyMQA@mail.gmail.com>
 <20240822170951.339492-1-abdellatif.elkhlifi@arm.com>
 <20240822170951.339492-2-abdellatif.elkhlifi@arm.com>
 <gzlncpyzwm7x4jcxtdrthrlv2dofk7u3oxn4taadwog5tt37wo@ot6s6kwukd4k>
 <20240919093517.GA43740@e130802.arm.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20240919093517.GA43740@e130802.arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 19/09/2024 11:35, Abdellatif El Khlifi wrote:
> Hi Krzysztof,
> 
>>> Add devicetree binding schema for the External Systems remote processors
>>>
>>> The External Systems remote processors are provided on the Corstone-1000
>>> IoT Reference Design Platform via the SSE-710 subsystem.
>>>
>>> For more details about the External Systems, please see Corstone SSE-710
>>> subsystem features [1].
>>>
>>
>> Do not attach (thread) your patchsets to some other threads (unrelated
>> or older versions). This buries them deep in the mailbox and might
>> interfere with applying entire sets.
>>
>>> [1]: https://developer.arm.com/documentation/102360/0000/Overview-of-Corstone-1000/Corstone-SSE-710-subsystem-features
>>>
>>> Signed-off-by: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
>>> ---
>>>  .../remoteproc/arm,sse710-extsys.yaml         | 90 +++++++++++++++++++
>>>  1 file changed, 90 insertions(+)
>>>  create mode 100644 Documentation/devicetree/bindings/remoteproc/arm,sse710-extsys.yaml
>>>
>>> diff --git a/Documentation/devicetree/bindings/remoteproc/arm,sse710-extsys.yaml b/Documentation/devicetree/bindings/remoteproc/arm,sse710-extsys.yaml
>>> new file mode 100644
>>> index 000000000000..827ba8d962f1
>>> --- /dev/null
>>> +++ b/Documentation/devicetree/bindings/remoteproc/arm,sse710-extsys.yaml
>>> @@ -0,0 +1,90 @@
>>> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
>>> +%YAML 1.2
>>> +---
>>> +$id: http://devicetree.org/schemas/remoteproc/arm,sse710-extsys.yaml#
>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>> +
>>> +title: SSE-710 External System Remote Processor
>>> +
>>> +maintainers:
>>> +  - Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
>>> +  - Hugues Kamba Mpiana <hugues.kambampiana@arm.com>
>>> +
>>> +description: |
>>
>> dt-preserve-formatting
> 
> Do you mean I should remove the '|' please ? (I didn't find examples of use of
> dt-preserve-formatting in Documentation/devicetree/bindings/)

I am sorry, it was supposed to be expanded from VIM snippet, but I did
not finish the expansion. The point was to remove '|' because it is not
needed.



Best regards,
Krzysztof

