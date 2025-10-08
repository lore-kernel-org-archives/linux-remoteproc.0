Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E416D2F360C
	for <linux-remoteproc@vger.kernel.org>; Wed,  8 Oct 2025 07:37:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759909072; cv=none; b=VadoqjACptnUp74BYEFF8ypGDYeHaXUhN1R8M8qmCFPGemAFCTkJsFCv4BwEacJv36mscFk/EVnAMWth8Mcewj/UFzZgxc4Z74hcoSRI6UDfagBLkgCzwbqyYmW9Kuj14Dn85fvxAEsQRIczRTvECZvs6I/RpZF2KyehwZdqiqw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759909072; c=relaxed/simple;
	bh=UmJmAReAY/jF3ItLrlKSZT7z9wMkPQICrwk+v4kExEs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=A1SvyXr6UU1ACez5iKcI0c/aBscrcydIn/DKReVPXFNvDJXNztBn7bBxCQyl1YILGJ7horjxPXar/gBl/fI9uLc2NXiyZp3rAfqt7yS5Hq7LgJevBk7c253XmrKISXfnCbSTDqHAsqJFhodj7JxLubNxGvVoYBTzkGssfJsz1Us=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FZjW4lyQ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FZjW4lyQ"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5987aTgC002776
	for <linux-remoteproc@vger.kernel.org>; Wed, 8 Oct 2025 07:37:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nEeCmEmfnHwSIvF0jtyqfFMfczTk2xlyvYDbM9SaDUM=; b=FZjW4lyQyTNCldwN
	VAglafu1CqtEEpiVsxL7rYC6rL2jK2DTqS8+j+vDrhF1mRq8/metv5pJuSuwbWP+
	kNzKUOTXD4cbRsU9bnJ8Ov1XKRLqY+Mg3ni24SWcqUmZ/QRSN2+HweEJb4EioEk/
	t2ULzfrhDFeStXn9bzmqMLG7gDcPJlGK8XAeoG0BonpSfoEzV73i5mdv3vR9SrEG
	9BzRdNBkVyqDorDDC6iWRd2YGZwHokPg41Lok6MOty49r7BEc/rAEDzqxTwhGd/q
	AjWK/4NqthCZYOWMLtkI7js/c4CE/mqIufiXLGeF/gKMcl+tAh+WwuUtk5hvS7Ap
	1uwXqw==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49juy71p7e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Wed, 08 Oct 2025 07:37:47 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-b552f91033cso8516724a12.1
        for <linux-remoteproc@vger.kernel.org>; Wed, 08 Oct 2025 00:37:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759909066; x=1760513866;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nEeCmEmfnHwSIvF0jtyqfFMfczTk2xlyvYDbM9SaDUM=;
        b=j/3/TkLfiue9wtwZh3J0Ola8NSyGDx8h9neOK5sxKj3OWbe00KAsmrbnrQZXz2AIA3
         uNuQdUVnfhi8kFDOSy5Xjp1mXihorfCxbd5iJHPnPuyahK73YeemqSw0IeLc6NxtMQRC
         ly86h1eaCClDo5zgdeU/IJxjg9xRRUQ34iIW6ZjqfVEgWf/JqQk1Q46lARWJ8WTv6jk+
         0B9/+LtCr2SGgCBkAWB4aUbHDM2RNAg2Dp1ZcAVTrWXIovIIDBOVopsi04RLawT1hzdT
         SObnp3bBjGi77N0b3Td3ppHskFHfEvnbQD0Ku5G/+D8jCbuhnNejMCzOQGOZ6YxkO19W
         sTwA==
X-Forwarded-Encrypted: i=1; AJvYcCWAADQEhWn79V5BzPWduhzlZKpxxF3Q/LTwmRep8jRGs2cfGgHn+KASP8oh1IJe93ZAl30KFWRguA/jO/rUVVPL@vger.kernel.org
X-Gm-Message-State: AOJu0YzeSbObRaADAyqdVdz7hSIN+hX4kZnU0vxHrwVH0Rgcp9ydiZ5W
	NrcQjPMG0LhBrEXC/wFV3vZAt81PjYBz4Df7YIvNnT7fPORuWTW9kgZSq0XcCMIMFXHlPpguxEO
	rruhv91jLvl0zQIF0UBhkNTgtZSb/0ZipB8L2wNq+Mx49TigLIHA9lzWFjS3/RyXY2LDwSnpk
