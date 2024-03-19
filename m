Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8959933C9
	for <linux-remoteproc@vger.kernel.org>; Tue, 19 Mar 2024 05:25:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710825946; cv=none; b=VmFMeHO+Xzw08MK40JxC37QL8Utl4Z7zsbk8Nn7b395OzTZlhrODRKMoBwJQkB2bQeoi6cEUcFCOf67vR32MGS+Ku23r5oV4MywJ4LPlZ+98i2pqQIJR3dQpaj0lGAi8C0C7tbKds2jBgfLwtrztzhkkyoolYT5rHSN2D4Jm1cA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710825946; c=relaxed/simple;
	bh=xlJw5DDEno2UeELF7izcYnWagKR66XQtubOlkVabBik=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=G7zykj71xoIG8ssK4PAqR/isku8zhZfv7MMwj1av7NbwDiCO6VVcN9gpoMYpO7rA5NPnmwfgm8jPdnJYH5Q987KqhQ2/S2xNEFm21u+tzRaDn07zm/7NHy/lDBp5Su+H1xiZv3GjKfMhtzfyNvLacUyadQkhxsvs1AHp8fZpktQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=sZoQUJLR; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="sZoQUJLR"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-a3fb8b0b7acso486972766b.2
        for <linux-remoteproc@vger.kernel.org>; Mon, 18 Mar 2024 22:25:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710825942; x=1711430742; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=q6oinwYj2RW9QvL1NsB8w5LaSXSn9PMQMxOTGnro9J0=;
        b=sZoQUJLRpYcPTy4r6fDe+jfD3IalurH0WOJA39tmwoCC0tU0+BAl8Y1sBhs8PZRndY
         M/KbUAXm5e9lXVSJLQPNLz1zzoXZoFwD28T+ZG3NMAh9WyotXxilSnnj1abxRLpVuOSS
         ZPMCvLaM3Ektfn4ec8LLJemNJGfBR16keH/19apakd62KQp7WkMUBAb6fItCHk9bXJq4
         DhFuqJz1KMM3JrfA0OLNJ/+UfIy7c1UJsv22qLKGpv7phYwjCUHVawYSDRkrjVa4EMUv
         y1HwDKpN4+97iPoU7ulcYnQQDjyeFzy8mGvuc1D2s+RMgXa2DfmlA8TE+vWeVST+Xvz/
         Qalw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710825942; x=1711430742;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=q6oinwYj2RW9QvL1NsB8w5LaSXSn9PMQMxOTGnro9J0=;
        b=fCT6hJWVkogKYstC8bEzgk/MYNvIh3D9jj7ra2IdSobqhxf3DI2KAyqvKGSrrGuqhl
         zYdOso0nifkI2ZLLBkD1IYy7ZRsTvJ9bkC7PgjNeIyNkGRpYXDbZxzo74BkKHHLg0PV8
         WY62KDDHlwUuhIGDRdVN5aqDx/P/aRdyC2SfXyLNK2vXGqW84nTbebKwOhAR5nmAuI0s
         tEL/WKnOYbDK7Lvemw8RxmDWBp6FpatPk4BNBCJbI1kpvi3eliNinxj2FKxXIiLU5G18
         xH9ipJIq49xNIa4KNCyTit4si7zHEbssB5ApGTSdFgRHFpP89ldrEM6zH/+J7nbheMO/
         tk8Q==
X-Gm-Message-State: AOJu0YyGZ4In/MplxldlHzbkBtz9PT2P8bm6MaCt6eJXcqL62Q/mRhSb
	D4QkXT/HXG+gi5AxiBEFYnnCB4BeF/j3o2wCRpmFnv8KXxMCXLwU6XpHPGjaShk=
X-Google-Smtp-Source: AGHT+IEWpgg1fSu64M/h3IwcVwL8gooNkA1Q+CBb/2WJmTMukjtW7WIz+iHtiCVrQv9GrWf/A5L76A==
X-Received: by 2002:a17:906:6a19:b0:a46:af3e:dedc with SMTP id qw25-20020a1709066a1900b00a46af3ededcmr5170830ejc.40.1710825941870;
        Mon, 18 Mar 2024 22:25:41 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.222.97])
        by smtp.gmail.com with ESMTPSA id d10-20020a170907272a00b00a45ff890df0sm5616647ejl.35.2024.03.18.22.25.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Mar 2024 22:25:41 -0700 (PDT)
Message-ID: <b9bcd0e2-634c-4441-b9ce-839b2f7bfd85@linaro.org>
Date: Tue, 19 Mar 2024 06:25:39 +0100
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] drivers: remoteproc: add Versal and Versal-NET
 support
