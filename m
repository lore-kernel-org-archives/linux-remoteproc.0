Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30D197E0F9
	for <linux-remoteproc@vger.kernel.org>; Tue, 12 Mar 2024 18:34:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710268478; cv=none; b=eBFBE3xl22tpg4r6jL85LYmbZkQAeHgd+c4A3tWUUXKJxYZiujRfOlzJY3ykZJOZhrs64K6n+KcLsfZzNMOgc6uBuPJqNCPqggoZnwwZpTuOq+ZuWeNe+Oo1O6r9RYo5qNo0sXVLn44CoVA+Ly/vs+GQw7CewLPVOCUxLa17oOE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710268478; c=relaxed/simple;
	bh=pGuULm/CHXM11bgwq9+j2y5waqyjjkr9xF1BTqDkZJM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=thzm6slu4l81YIssJDXb0DQPPbQ6dwxlDFqBa7YQCxKYg1ol/OJIs2IJ/xzbsUEBLLIdEhZP5AlvTCKJZJPgNNtL7/7SmBRkxRj0UlH8mUUkUf6lYwaGzDQHeF5rmzy0x49RKgg5UKXuucAF13YDyhNU9E6kNTgtxBDrQ0GvDvo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HlhZA/4g; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HlhZA/4g"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4133847e47bso6943705e9.2
        for <linux-remoteproc@vger.kernel.org>; Tue, 12 Mar 2024 11:34:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710268475; x=1710873275; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Vv4Sm7UZXVqdBGX8hplEk2uRkZer1n7N2k6G4yb6swM=;
        b=HlhZA/4grcr0v8d4aNO0PG70QRQAP9VyRhOxnzfwTQOLi0LhBi+AVFW0E/uCRwOd+h
         Rw4Iqqgn/LNya1MOTJ+nZMtJJyHWRhSULEc8Ivr6vJ0SgnaMH3NHRoJFq4xDXRMKoyGP
         nEkgQRn9NVRBapMbLB47sBsyOW4UYCyVE9bLRmEcTvrptCHsJLMRdNc97lm7Mxoc/3ye
         LMFe0LdecAHhEH+ouGZ4OEg76wBrtJY0KVapHeAZOS/y/QI5xlUmJBjWlQSyToYhwlXC
         JDEi9fvNnfHgwh6bssxHgWBh+gC06/FC3m9GYiiZd2h+pLd86X/Z7Z01bkpTSf+kxNzN
         +Wkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710268475; x=1710873275;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Vv4Sm7UZXVqdBGX8hplEk2uRkZer1n7N2k6G4yb6swM=;
        b=nERzZmmNN7pZy25lm7H/wb2ykQQWIVIdnEFY8ZSx10g3Zg+ESSDiVc9Yk8DQwg9Cpx
         XI5MUAchYDTIRn0uMdZDMPgAsI73D7UUbH578MFtZ/Xv3wqaYF4GDAYL/8+mnx0RZ1iE
         n1jxhX5xncoAX80uZtvLm9mEmRUheL5yX06EKZv+eIm53smciB5c3XUJrvj6dLiZ6Fah
         DJLjZlYaQK54o1hIR+jZ9WvGTMneDIPBRFLK8NxNgReXEQp9Y7oSl+0ICPkuBN4f6TVN
         0u3QaPcSO8WNjFiC4ErzuMFJ3BYb99iCwT/XQcI0VWHAwyTmwlVEYDII0JGwGxDEUZzz
         oVUQ==
X-Gm-Message-State: AOJu0YwrNiIASPvBy/SmBVFoUcry0SCTk50guL0QdfsePdt01R6CkhME
	zRHyCRMiEVQrrPG9VuzBfA7pdsu3bGdTk0rfLPdyN6H1xhMTUi+ABS/MTj6uOI8=
X-Google-Smtp-Source: AGHT+IHYNgNP421vNaL5nXSlSaT4BZLzBe/yll6vafwoUuA66iFoHfjPfZkvNbfiFEeYo/m5gaX4uA==
X-Received: by 2002:a05:600c:5385:b0:413:2ab7:4396 with SMTP id hg5-20020a05600c538500b004132ab74396mr4743708wmb.18.1710268475495;
        Tue, 12 Mar 2024 11:34:35 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.222.97])
        by smtp.gmail.com with ESMTPSA id u18-20020a05600c19d200b0041316e91c99sm13277255wmq.1.2024.03.12.11.34.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Mar 2024 11:34:35 -0700 (PDT)
Message-ID: <3d602e0b-a49c-4281-bc51-f8c015c5606f@linaro.org>
Date: Tue, 12 Mar 2024 19:34:32 +0100
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v13 2/4] dt-bindings: remoteproc: add Tightly Coupled
 Memory (TCM) bindings
Content-Language: en-US
To: Tanmay Shah <tanmay.shah@amd.com>, andersson@kernel.org,
 mathieu.poirier@linaro.org, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 michal.simek@amd.com, ben.levinsky@amd.com
Cc: linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
References: <20240311175926.1625180-1-tanmay.shah@amd.com>
 <20240311175926.1625180-3-tanmay.shah@amd.com>
 <d498d76e-b021-4cf7-adca-63f1cd3e1542@linaro.org>
 <fdad2198-5d3a-4bce-8249-8b2f9f75f84a@amd.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <fdad2198-5d3a-4bce-8249-8b2f9f75f84a@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 12/03/2024 18:42, Tanmay Shah wrote:
> 
> 
> On 3/12/24 7:13 AM, Krzysztof Kozlowski wrote:
>> On 11/03/2024 18:59, Tanmay Shah wrote:
>>> From: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
>>>
>>> Introduce bindings for TCM memory address space on AMD-xilinx Zynq
>>> UltraScale+ platform. It will help in defining TCM in device-tree
>>> and make it's access platform agnostic and data-driven.
>>>
>>> Tightly-coupled memories(TCMs) are low-latency memory that provides
>>> predictable instruction execution and predictable data load/store
>>> timing. Each Cortex-R5F processor contains two 64-bit wide 64 KB memory
>>> banks on the ATCM and BTCM ports, for a total of 128 KB of memory.
>>>
>>> The TCM resources(reg, reg-names and power-domain) are documented for
>>> each TCM in the R5 node. The reg and reg-names are made as required
>>> properties as we don't want to hardcode TCM addresses for future
>>> platforms and for zu+ legacy implementation will ensure that the
>>> old dts w/o reg/reg-names works and stable ABI is maintained.
>>>
>>> It also extends the examples for TCM split and lockstep modes.
>>>
>>> Signed-off-by: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
>>> Signed-off-by: Tanmay Shah <tanmay.shah@amd.com>
>>> ---
>>>
>>> Changes in v13:
>>>   - Have power-domains property for lockstep case instead of
>>>     keeping it flexible.
>>>   - Add "items:" list in power-domains property
>>
>>
>> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> Hi Krzysztof,
> 
> Thanks for RB. I provided explanation of flexible power-domains in
> previous patchset. I am happy to send new revision removing
> minItems if you dis-agree.

Thanks for the explanation, it sounds fine, thus patch LGTM.

Best regards,
Krzysztof

