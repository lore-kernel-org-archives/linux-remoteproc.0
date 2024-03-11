Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AECD482DB
	for <linux-remoteproc@vger.kernel.org>; Mon, 11 Mar 2024 16:58:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710176337; cv=none; b=YxdCec5GHGURWQj/V3tm7k3QWFjtqpav6RhhgxFMtkLD9/nZp6u3hFYcsJMVMi4xMh0grQCwjYKw/bO3ZCeumHhfoqD/Pq++YWtHmy36Cpxrds27poW0aVdhCfZXVIUoXJtGfPiiFhK+p6nqVWb8Fxe82N8oWslJsKfHFkDg0Wo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710176337; c=relaxed/simple;
	bh=qHURRtiNiKWLkGsFB0TF9O/nXxSjMfEGtg9Cpm2qGy8=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=oqpN4553zg4NPqxjfJK+ZUF2/cGpBthahfYoc7+ZO8HNOcLZww2et12skDH4Bk0g0+zTOHH6dq70N/RJEcGqZ8y38+3qJwDng3zjEMNLCSiO//WCbcwqmPlYYKz1VCRtlWjhHxOZ8TCc8lfjBcfn7L8CM5RH7mffoMVZZxC6/sk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HHMhC+7l; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HHMhC+7l"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-41329a665d8so9259255e9.2
        for <linux-remoteproc@vger.kernel.org>; Mon, 11 Mar 2024 09:58:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710176332; x=1710781132; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :references:cc:to:content-language:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mFxVHbSdiVwUSkdtnz62DjQcs45SLQQd4y6HjEjM9ys=;
        b=HHMhC+7l8cwJNs3V/dB10utwCFUdaP/ea5WvTTU05yKiAtBw9TkGs0MLdP9yTOLaxR
         8vsrKTyqF2bJ3eW4NV5JM40rQ5Vgl7XooIB6p0c6ZyxNmrBMMcubjL5trPAp4PLg58/U
         PzuS+82adfrzHQ0M5o9AwnzEQ7OGDRcnk53fb4KV18ppMq1CCFFYwsGyK9Gft0LqnpMK
         BckNWOjV4K8zWpQoet5e3pQdtTc7f1KEaiBY4ShwXckFxSzau3nNeaJKmCMkO+prrJtE
         HKdCenEngxTtQ/4KmJpdu9t49VJT3aIa86HVDQa5rAhk/E8BbkvKBbP8XPPSzyHifTkv
         LV1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710176332; x=1710781132;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :references:cc:to:content-language:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=mFxVHbSdiVwUSkdtnz62DjQcs45SLQQd4y6HjEjM9ys=;
        b=pAdMTGBq/Iv+FeDuWdQTYf6nn4T1BtAsbIO93pfbpB3KWszAmJtcgn80SpQICHWSiM
         9MEh5nleCjFu7q7VdZQKAv667uMWca0HMlXPSJuLpnNs7mUJ+KUwANJBMmxuOfupOdXw
         5TybeXrkc14y1T4oO+3lcsqVLqctaPFOLWjPoAu6YBLLFbGio5QjfMsC+0NLsYWryLG6
         4WCzSHnvzYZXtHc1CVQTznK3gH7GaNQucVnEHmiWWCqwNeRlG4+xgqQqse4NeUzyLxj8
         u8Tl8Y9DPAX54zepDTCj6shC6GhZMeO3to4rASD60UqEgSMNKM/cpYZqke2BTQ+pD/dG
         Knrg==
X-Forwarded-Encrypted: i=1; AJvYcCXsi8JBnLvNjUQqFEpqGSTH/7E1iyVwNNPVLl3o0/ULbYUzWkLqfNWiuCxgGvyQIqCjlvwwCR5tPKJLsXIzKV/mwQ8m060rwpQPDOyRvNNL+A==
X-Gm-Message-State: AOJu0YwDQZKhvirDgLXdPsZM2kVMI0G+ptsp/cVRunwRJnK6b6yJTulO
	PKPpubNmbulvTZN7BX7pSg2sw90K0K5Uz/HpYpFtYRtGeuyLStVOPWPYKVsVoy12+00CioZwo6u
	WRP7WYQ==
X-Google-Smtp-Source: AGHT+IFcdn+j6zNR5DTUC5DuiVJZ2Toh7v3+nqc6hUuKJQ9aysBew/TZRYlQ7biVs6izFWnnQd9Hig==
X-Received: by 2002:a05:600c:1d25:b0:413:1810:4a48 with SMTP id l37-20020a05600c1d2500b0041318104a48mr5575967wms.22.1710176331693;
        Mon, 11 Mar 2024 09:58:51 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:48be:feb9:192b:f402? ([2a01:e0a:982:cbb0:48be:feb9:192b:f402])
        by smtp.gmail.com with ESMTPSA id fm10-20020a05600c0c0a00b0041330de9587sm448557wmb.40.2024.03.11.09.58.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Mar 2024 09:58:51 -0700 (PDT)
