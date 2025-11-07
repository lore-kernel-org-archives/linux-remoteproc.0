Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A41EF25D216
	for <linux-remoteproc@vger.kernel.org>; Fri,  7 Nov 2025 10:05:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762509905; cv=none; b=O4yrm/ys7hWfUwuHALRKM9sw53d7fj3GP3M832TzFjXogHY4OqIju4PMOQQJAmiKNuvumfZBT89RoXvcwT8N6UKZTP55BU1H2gRk/PGpmTV4BmDwP4L+QdewDoFP4W0gWIQhsyeYoepze46Cx36m9GZXzrkbL+3FFvowzcY4qUQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762509905; c=relaxed/simple;
	bh=Zv8AR6SJ54Ta42CALeGguW44PsrjtNsPhE80SPyIkT0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hZXN4CBwQ8XNTZDFVT7w12C/bO/TMfdaKeZlofcd8wu0jW/QSbaNX7C3aQS6ACqKuz9WMvlhGk3EqYHTAjjj1+mHudK3VpS8HhFdqyo6ZG8FBdnA0jrpWolc7x5o+q+PJ8csx9rtOeeUrbioYXkqUmuoWDsy8iNjuhkDyP+GYOc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BgQgLoGt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GczcBXD4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BgQgLoGt";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GczcBXD4"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A757smp2273984
	for <linux-remoteproc@vger.kernel.org>; Fri, 7 Nov 2025 10:05:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	38uukSqtrZbZB+x525VFewPE7UBvS9QwCZXap8mnYiU=; b=BgQgLoGtWEj4H0Bf
	pjSqJrqRKNE6gL0TlSurzH8occv83BjsK5VWm8zeS9lPqvasvcWy7rQZ9oF96lYp
	Sq9DwiI4SCqjcnlRjgsaDwivy7L4Lm2g3FE2ZfCcdFGgKJvnkpF7/jnn94dmqQhn
	mWD5E7iRt+O9EclXEkl/6db3Jzh2X0Bc6agk9DZwtxLeOM+jt+ZRXw+uNo7sUsOi
	8RlMj3bsnydPlmEJmU2V30/28m7RpSgdTHvaAu4EnVWTM0p9ODSPGaTWQCBxRv7w
	c8kQQUBf1qjE3D7+C5r9CrlzVy1i4ZYSz/FJkuhX9BYZb/GVxDFegDjvKm70Tb2G
	3pgAZg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a9abmrujf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Fri, 07 Nov 2025 10:05:01 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4ed6a906c52so1532521cf.2
        for <linux-remoteproc@vger.kernel.org>; Fri, 07 Nov 2025 02:05:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762509901; x=1763114701; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=38uukSqtrZbZB+x525VFewPE7UBvS9QwCZXap8mnYiU=;
        b=GczcBXD4sctSgG7Pt4NIvF9hRbZwJ5beeUxOadhvOkqVDCb33Eqm0mGVBHOMek1Izm
         b2XLUl3C4Rcowf+hujuL9RmvQuy5mXo0KmnHRafiwiSCEJjkfFMXWxesl9QFqj6wWMiv
         yVkAfgwBD2CJwGaFKAsBH9Xs4v6Ll2ldJKDPtO0GKBYWA2K3QwuR/M2nXX3XJScQD+l7
         4RxJys3IAR7BCg2cYx5UITWWdRzcqYO/wUuVd01pzHZKTN4/XW5ssOSvHf9X6Ju2cDCF
         bU8HSQ7eNW2JNGUm2AmnP3vj5+B+9TCvBhwSQySfXKwe8MYAnpoQ0ATjt/b/GgeQhV0Y
         z3rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762509901; x=1763114701;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=38uukSqtrZbZB+x525VFewPE7UBvS9QwCZXap8mnYiU=;
        b=Yo1ynwnMX0G5B682EQn9fU1T0DaqXARjiQ/MdWixe0/cstNHHTdWH1zM3Q8iFZD66o
         FYPJ6mUlyGb6/R+8B4QeiZTQxaRExfyLsK6F/Hip9VJldH6YcL/RoQTJqmCO6OQ0NCEW
         3PnrAsRubA/1+rAZ3g1eTvudPbmZl4Ok+nCfoA8Xa7gCOl1Lz0itoeXS+pgkc1OXE76D
         8zJq9kBl3siSFVDWySdjN1VA3BfvH+VO8j/Uq0Q0Ntxj0b8rvhzmWgw+kELunJHGNdFK
         H0PdCMw8eW0YJXhsr9vwQTystFnMVjC6UKnwilSpqSVevudZybKzuaNbTlM5I7gJSZKg
         5/Rg==