X-Gm-Gg: ASbGncu3n20P2zzBPjrf8jLSRoKlRdyuNMeEl02hsy7hrX6OcFUucOplw5UgIxpde+Q
	FDCxnFb4T6mHv2x6N2ermjKoxJOaM1jpFAF57suirUBKYe6Qpo0uQw/Sgo1SIf5H/c7mYdVqzsM
	pszCav9Cn69wAqCJKfdItxcQYhIGM3bJhrbo/miFgcL0agIMAg9uV7mDU7OXGL82kei4OGINcO4
	CMLszNYE57ZDLbefBjq76ZPBesTu0gGQP0Tsx/Q4bBqqdNu+tVg8a0kRj1xRna9GaqmNgdBLE30
	NQq8Dfh5kY+iaT+0LB3hXUgBC+kDbfwyt7R3G3koD0FsdDXcQZeuyRuxNLf9kWjlOijgDJL1
X-Received: by 2002:a17:903:1a23:b0:271:479d:3de3 with SMTP id d9443c01a7336-290272152eamr35569495ad.12.1759909065880;
        Wed, 08 Oct 2025 00:37:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHtOQphOowBe6Hg/t0ShWeX70LzlCSScSpdIGal/lhehLMwq+1q9QA9k7hG2OyyZPdbNLzMiw==
X-Received: by 2002:a17:903:1a23:b0:271:479d:3de3 with SMTP id d9443c01a7336-290272152eamr35569135ad.12.1759909065205;
        Wed, 08 Oct 2025 00:37:45 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-28e8d11080csm189262545ad.1.2025.10.08.00.37.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Oct 2025 00:37:44 -0700 (PDT)
Date: Wed, 8 Oct 2025 13:07:38 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 05/12] remoteproc: pas: Replace metadata context with
 PAS context structure
Message-ID: <20251008073738.prbgdvcwsvgn2db2@hu-mojha-hyd.qualcomm.com>
References: <20251007-kvm_rprocv4_next-20251007-v4-0-de841623af3c@oss.qualcomm.com>
 <20251007-kvm_rprocv4_next-20251007-v4-5-de841623af3c@oss.qualcomm.com>
 <kws3pzpygv3i4fzusnw6nbgw7lrr74hhg43h77232s7s7otgvu@lem5qdzarl6r>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <kws3pzpygv3i4fzusnw6nbgw7lrr74hhg43h77232s7s7otgvu@lem5qdzarl6r>
X-Authority-Analysis: v=2.4 cv=IrITsb/g c=1 sm=1 tr=0 ts=68e614cb cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=EUspDBNiAAAA:8 a=ITxB3YW7ubr_P7K2B3gA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-GUID: 7OwOEGepHpVQ3x3OFUw2tzl4-Bh_bfU8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA0MDAyOSBTYWx0ZWRfX1kLPvGCnK/Po
 hn/o+/aQ4ALZzcIHBXVUQ5EXzzuzJ3bJzufc2ZO3KNboEbMwplqdmZB7RTC8fJiERBpF7s8Qgao
 Ji+UoyAc4VpeGpA9j6a9Bf5+1peWsnCM1bGNC5+c9UR58q9T2DRKEuq1kEmFkJqzdhj6/bObowA
 aC6r/FxFnLSzr9wEscq+WQXDTfulVAfsx35iY2xhF0/QFF9rjnBfhBboaUHRBjiZD8G1m7v5kz5
 5aq6oHsHX6uVIi9+0JYEScdvPCkDhKtRCDH2wTi2np97tNz0ghJJFM3s11AMRc6A4DPivkwFtaf
 iKarWfnDDE6jHiBEsZyWitA/bneRjJ0Qg2cWP+VUOi7lllIblnl9SpILItLEdMu5MPFqiSKAa5e
 e1ilJ4MDzgpdMYQi4CmsWkgc5Zf3Iw==
X-Proofpoint-ORIG-GUID: 7OwOEGepHpVQ3x3OFUw2tzl4-Bh_bfU8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-08_01,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 bulkscore=0 clxscore=1015 malwarescore=0
 spamscore=0 phishscore=0 impostorscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2510040029

