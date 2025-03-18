Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56A752080EC
	for <linux-remoteproc@vger.kernel.org>; Tue, 18 Mar 2025 10:48:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742294886; cv=none; b=FI1P5zy9Jiet6UsuV+nQI1K+o+beB7J26v7W6jIAIOHB4ZXq2le2BrNI3lEz4Q2JXVt8N8nIK2KifsmwyIQ5C4opztv4W6obMzrO3gxS0KTrkervipAm7EtB6OGlrZz8nCW2PPa5JZB/XUrq3GPIZ1M3QCJSBuwaBH8ZaikZZ48=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742294886; c=relaxed/simple;
	bh=Md/XRvHHliyWz7wlhOz6ujqai1U1PDubvuCqKxWBDwE=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=lH1TZldCs7cy/39QuO5Ijlf5ZawFwu6+gRhI9qPKXBzkssc0qLbRtD346h5a8yq6Edc40JmBuMBOeC06miA+f6Bq/rxfkOOLgbR9GsPaHiBIt5qQ6LxuL3Dsr8J8anKsm5i5mlXP+lhd4fsw4DUoOVEftivS5ZUF6qwpH063QXM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wAGUCUrN; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wAGUCUrN"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-43cf58eea0fso16352615e9.0
        for <linux-remoteproc@vger.kernel.org>; Tue, 18 Mar 2025 03:48:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742294882; x=1742899682; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lQHq2hCTlCvty8OK/ZzDJdJz20qlST0ei05aCL2P84s=;
        b=wAGUCUrNVAMuS7D0L/d8u4hN6JWKZb1RXZ+KgmYifI6R4yWFxzreSaPRmlzBCk6vXj
         G1tBRbGRFhIAeq8uS67N6t4N7izBNXjsz02pFl2xzKDkWUgGQR0A2TucuMOQFWU0MIfJ
         s4qx4kUwAcIBg3X0oMbQ0auTvIgdU7T5TLYYJkeivvqhHqDREZdVAQChShynbaNrv7/r
         0BECNZUB3rw0WNOV4NBDzsjTIOskL/r6mnqIPnGMJX5nQ/7191201Z6eJWM5C/X6g1Rl
         NnmCmK9xo0OGVnzd6zhjCNy4oi36Mm4QUoQnE0cuTw/XtD+1IjvwcZvclWtphPc7PH6/
         hm5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742294882; x=1742899682;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=lQHq2hCTlCvty8OK/ZzDJdJz20qlST0ei05aCL2P84s=;
        b=o3bhbAxhmZVHGswo0UCkpBfVZD/Nh7fgzixi75PqKSpinvmKNMXUdCa9EU74utPN1g
         D7foiIVAl1FqDTxvzgw+n1dyzfmM4XwSd9twkUnQ7qzGyxo56RnfQp9Mn2fPT7A5Kz65
         a4+Ys82q75oeNc4vMRI/wtAnQBqh54Vr1WaXKUWRW6bVNNFE6cK5YXfCezfPrDmcqxho
         CfFewlpy/eXy/3VJxFw1SWy426BcT1gNDMOWOo2a74zhucgoncngO1w6OmpDBA0Jab2o
         7HnrTUozi3QI5y7IlGq+Giys8pyVax8MCMqXGCgL4f+0EjYQRwS06AHQSZ9FqVKAFbs9
         rJlg==
X-Forwarded-Encrypted: i=1; AJvYcCXOaKIPaYFOX2n15vQsoaqVHB4LEL4fdOSe0G3EvXrqiWVdF0CnJxIkFf7vC2DB1yeAfHVGPrTtCBnDL3jrpJbs@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0CNw2VCyvxBIm0wJR1gVIxmiynWvusGf93Zp0RHUeJZiQhHvk
	YyDG+hEI7nr5cS8k56Dj2ixYe0LtEs98OsEYbUFZkfwD155gx6IEMAVj1c0fe2Y=
X-Gm-Gg: ASbGncswF3fnmqfev9Nia18LU5eDUQasP9kbJJwle0STw0XXY19TTcViuGusMVl7Yy5
	/YUL2/Xq+Z7oW4wutpC/YuK87H+TqLpyu0cofWoqR2wMA4iREaPktvQwraafwUQRfNoHJ3y5ekc
	M/jFfU0c/hrcu3XeubTmSI9BycR0wI8T7WHy3o4ttVEN3xk/df8kWEvo54JEghFHmxkXtoFUD8S
	86Fbmeju96HWKnD+5i2+vhhBNG3EdSDX3PH/eQ8p/7XzqZ+gKIabnEB/xuVVlnq1PPNdoD4KaWl
	IXvo2cLEseoR0EnfLqo2U8+VqQ/Kfu/qv6o5ulzmWuvEWMv6rOeCy/xmNMKTGxdJb2hF1KqM/Pk
	UGuvQXQmNVqSZhGnORiDfLw==
