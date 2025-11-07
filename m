Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1FFD320CD5
	for <linux-remoteproc@vger.kernel.org>; Fri,  7 Nov 2025 11:26:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762514772; cv=none; b=vCJ+zMsc6j/d4wMSogkVhVRZbFcIQaCJ/URf/ZM87gRDi3+m1FSiRg3hCAhH0quvaXD5K3UvjXL5aIDzRsCiZPx/Wa6F7P4nuAvqvBStaLMrHeeRjr8VD47/rZ9YaB8z66groxPvyED5HxA9YqM3L65bXIWeI6ndWzwYC9E2s2I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762514772; c=relaxed/simple;
	bh=JPqVbXPJZmklI+pwoH6/8gE2oARGE7ZjeAxr3XDDiX8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=L+T51G78l/f6RuWmNXZtK9Kw7mOZvSI8LWaidQ4G3eu7o+g7yH46sJ0BDN4utQI8pwi/oFRcJ2hXsOG0aO499DYpgtu7UOt+9BTzobJmwJYTS2CZmOe4Ju1hE4+E633k0HmY21lxGX2wrd3jOJBX/c7Lkvh6Uzbr1VmQvdQWSy0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=L7HBQ1E7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UV2l158R; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="L7HBQ1E7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UV2l158R"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A74kfCm584022
	for <linux-remoteproc@vger.kernel.org>; Fri, 7 Nov 2025 11:26:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=d8EvD0d7L0GuiCtT7n4OZQlj
	X2mGlCzD+eatpH4B/GA=; b=L7HBQ1E7B+noRozzAqy7UFAwg9Gjaak9gXDTLNX+
	OiTJZ4UUSHqfJb6U2lO5po8ITV60q0h1bjPvBOg2NZeehwkluK2CfTmdeqaQ+eww
	MbDH6MT3jIRxIHfbOIZXbHAjEt/Kyq8BU2xprfPbBoHuFHzRrDwLmbwxqZNm9mwi
	kDQxlbaim7FCBLPgdQ0dUWJM5msOp0FALodj1wBcrzZkXmKqVyhorqu1Pd8bWAX+
	l4uwBwtwtYhn/VFZM5mt3j4/IvSZ2hXpl+iEWvV095a9x6T5nrcVfBzmpwxg4U+x
	WzU7E57NhPMPdZYW1aJdYXzMzsSt6FRSG6AXay8lgI0wDw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a8yktjvv1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Fri, 07 Nov 2025 11:26:09 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3416dc5754fso1006909a91.1
        for <linux-remoteproc@vger.kernel.org>; Fri, 07 Nov 2025 03:26:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762514769; x=1763119569; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=d8EvD0d7L0GuiCtT7n4OZQljX2mGlCzD+eatpH4B/GA=;
        b=UV2l158RWuKS1bHUDQSrlhk5b/3+MSr7dHUby0Gw0GINfK/H5j/UG0ximtPZOFSyE3
         TWIHveWIscQVcoIo+aSc7PLhYcGrchaVVsIf0n17aZljwwALDtfZrMqLZsbZQLtkpYGk
         rK+LkwjWUNjzWC9OocclpCrDo8A5eJWT5JTdZ2nVBlJrtgD8KV+XHv3aZXjJVnsw7hYm
         f1d9PXOeGLbSKZBeMuXOkRUuBtpmGOmDQOVuJXeUihky38K5IClk/LdbBES86ppXh5lR
         hzqPCtpofTBv0MwC+5QJkKoX7hOtBdZJ699vbStGmD3hfJzdDp1xmXHDNWPDKOh+0gMr
         W57Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762514769; x=1763119569;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=d8EvD0d7L0GuiCtT7n4OZQljX2mGlCzD+eatpH4B/GA=;
        b=vX+gIKJj/DMHnJ7lQI7LGZFWYcAHEYcAn9vMGZP2aaEOiljuAlQcM6CTN4OV0+a7pL
         6CAgmYBcF56Ilj7bw6UKgkHn2oI6yCPTHQrFKE/4Wz+8t6kkv1NRQvEtIQdtAOPL6m4f
         rCn5guCnSmZKfZBtc92Z9pAqPZWdkHQekHxwbppcdTe3Yj3vdDWIPiOCXVxyODby0WtL
         Zmzafz/jzZtdHT0n9tjP3oWdpXzRcW0Vl7VJqazRYHfmeqBDe1yePIoeXAhI8VJq+Zcm
         lbkA3jLJB/Q6nzOzO0PZ1N5YQw4TzwdbvBM5qyujL9z/zVs1VhBZLpOBypUHM954whfm
         ny2A==