Content-Language: en-US
To: Tanmay Shah <tanmay.shah@amd.com>, andersson@kernel.org,
 mathieu.poirier@linaro.org, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 michal.simek@amd.com, ben.levinsky@amd.com
Cc: linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20240315211533.1996543-1-tanmay.shah@amd.com>
 <20240315211533.1996543-4-tanmay.shah@amd.com>
 <db6f16af-e715-4ff5-84d6-2d85d62d7c0c@linaro.org>
 <a0cdfa4c-9257-49e7-b519-54e7fd0fb230@amd.com>
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
In-Reply-To: <a0cdfa4c-9257-49e7-b519-54e7fd0fb230@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 19/03/2024 02:06, Tanmay Shah wrote:
> 
> 
> On 3/17/24 1:55 PM, Krzysztof Kozlowski wrote:
>> On 15/03/2024 22:15, Tanmay Shah wrote:
>>> AMD-Xilinx Versal and Versal-NET are successor of ZynqMP platform. ZynqMP
>>> remoteproc driver is mostly compatible with new platforms except few
>>> platform specific differences.
>>>
>>> Versal has same IP of cortex-R5 cores hence maintained compatible string
>>> same as ZynqMP platform. However, hardcode TCM addresses are not
>>> supported for new platforms and must be provided in device-tree as per
>>> new bindings. This makes TCM representation data-driven and easy to
>>> maintain. This check is provided in the driver.
>>>
>>> For Versal-NET platform, TCM doesn't need to be configured in lockstep
>>> mode or split mode. Hence that call to PMC firmware is avoided in the
>>> driver for Versal-NET platform.
>>>
>>> Signed-off-by: Tanmay Shah <tanmay.shah@amd.com>
>>> ---
>>>  drivers/remoteproc/xlnx_r5_remoteproc.c | 19 +++++++++++++++----
>>>  1 file changed, 15 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/drivers/remoteproc/xlnx_r5_remoteproc.c b/drivers/remoteproc/xlnx_r5_remoteproc.c
>>> index d4a22caebaad..193bc159d1b4 100644
>>> --- a/drivers/remoteproc/xlnx_r5_remoteproc.c
>>> +++ b/drivers/remoteproc/xlnx_r5_remoteproc.c
>>> @@ -323,9 +323,12 @@ static int zynqmp_r5_set_mode(struct zynqmp_r5_core *r5_core,
>>>  		return ret;
>>>  	}
>>>  
>>> -	ret = zynqmp_pm_set_tcm_config(r5_core->pm_domain_id, tcm_mode);
>>> -	if (ret < 0)
>>> -		dev_err(r5_core->dev, "failed to configure TCM\n");
>>> +	/* TCM configuration is not needed in versal-net */
>>> +	if (device_is_compatible(r5_core->dev, "xlnx,zynqmp-r5f")) {
>>> +		ret = zynqmp_pm_set_tcm_config(r5_core->pm_domain_id, tcm_mode);
>>> +		if (ret < 0)
>>> +			dev_err(r5_core->dev, "failed to configure TCM\n");
>>> +	}
>>>  
>>>  	return ret;
>>>  }
>>> @@ -933,10 +936,17 @@ static int zynqmp_r5_core_init(struct zynqmp_r5_cluster *cluster,
>>>  	int ret, i;
>>>  
>>>  	r5_core = cluster->r5_cores[0];
>>> +
>>> +	/*
>>> +	 * New platforms must use device tree for TCM parsing.
>>> +	 * Only ZynqMP uses hardcode TCM.
>>> +	 */
>>>  	if (of_find_property(r5_core->np, "reg", NULL))
>>>  		ret = zynqmp_r5_get_tcm_node_from_dt(cluster);
>>> -	else
>>> +	else if (of_machine_is_compatible("xlnx,zynqmp"))
>>>  		ret = zynqmp_r5_get_tcm_node(cluster);
>>
>> That's poor code. Your drivers should not depend on platform. I don't
>> understand why you need to do this and how is even related to this patch.
> 
> You are correct, ideally this shouldn't be needed. However, this driver contains
> hardcode TCM addresses that were used before TCM bindings were designed and available in
> device-tree. This check is provided to maintain backward compatibility with device-tree
> where TCM isn't expected.
> 
> For new platforms (Versal and Versal-NET) TCM must be provided in device-tree and for
> ZynqMP if it's not in device-tree then to maintain backward compatibility hardcode
> addresses are used.

That does not work like this. You cannot bind to some sort of different
compatible. If you disagree, please list the compatibles the driver
binds to.

Best regards,
Krzysztof