X-Google-Smtp-Source: AGHT+IEvqQm0L33zdjtiaR0kLcpkjVK78vmD/D0qYWBavdIvwJwnojSo58SFbe1jRfiwWGTyvooy4Q==
X-Received: by 2002:a05:600c:1d85:b0:43c:fe15:41e1 with SMTP id 5b1f17b1804b1-43d3fca93dfmr2270645e9.4.1742294882536;
        Tue, 18 Mar 2025 03:48:02 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:eac1:f2d4:84a8:c5ff? ([2a01:e0a:3d9:2080:eac1:f2d4:84a8:c5ff])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d1ffc4173sm131457905e9.20.2025.03.18.03.48.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Mar 2025 03:48:02 -0700 (PDT)
Message-ID: <a2ecebf5-9d37-49ad-9422-f984d1da8c57@linaro.org>
Date: Tue, 18 Mar 2025 11:48:01 +0100
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH 3/3] remoteproc: Use of_reserved_mem_region_* functions
 for "memory-region"
To: "Rob Herring (Arm)" <robh@kernel.org>,
 Saravana Kannan <saravanak@google.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>, Shawn Guo
 <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>,
 Patrice Chotard <patrice.chotard@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-remoteproc@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com
References: <20250317232426.952188-1-robh@kernel.org>
 <20250317232426.952188-4-robh@kernel.org>
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
In-Reply-To: <20250317232426.952188-4-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 18/03/2025 00:24, Rob Herring (Arm) wrote:
> Use the newly added of_reserved_mem_region_to_resource() and
> of_reserved_mem_region_count() functions to handle "memory-region"
> properties.
> 
> The error handling is a bit different in some cases. Often
> "memory-region" is optional, so failed lookup is not an error. But then
> an error in of_reserved_mem_lookup() is treated as an error. However,
> that distinction is not really important. Either the region is available
> and usable or it is not. So now, it is just
> of_reserved_mem_region_to_resource() which is checked for an error.
> 
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---
> For v6.16
> 
>   drivers/remoteproc/imx_dsp_rproc.c        | 44 ++++++---------
>   drivers/remoteproc/imx_rproc.c            | 65 ++++++++-------------
>   drivers/remoteproc/qcom_q6v5_adsp.c       | 24 +++-----
>   drivers/remoteproc/qcom_q6v5_mss.c        | 60 +++++++-------------
>   drivers/remoteproc/qcom_q6v5_pas.c        | 69 ++++++++---------------
>   drivers/remoteproc/qcom_q6v5_wcss.c       | 25 ++++----
>   drivers/remoteproc/qcom_wcnss.c           | 23 +++-----
>   drivers/remoteproc/rcar_rproc.c           | 36 +++++-------
>   drivers/remoteproc/st_remoteproc.c        | 39 ++++++-------
>   drivers/remoteproc/stm32_rproc.c          | 42 ++++++--------
>   drivers/remoteproc/ti_k3_dsp_remoteproc.c | 28 ++++-----
>   drivers/remoteproc/ti_k3_m4_remoteproc.c  | 28 ++++-----
>   drivers/remoteproc/ti_k3_r5_remoteproc.c  | 28 ++++-----
>   drivers/remoteproc/xlnx_r5_remoteproc.c   | 49 ++++++----------
>   14 files changed, 213 insertions(+), 347 deletions(-)
> 
<snip>

I get:
ERROR: modpost: "devm_ioremap_resource_wc" [drivers/remoteproc/qcom_q6v5_adsp.ko] undefined!
ERROR: modpost: "devm_ioremap_resource_wc" [drivers/remoteproc/qcom_q6v5_pas.ko] undefined!
ERROR: modpost: "devm_ioremap_resource_wc" [drivers/remoteproc/qcom_wcnss_pil.ko] undefined!
ERROR: modpost: "devm_ioremap_resource_wc" [drivers/remoteproc/ti_k3_dsp_remoteproc.ko] undefined!
ERROR: modpost: "devm_ioremap_resource_wc" [drivers/remoteproc/ti_k3_m4_remoteproc.ko] undefined!
ERROR: modpost: "devm_ioremap_resource_wc" [drivers/remoteproc/ti_k3_r5_remoteproc.ko] undefined!

when building with arm64 defconfig. I guess a proper:
EXPORT_SYMBOL(devm_ioremap_resource_wc)
is missing.

Neil

