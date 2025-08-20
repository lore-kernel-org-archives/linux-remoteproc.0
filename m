Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82BE521FF36
	for <linux-remoteproc@vger.kernel.org>; Wed, 20 Aug 2025 06:19:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755670801; cv=none; b=t6bQL8AyfsJ9bWBK4WJgcO8Fl2VoUAet7o0Eyo01YHnEqWRMK1kfcj+NFjdFfVpgLgLnmbP4SYNOkpIMdZRNMTzuFTutu2rIaU1LJa36sHjjNrIYurLvKUmjaV5D58/zMdCP51FAPVJ9405urMRYwLraDG9b1bsvSilIREVSXuI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755670801; c=relaxed/simple;
	bh=Il8EIAg1QfxzNI0BfdWour3oPDvc6yu7jWmA2XyppAk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oR0Lc4zX6YOnZyXiNUEJrhZIhdD9oYKH0Ugp921gLa4TSzR55EM9NCm3fH1785QbcvtjBGjoiP8DoT+GvY0IKRU6d+hrKAAlUYn0iCDNnrJJ8/BypYMQXR+SzumoGu+ArSvDca+7z0gJbAe1dAvW+RPqlF19QsiokCKRv0b269E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ONd+zipw; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ONd+zipw"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57K1oVgB024114
	for <linux-remoteproc@vger.kernel.org>; Wed, 20 Aug 2025 06:19:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=uNKU1Frwft226LHp/hY7w5oY
	RJNUWwbLNrcXicahC3A=; b=ONd+zipwKnNSwK9V/LODsmfaSYK6HjIXDMRmFrPI
	UCd6REa4r+K3y1w6XzKWpuun5Pxw+ghmWONHsRtHXVOCEOOlEhey/U2X6YF2YU3g
	LvsXo+KwnsiHz23ZIp87JZRTD4tHxucNssPuPH48JPl0RiPrSC7YMvACxvwOr6nD
	j24uTmbb+FFwr6Z9aisfZO5K4vGZ4VFFxmJpGXUoE5LBZoHRGCLQLl95/pIiSMZS
	QoB98yj+6Huy3BvE62fBcUuZJ61gn1rxPUwhcTIWU+LXNmQ05yw7yZ6YIB+dGae7
	0Y+AtoAvUcaYSQQfug6ZnbtW1932hHxAdrLGiFJScaoWxA==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48n5290mah-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Wed, 20 Aug 2025 06:19:58 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-76e2ead3b51so11365392b3a.2
        for <linux-remoteproc@vger.kernel.org>; Tue, 19 Aug 2025 23:19:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755670798; x=1756275598;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uNKU1Frwft226LHp/hY7w5oYRJNUWwbLNrcXicahC3A=;
        b=ce0Gc73YjnJjqQwhjZ59ZS/xMw6Bkm6BxRSn4QAQwAt7wHjJKl6FvryxKQApQ1eUas
         caxwH7QZjKUkT6Hoct6a+xzSCRQbLYyN8szlWw4BvbhlOokyPnTC00RPbJup/h3KHO8y
         a/kdcf0yS8aGQ+LjVQAIiIwmX6dEN3An/xklBJ6K3KN0Z3M9T83Rk+MjwwiEReh8O5bD
         jH5R4hOuF7ufprxGgBlViuXONzxMZac3RgC4N/9yUT9EZd0z+836kBd2mxTOYgGEg//r
         j6Hz6sajXLbwzpLXeXNsmxlLQvxemKvLsjUKPU07HIH1B8bu6zG/bqIfNzb0mPXOK6ZV
         dMhg==
X-Forwarded-Encrypted: i=1; AJvYcCXnt5W/gdatev0oe8V5Ld/19+7s2qwREkjuN5pf9x1QR3HeFVfuGkRqbcO7d25NPkg2kzQVbaOPcr4zYTZi4qX7@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3pZt/+dvQetqb2lbEWZk9PrJj6R2mKFJalQqSY2iBSZD4LZVk
	Xa/F1Sr3rLoNLWpZs7QGHrCIw80flA6V4lSVcShcfdq8wOZrquLady4xcIfzxiBjHCMX0q07Sfq
	tUWqZu1nLswbuFlO0UwkbMO/dhXv3VnVp+zD0M1Oc6sGOMXnpFnK7R3+SC2Sy02Vg6QlvRATx