X-Forwarded-Encrypted: i=1; AJvYcCXEM92D4D0R31KIj+HLwfRAkNpECtCMRAPTIG4iieC5jUq6JZws88Y8KzPrKjqxBNdIFjlKCVUoB+aPiambHz7P@vger.kernel.org
X-Gm-Message-State: AOJu0YwJl7BtgtZPQL0vUIbBOBf8ZCuwjv2Wuthle2RV3Yc2mfXKOd+i
	UDiZBl3gu15cVfgkbN/Unx/K0zrfcnSWgpmMHwmEq1sAnASv4xGg1QKt+A/Zzt3nMTaqi/dSvMT
	i9Hw2FftmhUTHDyGt/+Wb7uKs+JAqvs2Yvw1yBgzgv+6N0e2uFxQ9u5IRrhZvH5bLwn1rf/iG
X-Gm-Gg: ASbGncvChLLiDSZP/g+1wpGyF+E8qHxlopEWZiYBkbUpQvflw3IoqoeYdYH5wVgAEGo
	RCKLxnIvHCgUsiO4yVU4n6lKONjUk/HanPBC0Oy9un4RBGzbjJmttuGpY5GR3nGfEGWtdCzVOld
	QRBSLrGlIyUv4IcBLky2RjgBpiC6c17YAzu01utC1QwEwV1oYNQHa4TtJCkQdWNGaesuhOOvg+v
	TL6/4nHE3IaN2IY0JCP8HiIPrqQ8k4nSNyWy5ft6mo8RUD07B08089zgglskVIu9kzampJtzo0O
	dXHIM6tub8LeJZus4tjmjlrPGbmKrVAmHmoRN1xKT1xZTabaezfAj9z7A4TU9rQqXB8yWYstSyi
	mwtTXuRA5gpnZb3+QNl/K61Sg/g==
X-Received: by 2002:a17:90b:2dc5:b0:341:2b78:61b8 with SMTP id 98e67ed59e1d1-3434c564120mr2982805a91.20.1762514768748;
        Fri, 07 Nov 2025 03:26:08 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHjsXZ34UdmP7QZ8ylREejNcVjzEFfoEWKYq6zKHuNoYObQ5tQw+7axCXoswV8JW22oUsyu+w==
X-Received: by 2002:a17:90b:2dc5:b0:341:2b78:61b8 with SMTP id 98e67ed59e1d1-3434c564120mr2982767a91.20.1762514768010;
        Fri, 07 Nov 2025 03:26:08 -0800 (PST)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7b0c9ff8538sm2702701b3a.28.2025.11.07.03.26.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Nov 2025 03:26:07 -0800 (PST)
Date: Fri, 7 Nov 2025 16:56:01 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 05/14] remoteproc: pas: Replace metadata context with
 PAS context structure
