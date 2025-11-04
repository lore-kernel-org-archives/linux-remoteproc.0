Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A47B23385A7
	for <linux-remoteproc@vger.kernel.org>; Tue,  4 Nov 2025 17:33:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762277635; cv=none; b=lsu72XTicl3FqC9EBkm9vJErU8cbrtYMbrUh1OjqYhOAYdKbSyDUnH6Fgb4ZIkXmpRP4cU/yzteOH50ylrUw3IF+n5nkCPPLMMAwS3zRKBNLNTNH0m8BOaxbAkDnnStFWk5I7gj8E10+YAIN2IrWO4mtzYLt29C8Wg7Qpxqg3io=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762277635; c=relaxed/simple;
	bh=KFvjz0cCCOJBoQSCD85u71EH/JU99I4A+NIvx/VMOTw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eTKB0Uyl5pBwrNQ1l/rV5mTYMuSXj+dMoVY9wixoYxEDdlx5dcyYCxlHMR7Qs801mM/icGWd6VxBZDkhMLMtXkiuHlt0zMPlnuRkvHfBp0XS7eRITAh7W2cdEOZ7jjZOuDklFbSAoOJRT1RKZo430wNB8jpDvXYXUOoaFJZ//OQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JT8C8owM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TXZCY90j; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JT8C8owM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TXZCY90j"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A4GgWw22441918
	for <linux-remoteproc@vger.kernel.org>; Tue, 4 Nov 2025 17:33:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aqZ9yfny6oAzxmXiKferFQ7liegXvYnBU8DVU4CAdfs=; b=JT8C8owMtH0dtdHH
	avdy3GC0PGU1LxkxoWlxeDOyeSmhOpkaDYO0ri9ia6WpLwKPnm5TLRVXS//kfZLY
	9iVeJ1jSEgmJESSbwKKUNaICoteG8XMxGyMwH/1zEk0HtJFyNE29KQ803TnqWO92
	OfGcLP30SERbqZnNOhCHU8+F15a3qydKi22eWRQbKU1Nj+dYdGjzK+p4sJBq9zIQ
	+T0gtYnScZNvyFhfnz44oABNHchzgurNd6UYGClUN2PeExbvB74fgtNSEOjmNpKt
	q//87dZeux3nPufYMT/2vi3EWyxZO+Zaek1nrqG2tfJ+79NFEtanPu8sSn+/xxui
	S0A82A==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a7me5rbga-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Tue, 04 Nov 2025 17:33:52 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4e890deecf6so9824831cf.0
        for <linux-remoteproc@vger.kernel.org>; Tue, 04 Nov 2025 09:33:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762277632; x=1762882432; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aqZ9yfny6oAzxmXiKferFQ7liegXvYnBU8DVU4CAdfs=;
        b=TXZCY90jLOCK//3gnwcP+U8paekG/zN4GjHY6Dsz6wW2Zi+72zTw4Qv3VJ1Ha4oCdr
         kO/W322us/EcivWBSNxL4CdlIkqL7+y5xn2eJ9i9024K0f6WxeMx9PvRlELmJkNsQ3P0
         NUkEyx7gx81Mn3eumQNLYOlupcLKbodtaSviuwp2WueI570yHP8v5CgSUDL72z8dozAC
         6pANdMvs3g14MjhvAkeinLpl7xZ5AM7TPfghZtI30MZspp7qyTNXb9P8WqFhw6YIs17N
         o/dcAMXjhUDR/emdKoenL/dpMaEnR9n96yJqq+HMqkjA3arzJkMg01Q4do3+5x9hu4wk
         iW9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762277632; x=1762882432;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aqZ9yfny6oAzxmXiKferFQ7liegXvYnBU8DVU4CAdfs=;
        b=Qpmd2wzo3C8FZjY0umTw5yC3mFrls932hadN8ggHpfVrBl7FSpRlPq6ZQ6rYP55u60
         fa0aG2FqpJ6z9i80BMrIeZt1H0pixmehsjwn+wjVtxXjC0b7JCmEVE89okfanC7Ct6nh
         7ZC4pJIeYBT8IS22RU/h9ljg85zzATlcyCh/0lvDVyrpRYMQOK1Y0xyzdChMjTSWQq5N
         cclhogXeyDf9PmhmAw7Q8Q1jdWvjZiTk2P4qjku+isUG3rdr1+g4xzt7cnfXKhFiBkoP
         tBc0U+hQXP34gGbnkuh5+d1Nm0sIBQbG83jc8SfSCHk2VYI8Zme1gQWdLRwlQmwBsHAT
         7Rbw==