Message-ID: <9db38740-9a47-407c-ba0d-c87c397824fb@linaro.org>
Date: Mon, 11 Mar 2024 17:58:50 +0100
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH v4 7/7] remoteproc: qcom: pas: add configuration for
 in-kernel pdm
Content-Language: en-US, fr
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
 Johan Hovold <johan+linaro@kernel.org>
References: <20240311-qcom-pd-mapper-v4-0-24679cca5c24@linaro.org>
 <20240311-qcom-pd-mapper-v4-7-24679cca5c24@linaro.org>
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
Organization: Linaro Developer Services
In-Reply-To: <20240311-qcom-pd-mapper-v4-7-24679cca5c24@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/03/2024 16:34, Dmitry Baryshkov wrote:
> Add domain / service configuration for the in-kernel protection domain
> mapper service.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/remoteproc/Kconfig         |   1 +
>   drivers/remoteproc/qcom_q6v5_pas.c | 370 +++++++++++++++++++++++++++++++++++--
>   2 files changed, 354 insertions(+), 17 deletions(-)
> 
> diff --git a/drivers/remoteproc/Kconfig b/drivers/remoteproc/Kconfig
> index 8152e845f7a3..7c6ec54c7b35 100644
> --- a/drivers/remoteproc/Kconfig
> +++ b/drivers/remoteproc/Kconfig
> @@ -223,6 +223,7 @@ config QCOM_Q6V5_PAS
>   	depends on QCOM_SYSMON || QCOM_SYSMON=n
>   	depends on RPMSG_QCOM_GLINK || RPMSG_QCOM_GLINK=n
>   	depends on QCOM_AOSS_QMP || QCOM_AOSS_QMP=n
> +	depends on QCOM_PD_MAPPER || QCOM_PD_MAPPER=n
>   	select MFD_SYSCON
>   	select QCOM_PIL_INFO
>   	select QCOM_MDT_LOADER
> diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
> index 3235249d703d..ba53df7ea30e 100644
> --- a/drivers/remoteproc/qcom_q6v5_pas.c
> +++ b/drivers/remoteproc/qcom_q6v5_pas.c
> @@ -23,6 +23,7 @@
>   #include <linux/regulator/consumer.h>
>   #include <linux/remoteproc.h>
>   #include <linux/soc/qcom/mdt_loader.h>
> +#include <linux/soc/qcom/pd_mapper.h>
>   #include <linux/soc/qcom/smem.h>
>   #include <linux/soc/qcom/smem_state.h>
>   
> @@ -56,6 +57,9 @@ struct adsp_data {
>   	int region_assign_count;
>   	bool region_assign_shared;
>   	int region_assign_vmid;
> +
> +	const struct qcom_pdm_domain_data * const *domains;
> +	size_t num_domains;
>   };
>   
>   struct qcom_adsp {
> @@ -112,6 +116,9 @@ struct qcom_adsp {
>   
>   	struct qcom_scm_pas_metadata pas_metadata;
>   	struct qcom_scm_pas_metadata dtb_pas_metadata;
> +
> +	const struct qcom_pdm_domain_data * const *domains;
> +	size_t num_domains;
>   };
>   
>   static void adsp_segment_dump(struct rproc *rproc, struct rproc_dump_segment *segment,
> @@ -256,10 +263,14 @@ static int adsp_start(struct rproc *rproc)
>   	struct qcom_adsp *adsp = rproc->priv;
>   	int ret;
>   
> -	ret = qcom_q6v5_prepare(&adsp->q6v5);
> +	ret = qcom_pdm_add_domains(adsp->domains, adsp->num_domains);
>   	if (ret)
>   		return ret;
>   
> +	ret = qcom_q6v5_prepare(&adsp->q6v5);
> +	if (ret)
> +		goto del_domains;
> +
>   	ret = adsp_pds_enable(adsp, adsp->proxy_pds, adsp->proxy_pd_count);
>   	if (ret < 0)
>   		goto disable_irqs;
> @@ -348,6 +359,9 @@ static int adsp_start(struct rproc *rproc)
>   disable_irqs:
>   	qcom_q6v5_unprepare(&adsp->q6v5);
>   
> +del_domains:
> +	qcom_pdm_del_domains(adsp->domains, adsp->num_domains);
> +
>   	/* Remove pointer to the loaded firmware, only valid in adsp_load() & adsp_start() */
>   	adsp->firmware = NULL;
>   
> @@ -394,6 +408,8 @@ static int adsp_stop(struct rproc *rproc)
>   	if (handover)
>   		qcom_pas_handover(&adsp->q6v5);
>   
> +	qcom_pdm_del_domains(adsp->domains, adsp->num_domains);
> +
>   	return ret;
>   }
>   
> @@ -730,6 +746,10 @@ static int adsp_probe(struct platform_device *pdev)
>   		adsp->dtb_firmware_name = dtb_fw_name;
>   		adsp->dtb_pas_id = desc->dtb_pas_id;
>   	}
> +
> +	adsp->domains = desc->domains;
> +	adsp->num_domains = desc->num_domains;
> +
>   	platform_set_drvdata(pdev, adsp);
>   
>   	ret = device_init_wakeup(adsp->dev, true);
> @@ -806,6 +826,172 @@ static void adsp_remove(struct platform_device *pdev)
>   	rproc_free(adsp->rproc);
>   }
>   
> +static const struct qcom_pdm_domain_data adsp_audio_pd = {
> +	.domain = "msm/adsp/audio_pd",
> +	.instance_id = 74,
> +	.services = {
> +		"avs/audio",
> +		NULL,
> +	},
> +};
> +
> +static const struct qcom_pdm_domain_data adsp_charger_pd = {
> +	.domain = "msm/adsp/charger_pd",
> +	.instance_id = 74,
> +	.services = { NULL },
> +};
> +
> +static const struct qcom_pdm_domain_data adsp_root_pd = {
> +	.domain = "msm/adsp/root_pd",
> +	.instance_id = 74,
> +	.services = { NULL },
> +};
> +
> +static const struct qcom_pdm_domain_data adsp_root_pd_pdr = {
> +	.domain = "msm/adsp/root_pd",
> +	.instance_id = 74,
> +	.services = {
> +		"tms/pdr_enabled",
> +		NULL,
> +	},
> +};
> +
> +static const struct qcom_pdm_domain_data adsp_sensor_pd = {
> +	.domain = "msm/adsp/sensor_pd",
> +	.instance_id = 74,
> +	.services = { NULL },
> +};
> +
> +static const struct qcom_pdm_domain_data msm8996_adsp_audio_pd = {
> +	.domain = "msm/adsp/audio_pd",
> +	.instance_id = 4,
> +	.services = { NULL },
> +};
> +
> +static const struct qcom_pdm_domain_data msm8996_adsp_root_pd = {
> +	.domain = "msm/adsp/root_pd",
> +	.instance_id = 4,
> +	.services = { NULL },
> +};
> +
> +static const struct qcom_pdm_domain_data *msm8996_adsp_domains[] = {
> +	&msm8996_adsp_audio_pd,
> +	&msm8996_adsp_root_pd,
> +};
> +
> +static const struct qcom_pdm_domain_data *qcs404_adsp_domains[] = {
> +	&adsp_audio_pd,
> +	&adsp_root_pd,
> +	&adsp_sensor_pd,
> +};
> +
> +static const struct qcom_pdm_domain_data *sc7180_adsp_domains[] = {
> +	&adsp_audio_pd,
> +	&adsp_root_pd_pdr,
> +	&adsp_sensor_pd,
> +};
> +
> +static const struct qcom_pdm_domain_data *sc7280_adsp_domains[] = {
> +	&adsp_audio_pd,
> +	&adsp_root_pd_pdr,
> +	&adsp_charger_pd,
> +	&adsp_sensor_pd,
> +};
> +
> +static const struct qcom_pdm_domain_data *sdm845_adsp_domains[] = {
> +	&adsp_audio_pd,
> +	&adsp_root_pd,
> +};
> +
> +static const struct qcom_pdm_domain_data *sm8350_adsp_domains[] = {
> +	&adsp_audio_pd,
> +	&adsp_root_pd_pdr,
> +	&adsp_charger_pd,
> +};
> +
> +static const struct qcom_pdm_domain_data cdsp_root_pd = {
> +	.domain = "msm/cdsp/root_pd",
> +	.instance_id = 76,
> +	.services = { NULL },
> +};
> +
> +static const struct qcom_pdm_domain_data *sdm845_cdsp_domains[] = {
> +	&cdsp_root_pd,
> +};
> +
> +static const struct qcom_pdm_domain_data slpi_root_pd = {
> +	.domain = "msm/slpi/root_pd",
> +	.instance_id = 90,
> +	.services = { NULL },
> +};
> +
> +static const struct qcom_pdm_domain_data slpi_sensor_pd = {
> +	.domain = "msm/slpi/sensor_pd",
> +	.instance_id = 90,
> +	.services = { NULL },
> +};
> +
> +static const struct qcom_pdm_domain_data *sdm845_slpi_domains[] = {
> +	&slpi_root_pd,
> +	&slpi_sensor_pd,
> +};
> +
> +static const struct qcom_pdm_domain_data mpss_root_pd = {
> +	.domain = "msm/modem/root_pd",
> +	.instance_id = 180,
> +	.services = {
> +		NULL,
> +	},
> +};
> +
> +static const struct qcom_pdm_domain_data mpss_root_pd_gps = {
> +	.domain = "msm/modem/root_pd",
> +	.instance_id = 180,
> +	.services = {
> +		"gps/gps_service",
> +		NULL,
> +	},
> +};
> +
> +static const struct qcom_pdm_domain_data mpss_root_pd_gps_pdr = {
> +	.domain = "msm/modem/root_pd",
> +	.instance_id = 180,
> +	.services = {
> +		"gps/gps_service",
> +		"tms/pdr_enabled",
> +		NULL,
> +	},
> +};
> +
> +static const struct qcom_pdm_domain_data mpss_wlan_pd = {
> +	.domain = "msm/modem/wlan_pd",
> +	.instance_id = 180,
> +	.services = {
> +		"kernel/elf_loader",
> +		"wlan/fw",
> +		NULL,
> +	},
> +};
> +
> +static const struct qcom_pdm_domain_data *qcs404_mpss_domains[] = {
> +	&mpss_root_pd,
> +	&mpss_wlan_pd,
> +};
> +
> +static const struct qcom_pdm_domain_data *sc7180_mpss_domains[] = {
> +	&mpss_root_pd_gps_pdr,
> +	&mpss_wlan_pd,
> +};
> +
> +static const struct qcom_pdm_domain_data *sm8150_mpss_domains[] = {
> +	&mpss_root_pd_gps,
> +	&mpss_wlan_pd,
> +};
> +
> +static const struct qcom_pdm_domain_data *sm8350_mpss_domains[] = {
> +	&mpss_root_pd_gps,
> +};
> +
>   static const struct adsp_data adsp_resource_init = {
>   	.crash_reason_smem = 423,
>   	.firmware_name = "adsp.mdt",
> @@ -814,6 +1000,55 @@ static const struct adsp_data adsp_resource_init = {
>   	.ssr_name = "lpass",
>   	.sysmon_name = "adsp",
>   	.ssctl_id = 0x14,
> +	/* no domains */
> +};
> +
> +static const struct adsp_data qcs404_adsp_resource = {
> +	.crash_reason_smem = 423,
> +	.firmware_name = "adsp.mdt",
> +	.pas_id = 1,
> +	.auto_boot = true,
> +	.ssr_name = "lpass",
> +	.sysmon_name = "adsp",
> +	.ssctl_id = 0x14,
> +	.domains = qcs404_adsp_domains,
> +	.num_domains = ARRAY_SIZE(qcs404_adsp_domains),
> +};
> +
> +static const struct adsp_data sc7180_adsp_resource = {
> +	.crash_reason_smem = 423,
> +	.firmware_name = "adsp.mdt",
> +	.pas_id = 1,
> +	.auto_boot = true,
> +	.proxy_pd_names = (char*[]){
> +		"lcx",
> +		"lmx",
> +		NULL
> +	},
> +	.load_state = "adsp",
> +	.ssr_name = "lpass",
> +	.sysmon_name = "adsp",
> +	.ssctl_id = 0x14,
> +	.domains = sc7180_adsp_domains,
> +	.num_domains = ARRAY_SIZE(sc7180_adsp_domains),
> +};
> +
> +static const struct adsp_data sc7280_adsp_resource = {
> +	.crash_reason_smem = 423,
> +	.firmware_name = "adsp.mdt",
> +	.pas_id = 1,
> +	.auto_boot = true,
> +	.proxy_pd_names = (char*[]){
> +		"lcx",
> +		"lmx",
> +		NULL
> +	},
> +	.load_state = "adsp",
> +	.ssr_name = "lpass",
> +	.sysmon_name = "adsp",
> +	.ssctl_id = 0x14,
> +	.domains = sc7280_adsp_domains,
> +	.num_domains = ARRAY_SIZE(sc7280_adsp_domains),
>   };
>   
>   static const struct adsp_data sdm845_adsp_resource_init = {
> @@ -825,6 +1060,20 @@ static const struct adsp_data sdm845_adsp_resource_init = {
>   	.ssr_name = "lpass",
>   	.sysmon_name = "adsp",
>   	.ssctl_id = 0x14,
> +	.domains = sdm845_adsp_domains,
> +	.num_domains = ARRAY_SIZE(sdm845_adsp_domains),
> +};
> +
> +static const struct adsp_data sm6115_adsp_resource = {
> +	.crash_reason_smem = 423,
> +	.firmware_name = "adsp.mdt",
> +	.pas_id = 1,
> +	.auto_boot = true,
> +	.ssr_name = "lpass",
> +	.sysmon_name = "adsp",
> +	.ssctl_id = 0x14,
> +	.domains = sdm845_adsp_domains,
> +	.num_domains = ARRAY_SIZE(sdm845_adsp_domains),
>   };
>   
>   static const struct adsp_data sm6350_adsp_resource = {
> @@ -841,6 +1090,8 @@ static const struct adsp_data sm6350_adsp_resource = {
>   	.ssr_name = "lpass",
>   	.sysmon_name = "adsp",
>   	.ssctl_id = 0x14,
> +	.domains = qcs404_adsp_domains,
> +	.num_domains = ARRAY_SIZE(qcs404_adsp_domains),
>   };
>   
>   static const struct adsp_data sm6375_mpss_resource = {
> @@ -856,6 +1107,7 @@ static const struct adsp_data sm6375_mpss_resource = {
>   	.ssr_name = "mpss",
>   	.sysmon_name = "modem",
>   	.ssctl_id = 0x12,
> +	// TODO: domains
>   };
>   
>   static const struct adsp_data sm8150_adsp_resource = {
> @@ -871,6 +1123,8 @@ static const struct adsp_data sm8150_adsp_resource = {
>   	.ssr_name = "lpass",
>   	.sysmon_name = "adsp",
>   	.ssctl_id = 0x14,
> +	.domains = sdm845_adsp_domains,
> +	.num_domains = ARRAY_SIZE(sdm845_adsp_domains),
>   };
>   
>   static const struct adsp_data sm8250_adsp_resource = {
> @@ -887,6 +1141,8 @@ static const struct adsp_data sm8250_adsp_resource = {
>   	.ssr_name = "lpass",
>   	.sysmon_name = "adsp",
>   	.ssctl_id = 0x14,
> +	.domains = sdm845_adsp_domains,
> +	.num_domains = ARRAY_SIZE(sdm845_adsp_domains),
>   };
>   
>   static const struct adsp_data sm8350_adsp_resource = {
> @@ -903,6 +1159,8 @@ static const struct adsp_data sm8350_adsp_resource = {
>   	.ssr_name = "lpass",
>   	.sysmon_name = "adsp",
>   	.ssctl_id = 0x14,
> +	.domains = sm8350_adsp_domains,
> +	.num_domains = ARRAY_SIZE(sm8350_adsp_domains),
>   };
>   
>   static const struct adsp_data msm8996_adsp_resource = {
> @@ -917,9 +1175,11 @@ static const struct adsp_data msm8996_adsp_resource = {
>   	.ssr_name = "lpass",
>   	.sysmon_name = "adsp",
>   	.ssctl_id = 0x14,
> +	.domains = msm8996_adsp_domains,
> +	.num_domains = ARRAY_SIZE(msm8996_adsp_domains),
>   };
>   
> -static const struct adsp_data cdsp_resource_init = {
> +static const struct adsp_data qcs404_cdsp_resource = {
>   	.crash_reason_smem = 601,
>   	.firmware_name = "cdsp.mdt",
>   	.pas_id = 18,
> @@ -927,6 +1187,8 @@ static const struct adsp_data cdsp_resource_init = {
>   	.ssr_name = "cdsp",
>   	.sysmon_name = "cdsp",
>   	.ssctl_id = 0x17,
> +	.domains = sdm845_cdsp_domains,
> +	.num_domains = ARRAY_SIZE(sdm845_cdsp_domains),
>   };
>   
>   static const struct adsp_data sdm845_cdsp_resource_init = {
> @@ -938,6 +1200,8 @@ static const struct adsp_data sdm845_cdsp_resource_init = {
>   	.ssr_name = "cdsp",
>   	.sysmon_name = "cdsp",
>   	.ssctl_id = 0x17,
> +	.domains = sdm845_cdsp_domains,
> +	.num_domains = ARRAY_SIZE(sdm845_cdsp_domains),
>   };
>   
>   static const struct adsp_data sm6350_cdsp_resource = {
> @@ -954,6 +1218,8 @@ static const struct adsp_data sm6350_cdsp_resource = {
>   	.ssr_name = "cdsp",
>   	.sysmon_name = "cdsp",
>   	.ssctl_id = 0x17,
> +	.domains = sdm845_cdsp_domains,
> +	.num_domains = ARRAY_SIZE(sdm845_cdsp_domains),
>   };
>   
>   static const struct adsp_data sm8150_cdsp_resource = {
> @@ -969,6 +1235,8 @@ static const struct adsp_data sm8150_cdsp_resource = {
>   	.ssr_name = "cdsp",
>   	.sysmon_name = "cdsp",
>   	.ssctl_id = 0x17,
> +	.domains = sdm845_cdsp_domains,
> +	.num_domains = ARRAY_SIZE(sdm845_cdsp_domains),
>   };
>   
>   static const struct adsp_data sm8250_cdsp_resource = {
> @@ -984,6 +1252,8 @@ static const struct adsp_data sm8250_cdsp_resource = {
>   	.ssr_name = "cdsp",
>   	.sysmon_name = "cdsp",
>   	.ssctl_id = 0x17,
> +	.domains = sdm845_cdsp_domains,
> +	.num_domains = ARRAY_SIZE(sdm845_cdsp_domains),
>   };
>   
>   static const struct adsp_data sc8280xp_nsp0_resource = {
> @@ -998,6 +1268,8 @@ static const struct adsp_data sc8280xp_nsp0_resource = {
>   	.ssr_name = "cdsp0",
>   	.sysmon_name = "cdsp",
>   	.ssctl_id = 0x17,
> +	.domains = sdm845_cdsp_domains,
> +	.num_domains = ARRAY_SIZE(sdm845_cdsp_domains),
>   };
>   
>   static const struct adsp_data sc8280xp_nsp1_resource = {
> @@ -1012,6 +1284,7 @@ static const struct adsp_data sc8280xp_nsp1_resource = {
>   	.ssr_name = "cdsp1",
>   	.sysmon_name = "cdsp1",
>   	.ssctl_id = 0x20,
> +	// TODO: domains
>   };
>   
>   static const struct adsp_data sm8350_cdsp_resource = {
> @@ -1028,9 +1301,11 @@ static const struct adsp_data sm8350_cdsp_resource = {
>   	.ssr_name = "cdsp",
>   	.sysmon_name = "cdsp",
>   	.ssctl_id = 0x17,
> +	.domains = sdm845_cdsp_domains,
> +	.num_domains = ARRAY_SIZE(sdm845_cdsp_domains),
>   };
>   
> -static const struct adsp_data mpss_resource_init = {
> +static const struct adsp_data sc7180_mpss_resource = {
>   	.crash_reason_smem = 421,
>   	.firmware_name = "modem.mdt",
>   	.pas_id = 4,
> @@ -1045,6 +1320,27 @@ static const struct adsp_data mpss_resource_init = {
>   	.ssr_name = "mpss",
>   	.sysmon_name = "modem",
>   	.ssctl_id = 0x12,
> +	.domains = sc7180_mpss_domains,
> +	.num_domains = ARRAY_SIZE(sc7180_mpss_domains),
> +};
> +
> +static const struct adsp_data sc7280_mpss_resource = {
> +	.crash_reason_smem = 421,
> +	.firmware_name = "modem.mdt",
> +	.pas_id = 4,
> +	.minidump_id = 3,
> +	.auto_boot = false,
> +	.proxy_pd_names = (char*[]){
> +		"cx",
> +		"mss",
> +		NULL
> +	},
> +	.load_state = "modem",
> +	.ssr_name = "mpss",
> +	.sysmon_name = "modem",
> +	.ssctl_id = 0x12,
> +	.domains = sm8350_mpss_domains,
> +	.num_domains = ARRAY_SIZE(sm8350_mpss_domains),
>   };
>   
>   static const struct adsp_data sc8180x_mpss_resource = {
> @@ -1060,6 +1356,27 @@ static const struct adsp_data sc8180x_mpss_resource = {
>   	.ssr_name = "mpss",
>   	.sysmon_name = "modem",
>   	.ssctl_id = 0x12,
> +	.domains = sm8150_mpss_domains,
> +	.num_domains = ARRAY_SIZE(sm8150_mpss_domains),
> +};
> +
> +static const struct adsp_data sm8150_mpss_resource = {
> +	.crash_reason_smem = 421,
> +	.firmware_name = "modem.mdt",
> +	.pas_id = 4,
> +	.minidump_id = 3,
> +	.auto_boot = false,
> +	.proxy_pd_names = (char*[]){
> +		"cx",
> +		"mss",
> +		NULL
> +	},
> +	.load_state = "modem",
> +	.ssr_name = "mpss",
> +	.sysmon_name = "modem",
> +	.ssctl_id = 0x12,
> +	.domains = sm8150_mpss_domains,
> +	.num_domains = ARRAY_SIZE(sm8150_mpss_domains),
>   };
>   
>   static const struct adsp_data msm8996_slpi_resource_init = {
> @@ -1074,6 +1391,7 @@ static const struct adsp_data msm8996_slpi_resource_init = {
>   	.ssr_name = "dsps",
>   	.sysmon_name = "slpi",
>   	.ssctl_id = 0x16,
> +	/* no domains */
>   };
>   
>   static const struct adsp_data sdm845_slpi_resource_init = {
> @@ -1090,9 +1408,11 @@ static const struct adsp_data sdm845_slpi_resource_init = {
>   	.ssr_name = "dsps",
>   	.sysmon_name = "slpi",
>   	.ssctl_id = 0x16,
> +	.domains = sdm845_slpi_domains,
> +	.num_domains = ARRAY_SIZE(sdm845_slpi_domains),
>   };
>   
> -static const struct adsp_data wcss_resource_init = {
> +static const struct adsp_data qcs404_wcss_resource = {
>   	.crash_reason_smem = 421,
>   	.firmware_name = "wcnss.mdt",
>   	.pas_id = 6,
> @@ -1100,6 +1420,8 @@ static const struct adsp_data wcss_resource_init = {
>   	.ssr_name = "mpss",
>   	.sysmon_name = "wcnss",
>   	.ssctl_id = 0x12,
> +	.domains = qcs404_mpss_domains,
> +	.num_domains = ARRAY_SIZE(qcs404_mpss_domains),
>   };
>   
>   static const struct adsp_data sdx55_mpss_resource = {
> @@ -1115,6 +1437,7 @@ static const struct adsp_data sdx55_mpss_resource = {
>   	.ssr_name = "mpss",
>   	.sysmon_name = "modem",
>   	.ssctl_id = 0x22,
> +	// TODO: domains
>   };
>   
>   static const struct adsp_data sm8450_mpss_resource = {
> @@ -1133,6 +1456,8 @@ static const struct adsp_data sm8450_mpss_resource = {
>   	.ssr_name = "mpss",
>   	.sysmon_name = "modem",
>   	.ssctl_id = 0x12,
> +	.domains = sm8350_mpss_domains,
> +	.num_domains = ARRAY_SIZE(sm8350_mpss_domains),
>   };
>   
>   static const struct adsp_data sm8550_adsp_resource = {
> @@ -1152,6 +1477,8 @@ static const struct adsp_data sm8550_adsp_resource = {
>   	.ssr_name = "lpass",
>   	.sysmon_name = "adsp",
>   	.ssctl_id = 0x14,
> +	.domains = sm8350_adsp_domains,
> +	.num_domains = ARRAY_SIZE(sm8350_adsp_domains),

Looking at the jsn shipped with the SM8550 adsp, it should be:

static const struct qcom_pdm_domain_data *sm8550_adsp_domains[] = {
	&adsp_audio_pd,
	&adsp_sensor_pd,
	&adsp_root_pd,
	&adsp_charger_pd,
};

since SLPI has been moved to ADSP,
and for the root_pd there's no pdr_enabled service listed.

>   };
>   
>   static const struct adsp_data sm8550_cdsp_resource = {
> @@ -1172,6 +1499,8 @@ static const struct adsp_data sm8550_cdsp_resource = {
>   	.ssr_name = "cdsp",
>   	.sysmon_name = "cdsp",
>   	.ssctl_id = 0x17,
> +	.domains = sdm845_cdsp_domains,
> +	.num_domains = ARRAY_SIZE(sdm845_cdsp_domains),
>   };
>   
>   static const struct adsp_data sm8550_mpss_resource = {
> @@ -1195,6 +1524,8 @@ static const struct adsp_data sm8550_mpss_resource = {
>   	.region_assign_idx = 2,
>   	.region_assign_count = 1,
>   	.region_assign_vmid = QCOM_SCM_VMID_MSS_MSA,
> +	.domains = sm8350_mpss_domains,
> +	.num_domains = ARRAY_SIZE(sm8350_mpss_domains),
>   };
>   
>   static const struct adsp_data sc7280_wpss_resource = {
> @@ -1235,6 +1566,8 @@ static const struct adsp_data sm8650_cdsp_resource = {
>   	.region_assign_count = 1,
>   	.region_assign_shared = true,
>   	.region_assign_vmid = QCOM_SCM_VMID_CDSP,
> +	.domains = sdm845_cdsp_domains,
> +	.num_domains = ARRAY_SIZE(sdm845_cdsp_domains),
>   };
>   
>   static const struct adsp_data sm8650_mpss_resource = {
> @@ -1258,29 +1591,32 @@ static const struct adsp_data sm8650_mpss_resource = {
>   	.region_assign_idx = 2,
>   	.region_assign_count = 3,
>   	.region_assign_vmid = QCOM_SCM_VMID_MSS_MSA,
> +	.domains = sm8350_mpss_domains,
> +	.num_domains = ARRAY_SIZE(sm8350_mpss_domains),

Ok for the SM8550/SM8650 CDSP/MPSS.

Neil

>   };
>   
>   static const struct of_device_id adsp_of_match[] = {
>   	{ .compatible = "qcom,msm8226-adsp-pil", .data = &adsp_resource_init},
> +	// FIXME: is msm8996 adsp audio domain applicable to msm8953 ?
>   	{ .compatible = "qcom,msm8953-adsp-pil", .data = &msm8996_adsp_resource},
>   	{ .compatible = "qcom,msm8974-adsp-pil", .data = &adsp_resource_init},
>   	{ .compatible = "qcom,msm8996-adsp-pil", .data = &msm8996_adsp_resource},
>   	{ .compatible = "qcom,msm8996-slpi-pil", .data = &msm8996_slpi_resource_init},
>   	{ .compatible = "qcom,msm8998-adsp-pas", .data = &msm8996_adsp_resource},
>   	{ .compatible = "qcom,msm8998-slpi-pas", .data = &msm8996_slpi_resource_init},
> -	{ .compatible = "qcom,qcs404-adsp-pas", .data = &adsp_resource_init },
> -	{ .compatible = "qcom,qcs404-cdsp-pas", .data = &cdsp_resource_init },
> -	{ .compatible = "qcom,qcs404-wcss-pas", .data = &wcss_resource_init },
> -	{ .compatible = "qcom,sc7180-adsp-pas", .data = &sm8250_adsp_resource},
> -	{ .compatible = "qcom,sc7180-mpss-pas", .data = &mpss_resource_init},
> -	{ .compatible = "qcom,sc7280-adsp-pas", .data = &sm8350_adsp_resource},
> +	{ .compatible = "qcom,qcs404-adsp-pas", .data = &qcs404_adsp_resource },
> +	{ .compatible = "qcom,qcs404-cdsp-pas", .data = &qcs404_cdsp_resource },
> +	{ .compatible = "qcom,qcs404-wcss-pas", .data = &qcs404_wcss_resource },
> +	{ .compatible = "qcom,sc7180-adsp-pas", .data = &sc7180_adsp_resource},
> +	{ .compatible = "qcom,sc7180-mpss-pas", .data = &sc7180_mpss_resource},
> +	{ .compatible = "qcom,sc7280-adsp-pas", .data = &sc7280_adsp_resource},
>   	{ .compatible = "qcom,sc7280-cdsp-pas", .data = &sm6350_cdsp_resource},
> -	{ .compatible = "qcom,sc7280-mpss-pas", .data = &mpss_resource_init},
> +	{ .compatible = "qcom,sc7280-mpss-pas", .data = &sc7280_mpss_resource},
>   	{ .compatible = "qcom,sc7280-wpss-pas", .data = &sc7280_wpss_resource},
>   	{ .compatible = "qcom,sc8180x-adsp-pas", .data = &sm8150_adsp_resource},
>   	{ .compatible = "qcom,sc8180x-cdsp-pas", .data = &sm8150_cdsp_resource},
>   	{ .compatible = "qcom,sc8180x-mpss-pas", .data = &sc8180x_mpss_resource},
> -	{ .compatible = "qcom,sc8280xp-adsp-pas", .data = &sm8250_adsp_resource},
> +	{ .compatible = "qcom,sc8280xp-adsp-pas", .data = &sm8350_adsp_resource},
>   	{ .compatible = "qcom,sc8280xp-nsp0-pas", .data = &sc8280xp_nsp0_resource},
>   	{ .compatible = "qcom,sc8280xp-nsp1-pas", .data = &sc8280xp_nsp1_resource},
>   	{ .compatible = "qcom,sdm660-adsp-pas", .data = &adsp_resource_init},
> @@ -1288,18 +1624,18 @@ static const struct of_device_id adsp_of_match[] = {
>   	{ .compatible = "qcom,sdm845-cdsp-pas", .data = &sdm845_cdsp_resource_init},
>   	{ .compatible = "qcom,sdm845-slpi-pas", .data = &sdm845_slpi_resource_init},
>   	{ .compatible = "qcom,sdx55-mpss-pas", .data = &sdx55_mpss_resource},
> -	{ .compatible = "qcom,sm6115-adsp-pas", .data = &adsp_resource_init},
> -	{ .compatible = "qcom,sm6115-cdsp-pas", .data = &cdsp_resource_init},
> +	{ .compatible = "qcom,sm6115-adsp-pas", .data = &sm6115_adsp_resource},
> +	{ .compatible = "qcom,sm6115-cdsp-pas", .data = &qcs404_cdsp_resource},
>   	{ .compatible = "qcom,sm6115-mpss-pas", .data = &sc8180x_mpss_resource},
>   	{ .compatible = "qcom,sm6350-adsp-pas", .data = &sm6350_adsp_resource},
>   	{ .compatible = "qcom,sm6350-cdsp-pas", .data = &sm6350_cdsp_resource},
> -	{ .compatible = "qcom,sm6350-mpss-pas", .data = &mpss_resource_init},
> +	{ .compatible = "qcom,sm6350-mpss-pas", .data = &sm8150_mpss_resource},
>   	{ .compatible = "qcom,sm6375-adsp-pas", .data = &sm6350_adsp_resource},
>   	{ .compatible = "qcom,sm6375-cdsp-pas", .data = &sm8150_cdsp_resource},
>   	{ .compatible = "qcom,sm6375-mpss-pas", .data = &sm6375_mpss_resource},
>   	{ .compatible = "qcom,sm8150-adsp-pas", .data = &sm8150_adsp_resource},
>   	{ .compatible = "qcom,sm8150-cdsp-pas", .data = &sm8150_cdsp_resource},
> -	{ .compatible = "qcom,sm8150-mpss-pas", .data = &mpss_resource_init},
> +	{ .compatible = "qcom,sm8150-mpss-pas", .data = &sm8150_mpss_resource},
>   	{ .compatible = "qcom,sm8150-slpi-pas", .data = &sdm845_slpi_resource_init},
>   	{ .compatible = "qcom,sm8250-adsp-pas", .data = &sm8250_adsp_resource},
>   	{ .compatible = "qcom,sm8250-cdsp-pas", .data = &sm8250_cdsp_resource},
> @@ -1307,7 +1643,7 @@ static const struct of_device_id adsp_of_match[] = {
>   	{ .compatible = "qcom,sm8350-adsp-pas", .data = &sm8350_adsp_resource},
>   	{ .compatible = "qcom,sm8350-cdsp-pas", .data = &sm8350_cdsp_resource},
>   	{ .compatible = "qcom,sm8350-slpi-pas", .data = &sdm845_slpi_resource_init},
> -	{ .compatible = "qcom,sm8350-mpss-pas", .data = &mpss_resource_init},
> +	{ .compatible = "qcom,sm8350-mpss-pas", .data = &sc7280_mpss_resource},
>   	{ .compatible = "qcom,sm8450-adsp-pas", .data = &sm8350_adsp_resource},
>   	{ .compatible = "qcom,sm8450-cdsp-pas", .data = &sm8350_cdsp_resource},
>   	{ .compatible = "qcom,sm8450-slpi-pas", .data = &sdm845_slpi_resource_init},
> 

