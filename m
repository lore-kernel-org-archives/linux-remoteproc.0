Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63F9917B4FB
	for <linux-remoteproc@vger.kernel.org>; Wed, 10 Apr 2024 17:52:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712771569; cv=none; b=HJrctMcOGMDIOo791q7RnIFg3QDvImgrs0tZz5Fn4csWaC9ySbTn4+oKnw2rVWCIM35jvujJ5xwifEE9lYwV4+Ta7JLOQ/Ga3AIRRf9Tk3eMPXSrTf3TLdF4kYIEyxD5W7Z0CZwwdP/QxNNP9X5Qjd0Un5cTtYzdIp9rqmAQNu4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712771569; c=relaxed/simple;
	bh=767o7xvkZkE5AQMsnF/zYn8G1hq61jQzSHPrrqakIms=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=LydO/MlJRKv4xZn3U3J9Npm4fl4rs7aALLEATlLhnOIv0LwN3Ahgrn5zoQCU7P6fXRJT5eYJI9jKMJbjU7NvIUnzNH3jLU7RUZG6Xog/2vDnaiNai5w/4wkX73fAwLKyHd+KupCwqPX6FnfwBNlyElwJAYtUYn5f7qBiivCJTEA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=NChVpYqB; arc=none smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NChVpYqB"
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-2d8b4778f5fso15559451fa.3
        for <linux-remoteproc@vger.kernel.org>; Wed, 10 Apr 2024 10:52:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712771564; x=1713376364; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=uOVHA2xlzK7je7ttjy1nhrPlXlPuAp2xezIP2Gu8nIM=;
        b=NChVpYqBHbSAiaCkhnBtbML0SQ3clrOE0QexSV+3o7bhupaWXmVtZcmUxuQuI2ibsV
         jWlcCOpQGZb5xBOuTu/4dwjReDfdML1jxYoY+sP0X1OtLiNetersEMznvDTubuyzFU3M
         zHA4An29eKS46OJdg4uV0bX/1Cub5ghDNTJMHBUd4ewA8+RNl9QyYnI7FjxyVZuciyGX
         B2tKKOeeNbXVPzgsp5yuJBMpDipGZ7C5IMMC3E3Nq9D3B6ndz9PoWM89Q3jCWbfkokqB
         wjGuTpmdIQGk06bWSRNeIWjgWSblJzCy9U4sFmBFH6RatuBqYrUELC7F7UBlU0HokwTt
         YDjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712771564; x=1713376364;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uOVHA2xlzK7je7ttjy1nhrPlXlPuAp2xezIP2Gu8nIM=;
        b=uZhKEPZRy4SdmRLQ/mApuKWLhmbW/EtUQyQOR/BFEPcU93aQh8RWeP5i1i1kzXgcY5
         D8A276EDxGI1EjckpH0n2mg0ied4UJNKCVz6k2uwq1R4ZFlBjNYE0ZeoQmtlgRAir6+R
         8vFMor9as4BRcKINv5ZZdGtq+f2/W5xPhoD5cZ20AyZ1curiuVtj8WbRiaX/rIhlY3k4
         xRkKmDFrcwjDiamcPuGgkVfCmvpALay84qOu4bJSSlBUADajOokJSXOMarZ/GcDbg3gH
         8PL8VWWXAWmIOH55afMu1gXSBPz4lQcscM6soJLK+nRh7gbx2cKFCXAsq1PMY66OtN+J
         zgvw==
X-Forwarded-Encrypted: i=1; AJvYcCULXbbmfd/eAg+nYtWOidiXGA1Mx8vgbEm6Zpvm5QXm/JKvYjOskOr1ilxZYm8NkYevww8fJDIt9Fg5EVFdN8+p4FvDYY1W5659XLd/R0No9g==
X-Gm-Message-State: AOJu0YxnpXTI7DdgtAagd2NMQ7c5AiF0nH93NCVW8CWW+WVxmnXCpGV1
	wrdtzS6LEfig4HoVQYsDcbe8XtY/B9DPyS+pK7Rp9/BsHlCKuvox1vxovXxvnZk=
X-Google-Smtp-Source: AGHT+IEOlj4YMG9ismhRXJyrEXTIOfXs991+9TpCiZiqMR8fC8jAZzGSCXGqag0xPmiMZ4gXU+5/0g==
X-Received: by 2002:a2e:300b:0:b0:2d8:71a3:aafd with SMTP id w11-20020a2e300b000000b002d871a3aafdmr2448469ljw.27.1712771563497;
        Wed, 10 Apr 2024 10:52:43 -0700 (PDT)
Received: from [172.30.205.26] (UNUSED.212-182-62-129.lubman.net.pl. [212.182.62.129])
        by smtp.gmail.com with ESMTPSA id c20-20020a2e6814000000b002d82f0f14c3sm1844665lja.130.2024.04.10.10.52.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Apr 2024 10:52:43 -0700 (PDT)
Message-ID: <148157a4-7f78-4d03-8a12-44658ca6ab51@linaro.org>
Date: Wed, 10 Apr 2024 19:52:41 +0200
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] rpmsg: qcom_glink_ssr: fix module autoloading
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>, linux-arm-msm@vger.kernel.org,
 linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20240410164058.233280-1-krzk@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20240410164058.233280-1-krzk@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 4/10/24 18:40, Krzysztof Kozlowski wrote:
> Add MODULE_DEVICE_TABLE(), so the module could be properly autoloaded
> based on the alias from of_device_id table.
> 
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
