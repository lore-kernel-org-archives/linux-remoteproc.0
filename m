Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0C6362150
	for <linux-remoteproc@vger.kernel.org>; Mon,  4 Mar 2024 17:56:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709574976; cv=none; b=AZGeVMfdYDVNGLiFcmIk2BxIdXPjHrZgZ6ZUJl2pMMWHRwez3D+YBblCLEPMPKdF2HAaPv+zH3KrUvIrM0nKTyk/L6i3u7fiYiHVIgUkkvsqmx0P8Hq+nHAcsPS/rnTBYPTZkhFRa7+9bVKQ43ngHKjkMIMrStX9gNE1GPnEp7o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709574976; c=relaxed/simple;
	bh=kkrPwbwq3HUb7dryDp5pAq3pLbLwY3Tp45E3kugU5S4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BVGkSMvuOLf/JZ4LQL5kAeAv8NFX6kZqF81wotbdAkbVNixpYdo2wQ7asTjcaZgBx4joe9shExjZlkTVibAxzsatGVW0xxrWA7a93trum9R58oFSXnsBKXREVSNPM2UNISgf/73QBLRAM6bCAcjM2YFd0bTUgciE9qlLyzdUUSY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HsSDbITv; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HsSDbITv"
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-2d094bc2244so69308171fa.1
        for <linux-remoteproc@vger.kernel.org>; Mon, 04 Mar 2024 09:56:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709574973; x=1710179773; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SpMuUtqDP80mrn0s2WW+RwGSbgeBVA1YFpkb3uniFDs=;
        b=HsSDbITvd2kzOSNdUqqKHbPsGjnqSZF6ekdcbwrcct1ttzjf9Xqk3eibWmk5osW7DS
         vj5gHuGSoRt2jnIQeLtVN2+nlGIsl/x9B6z+65e4CpXTrAVZw+mZpOgO8WNy//mdzPUB
         YdP4mqPiz8H/CcbJaja+WzLOjVtKQmdr0in93a95tqsgVSAYP6DZabJo55AH/Rv7m6YA
         aPAObZnDlvwNH0r1iRJrlbqHlG53HOZjkEAIhJpWuAvKG3aPwBcEpvgQA+7NzSNS6Mu3
         rg/fA8OrcJBL5+15RFQzltmzZDaEAB05mmk+4N/hDrbZvzoXb6ITJNuCeE+BpGBR+POi
         Gzmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709574973; x=1710179773;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SpMuUtqDP80mrn0s2WW+RwGSbgeBVA1YFpkb3uniFDs=;
        b=iC9fFTidwucmRgPfORLHyx/zq4FWTManLQXnZmDA7sZyJloL/VBsJuIJqQId0DzWu5
         CS3BctQZVhj3XY7ioRUQn3fp+8Jjpu/759F9T8IySckE9ANprOBuTWwBs4X37d3I50oQ
         t7qC8KPHvD3cqyEAa8tW7aX5sAoNjrZtklldVnuPXrHzJzzXWswzwBLmQsS9yGdli94C
         GR3C8jO74GcZaKgYPLlVM2Oxi6qYUSdmEXedFFT4LVIERg/olfJJppfzFaF/bb+AA6q7
         5vsoOcPyLCPBe2HkgiwXx6oWshNxgXgi6jhxq9q31eEGdVskz+LYyZ078BouaGaT7YN9
         YzPQ==
X-Forwarded-Encrypted: i=1; AJvYcCVEVXW+jQ416c7GBxJEOp6yvUn5Jc3B2tT2mqH0Pu0Wdu7Fnco9iJ5tXUEXvHXaLCYD2tWQ9NEqUyK9jWjYcKKu5+X/QzDFGu6DdkMuRHLEcw==
X-Gm-Message-State: AOJu0YyHCrRUbXrid8UoWkOLQUCf/UN+ZL406AegQi3O9sGcgosiFiGC
	vLiIbsCFtkq4eNvepRyJFDSoRaE9fY5H29q2HJMho2ZdEHcfY0XoKOQesK9TuIs=
X-Google-Smtp-Source: AGHT+IF7F4P8R+O9yUi9Koz60hPU30oDeTiJ5K3hVO7gXnUQSLl7GUgoL9GWXBIPe7Q1MyDmEDFxvg==
X-Received: by 2002:a05:651c:1a24:b0:2d3:a68a:9462 with SMTP id by36-20020a05651c1a2400b002d3a68a9462mr3761444ljb.20.1709574972936;
        Mon, 04 Mar 2024 09:56:12 -0800 (PST)
Received: from [172.30.204.149] (UNUSED.212-182-62-129.lubman.net.pl. [212.182.62.129])
        by smtp.gmail.com with ESMTPSA id bg12-20020a05651c0b8c00b002d3236a30bbsm1496732ljb.140.2024.03.04.09.56.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Mar 2024 09:56:12 -0800 (PST)
Message-ID: <c5abc503-2019-46d4-bbfd-8295bc0240fb@linaro.org>
Date: Mon, 4 Mar 2024 18:56:11 +0100
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v3 2/7] soc: qcom: qmi: add a way to remove running
 service
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
 Johan Hovold <johan+linaro@kernel.org>
References: <20240304-qcom-pd-mapper-v3-0-6858fa1ac1c8@linaro.org>
 <20240304-qcom-pd-mapper-v3-2-6858fa1ac1c8@linaro.org>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20240304-qcom-pd-mapper-v3-2-6858fa1ac1c8@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 3/4/24 18:03, Dmitry Baryshkov wrote:
> Add qmi_del_server(), a pair to qmi_add_server(), a way to remove
> running server from the QMI socket. This is e.g. necessary for
> pd-mapper, which needs to readd a server each time the DSP is started or
> stopped.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

[...]

> +
> +	list_for_each_entry_safe(svc, tmp, &qmi->services, list_node) {
> +		if (svc->service != service ||
> +		    svc->version != version ||
> +		    svc->instance != instance)
> +			continue;
> +
> +		qmi_send_del_server(qmi, svc);
> +		//list_del(&vc->list_node);
> +		//kfree(svc);

foo

Konrad