X-Forwarded-Encrypted: i=1; AJvYcCVqbAJaeLoyZfgCe5wPMzY2e0o1N+rh3MTAVfIVe3vVYXT0eZ67UkYfsYCIuXOh1zWr+CFxpj4qmYzNL1rUPKKJ@vger.kernel.org
X-Gm-Message-State: AOJu0YxhHlerA4k1D953gGxj2Ae24Y+haRKlhI7EABfX6mSpx/Ok1Fe5
	jJb76SheckDFYMFYlTzZdEYDmCk1dX6smclEfh6pmd5+rdNLySMJYkm9V9OqnIkKhEAnT8s2qGF
	cmIxRmyapYm3OfuH/P1kWZFFKPRTpLpNvalPhFpstq7UxQQjmr7gs2fox9srg+NxdJmudAxlT
X-Gm-Gg: ASbGncu9lvmOFdnSG2ScBGJizVMwnX9LyAb9FN9bzcEjl7j1m7Do7dvolEvLxETI+WM
	9wgf5T0Ke6Y+v2JahL+LxWMkI+CFuqrEzdI4K83kvMqNw3Eugng4JmTc9picXZlT4yqSkMu6M1n
	/Jfmb9JRe78SOVxtItYlA64GwJCKYc7cBnihUB1FwwjR8ARpL469DQBu0vxvINSzELFYNCDxWtP
	R1Daooh0N+86u9LKi7pUpGVZFmFA3ikbxKB83xm2+YAPTWna4D1t3xaK9La6WBkSiv8Eo4wvSCP
	ewD+mQUanQdSpqu0xjhC3bXotKzk5nbWOyk9g1gT/gltScsb2SJajT9ujC9vb74am5+zJZZiExR
	Mts8zEpYVwKX5PYgq45yzT2eRk/VI30rzxuh6VniOWPuiAowjbklkaTtg
X-Received: by 2002:ac8:5ace:0:b0:4ec:eef1:52f7 with SMTP id d75a77b69052e-4ed94a59fd9mr18685631cf.11.1762509900758;
        Fri, 07 Nov 2025 02:05:00 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFlvb40HwfJq9SwOccSWwNZaSEGTSrcZ5r3eBdB9GGqjvFsf4uLiSdPwNbh+m3v/j1axxuAnw==
X-Received: by 2002:ac8:5ace:0:b0:4ec:eef1:52f7 with SMTP id d75a77b69052e-4ed94a59fd9mr18685481cf.11.1762509900324;
        Fri, 07 Nov 2025 02:05:00 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b72bf9be184sm199260766b.56.2025.11.07.02.04.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Nov 2025 02:04:59 -0800 (PST)
Message-ID: <17c9c47f-22f5-42c4-81ce-a5fae9bfff37@oss.qualcomm.com>
Date: Fri, 7 Nov 2025 11:04:56 +0100
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 05/14] remoteproc: pas: Replace metadata context with
 PAS context structure
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20251104-kvm_rproc_v6-v6-0-7017b0adc24e@oss.qualcomm.com>
 <20251104-kvm_rproc_v6-v6-5-7017b0adc24e@oss.qualcomm.com>
 <fc8beead-566d-463b-aebe-407429adf156@oss.qualcomm.com>
 <20251105064252.qxqkno4xqwfrhmlf@hu-mojha-hyd.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251105064252.qxqkno4xqwfrhmlf@hu-mojha-hyd.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: PDwJnIHTwmaNf0S3yEgCHmug2AbQWzBZ
X-Proofpoint-ORIG-GUID: PDwJnIHTwmaNf0S3yEgCHmug2AbQWzBZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA3MDA4MCBTYWx0ZWRfX3xpXPvc8aazK
 RyWGQdWxyT9lkSKx52PnLvwXQ9PN2jQYyh5zRiwpbObiiR3p+hNe+7ffN+3WyjkqB6mJHj1xGhO
 RwjI2Nz9mrciVqLPqjcAzTpc59xMAveb7/1lFk5eZqs3+97GJBULIRRvBu1OGgybfw236cxScUu
 WkGC+ySqkFHrDEAPMA3pQ7E/aZaSulvrnyJq9ucPKhWtdbE3Gem/jrsVN8YrlrGJLiTEPPiWI8c
 gCiOCh0T81Ko4jPNdItL+TLxzIuezXyDkwpm+3cDPYc8Y8YvnH7KkphFaf/+r4HsP19xT00f3Sk
 YotoYHDQLJBsNaHVUDX+lPRdNwbycIREi86Y4iPBEBKVHjdE30qjvjNHdGEsbvi8NUhRfwvCMNH
 u+JHrG9qwf8UC8dadWS28Q/XPh5Jmw==
X-Authority-Analysis: v=2.4 cv=HPjO14tv c=1 sm=1 tr=0 ts=690dc44d cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=C1O_lNBdy6xfDsNB084A:9
 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-07_02,2025-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 bulkscore=0 clxscore=1015 malwarescore=0
 suspectscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511070080

