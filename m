Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD7731AF4E9
	for <linux-remoteproc@vger.kernel.org>; Thu, 10 Oct 2024 06:59:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728543549; cv=none; b=ZyJ1xxrcSg1XdPTvnabgkW1eSm89JdkIYmYAYUvJMz/B56oJpu61yEczU1ATrz35jARkuttYBqnz005Em93HwERVXirQPXEt3B/SMukF3oOrgx748EKkM87XXtZJ8/e3Gw0KgjWRMkHnMGkxtar+LAdgU5arFetQzT2K9BAwvFU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728543549; c=relaxed/simple;
	bh=mQX9jQU0DPHWRiNPFczNQNp6e4J+Co2WY0aP+fHFmFw=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=ZazNF8nvJScQWyZEH3rM8Gde88eBfoJL5I9KK5vJ7jW5GZZu5V2rqcwa+Bd4F7xzPa59d8jXIjzvJPD7WsduyK+r1mvG1g3/HZSvv/VqOEpbR7aGvsVfB22KXXIkJmfQLuWlq6Qth4LfURXD2JDwugchTjtMA4hUqYViefUS/UY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TYir694c; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TYir694c"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-37ce9644daaso336634f8f.3
        for <linux-remoteproc@vger.kernel.org>; Wed, 09 Oct 2024 23:59:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728543546; x=1729148346; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Fu5UKmO88VBg+uZPHlg4bMbsMyVFn+ft6QBZVzUL7Tc=;
        b=TYir694c/weWob2Ry5hIRZKqGHm/RPxblpDNPQQrmeENNcdum3xmaQyCJiKOwTKjzl
         ULvap9HQ+O0JZVqyGo7frOaFeWNYFEG6nTnTHPIKliR4zaeF2c6xLraDGPWYQuumD+gh
         2s/GsPR5KlVZKu3GvLUEHWttlptYvhTZZOokMicvaGTa2O8EDHciTUV7IUdU4MkaMywo
         /pMyJuwJvd4HSzWVDQbhWOqEPWAniBiszQcR4GPRQTW1LNhWER9Qwh88J1mVnil2hkbw
         gsZTrkrbDcNuIM58vspS2SCy95bKbnrsOEDyE16f9pykSvTNrdzwdQx2Tjd7m/payMma
         c74w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728543546; x=1729148346;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Fu5UKmO88VBg+uZPHlg4bMbsMyVFn+ft6QBZVzUL7Tc=;
        b=cWI2L74RacxHbjXcNJHIYEZ4af5HXGWbXobCau2TuiGnzyb/796IGNusbf92b/hUq/
         YsSBMnbH0Z4C9zIf6GAm26CFIBAUQ8JhttDXBUOJQidAtpaPvQwofdZw2MDzpTRZquSH
         c3xv26YGoJbfz4hhG/bP9BiewRA3zhp8FtHv2sP2NdkOdNVSKlfv8gRQ48p1ZrRCucsa
         dzNOtii6iLTIAr3AtB4A7axeknqyPI8Ews9NWW1kbGOpDAxY2t1azg6VooobvWNaXwd6
         yBric5k0lm6PBFf9hXtlVevZ6//nvvDljjsXPpjt53EczB1DQrKr5+ccgROhjQRk6cm4
         Xm5w==
X-Forwarded-Encrypted: i=1; AJvYcCV9WUKzlK3DVORa7ohW5zJDJqtQBnBhE+N3TT/47FkgHZ2ftdlRfLkFKqRnLjYps97q6LdidTdrCqhjK9IPIX13@vger.kernel.org
X-Gm-Message-State: AOJu0Yzg2aROba4r+yn4gaDdRT2wbGb36PLGoPZLP73z8NVCulNqrLAo
	BKmn23TscahJe2C0Ww4eHlsui0qcwmGjhjVVo70kLD6/0nO9weFqLl6urdK3BsA=
X-Google-Smtp-Source: AGHT+IHuGKmwEjsezbeyACGUv6HYsE4XqNQZhrvfZtA6jtX0+67T0GwfuToRr3c9bzLP77yPOnCRsw==
X-Received: by 2002:a5d:490f:0:b0:37d:49cd:7b46 with SMTP id ffacd0b85a97d-37d49cd7e80mr834783f8f.27.1728543546142;
        Wed, 09 Oct 2024 23:59:06 -0700 (PDT)
Received: from [192.168.7.189] ([212.114.21.58])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37d4b9190f7sm654282f8f.114.2024.10.09.23.59.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Oct 2024 23:59:05 -0700 (PDT)
Message-ID: <5fc9d581-14a6-45e8-8eda-4df49b81f15d@linaro.org>
Date: Thu, 10 Oct 2024 08:59:04 +0200
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH 3/6] remoteproc: qcom: Add helper function to support
 IOMMU devmem translation
To: Mukesh Ojha <quic_mojha@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Shiraz Hashim <quic_shashim@quicinc.com>
References: <20241004212359.2263502-1-quic_mojha@quicinc.com>
 <20241004212359.2263502-4-quic_mojha@quicinc.com>
 <83e23090-0390-4c2e-91e3-e222baaa889a@linaro.org>
 <ZwPyE/rQOH181rqz@hu-mojha-hyd.qualcomm.com>
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
In-Reply-To: <ZwPyE/rQOH181rqz@hu-mojha-hyd.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 07/10/2024 16:37, Mukesh Ojha wrote:
> On Mon, Oct 07, 2024 at 10:08:16AM +0200, neil.armstrong@linaro.org wrote:
>> On 04/10/2024 23:23, Mukesh Ojha wrote:
>>> From: Shiraz Hashim <quic_shashim@quicinc.com>
>>>
>>> Qualcomm SoCs runnning with Qualcomm EL2 hypervisor(QHEE), IOMMU
>>> translation set up for remote processors is managed by QHEE itself
>>> however, for a case when these remote processors has to run under KVM
>>
>> This is not true, KVM is a Linux hypervisor, remote processors have
>> nothing to do with KVM, please rephrase.
> 
> Thanks, perhaps something like this,
> 
> "However, when same SoC runs with KVM configuration, remoteproc IOMMU
> translation needs to be set from Linux host running remoteproc PAS
> driver"

Thanks but I still don't see what KVM has to do here, KVM is an an optional
Linux kernel feature, Linux can be configured without KVM and still perfectly
startup those remoteprocs.

Neil

> 
> -Mukesh
> 

