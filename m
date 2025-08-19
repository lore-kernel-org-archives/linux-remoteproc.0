Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48BD92E22A7
	for <linux-remoteproc@vger.kernel.org>; Tue, 19 Aug 2025 17:17:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755623876; cv=none; b=n5mTLSwKqm0+xQtEzdzrlaqEsy9HQJSHkwUklWi7CkmAMDfEwNkupOLzUWXndjeXX/YxV/xLWWzPwofUq3HWM9xGtTD4iOPj4Myl7W7KbY7Twslwr9C9IFP8aK/LLvwMptcb2UhRa4YqnzWu1/xmChgl9AY43HP9KHYxGm/rXqc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755623876; c=relaxed/simple;
	bh=nvWzzpqNpT6eJfaRE4PBD9zQF//aAwvkd8/k/iioYeQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QfbWwjsBQ4I+oEfv63CNWkdnWLOdVAh6G/S+TuWgmbmRvl+Z6BH2auvIWp5dH+vWoUZhkjaGGz7rxa22Ow945fyzhqKe3917Po5vGDm+tdiEtyhe+W42xmUT9qilsXxGDsiV7ITZis1H42haQbNGUYpsxWMfwh4ipy5nPj4ju4E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YDpVHwao; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YDpVHwao"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57J90Zut018032
	for <linux-remoteproc@vger.kernel.org>; Tue, 19 Aug 2025 17:17:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=jcJugMEmP+bjapXf/nEWeVTp
	niYytQQ7IyAUbp7KDGw=; b=YDpVHwaoiNDYc1EstbKRajG+5Bss+xcUqnjV8xew
	SHQq9vWf0M/krUsz0Oo02Wb4CR9CUL1wVSp3tFWLgLHDX8bpXVtDsQ/cKXYQxEfK
	ctDGkTLXNxOfhz3ggJEFFO8rXi27DGzstYB2dgbzC4XGnRTwtDkOy4NHFIxSmlLS
	CofzYV6sCtFJsOR/ZkP+xTKOz63pQjsEGo3bv2N2zDzBMBIilL8JJ4+Mf+uQWueK
	LWP2GAB1EJ7QnWaYl3AHuzqBqdtKHtRE19G73O68BmwHF/SRQPez54S9msIUEUsr
	NcnuZsLbN3Q86pLKMGUcRPobdK+HYTbZ+2WX8TVzDnAT7A==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48jhah1a9y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Tue, 19 Aug 2025 17:17:53 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-b471758845dso4679902a12.3
        for <linux-remoteproc@vger.kernel.org>; Tue, 19 Aug 2025 10:17:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755623873; x=1756228673;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jcJugMEmP+bjapXf/nEWeVTpniYytQQ7IyAUbp7KDGw=;
        b=uxW2KTGQpfALQTqG3EyWIRBPs3MHSKQP0xI2juZct4yaiqV2fKzTwTX9BixZEE3lma
         cIsbJZsWEucFr+LwDuWJrNYYI6XPIAt+HRDdW8Zk3zjkC4d80fMjOM61SSjyr1pf6aCm
         KqvLXdXDct1IsabSSlj9Nx+8UnSegvF3c6hDI6ZLy3pcMZSXicxVow3pPtX/rjSj7r6z
         /PUBx7VwCfcjcHc20GcthbIW6JCKYFncc/Cg7lWQaqcrAyAbZ6Q+Meblio08ZNZGYK5R
         rIaWapivYkxYObll1Jx7v+uicKjq31r5OaJnYl+8IX8HZHFIkYU9xbuBvY2EytfR+JUn
         oKOw==
X-Forwarded-Encrypted: i=1; AJvYcCWWZO22GQCyZ38QKbz6fGMLMIgk7yepsjDRQ60TsRG1V2mTpc25TCMi8dMcdhecC+4p737xdXM080JWLL0ffGvl@vger.kernel.org
X-Gm-Message-State: AOJu0YxhTEBDRTliAaSoQsC+fQFVSFF18Ock3C6tjDoYcojPvqeHsH5L
	p7TIBO/Opm4DidlYKBLwkfNW2gQs5tK31bwG29ObH6z92l5uq15Eng9qMIBb8zxGvkO81qW2fo1
	vKSj90/t2CpwUKOt1YcufJEh/PAr9CJQQaASgfsWcc7+iMCHQ9fbezLbDU+y6Z8thVYvga0LW