X-Forwarded-Encrypted: i=1; AJvYcCX0YiUEiFnAvH4xARlOkL4YI8ciJoJ/VyOchew9QMeazSiuw4mXT0n6rh8GrgAgevOJ8EB3snUFm8U6iR2yufBl@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2wypfT45wQ1KUCMxrMI9OaeQ3AhgZTDJA4FLigCVv/5mqEiS/
	xcrjQ//N9YVVl6rJdPL0jBQgFnbNqGpfc+rv4XFZMM0Kn7nHfduego1mx2Et/SiTlRplsGI/8FO
	nNvdNVeQBaqQrRJA08ukxZWtIFx2XbjU9omDwajuJWt70VVqqut8OiCzZz+albM/5991uWWVn
X-Gm-Gg: ASbGncvzBdHrTw85KmyZXK1iM6Rm2Xob8w2fcpHrEnnocxbf3I8Ks28za7mzmVEbFNs
	YUD9Nzc/4JZ+LQryuquH+URRXVEFBxTWgGm1OBL9a81lVy1bi+m0m8VabTpdNOVw9puiFfm5Oel
	LVYxnNnTuQCedX2AwxgWEUEvNNQ+z6kM3t3CnVrAvP0tu83UZMtzxK1yv+C9VmM4/bgUkXos41y
	gzcbeuQvxapNaPpZZvfUNbehH2H3tNd7W3B8bw2BWFxVN3OSeKD6iXhjnkm4E0oUjkLt5woXaVX
	PvW+wIx9mXNyLJ+GyPFLtV5Wej7IJZCdAkyZ06wVGYwh7yKmK9BOoheKA6FMRrtKJ0m0lkLehu2
	nM52Aga1zOF4LZOWIyOsunA6elOPh4heB2zIbK4gZCl3r0+/y9pJ6KjJp
X-Received: by 2002:a05:622a:306:b0:4ed:1603:9504 with SMTP id d75a77b69052e-4ed719128a5mr3277351cf.0.1762277631944;
        Tue, 04 Nov 2025 09:33:51 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGW4Fzu7h1aS6jL7fg0IN2U5tLZI4K3C0D5I77oLa9b8QEcRdS4uAvBjPC1sDrWLjCqoMK2uw==
X-Received: by 2002:a05:622a:306:b0:4ed:1603:9504 with SMTP id d75a77b69052e-4ed719128a5mr3276881cf.0.1762277631241;
        Tue, 04 Nov 2025 09:33:51 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b723f6e4089sm274335066b.44.2025.11.04.09.33.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Nov 2025 09:33:50 -0800 (PST)
Message-ID: <fc8beead-566d-463b-aebe-407429adf156@oss.qualcomm.com>
Date: Tue, 4 Nov 2025 18:33:49 +0100
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 05/14] remoteproc: pas: Replace metadata context with
 PAS context structure
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20251104-kvm_rproc_v6-v6-0-7017b0adc24e@oss.qualcomm.com>
 <20251104-kvm_rproc_v6-v6-5-7017b0adc24e@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251104-kvm_rproc_v6-v6-5-7017b0adc24e@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: t48XqXgMQXciRbRWGXEtf9uQx3h2qEFW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA0MDE0NyBTYWx0ZWRfX78zf4kXBTkKO
 uSseLnOFRt6ubQpCF7g/+Zy1MY0DPGaXcgEMHfpRfeRCMRML4E6oybVhIJOzisaAKg6YTyOjqBv
 cDjcLIljpIDtFfngC6eK/F/ETAOJhziJ0Ld7QRuWErkwOP7535cdxuHSIwvDlftq2CupY4oBgSY
 mbDPLTlmH2Y04IAbYtzIxNtYLlhUFvIofsvQrnvsRe73w+O9Yh/esHCaVrkgeH48HtRM3qETD9i
 efSWd6idhEfuBWiBs6++MRcep5pjBtnuXhk/pMiUZK8an5WcNxrEjd+r7Sy+cIAG+6wvFIL8J/d
 FOhDkJeRze6qfyz06WE8bKhwu/BYiNkSqpnQcSAsOgBf1YH8R1eL1MWMRDnXrBvrIl1fKqe7sUR
 tgtp93QO85fEEpMZRJzncrtZ7eRSAQ==