X-Gm-Gg: ASbGncuF7IGtBzjtNoaOw5t+L1XtVwR0YwMgVDxs/wcG/VrbZNbcuuPmUIoXr6479t7
	GAfUFpP5v6lAr30a8ub0H8J+aeK2sJa58BrVB9P282WePjETxKrAwatQ6sQKbV6OHpcMP5q6d34
	VZvFD/m1q8YtzcYIRu/woP2ZcYBpl6tl5fXV4uu5p5qAQ457vYkYoXx0fka6zZ+Go45lSAoPvU/
	/j5A2/DZO/dT5B8NAo/Rbzc7I9KdtDXqS0UlShggmbzutSKpHBaNvcalszEXSGunNzYNRblob/W
	QywQJdNxTgoD5OYOBlI/snoR9e1543kI3bdQaRxeoH9UtiZXMZrS/B5mQrJdXvRxDSk=
X-Received: by 2002:a05:6a00:1989:b0:76b:d8f7:d30b with SMTP id d2e1a72fcca58-76e8dbaa401mr1993148b3a.10.1755670797782;
        Tue, 19 Aug 2025 23:19:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFVWVmutWphmCS82Rcwj2tmZT39j3z+E7I3LxdsVVCYqR8vLEcV2M7wRqe6Vip/Yxu0WHvoGQ==
X-Received: by 2002:a05:6a00:1989:b0:76b:d8f7:d30b with SMTP id d2e1a72fcca58-76e8dbaa401mr1993117b3a.10.1755670797336;
        Tue, 19 Aug 2025 23:19:57 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-76e7d4fd29fsm4335862b3a.72.2025.08.19.23.19.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Aug 2025 23:19:57 -0700 (PDT)
Date: Wed, 20 Aug 2025 11:49:50 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Pavan Kondeti <pavan.kondeti@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Vikash Garodia <quic_vgarodia@quicinc.com>,
        Dikshita Agarwal <quic_dikshita@quicinc.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-media@vger.kernel.org, linux-remoteproc@vger.kernel.org
Subject: Re: [PATCH v2 01/11] firmware: qcom_scm: Introduce PAS context
 initialization helper
Message-ID: <20250820061950.lqsuoj7u7se75mmj@hu-mojha-hyd.qualcomm.com>
Mail-Followup-To: Pavan Kondeti <pavan.kondeti@oss.qualcomm.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Vikash Garodia <quic_vgarodia@quicinc.com>,
	Dikshita Agarwal <quic_dikshita@quicinc.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-media@vger.kernel.org, linux-remoteproc@vger.kernel.org
References: <20250819165447.4149674-1-mukesh.ojha@oss.qualcomm.com>
 <20250819165447.4149674-2-mukesh.ojha@oss.qualcomm.com>
 <3b74157a-3f2a-4533-acf6-7cab8154709c@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3b74157a-3f2a-4533-acf6-7cab8154709c@quicinc.com>
X-Authority-Analysis: v=2.4 cv=ZJKOWX7b c=1 sm=1 tr=0 ts=68a5690e cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=c7pJEiSHkIStB_RkOCEA:9
 a=CjuIK1q_8ugA:10 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-ORIG-GUID: izkBhCAYd3gMEpEXxf-G4g9zGe7S7uPa
X-Proofpoint-GUID: izkBhCAYd3gMEpEXxf-G4g9zGe7S7uPa
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIwMDAxMyBTYWx0ZWRfX4B3Qv58jmPhn
 yWnR6t9oq+1/mcScFpVhuuhsETtGh54iptVXdS0JfjunPKRpwBIvn5L47ZBstPrSeNDCETto5GK
 QCkBzO8Ct71DhLoSKm7n6lQkLtc9MCpenybDTOXBmavqM98FS7219rA33ywOlZIL5dVgIuAbq8/
 QAC0m9L73H0iRQ2XHhXk07uJXaGP5GjUCREsxKChecPpsmDSjT3F0hGHO+AsYOlpR9s7vw7PP1o
 MFRAQQ8k0gwkQ9Nx2gVFTUK3JeR8eackoXpN0dTTgWFmIKwoqitmJlUO50Go9CxTq13Wa20JRYV
 8dqGj2ykyExhp8xP3NV/s2rD/A6ip3NDR6SLHoQLGtZPollji3vQ+fHMGE3ato7gGx/TzLDM0cQ
 q4m6vBm2TRGpelHjvhmFr7d2YjpiUQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-20_02,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 malwarescore=0 adultscore=0 suspectscore=0
 lowpriorityscore=0 impostorscore=0 phishscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2508110000 definitions=main-2508200013