On 11/5/25 7:42 AM, Mukesh Ojha wrote:
> On Tue, Nov 04, 2025 at 06:33:49PM +0100, Konrad Dybcio wrote:
>> On 11/4/25 8:35 AM, Mukesh Ojha wrote:
>>> As a superset of the existing metadata context, the PAS context
>>> structure enables both remoteproc and non-remoteproc subsystems to
>>> better support scenarios where the SoC runs with or without the Gunyah
>>> hypervisor. To reflect this, relevant SCM and metadata functions are
>>> updated to incorporate PAS context awareness.
>>>
>>> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
>>> ---
>>>  drivers/firmware/qcom/qcom_scm.c       | 25 +++++++++++++---------
>>>  drivers/remoteproc/qcom_q6v5_pas.c     | 38 ++++++++++++++++++++++++----------
>>>  drivers/soc/qcom/mdt_loader.c          |  4 ++--
>>>  include/linux/firmware/qcom/qcom_scm.h |  4 ++--
>>>  include/linux/soc/qcom/mdt_loader.h    |  6 +++---
>>>  5 files changed, 49 insertions(+), 28 deletions(-)
>>>
>>> diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
>>> index 5a525dbd0a2e..9cdd152da592 100644
>>> --- a/drivers/firmware/qcom/qcom_scm.c
>>> +++ b/drivers/firmware/qcom/qcom_scm.c
>>> @@ -603,7 +603,7 @@ EXPORT_SYMBOL_GPL(devm_qcom_scm_pas_context_init);
>>>   *		and optional blob of data used for authenticating the metadata
>>>   *		and the rest of the firmware
>>>   * @size:	size of the metadata
>>> - * @ctx:	optional metadata context
>>> + * @ctx:	optional pas context
>>>   *
>>>   * Return: 0 on success.
>>>   *
>>> @@ -612,8 +612,9 @@ EXPORT_SYMBOL_GPL(devm_qcom_scm_pas_context_init);
>>>   * qcom_scm_pas_metadata_release() by the caller.
>>>   */
>>>  int qcom_scm_pas_init_image(u32 pas_id, const void *metadata, size_t size,
>>> -			    struct qcom_scm_pas_metadata *ctx)
>>> +			    struct qcom_scm_pas_context *ctx)
>>>  {
>>> +	struct qcom_scm_pas_metadata *mdt_ctx;
>>
>> This is never initialized
>>
>>>  	dma_addr_t mdata_phys;
>>>  	void *mdata_buf;
>>>  	int ret;
>>> @@ -665,9 +666,10 @@ int qcom_scm_pas_init_image(u32 pas_id, const void *metadata, size_t size,
>>>  	if (ret < 0 || !ctx) {
>>>  		dma_free_coherent(__scm->dev, size, mdata_buf, mdata_phys);
>>>  	} else if (ctx) {
>>> -		ctx->ptr = mdata_buf;
>>> -		ctx->phys = mdata_phys;
>>> -		ctx->size = size;
>>> +		mdt_ctx = ctx->metadata;
>>> +		mdt_ctx->ptr = mdata_buf;
>>> +		mdt_ctx->phys = mdata_phys;
>>> +		mdt_ctx->size = size;
>>
>> So this will always cause stack corruption
>>
>>>  	}
>>>  
>>>  	return ret ? : res.result[0];
>>> @@ -676,16 +678,19 @@ EXPORT_SYMBOL_GPL(qcom_scm_pas_init_image);
>>>  
>>>  /**
>>>   * qcom_scm_pas_metadata_release() - release metadata context
>>> - * @ctx:	metadata context
>>> + * @ctx:	pas context
>>>   */
>>> -void qcom_scm_pas_metadata_release(struct qcom_scm_pas_metadata *ctx)
>>> +void qcom_scm_pas_metadata_release(struct qcom_scm_pas_context *ctx)
>>>  {
>>> -	if (!ctx->ptr)
>>> +	struct qcom_scm_pas_metadata *mdt_ctx;
>>
>> Is the existence of this struct any useful after you introduced
>> pas_context?
> 
> Yes, it is still useful, mdt_ctx is only relevant for remoteproc based
> subsystem like adsp, cdsp, modem while they are not required for video,
> ipa, gpu etc. but the superset which is pas_context is needed by
> whosoever need to support secure PAS method Linux at EL2.

$ b4 shazam 20251104-kvm_rproc_v6-v6-0-7017b0adc24e@oss.qualcomm.com
$ rg 'struct qcom_scm_pas_metadata'

include/linux/firmware/qcom/qcom_scm.h
69:struct qcom_scm_pas_metadata {
80:     struct qcom_scm_pas_metadata *metadata;

drivers/firmware/qcom/qcom_scm.c
636:    struct qcom_scm_pas_metadata *mdt_ctx;
680:    struct qcom_scm_pas_metadata *mdt_ctx;
728:    struct qcom_scm_pas_metadata *mdt_ctx;

So really it seems like it always exists as part of the pas_context..
should we just make the larger struct integrate the smaller one and drop
the unnecessary layer?

TBF I don't really insist on this, but it surely looks a little odd

Konrad