X-Gm-Gg: ASbGncubgrpMU5fNdp467xItJuN9+qlBXcTEIzSLoVa8ZjC0/W3wmVfHAyzdHS3BwOX
	OQxeB7sZKmcRb/SwJk65o0i5kORDDd21BbTDhJQbhDosLas7Xf8lf6u6vmNzsvNOzW8PKlb5UV9
	FvN87aNKyL7uQE55+B8NTY/XyahGNIJRpauRszNKRaFTqdPtiuqRaRWAtHdM8am7/UiqeUmsh96
	aKcSOGFsLfMVCvn5j17Vj3kWMhXq8Am0rtBJqpGqAa5ozKW5yhuRJ101k4vzCuA/zSFN9fFVT+y
	2IdfiJBYdNDtsxHMCtDYP65mVN6rfDxIwYHRaIYT5OGnL+4WuGY49jNEED35uOxCGhCM5XT2Yg=
	=
X-Received: by 2002:a05:6a20:7d86:b0:243:78a:82b9 with SMTP id adf61e73a8af0-2431b980068mr162642637.51.1755623872614;
        Tue, 19 Aug 2025 10:17:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFN9cn2Ql/5avNFjiCvAWCZGwnNNwM92fq94h29uNQopaI93fMSoUy7tmgOUYUQhdeGK5VXtQ==
X-Received: by 2002:a05:6a20:7d86:b0:243:78a:82b9 with SMTP id adf61e73a8af0-2431b980068mr162576637.51.1755623872003;
        Tue, 19 Aug 2025 10:17:52 -0700 (PDT)
Received: from hu-pkondeti-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b47640b2d37sm198078a12.46.2025.08.19.10.17.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Aug 2025 10:17:51 -0700 (PDT)
Date: Tue, 19 Aug 2025 22:47:45 +0530
From: Pavan Kondeti <pavan.kondeti@oss.qualcomm.com>
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
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
Message-ID: <3b74157a-3f2a-4533-acf6-7cab8154709c@quicinc.com>
References: <20250819165447.4149674-1-mukesh.ojha@oss.qualcomm.com>
 <20250819165447.4149674-2-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250819165447.4149674-2-mukesh.ojha@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=D9xHKuRj c=1 sm=1 tr=0 ts=68a4b1c1 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=kj9zAlcOel0A:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=1sDHh0GgXtZW7FQMFNoA:9
 a=CjuIK1q_8ugA:10 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-ORIG-GUID: gbuhTi-IaT97tX3sRznMblMMtNaacb6u
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE2MDAyNCBTYWx0ZWRfX0lEGabtIFFE2
 PHYgRTA5AvuR6I59sy2cXzJ1dR0rKKQ0bW6VETF3D5fLxmueAQoDVOBDatzaFF6lGJCrcojstp/
 4hAgRrmXaF4P0XIGg4zJQTnzhQCtF/ddnbpT+fwsl7Re/5M0W5/VqNwjHRj5ghJ7P9weM8Swu3Z
 3g52E1LbYY1qARoABdzRfqUqnOgWhzowsFMWVSLcR4OQi8hBUpjMwwHUVQsFbvh5dNS3kDlIPpu
 Y37YKU5H0+U+iiY82ApF8c0FD6B56nA+4jtuZ78jU1QXGTesSdj5c4+482Nj2CtZOfkav6KwXiy
 Gc9hruMmpZwdYgrMxpqOantDgB7GwS+Z1VFJtkpVfvfRVRj2+jVtUdqRLkRCyEtrMMJKdQLTeOX
 OoYLv2zM
X-Proofpoint-GUID: gbuhTi-IaT97tX3sRznMblMMtNaacb6u
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-19_02,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 malwarescore=0 phishscore=0 impostorscore=0 bulkscore=0
 priorityscore=1501 spamscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508160024