Message-ID: <20251107112601.hiqtai4gvr76rqsh@hu-mojha-hyd.qualcomm.com>
References: <20251104-kvm_rproc_v6-v6-0-7017b0adc24e@oss.qualcomm.com>
 <20251104-kvm_rproc_v6-v6-5-7017b0adc24e@oss.qualcomm.com>
 <fc8beead-566d-463b-aebe-407429adf156@oss.qualcomm.com>
 <20251105064252.qxqkno4xqwfrhmlf@hu-mojha-hyd.qualcomm.com>
 <17c9c47f-22f5-42c4-81ce-a5fae9bfff37@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <17c9c47f-22f5-42c4-81ce-a5fae9bfff37@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=bOgb4f+Z c=1 sm=1 tr=0 ts=690dd751 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=cJmc9I_l0s9wiupe7YcA:9
 a=CjuIK1q_8ugA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: MNXT7t_U-sMFbE5U2jMFK_5sBKCOLzrz
X-Proofpoint-GUID: MNXT7t_U-sMFbE5U2jMFK_5sBKCOLzrz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA3MDA5MiBTYWx0ZWRfX8zUqEKMpaqax
 FWjb2FjmaZLI9yzOacpmPng5ko0M6b8/2VSZwmmkDRiXL9Pppt41gqA3PSzV+T18+XLL9SToAPG
 xCRGk9ybFkxAlQFMZQS7f3VAPWLiLStbKG5hfzfZsTX4wyOP1RB8v1L8xSTtZFW7whapS7+CJrY
 csKrDYUlgq00lDiuNGva54RAsQbAJWQYGob52vYOg4acUbgJCL0JfBhJWGreKmeKgn12T+vnhUH
 mBaB0lVsTPDMMfqJXStgWWi3NsCytZ1z/aW8bq0WsUA45pZLkVxQN+86Wa5yqx6kV9QCa1ZVniC
 xvmM2Xrld1QhonnCDdARryP3WFa0GvTHhAaMLY5IbZD2deGBNo3Uy4RmiQjYNtl/bU3Iw/P8sok
 F0TzN5r8/1VUfo+hCuDaD20dzlt4xA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-07_02,2025-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 lowpriorityscore=0 spamscore=0 clxscore=1015
 impostorscore=0 malwarescore=0 phishscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511070092

