Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52DAB18DB1F
	for <linux-remoteproc@vger.kernel.org>; Sun, 21 Sep 2025 21:40:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758490861; cv=none; b=L/o4K3h+MbsHAlI/6lJLphrurq24WbZSFkE2AGMP8LCbTpH7EAbunrsSJXzYwMNN7e4FqFkcyiUGxY8CRGUbgibuNBFewc3rQOMkQsR6DCH9HvutSfTTY34WW4BN5krrBXwrR+hMsO4Et3Y+GstYkfQEJOsxmUy7zhdmC+auwCU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758490861; c=relaxed/simple;
	bh=1oNc0sJYdb9rX45c7syeiBdncY9kKRBhqLifXQ83cWs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Aw+Av8v8J7WvdWqg0KcryymKNE9nFTNTGh4FiE4LtVRxd6+fAqUlxdWS2CtL64uuTny2Xf4B/phqh/7osMV9ZSxHJskRxSLOBLa14bpyIWI2MZzA5WfVxCB4eRoRvLdKBPse44OZ1ZhraqzHsdY2FUuLdntpVHYy1pTl8X+a/8o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=IEFagO3U; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="IEFagO3U"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-45de56a042dso23352345e9.3
        for <linux-remoteproc@vger.kernel.org>; Sun, 21 Sep 2025 14:40:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1758490858; x=1759095658; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WosRKVT+AD3vASAmC7vYIumBFhKj0WFw859hR7TLepU=;
        b=IEFagO3U5hCLobCInDoUWdX+cA1L5BKqe7vFziLOlDQyrCIDGn404BS8nLOcd0LDXz
         MvIHk8jfT8ThEk7/VU5icdcJtU3OXQvyYVhBwPm9ftck7jbr88B70PIb0ClkiVaHz9fQ
         xSWOxwtchvSAzKP273aAWRSuqFDYyK61bp6TxIqOQ/3Ou7f1a8YWTmMRG15xG+pXkcJI
         dFlmlY4Qt2SFF/ssHHgA+8BuLtW80Ywt8h5lUXK/A0dwzGPjCOP2JlM5lD/Qz9cOzjE5
         hHRBqaV3FasUJz5r7RFIe/XnfLkSdWmRYdAnNwOqByxh/BwmgEvKOBSUX0p9RzIspj7v
         kizQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758490858; x=1759095658;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WosRKVT+AD3vASAmC7vYIumBFhKj0WFw859hR7TLepU=;
        b=KFTBsewNog5v2TjSMJAl1vMU9YpZ1ZAhbG/GBgkIrTEfZNLwDS+ZSanV4QE3Nke9XK
         uN+SjnmD/BguVpHUMTSwniWL9SIWcRKnbY4vJm8+tk9ZEYN6UO38EuyMPDKknyd5sXg4
         I5I1eGBELwyVaK8Rc98M4AoDTwcebyV7YD09Zmf150nduhwKtbrU1P+wl14lszl+WnDe
         LnPAr1XhoJDWdJ8RhoUrXCagASncTENOUl29i557REGhYBLMXG7nujxO98SJaUdPYCuO
         jghQcvbTN/5gf4C30/yT0zRFvF3Og+6LcLq55exr8+9hnhjxFBa79q4QK01iC/hXZbbV
         HU+w==
X-Forwarded-Encrypted: i=1; AJvYcCXwz65vawhGnPZBtbTcoK10PUI4ibJ1JnKhULpuAHr6Ib8ZOGNYAGdcDiK0XV+oE5Vj7qjd3lYSG0m12SEkLVBr@vger.kernel.org
X-Gm-Message-State: AOJu0YyuNxSM3p+0SYfODn8Xkw8TrWuMnYRJXQert2fyDDocn6hrngER
	hEH3WulHB1t6YNc5OKJXH/8VBzA0dOmy4VUy7Wxln56FF+k9ZUqEXCQHA7GiN+CWp2s=
