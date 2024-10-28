Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CD8B19258E
	for <linux-remoteproc@vger.kernel.org>; Mon, 28 Oct 2024 08:30:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730104245; cv=none; b=I0+Obs4WKiMvOuqiNOoHT98ckgk10aXymfm7kiZgOOlfm8qn2rH5MP19qKhmg3jPiA3LJvEtwrrWaGVNenhx+dQ4lTXQDCBVCXNy22SMyDFmHI3GQbcw46jAdadoKFhMBUJYkI3DCLo+xV6LDb5sdOua1HZUxD6H5WbRLJTFFXw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730104245; c=relaxed/simple;
	bh=5vzdVPUULp5tzz81tWNHQvUdqrKcyhF4j6Ixvisbsxs=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=OdIdig1cYQp5XYNCGk8rUGFETnU8w8N0ljVaLw34uMRaIfLqxnp1G/BLAHUDvo0N7J6NlEgfdvpcSc/vJJhI8iuFm1yXeWQo3S15Va3LeUrUgIc6NBHJIog2ZSdskYlbkBZ4tLe2cq418mYG2KMotztFfa0dSmp9toMrkGfzv2U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=fQOArWsd; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fQOArWsd"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-43155abaf0bso41475495e9.0
        for <linux-remoteproc@vger.kernel.org>; Mon, 28 Oct 2024 01:30:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730104242; x=1730709042; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xYItaiaZRPrz/xhKOlsdxBElQPeUG3/eYMQxVE8xKhY=;
        b=fQOArWsdFgdNRNMvRuIHD61sZ20fp/UXjN3NuLn4XLsmTobhCiKqYCbn633s80m2zh
         0AykHVv/CwjywH2IuZMwKG2WMer9uB+8EG8Y6lhhR2B/G0iHA1oq0ZYePecgR1xrqq3c
         I9xSa/ZIDaKBMTVS+RV1PbbfDRMM3zSwGP+OQWJRAPINvdnKAxGixdMwEGtyrpEMNvEH
         7yAR27oopvt+Y7hJq/gj3NdV2kEUZEbNlZ/7+VC0oNHpVvSDRVxo/cQt6xhnUq177etF
         69bkYpUmfBU8jD0weme9SSHoc0jJwic7PyBIvJ8A0dOzGFpxR0AYRqcxNO5swweoGY0c
         sjrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730104242; x=1730709042;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=xYItaiaZRPrz/xhKOlsdxBElQPeUG3/eYMQxVE8xKhY=;
        b=pmZFVo7W164q0S6JrjRdJ5GUVbI+xjJY+RMGW/Xfv0+5aRN4D9xdPEhDIhVDvj161c
         gUUCkTouMnAmM0OjpupNno0A8jfhfjP6W810v+Ye6RbVnLGISfY7VtCebkIHEmozcVzk
         oQMHjWqU8B1tzHB3CFPqnZ/Yb81Sp50i8aQpXJy9WlVhSHRjqvvt8iFQ/JORcWF5mrT7
         lxaxFcRh7N3SG73hco6jX2jWmvawgKMDZDCcXZmQ3m1cx09h920NNHDZ7o/z9rOULXjJ
         rvnc7ATw6/RPICgXr6XwiuGFznNaJwnmQHQdVc6/7jDyvFpXg8vQ5ih3x2QRnvbcDDFK
         kqvg==
X-Forwarded-Encrypted: i=1; AJvYcCUFOkK3R3E98iTaJA2eLVa6L2mHqYv72Ypt+OI2yLnAbxxCjDSIYQ9HR7OEy5eTjI/r/I9t6YAKDFVO74aneGqC@vger.kernel.org
X-Gm-Message-State: AOJu0YziXfgHWM3hmKXrxXvvK9R7AVYYZh9exDDtDZRri0UiAbX+oxei
	UQHEa+q+0VicWMDjBiTPfJNtXA2R4SemjusIDeJfEhDdeTL3/S+uk9fWFON0bCo=
X-Google-Smtp-Source: AGHT+IFdrhDbAlKP5DwUGjW3tSq0KmIGHUx1DkzSp6utdXBvuqX8ui16hIOW8hJi9/xeSK++DQxoUg==
X-Received: by 2002:a05:600c:1c12:b0:431:4e39:1459 with SMTP id 5b1f17b1804b1-4319ad36498mr51136045e9.35.1730104241776;
        Mon, 28 Oct 2024 01:30:41 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:c11d:e163:200e:8a5d? ([2a01:e0a:982:cbb0:c11d:e163:200e:8a5d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4317d03b8b4sm172439265e9.0.2024.10.28.01.30.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Oct 2024 01:30:41 -0700 (PDT)
Message-ID: <823f6402-652d-4a57-98d9-3a24b54daa7e@linaro.org>
Date: Mon, 28 Oct 2024 09:30:40 +0100
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH 3/3] remoteproc: qcom: pas: enable SAR2130P audio DSP
 support
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 Vinod Koul <vkoul@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20241027-sar2130p-adsp-v1-0-bd204e39d24e@linaro.org>
 <20241027-sar2130p-adsp-v1-3-bd204e39d24e@linaro.org>
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
In-Reply-To: <20241027-sar2130p-adsp-v1-3-bd204e39d24e@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 27/10/2024 00:09, Dmitry Baryshkov wrote:
> Enable support for the Audio DSP on the Qualcomm SAR2130P platform,
> reusing the SM8350 resources.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/remoteproc/qcom_q6v5_pas.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
> index b10b4fc84f14eb40d64b278a339f2ceb45250a62..5944272bc2e414ea2258eb382452a74c1a742d13 100644
> --- a/drivers/remoteproc/qcom_q6v5_pas.c
> +++ b/drivers/remoteproc/qcom_q6v5_pas.c
> @@ -1423,6 +1423,7 @@ static const struct of_device_id adsp_of_match[] = {
>   	{ .compatible = "qcom,sa8775p-cdsp1-pas", .data = &sa8775p_cdsp1_resource},
>   	{ .compatible = "qcom,sa8775p-gpdsp0-pas", .data = &sa8775p_gpdsp0_resource},
>   	{ .compatible = "qcom,sa8775p-gpdsp1-pas", .data = &sa8775p_gpdsp1_resource},
> +	{ .compatible = "qcom,sar2130p-adsp-pas", .data = &sm8350_adsp_resource},
>   	{ .compatible = "qcom,sc7180-adsp-pas", .data = &sm8250_adsp_resource},
>   	{ .compatible = "qcom,sc7180-mpss-pas", .data = &mpss_resource_init},
>   	{ .compatible = "qcom,sc7280-adsp-pas", .data = &sm8350_adsp_resource},
> 

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