On Tue, Aug 19, 2025 at 10:24:36PM +0530, Mukesh Ojha wrote:
> Currently, remoteproc and non-remoteproc subsystems use different
> variants of the MDT loader helper API, primarily due to the handling of
> the metadata context. Remoteproc subsystems retain this context until
> authentication and reset, while non-remoteproc subsystems (e.g., video,
> graphics) do not require it.
> 
> Unify the metadata loading process for both remoteproc and
> non-remoteproc subsystems by introducing a dedicated PAS context
> initialization function.
> 
> By introducing qcom_scm_pas_ctx_init(), we can standardize the API usage
> across subsystems and reduce the number of parameters passed to MDT
> loader functions, improving code clarity and maintainability.
> 
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> ---
>  drivers/firmware/qcom/qcom_scm.c       | 26 ++++++++++++++++++++++++++
>  include/linux/firmware/qcom/qcom_scm.h | 11 +++++++++++
>  2 files changed, 37 insertions(+)
> 
> diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
> index 96d5cf40a74c..33187d4f4aef 100644
> --- a/drivers/firmware/qcom/qcom_scm.c
> +++ b/drivers/firmware/qcom/qcom_scm.c
> @@ -558,6 +558,32 @@ static void qcom_scm_set_download_mode(u32 dload_mode)
>  		dev_err(__scm->dev, "failed to set download mode: %d\n", ret);
>  }
>  
> +void *qcom_scm_pas_ctx_init(struct device *dev, u32 peripheral, phys_addr_t mem_phys,
> +			    size_t mem_size, bool save_mdt_ctx)

Since we export this for other drivers/module, consider adding kerneldoc
comments.

> +{
> +	struct qcom_scm_pas_ctx *ctx;
> +
> +	ctx = devm_kzalloc(dev, sizeof(*ctx), GFP_KERNEL);
> +	if (!ctx)
> +		return NULL;
> +
> +	ctx->dev = dev;
> +	ctx->peripheral = peripheral;
> +	ctx->mem_phys = mem_phys;
> +	ctx->mem_size = mem_size;
> +	ctx->save_mdt_ctx = save_mdt_ctx;
> +	ctx->metadata = NULL;

This seems unnecessary.

> +
> +	if (save_mdt_ctx) {
> +		ctx->metadata = devm_kzalloc(dev, sizeof(*ctx->metadata), GFP_KERNEL);
> +		if (!ctx->metadata)
> +			return NULL;

Do we really need to pass this burden to the caller to pass save_mdt_ctx
as true/false? What happens if we always keep metadata in qcom_scm_pas_ctx struct
and let clients use it if needed.

> +	}
> +
> +	return ctx;
> +}
> +EXPORT_SYMBOL_GPL(qcom_scm_pas_ctx_init);

Is there an equivalant ctx_destroy() function? It would be confusing for
drivers to call this in their probe and not doing anything upon error or
in their bus::remove callbacks. I don't know if we really want to
convert the whole function under devres or just provide a destroy
callback.

> +
>  /**
>   * qcom_scm_pas_init_image() - Initialize peripheral authentication service
>   *			       state machine for a given peripheral, using the
> diff --git a/include/linux/firmware/qcom/qcom_scm.h b/include/linux/firmware/qcom/qcom_scm.h
> index a55ca771286b..b7eb206561a9 100644
> --- a/include/linux/firmware/qcom/qcom_scm.h
> +++ b/include/linux/firmware/qcom/qcom_scm.h
> @@ -72,6 +72,17 @@ struct qcom_scm_pas_metadata {
>  	ssize_t size;
>  };
>  
> +struct qcom_scm_pas_ctx {
> +	struct device *dev;
> +	u32 peripheral;
> +	phys_addr_t mem_phys;
> +	size_t mem_size;
> +	struct qcom_scm_pas_metadata *metadata;
> +	bool save_mdt_ctx;

As mentioned above, can we just include qcom_scm_pas_metadata struct all
the time?

Thanks,
Pavan