X-Gm-Gg: ASbGnctkUcMxkq731FsnneuRNs2pgZbwdpvL2kjbZF3JAiwx0Vi5N30pPgsNuo97fQ+
	dzoOw/6jLs4XcjmHp4xh4eRsS5yfuZ4tU56EwSZ0VxmrrJ/uHoJfa/bti8mEYcw5Bg/bNqiKyGr
	QlVOPONzEBgQDFeGEkcLH9oXeq+GH5S/F0pVKFt6Kn2jIIWCfuVULb7jxlcSHW4cX4oqg2k+VJi
	4CCQt+cFl2TC2gNhWx5eB24VrY3Q3owIHw2n2Wth6aGQ2jq03sq9KtoQlu1gMcU9/LrweJEzCky
	2lZhgzWpIgHr1RtZsJMtwylR7XIBd+MvL8EzjBlUAtVTjlatF9HVeURYJYncKR9oOosZAaMzhxM
	V7OGkbP+07+Ho9WTrq0mSfRWQZ/Cv1gfgHcM4LeUCsczamVSsfCRejIxEUAur1o4VaP5Lvtha9V
	fBaowAm9BY+Lx837MAELs=
X-Google-Smtp-Source: AGHT+IFxQ7JkZZfaB476dGmISNTL1lZ3jMkfAy+OvS9OYEaehjoDsIOQ0nLG6IoE+CEVTZH9/YurZA==
X-Received: by 2002:a05:600c:4ed1:b0:45d:d291:5dc1 with SMTP id 5b1f17b1804b1-467eb8e216emr94817635e9.15.1758490857615;
        Sun, 21 Sep 2025 14:40:57 -0700 (PDT)
Received: from [192.168.0.19] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-464f64ad30csm201206795e9.23.2025.09.21.14.40.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 21 Sep 2025 14:40:57 -0700 (PDT)
Message-ID: <9139706a-708c-4be6-a994-120cce0cd0e6@linaro.org>
Date: Sun, 21 Sep 2025 22:40:55 +0100
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 03/12] firmware: qcom_scm: Introduce PAS context
 initialization and destroy helper
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250921-kvm_rproc_pas-v3-0-458f09647920@oss.qualcomm.com>
 <VaE1QImrKf8gxtMr-dFBEHJ0Mv9-1ugwsOz5I1Uaz1PXt6aJMrWR7G3c5bN74hJYzy5v6_obB1OqKgtgdbCUcw==@protonmail.internalid>
 <20250921-kvm_rproc_pas-v3-3-458f09647920@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20250921-kvm_rproc_pas-v3-3-458f09647920@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 20/09/2025 20:41, Mukesh Ojha wrote:
> When Secure Peripheral Authentication Service (PAS) method runs on a
> SoC where Linux runs at EL2 (Gunyah absence) where reset sequences

"i.e. runs without the Gynyah Hypervisor then, reset sequences"

> move to EL3 and Linux need to do some extra stuff before calling PAS
> SMC calls like creating SHMbridge. So, PAS SMC call need awareness and
> need handling of things required when Linux run at EL2.

"Therefore the PAS SMC call"

> 
> Currently, remoteproc and non-remoteproc subsystems use different

"Currently remoteproc"

> variants of the MDT loader helper API, primarily due to the handling of
> the metadata context. Remoteproc subsystems retain metadata context
> until authentication and reset is done, while non-remoteproc subsystems
> (e.g., video, graphics, ipa etc.) do not need to retain it and can free

"do not need to retain metadata context"

> the context right inside qcom_scm_pas_init() call based on passed context
> parameter as NULL.
> 
> So, in an attempt to unify the metadata API process for both remoteproc

"In an attempt to unify"

> and non-remoteproc subsystems and to make the SMC helper function
> cleaner whether SoC running with Gunyah presence or absence by introducing
> a dedicated PAS context initialization and destroy function. Context
> initialization beforehand would help all SMC function to carry it and do
> the right thing whether SoC is running with Gunyah presence or absence.

Since you need to do another version of this patch re: below, please 
tidy up the commit log here a bit too.

> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> ---
>   drivers/firmware/qcom/qcom_scm.c       | 53 ++++++++++++++++++++++++++++++++++
>   include/linux/firmware/qcom/qcom_scm.h | 11 +++++++
>   2 files changed, 64 insertions(+)
> 
> diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
> index 3379607eaf94..1c6b4c6f5513 100644
> --- a/drivers/firmware/qcom/qcom_scm.c
> +++ b/drivers/firmware/qcom/qcom_scm.c
> @@ -558,6 +558,59 @@ static void qcom_scm_set_download_mode(u32 dload_mode)
>   		dev_err(__scm->dev, "failed to set download mode: %d\n", ret);
>   }
> 
> +/**
> + * qcom_scm_pas_ctx_init() - Initialize peripheral authentication service
> + *			     context for a given peripheral and it can be
> + *			     destroyed with qcom_scm_pas_ctx_destroy() to
> + *			     release the context
> + *
> + * @dev:	  PAS firmware device
> + * @pas_id:	  peripheral authentication service id
> + * @mem_phys:	  Subsystem reserve memory start address
> + * @mem_size:	  Subsystem reserve memory size
> + *
> + * Upon successful, returns the PAS context or ERR_PTR() of the error otherwise.
> + */
> +void *qcom_scm_pas_ctx_init(struct device *dev, u32 pas_id, phys_addr_t mem_phys,
> +			    size_t mem_size)
> +{
> +	struct qcom_scm_pas_ctx *ctx;
> +
> +	ctx = kzalloc(sizeof(*ctx), GFP_KERNEL);
> +	if (!ctx)
> +		return ERR_PTR(-ENOMEM);
> +
> +	ctx->dev = dev;
> +	ctx->pas_id = pas_id;
> +	ctx->mem_phys = mem_phys;
> +	ctx->mem_size = mem_size;
> +
> +	ctx->metadata = kzalloc(sizeof(*ctx->metadata), GFP_KERNEL);
> +	if (!ctx->metadata) {
> +		kfree(ctx);
> +		return ERR_PTR(-ENOMEM);
> +	}
> +
> +	return ctx;
> +}
> +EXPORT_SYMBOL_GPL(qcom_scm_pas_ctx_init);
> +
> +/**
> + * qcom_scm_pas_ctx_destroy() - release PAS context
> + * @ctx:	PAS context
> + */
> +void qcom_scm_pas_ctx_destroy(struct qcom_scm_pas_ctx *ctx)
> +{
> +	kfree(ctx->metadata);
> +	ctx->metadata = NULL;
> +	ctx->dev = NULL;
> +	ctx->pas_id = 0;
> +	ctx->mem_phys = 0;
> +	ctx->mem_size = 0;
> +	kfree(ctx);
> +}

This looks a bit strange, manually destructing an object you then free. 
I get the argument you might make about use-after-free but, I don't 
think this level of defensive coding is necessary.

> +EXPORT_SYMBOL_GPL(qcom_scm_pas_ctx_destroy);
> +
>   /**
>    * qcom_scm_pas_init_image() - Initialize peripheral authentication service
>    *			       state machine for a given peripheral, using the
> diff --git a/include/linux/firmware/qcom/qcom_scm.h b/include/linux/firmware/qcom/qcom_scm.h
> index a13f703b16cd..e3e9e9e9077f 100644
> --- a/include/linux/firmware/qcom/qcom_scm.h
> +++ b/include/linux/firmware/qcom/qcom_scm.h
> @@ -72,6 +72,17 @@ struct qcom_scm_pas_metadata {
>   	ssize_t size;
>   };
> 
> +struct qcom_scm_pas_ctx {
> +	struct device *dev;
> +	u32 pas_id;
> +	phys_addr_t mem_phys;
> +	size_t mem_size;
> +	struct qcom_scm_pas_metadata *metadata;
> +};
> +
> +void *qcom_scm_pas_ctx_init(struct device *dev, u32 pas_id, phys_addr_t mem_phys,
> +			    size_t mem_size);
> +void qcom_scm_pas_ctx_destroy(struct qcom_scm_pas_ctx *ctx);
>   int qcom_scm_pas_init_image(u32 pas_id, const void *metadata, size_t size,
>   			    struct qcom_scm_pas_metadata *ctx);
>   void qcom_scm_pas_metadata_release(struct qcom_scm_pas_metadata *ctx);
> 
> --
> 2.50.1
> 
> 

Once fixed.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

---
bod