On Fri, Nov 07, 2025 at 11:04:56AM +0100, Konrad Dybcio wrote:
> On 11/5/25 7:42 AM, Mukesh Ojha wrote:
> > On Tue, Nov 04, 2025 at 06:33:49PM +0100, Konrad Dybcio wrote:
> >> On 11/4/25 8:35 AM, Mukesh Ojha wrote:
> >>> As a superset of the existing metadata context, the PAS context
> >>> structure enables both remoteproc and non-remoteproc subsystems to
> >>> better support scenarios where the SoC runs with or without the Gunyah
> >>> hypervisor. To reflect this, relevant SCM and metadata functions are
> >>> updated to incorporate PAS context awareness.
> >>>
> >>> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> >>> ---
> >>>  drivers/firmware/qcom/qcom_scm.c       | 25 +++++++++++++---------
> >>>  drivers/remoteproc/qcom_q6v5_pas.c     | 38 ++++++++++++++++++++++++----------
> >>>  drivers/soc/qcom/mdt_loader.c          |  4 ++--
> >>>  include/linux/firmware/qcom/qcom_scm.h |  4 ++--
> >>>  include/linux/soc/qcom/mdt_loader.h    |  6 +++---
> >>>  5 files changed, 49 insertions(+), 28 deletions(-)
> >>>
> >>> diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
> >>> index 5a525dbd0a2e..9cdd152da592 100644
> >>> --- a/drivers/firmware/qcom/qcom_scm.c
> >>> +++ b/drivers/firmware/qcom/qcom_scm.c
> >>> @@ -603,7 +603,7 @@ EXPORT_SYMBOL_GPL(devm_qcom_scm_pas_context_init);
> >>>   *		and optional blob of data used for authenticating the metadata
> >>>   *		and the rest of the firmware
> >>>   * @size:	size of the metadata
> >>> - * @ctx:	optional metadata context
> >>> + * @ctx:	optional pas context
> >>>   *
> >>>   * Return: 0 on success.
> >>>   *
> >>> @@ -612,8 +612,9 @@ EXPORT_SYMBOL_GPL(devm_qcom_scm_pas_context_init);
> >>>   * qcom_scm_pas_metadata_release() by the caller.
> >>>   */
> >>>  int qcom_scm_pas_init_image(u32 pas_id, const void *metadata, size_t size,
> >>> -			    struct qcom_scm_pas_metadata *ctx)
> >>> +			    struct qcom_scm_pas_context *ctx)
> >>>  {
> >>> +	struct qcom_scm_pas_metadata *mdt_ctx;
> >>
> >> This is never initialized
> >>
> >>>  	dma_addr_t mdata_phys;
> >>>  	void *mdata_buf;
> >>>  	int ret;
> >>> @@ -665,9 +666,10 @@ int qcom_scm_pas_init_image(u32 pas_id, const void *metadata, size_t size,
> >>>  	if (ret < 0 || !ctx) {
> >>>  		dma_free_coherent(__scm->dev, size, mdata_buf, mdata_phys);
> >>>  	} else if (ctx) {
> >>> -		ctx->ptr = mdata_buf;
> >>> -		ctx->phys = mdata_phys;
> >>> -		ctx->size = size;
> >>> +		mdt_ctx = ctx->metadata;
> >>> +		mdt_ctx->ptr = mdata_buf;
> >>> +		mdt_ctx->phys = mdata_phys;
> >>> +		mdt_ctx->size = size;
> >>
> >> So this will always cause stack corruption
> >>
> >>>  	}
> >>>  
> >>>  	return ret ? : res.result[0];
> >>> @@ -676,16 +678,19 @@ EXPORT_SYMBOL_GPL(qcom_scm_pas_init_image);
> >>>  
> >>>  /**
> >>>   * qcom_scm_pas_metadata_release() - release metadata context
> >>> - * @ctx:	metadata context
> >>> + * @ctx:	pas context
> >>>   */
> >>> -void qcom_scm_pas_metadata_release(struct qcom_scm_pas_metadata *ctx)
> >>> +void qcom_scm_pas_metadata_release(struct qcom_scm_pas_context *ctx)
> >>>  {
> >>> -	if (!ctx->ptr)
> >>> +	struct qcom_scm_pas_metadata *mdt_ctx;
> >>
> >> Is the existence of this struct any useful after you introduced
> >> pas_context?
> > 
> > Yes, it is still useful, mdt_ctx is only relevant for remoteproc based
> > subsystem like adsp, cdsp, modem while they are not required for video,
> > ipa, gpu etc. but the superset which is pas_context is needed by
> > whosoever need to support secure PAS method Linux at EL2.
> 
> $ b4 shazam 20251104-kvm_rproc_v6-v6-0-7017b0adc24e@oss.qualcomm.com
> $ rg 'struct qcom_scm_pas_metadata'
> 
> include/linux/firmware/qcom/qcom_scm.h
> 69:struct qcom_scm_pas_metadata {
> 80:     struct qcom_scm_pas_metadata *metadata;
> 
> drivers/firmware/qcom/qcom_scm.c
> 636:    struct qcom_scm_pas_metadata *mdt_ctx;
> 680:    struct qcom_scm_pas_metadata *mdt_ctx;
> 728:    struct qcom_scm_pas_metadata *mdt_ctx;
> 
> So really it seems like it always exists as part of the pas_context..
> should we just make the larger struct integrate the smaller one and drop
> the unnecessary layer?
> 
> TBF I don't really insist on this, but it surely looks a little odd

You are right, we could remove 'struct qcom_scm_pas_metadata' completely
and can add the fields of it to struct qcom_scm_pas_context.

Will do it next spin.

> 
> Konrad

-- 
-Mukesh Ojha