On Tue, Oct 07, 2025 at 02:34:29PM -0700, Manivannan Sadhasivam wrote:
> On Tue, Oct 07, 2025 at 10:18:50PM +0530, Mukesh Ojha wrote:
> > As a superset of the existing metadata context, the PAS context
> > structure enables both remoteproc and non-remoteproc subsystems to
> > better support scenarios where the SoC runs with or without the Gunyah
> > hypervisor. To reflect this, relevant SMC and metadata functions are
> 
> SCM?

Yes, it should be SCM to be precise.

> 
> - Mani
> 
> > updated to incorporate PAS context awareness.
> > 
> > Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> > ---
> >  drivers/firmware/qcom/qcom_scm.c       | 32 +++++++++--------
> >  drivers/remoteproc/qcom_q6v5_pas.c     | 66 +++++++++++++++++++---------------
> >  drivers/soc/qcom/mdt_loader.c          |  7 ++--
> >  include/linux/firmware/qcom/qcom_scm.h |  4 +--
> >  include/linux/soc/qcom/mdt_loader.h    |  5 ++-
> >  5 files changed, 62 insertions(+), 52 deletions(-)
> > 
> > diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
> > index b8ce4fc34dbe..7b4ff3cb26ed 100644
> > --- a/drivers/firmware/qcom/qcom_scm.c
> > +++ b/drivers/firmware/qcom/qcom_scm.c
> > @@ -621,7 +621,7 @@ EXPORT_SYMBOL_GPL(qcom_scm_pas_context_destroy);
> >   *		and optional blob of data used for authenticating the metadata
> >   *		and the rest of the firmware
> >   * @size:	size of the metadata
> > - * @ctx:	optional metadata context
> > + * @ctx:	optional pas context
> >   *
> >   * Return: 0 on success.
> >   *
> > @@ -630,8 +630,9 @@ EXPORT_SYMBOL_GPL(qcom_scm_pas_context_destroy);
> >   * qcom_scm_pas_metadata_release() by the caller.
> >   */
> >  int qcom_scm_pas_init_image(u32 pas_id, const void *metadata, size_t size,
> > -			    struct qcom_scm_pas_metadata *ctx)
> > +			    struct qcom_scm_pas_context *ctx)
> >  {
> > +	struct qcom_scm_pas_metadata *mdt_ctx;
> >  	dma_addr_t mdata_phys;
> >  	void *mdata_buf;
> >  	int ret;
> > @@ -682,10 +683,11 @@ int qcom_scm_pas_init_image(u32 pas_id, const void *metadata, size_t size,
> >  out:
> >  	if (ret < 0 || !ctx) {
> >  		dma_free_coherent(__scm->dev, size, mdata_buf, mdata_phys);
> > -	} else if (ctx) {
> > -		ctx->ptr = mdata_buf;
> > -		ctx->phys = mdata_phys;
> > -		ctx->size = size;
> > +	} else if (ctx && ctx->metadata) {
> > +		mdt_ctx = ctx->metadata;
> > +		mdt_ctx->ptr = mdata_buf;
> > +		mdt_ctx->phys = mdata_phys;
> > +		mdt_ctx->size = size;
> >  	}
> >  
> >  	return ret ? : res.result[0];
> > @@ -694,18 +696,20 @@ EXPORT_SYMBOL_GPL(qcom_scm_pas_init_image);
> >  
> >  /**
> >   * qcom_scm_pas_metadata_release() - release metadata context
> > - * @ctx:	metadata context
> > + * @ctx:	pas context
> >   */
> > -void qcom_scm_pas_metadata_release(struct qcom_scm_pas_metadata *ctx)
> > +void qcom_scm_pas_metadata_release(struct qcom_scm_pas_context *ctx)
> >  {
> > -	if (!ctx->ptr)
> > -		return;
> > +	struct qcom_scm_pas_metadata *mdt_ctx;
> >  
> > -	dma_free_coherent(__scm->dev, ctx->size, ctx->ptr, ctx->phys);
> > +	mdt_ctx = ctx->metadata;
> > +	if (!mdt_ctx->ptr)
> > +		return;
> >  
> > -	ctx->ptr = NULL;
> > -	ctx->phys = 0;
> > -	ctx->size = 0;
> > +	dma_free_coherent(__scm->dev, mdt_ctx->size, mdt_ctx->ptr, mdt_ctx->phys);
> > +	mdt_ctx->ptr = NULL;
> > +	mdt_ctx->phys = 0;
> > +	mdt_ctx->size = 0;
> >  }
> >  EXPORT_SYMBOL_GPL(qcom_scm_pas_metadata_release);
> >  
> > diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
> > index 158bcd6cc85c..46a23fdefd48 100644
> > --- a/drivers/remoteproc/qcom_q6v5_pas.c
> > +++ b/drivers/remoteproc/qcom_q6v5_pas.c
> > @@ -117,8 +117,8 @@ struct qcom_pas {
> >  	struct qcom_rproc_ssr ssr_subdev;
> >  	struct qcom_sysmon *sysmon;
> >  
> > -	struct qcom_scm_pas_metadata pas_metadata;
> > -	struct qcom_scm_pas_metadata dtb_pas_metadata;
> > +	struct qcom_scm_pas_context *pas_ctx;
> > +	struct qcom_scm_pas_context *dtb_pas_ctx;
> >  };
> >  
> >  static void qcom_pas_segment_dump(struct rproc *rproc,
> > @@ -211,9 +211,9 @@ static int qcom_pas_unprepare(struct rproc *rproc)
> >  	 * auth_and_reset() was successful, but in other cases clean it up
> >  	 * here.
> >  	 */
> > -	qcom_scm_pas_metadata_release(&pas->pas_metadata);
> > +	qcom_scm_pas_metadata_release(pas->pas_ctx);
> >  	if (pas->dtb_pas_id)
> > -		qcom_scm_pas_metadata_release(&pas->dtb_pas_metadata);
> > +		qcom_scm_pas_metadata_release(pas->dtb_pas_ctx);
> >  
> >  	return 0;
> >  }
> > @@ -239,15 +239,8 @@ static int qcom_pas_load(struct rproc *rproc, const struct firmware *fw)
> >  			return ret;
> >  		}
> >  
> > -		ret = qcom_mdt_pas_init(pas->dev, pas->dtb_firmware, pas->dtb_firmware_name,
> > -					pas->dtb_pas_id, pas->dtb_mem_phys,
> > -					&pas->dtb_pas_metadata);
> > -		if (ret)
> > -			goto release_dtb_firmware;
> > -
> > -		ret = qcom_mdt_load_no_init(pas->dev, pas->dtb_firmware, pas->dtb_firmware_name,
> > -					    pas->dtb_mem_region, pas->dtb_mem_phys,
> > -					    pas->dtb_mem_size, &pas->dtb_mem_reloc);
> > +		ret = qcom_mdt_pas_load(pas->dtb_pas_ctx, pas->dtb_firmware, pas->dtb_firmware_name,
> > +					pas->dtb_mem_region, &pas->dtb_mem_reloc);
> >  		if (ret)
> >  			goto release_dtb_metadata;
> >  	}
> > @@ -255,9 +248,7 @@ static int qcom_pas_load(struct rproc *rproc, const struct firmware *fw)
> >  	return 0;
> >  
> >  release_dtb_metadata:
> > -	qcom_scm_pas_metadata_release(&pas->dtb_pas_metadata);
> > -
> > -release_dtb_firmware:
> > +	qcom_scm_pas_metadata_release(pas->dtb_pas_ctx);
> >  	release_firmware(pas->dtb_firmware);
> >  
> >  	return ret;
> > @@ -305,14 +296,8 @@ static int qcom_pas_start(struct rproc *rproc)
> >  		}
> >  	}
> >  
> > -	ret = qcom_mdt_pas_init(pas->dev, pas->firmware, rproc->firmware, pas->pas_id,
> > -				pas->mem_phys, &pas->pas_metadata);
> > -	if (ret)
> > -		goto disable_px_supply;
> > -
> > -	ret = qcom_mdt_load_no_init(pas->dev, pas->firmware, rproc->firmware,
> > -				    pas->mem_region, pas->mem_phys, pas->mem_size,
> > -				    &pas->mem_reloc);
> > +	ret = qcom_mdt_pas_load(pas->pas_ctx, pas->firmware, rproc->firmware,
> > +				pas->mem_region, &pas->dtb_mem_reloc);
> >  	if (ret)
> >  		goto release_pas_metadata;
> >  
> > @@ -332,9 +317,9 @@ static int qcom_pas_start(struct rproc *rproc)
> >  		goto release_pas_metadata;
> >  	}
> >  
> > -	qcom_scm_pas_metadata_release(&pas->pas_metadata);
> > +	qcom_scm_pas_metadata_release(pas->pas_ctx);
> >  	if (pas->dtb_pas_id)
> > -		qcom_scm_pas_metadata_release(&pas->dtb_pas_metadata);
> > +		qcom_scm_pas_metadata_release(pas->dtb_pas_ctx);
> >  
> >  	/* firmware is used to pass reference from qcom_pas_start(), drop it now */
> >  	pas->firmware = NULL;
> > @@ -342,9 +327,9 @@ static int qcom_pas_start(struct rproc *rproc)
> >  	return 0;
> >  
> >  release_pas_metadata:
> > -	qcom_scm_pas_metadata_release(&pas->pas_metadata);
> > +	qcom_scm_pas_metadata_release(pas->pas_ctx);
> >  	if (pas->dtb_pas_id)
> > -		qcom_scm_pas_metadata_release(&pas->dtb_pas_metadata);
> > +		qcom_scm_pas_metadata_release(pas->dtb_pas_ctx);
> >  disable_px_supply:
> >  	if (pas->px_supply)
> >  		regulator_disable(pas->px_supply);
> > @@ -779,12 +764,33 @@ static int qcom_pas_probe(struct platform_device *pdev)
> >  	}
> >  
> >  	qcom_add_ssr_subdev(rproc, &pas->ssr_subdev, desc->ssr_name);
> > +
> > +	pas->pas_ctx = qcom_scm_pas_context_init(pas->dev, pas->pas_id, pas->mem_phys,
> > +						 pas->mem_size);
> > +	if (IS_ERR(pas->pas_ctx)) {
> > +		ret = PTR_ERR(pas->pas_ctx);
> > +		goto remove_ssr_sysmon;
> > +	}
> > +
> > +	pas->dtb_pas_ctx = qcom_scm_pas_context_init(pas->dev, pas->dtb_pas_id,
> > +						     pas->dtb_mem_phys, pas->dtb_mem_size);
> > +	if (IS_ERR(pas->dtb_pas_ctx)) {
> > +		ret = PTR_ERR(pas->dtb_pas_ctx);
> > +		goto destroy_pas_ctx;
> > +	}
> > +
> >  	ret = rproc_add(rproc);
> >  	if (ret)
> > -		goto remove_ssr_sysmon;
> > +		goto destroy_dtb_pas_ctx;
> >  
> >  	return 0;
> >  
> > +destroy_dtb_pas_ctx:
> > +	qcom_scm_pas_context_destroy(pas->dtb_pas_ctx);
> > +
> > +destroy_pas_ctx:
> > +	qcom_scm_pas_context_destroy(pas->pas_ctx);
> > +
> >  remove_ssr_sysmon:
> >  	qcom_remove_ssr_subdev(rproc, &pas->ssr_subdev);
> >  	qcom_remove_sysmon_subdev(pas->sysmon);
> > @@ -807,6 +813,8 @@ static void qcom_pas_remove(struct platform_device *pdev)
> >  {
> >  	struct qcom_pas *pas = platform_get_drvdata(pdev);
> >  
> > +	qcom_scm_pas_context_destroy(pas->dtb_pas_ctx);
> > +	qcom_scm_pas_context_destroy(pas->pas_ctx);
> >  	rproc_del(pas->rproc);
> >  
> >  	qcom_q6v5_deinit(&pas->q6v5);
> > diff --git a/drivers/soc/qcom/mdt_loader.c b/drivers/soc/qcom/mdt_loader.c
> > index 31855836b251..105a44f42ba7 100644
> > --- a/drivers/soc/qcom/mdt_loader.c
> > +++ b/drivers/soc/qcom/mdt_loader.c
> > @@ -234,13 +234,13 @@ EXPORT_SYMBOL_GPL(qcom_mdt_read_metadata);
> >   * @fw_name:	name of the firmware, for construction of segment file names
> >   * @pas_id:	PAS identifier
> >   * @mem_phys:	physical address of allocated memory region
> > - * @ctx:	PAS metadata context, to be released by caller
> > + * @ctx:	PAS context, ctx->metadata to be released by caller
> >   *
> >   * Returns 0 on success, negative errno otherwise.
> >   */
> >  int qcom_mdt_pas_init(struct device *dev, const struct firmware *fw,
> >  		      const char *fw_name, int pas_id, phys_addr_t mem_phys,
> > -		      struct qcom_scm_pas_metadata *ctx)
> > +		      struct qcom_scm_pas_context *ctx)
> >  {
> >  	const struct elf32_phdr *phdrs;
> >  	const struct elf32_phdr *phdr;
> > @@ -505,8 +505,7 @@ int qcom_mdt_pas_load(struct qcom_scm_pas_context *ctx, const struct firmware *f
> >  {
> >  	int ret;
> >  
> > -	ret = qcom_mdt_pas_init(ctx->dev, fw, firmware, ctx->pas_id, ctx->mem_phys,
> > -				ctx->metadata);
> > +	ret = qcom_mdt_pas_init(ctx->dev, fw, firmware, ctx->pas_id, ctx->mem_phys, ctx);
> >  	if (ret)
> >  		return ret;
> >  
> > diff --git a/include/linux/firmware/qcom/qcom_scm.h b/include/linux/firmware/qcom/qcom_scm.h
> > index e82fdc200df7..af6ab837ad5a 100644
> > --- a/include/linux/firmware/qcom/qcom_scm.h
> > +++ b/include/linux/firmware/qcom/qcom_scm.h
> > @@ -84,8 +84,8 @@ void *qcom_scm_pas_context_init(struct device *dev, u32 pas_id, phys_addr_t mem_
> >  				size_t mem_size);
> >  void qcom_scm_pas_context_destroy(struct qcom_scm_pas_context *ctx);
> >  int qcom_scm_pas_init_image(u32 pas_id, const void *metadata, size_t size,
> > -			    struct qcom_scm_pas_metadata *ctx);
> > -void qcom_scm_pas_metadata_release(struct qcom_scm_pas_metadata *ctx);
> > +			    struct qcom_scm_pas_context *ctx);
> > +void qcom_scm_pas_metadata_release(struct qcom_scm_pas_context *ctx);
> >  int qcom_scm_pas_mem_setup(u32 pas_id, phys_addr_t addr, phys_addr_t size);
> >  int qcom_scm_pas_auth_and_reset(u32 pas_id);
> >  int qcom_scm_pas_shutdown(u32 pas_id);
> > diff --git a/include/linux/soc/qcom/mdt_loader.h b/include/linux/soc/qcom/mdt_loader.h
> > index 2832e0717729..7d57746fbbfa 100644
> > --- a/include/linux/soc/qcom/mdt_loader.h
> > +++ b/include/linux/soc/qcom/mdt_loader.h
> > @@ -10,7 +10,6 @@
> >  
> >  struct device;
> >  struct firmware;
> > -struct qcom_scm_pas_metadata;
> >  struct qcom_scm_pas_context;
> >  
> >  #if IS_ENABLED(CONFIG_QCOM_MDT_LOADER)
> > @@ -18,7 +17,7 @@ struct qcom_scm_pas_context;
> >  ssize_t qcom_mdt_get_size(const struct firmware *fw);
> >  int qcom_mdt_pas_init(struct device *dev, const struct firmware *fw,
> >  		      const char *fw_name, int pas_id, phys_addr_t mem_phys,
> > -		      struct qcom_scm_pas_metadata *pas_metadata_ctx);
> > +		      struct qcom_scm_pas_context *pas_ctx);
> >  int qcom_mdt_load(struct device *dev, const struct firmware *fw,
> >  		  const char *fw_name, int pas_id, void *mem_region,
> >  		  phys_addr_t mem_phys, size_t mem_size,
> > @@ -43,7 +42,7 @@ static inline ssize_t qcom_mdt_get_size(const struct firmware *fw)
> >  
> >  static inline int qcom_mdt_pas_init(struct device *dev, const struct firmware *fw,
> >  				    const char *fw_name, int pas_id, phys_addr_t mem_phys,
> > -				    struct qcom_scm_pas_metadata *pas_metadata_ctx)
> > +				    struct qcom_scm_pas_context *pas_ctx)
> >  {
> >  	return -ENODEV;
> >  }
> > 
> > -- 
> > 2.50.1
> > 
> 
> -- 
> மணிவண்ணன் சதாசிவம்

-- 
-Mukesh Ojha
