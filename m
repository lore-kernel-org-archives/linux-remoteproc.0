Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E04079DC7
	for <linux-remoteproc@vger.kernel.org>; Tue, 12 Mar 2024 12:10:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710245447; cv=none; b=LvZidM5CzHeivC5CaBSmlF0XKU51qpftYsNi2yLL4jCKPqbDHAlaijtfjcwLn9KbaxQGb4TxodPOSS6XahxBsvG3mfTvhM+AYP2MUXF/996Dz7tONNP+JUZyjr+GPgIYf2BwSt6BaExd+XMOAlWX/Jb9uutAa8/s92SLIXRbvgc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710245447; c=relaxed/simple;
	bh=PyBGji7l7FI7brDGl4t7hJ1vrfvni7rDqwS5suVvrs4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NdnqD9IPGuMiQuS9r+QIm8GmwjbKIFtBLsmWjM39UUyg3uguOurcdrHtt2pcKcCjDfSo6YgkazMzNwE26BrlUqSVbsQjWHcRS88m3G8BHGqqkY2bYJ6VJymJcaDd2+MPYdXlCMH/td3zAty5XC/JWiht3V7LC2sz1HZSOpBCfTE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=C+hKml1X; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="C+hKml1X"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-413383969efso3331265e9.1
        for <linux-remoteproc@vger.kernel.org>; Tue, 12 Mar 2024 05:10:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710245444; x=1710850244; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8rYihkVs9Zh9xGQ3HTA59y2k+odcsTvCnrT1AkFjmbA=;
        b=C+hKml1Xy1rsiaMuFXmkoP5hmGLH1BaglR/2AHJB7cxOoSXtrcrwJlI1WwkP5e7HKU
         TkV+hrqs+ofWiyrWhLTQHuxzNKtbQaHmQhcrEZ1UlLpkYVPJx7RjG3cTqpLS8Sqfv/pq
         9h4zq8Xwe4V3i9OTK5Mt3U1TEjRqdKKWJuqQyvj6uSOo5X0LMuuwx3cyuhvGEFwIGdx9
         extRlnyaGEI91YyLt17ot8ESO4G0BEyuZ4tMY4Ocy1OSvG7N8HqpE/dBVwE7tsJSPNW6
         ST3fZz2A8Uo38Nd0wr963XCkzYsh6YCRGvIl0wYMuv9cqSy23CmVSH1DfBcqzaYBg71l
         b7wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710245444; x=1710850244;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8rYihkVs9Zh9xGQ3HTA59y2k+odcsTvCnrT1AkFjmbA=;
        b=Cy/vItT0orVUgzzOI2KlyUdB8KsgjtTLmZ6g/iYid0f2nS71iD3yN4m3mQ0wiDT1Pr
         DopDHn1RZXQlyHPlM2XZj5pqbrJdDZt18q3jkcJk4mHGBW36wE2d6HTs7O74FAOFNw16
         3yCX6s+LD9LQTQwkyaRg+fh2yS3nqDZA/JHVFLpI8sRQE3SRGt96c8YTLBci02s9AEA8
         yyw93tThLhn0Cpp2OVSYOC1BdIxDdwI3weszVP9q8GJGyJL6BJ6r0WORgRNwiKm9kdgR
         fb2C//mAQt/aiMkVFZDJjjDRLO5aMBHwrJ1BGo4csDuNyjwwrSRIM0LminTV7JLXtdYq
         k6oA==
X-Gm-Message-State: AOJu0YwUoLpKFpDCSKH6/E/5MeFS06T5CmUXcidgoILa/kZF1rwWXdaI
	ZKj5cWl0HWm8wrtNKccSDUm4f/XoGL9LKyO2U68Bk3cTRHZ4kiw7wWHhc3QkuGo=
X-Google-Smtp-Source: AGHT+IHv496nHXyZhpEXIQR50uU5RPKd7kp+yl+ngA0rkiqjzciedtEC6obZ7CvBVhtshMovRX0y/g==
X-Received: by 2002:a05:600c:3514:b0:413:28ae:ebcb with SMTP id h20-20020a05600c351400b0041328aeebcbmr6301353wmq.3.1710245444558;
        Tue, 12 Mar 2024 05:10:44 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.222.97])
        by smtp.gmail.com with ESMTPSA id u15-20020a05600c138f00b00412706c3ddasm18794203wmf.18.2024.03.12.05.10.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Mar 2024 05:10:44 -0700 (PDT)
Message-ID: <cc06e895-e0f5-40da-8c29-0e4bf62bcacf@linaro.org>
Date: Tue, 12 Mar 2024 13:10:43 +0100
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12 2/4] dt-bindings: remoteproc: add Tightly Coupled
 Memory (TCM) bindings
Content-Language: en-US
To: Tanmay Shah <tanmay.shah@amd.com>, andersson@kernel.org,
 mathieu.poirier@linaro.org, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 michal.simek@amd.com, ben.levinsky@amd.com
Cc: linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
References: <20240301181638.814215-1-tanmay.shah@amd.com>
 <20240301181638.814215-3-tanmay.shah@amd.com>
 <fb78bdda-2ec7-4fcc-888e-233905a9386c@linaro.org>
 <17d58a39-7d56-4513-8d5f-7c18809c6cfb@amd.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <17d58a39-7d56-4513-8d5f-7c18809c6cfb@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/03/2024 19:39, Tanmay Shah wrote:
>>> +
>>> +    else:
>>> +      patternProperties:
>>> +        "^r5f@[0-9a-f]+$":
>>> +          type: object
>>> +
>>> +          properties:
>>> +            reg:
>>> +              minItems: 1
>>> +              items:
>>> +                - description: ATCM internal memory
>>> +                - description: BTCM internal memory
>>> +
>>> +            reg-names:
>>> +              minItems: 1
>>> +              items:
>>> +                - const: atcm0
>>> +                - const: btcm0
>>> +
>>> +            power-domains:
>>> +              maxItems: 3
>>
>> Please list power domains.
> 
> Hello,
> 
> Sent v13 addressing both comments.
> 

And gave me exactly two hours to disagree?

Best regards,
Krzysztof