On Tue, Aug 19, 2025 at 10:47:45PM +0530, Pavan Kondeti wrote:
> On Tue, Aug 19, 2025 at 10:24:36PM +0530, Mukesh Ojha wrote:
> > Currently, remoteproc and non-remoteproc subsystems use different
> > variants of the MDT loader helper API, primarily due to the handling of
> > the metadata context. Remoteproc subsystems retain this context until
> > authentication and reset, while non-remoteproc subsystems (e.g., video,
> > graphics) do not require it.
> > 
> > Unify the metadata loading process for both remoteproc and
> > non-remoteproc subsystems by introducing a dedicated PAS context
> > initialization function.
> > 
> > By introducing qcom_scm_pas_ctx_init(), we can standardize the API usage
> > across subsystems and reduce the number of parameters passed to MDT
> > loader functions, improving code clarity and maintainability.
> > 
> > Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> > ---
> >  drivers/firmware/qcom/qcom_scm.c       | 26 ++++++++++++++++++++++++++
> >  include/linux/firmware/qcom/qcom_scm.h | 11 +++++++++++
> >  2 files changed, 37 insertions(+)
> > 
> > diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
> > index 96d5cf40a74c..33187d4f4aef 100644
> > --- a/drivers/firmware/qcom/qcom_scm.c
> > +++ b/drivers/firmware/qcom/qcom_scm.c
> > @@ -558,6 +558,32 @@ static void qcom_scm_set_download_mode(u32 dload_mode)
> >  		dev_err(__scm->dev, "failed to set download mode: %d\n", ret);
> >  }
> >  
> > +void *qcom_scm_pas_ctx_init(struct device *dev, u32 peripheral, phys_addr_t mem_phys,
> > +			    size_t mem_size, bool save_mdt_ctx)
> 
> Since we export this for other drivers/module, consider adding kerneldoc
> comments.
> 

Sure.

> > +{
> > +	struct qcom_scm_pas_ctx *ctx;
> > +
> > +	ctx = devm_kzalloc(dev, sizeof(*ctx), GFP_KERNEL);
> > +	if (!ctx)
> > +		return NULL;
> > +
> > +	ctx->dev = dev;
> > +	ctx->peripheral = peripheral;
> > +	ctx->mem_phys = mem_phys;
> > +	ctx->mem_size = mem_size;
> > +	ctx->save_mdt_ctx = save_mdt_ctx;
> > +	ctx->metadata = NULL;
> 
> This seems unnecessary.

Yes, it is redundant.

> > +
> > +	if (save_mdt_ctx) {
> > +		ctx->metadata = devm_kzalloc(dev, sizeof(*ctx->metadata), GFP_KERNEL);
> > +		if (!ctx->metadata)
> > +			return NULL;
> 
> Do we really need to pass this burden to the caller to pass save_mdt_ctx
> as true/false? What happens if we always keep metadata in qcom_scm_pas_ctx struct
> and let clients use it if needed.
> 

Do not wanted to be aggressive like changing every driver which uses
qcom_mdt_load(), Hence, taken this safe approach of adapting the current
way.

Obviously, it is the one approach where I was looking to unify API's
across remoteproc or non-remoteproc subsystems and that's why I have
put comment in the 2/11 if we feel fine to do it for other drivers too.

> > +	}
> > +
> > +	return ctx;
> > +}
> > +EXPORT_SYMBOL_GPL(qcom_scm_pas_ctx_init);
> 
> Is there an equivalant ctx_destroy() function? It would be confusing for
> drivers to call this in their probe and not doing anything upon error or
> in their bus::remove callbacks. I don't know if we really want to
> convert the whole function under devres or just provide a destroy
> callback.
> 

I dont disagree., will wait for some more comments.

> > +
> >  /**
> >   * qcom_scm_pas_init_image() - Initialize peripheral authentication service
> >   *			       state machine for a given peripheral, using the
> > diff --git a/include/linux/firmware/qcom/qcom_scm.h b/include/linux/firmware/qcom/qcom_scm.h
> > index a55ca771286b..b7eb206561a9 100644
> > --- a/include/linux/firmware/qcom/qcom_scm.h
> > +++ b/include/linux/firmware/qcom/qcom_scm.h
> > @@ -72,6 +72,17 @@ struct qcom_scm_pas_metadata {
> >  	ssize_t size;
> >  };
> >  
> > +struct qcom_scm_pas_ctx {
> > +	struct device *dev;
> > +	u32 peripheral;
> > +	phys_addr_t mem_phys;
> > +	size_t mem_size;
> > +	struct qcom_scm_pas_metadata *metadata;
> > +	bool save_mdt_ctx;
> 
> As mentioned above, can we just include qcom_scm_pas_metadata struct all
> the time?
> 
> Thanks,
> Pavan

-- 
-Mukesh Ojha