X-Proofpoint-ORIG-GUID: t48XqXgMQXciRbRWGXEtf9uQx3h2qEFW
X-Authority-Analysis: v=2.4 cv=IpsTsb/g c=1 sm=1 tr=0 ts=690a3900 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=mTvibLGk-GZogn_PrgYA:9
 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-04_02,2025-11-03_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 clxscore=1015
 malwarescore=0 adultscore=0 suspectscore=0 impostorscore=0 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511040147

On 11/4/25 8:35 AM, Mukesh Ojha wrote:
> As a superset of the existing metadata context, the PAS context
> structure enables both remoteproc and non-remoteproc subsystems to
> better support scenarios where the SoC runs with or without the Gunyah
> hypervisor. To reflect this, relevant SCM and metadata functions are
> updated to incorporate PAS context awareness.
> 
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> ---
>  drivers/firmware/qcom/qcom_scm.c       | 25 +++++++++++++---------
>  drivers/remoteproc/qcom_q6v5_pas.c     | 38 ++++++++++++++++++++++++----------
>  drivers/soc/qcom/mdt_loader.c          |  4 ++--
>  include/linux/firmware/qcom/qcom_scm.h |  4 ++--
>  include/linux/soc/qcom/mdt_loader.h    |  6 +++---
>  5 files changed, 49 insertions(+), 28 deletions(-)
> 
> diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
> index 5a525dbd0a2e..9cdd152da592 100644
> --- a/drivers/firmware/qcom/qcom_scm.c
> +++ b/drivers/firmware/qcom/qcom_scm.c
> @@ -603,7 +603,7 @@ EXPORT_SYMBOL_GPL(devm_qcom_scm_pas_context_init);
>   *		and optional blob of data used for authenticating the metadata
>   *		and the rest of the firmware
>   * @size:	size of the metadata
> - * @ctx:	optional metadata context
> + * @ctx:	optional pas context
>   *
>   * Return: 0 on success.
>   *
> @@ -612,8 +612,9 @@ EXPORT_SYMBOL_GPL(devm_qcom_scm_pas_context_init);
>   * qcom_scm_pas_metadata_release() by the caller.
>   */
>  int qcom_scm_pas_init_image(u32 pas_id, const void *metadata, size_t size,
> -			    struct qcom_scm_pas_metadata *ctx)
> +			    struct qcom_scm_pas_context *ctx)
>  {
> +	struct qcom_scm_pas_metadata *mdt_ctx;

This is never initialized

>  	dma_addr_t mdata_phys;
>  	void *mdata_buf;
>  	int ret;
> @@ -665,9 +666,10 @@ int qcom_scm_pas_init_image(u32 pas_id, const void *metadata, size_t size,
>  	if (ret < 0 || !ctx) {
>  		dma_free_coherent(__scm->dev, size, mdata_buf, mdata_phys);
>  	} else if (ctx) {
> -		ctx->ptr = mdata_buf;
> -		ctx->phys = mdata_phys;
> -		ctx->size = size;
> +		mdt_ctx = ctx->metadata;
> +		mdt_ctx->ptr = mdata_buf;
> +		mdt_ctx->phys = mdata_phys;
> +		mdt_ctx->size = size;

So this will always cause stack corruption

>  	}
>  
>  	return ret ? : res.result[0];
> @@ -676,16 +678,19 @@ EXPORT_SYMBOL_GPL(qcom_scm_pas_init_image);
>  
>  /**
>   * qcom_scm_pas_metadata_release() - release metadata context
> - * @ctx:	metadata context
> + * @ctx:	pas context
>   */
> -void qcom_scm_pas_metadata_release(struct qcom_scm_pas_metadata *ctx)
> +void qcom_scm_pas_metadata_release(struct qcom_scm_pas_context *ctx)
>  {
> -	if (!ctx->ptr)
> +	struct qcom_scm_pas_metadata *mdt_ctx;

Is the existence of this struct any useful after you introduced
pas_context?

Konrad
