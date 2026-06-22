Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7864735F182
	for <linux-remoteproc@vger.kernel.org>; Mon, 22 Jun 2026 06:41:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782110510; cv=none; b=T8aZAkWH9YoiOBw822Rk2PuvXIAZRR6nAIMIEGbOjnQxnslx/J0219sEXBgQUNzNRXsmgNbZ8Yb2RUOVHRTxXGVxW2UUEFsVsBMPTdD+EEHEKUa5wkvZxsWR1PGlEWxbCNYEBtAP+QUiahSRTKfIiSSCk99CfjjdOVDdFbmSOsc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782110510; c=relaxed/simple;
	bh=9cmkIXMJO7gMCtwVcDVLNwQ8XrpCbFPx2UXY1rvqCtI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cs5kLrbC8L2s2jbO6stD2HXzc8E9sksf5taOfEQNFulY7cYMRnmOPT3CgVbgVW0nopuRCyYxaigyM9ZwKT2doKLB07qY4xvLygU8Yaed8N9dzKrAFBikk+tJs0r4oNzKPin6JYI78cuhf9/xbE9SQ7lWDkZ8rNTz7CMuVue02oE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MoJAIpGE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AYXrQjAu; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MoJAIpGE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AYXrQjAu"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65M59Bad3850434
	for <linux-remoteproc@vger.kernel.org>; Mon, 22 Jun 2026 06:41:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=xHK9/MiEK/EN1OHCR+z7uafv
	ifIPKlxHaMTGSbKnKig=; b=MoJAIpGEKRnqtUKZmOWiRhkEJRLHszGo57aPA+eS
	3g1mISBjJxBOLQ7CQjYObztBfLTCTARtFch9AH4btjR9skDXPbRox9hCKBOSr2Ug
	8ilinPw00hcxtpcf8UYOBZ3J3vL0wUIVSfOIJ0s/P9VdskKA92+eU2OxHS4w7fT4
	OIlRPA3liYLn+f2SLQ4ghlyHu2KMQWhg6Amk5COYV4/5nzouAS2NrX4iwodv6+NO
	bo/yvY88cVMdMjpFWofX+DQHFR8ZGIT1PETHywL79g9vBMor4tXQVbOnXUHb+kh9
	+h1mhWv+YlQvG52EeUlY+eSQqCJuGgKzEsY5CCgWao+Pdw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ewm584x3q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Mon, 22 Jun 2026 06:41:48 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2c79e5de32cso6215515ad.2
        for <linux-remoteproc@vger.kernel.org>; Sun, 21 Jun 2026 23:41:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782110508; x=1782715308; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=xHK9/MiEK/EN1OHCR+z7uafvifIPKlxHaMTGSbKnKig=;
        b=AYXrQjAugVwYwGKhTkYB9wDk0P4zHSQdqp+w3kcp08J84NVCGe+iozMlpr/LlLOLkY
         JI6smTv2NpwY4rJQ/pcTYwzNI7CT6PzTxJP8gbl5TDmQToK5usMxD1mnFjYoOon78lZr
         Af4HpJIxzs3ZgWWz7sWVGQ2Ir6wc89Sj07CGjezHPYvKhTzujGyXDCFBaE7BaW79vW9X
         8LR49f/LD4N9wXncpJKY8lZjgTF6pjRGLKOvdbAQ2k58vMsSJv/MQxI++ilzzfNMreHp
         ESFRtHAeDP3BpK4AqYPDfKwykSkoY7pr9eZJSvLqOQsXLRbgNx4cHnqXZL7/s1lnhljk
         c3LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782110508; x=1782715308;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xHK9/MiEK/EN1OHCR+z7uafvifIPKlxHaMTGSbKnKig=;
        b=VWnemerQ6GySdxcAkVE/DOJnFroFseqUBQ8jIgI3XaYripDqHbGK8/EmBJUlxquxdw
         fEqo4s6RrcBP6oxZN81mYpyJXucsvInQUb3zNuPkKGSLrX2+kVIQ6w6yE1Qvr/X44zeE
         6FiNXo1Oy2YGgI68SZuIvMobauekSTsoPXkV07V2glUfEP7aeftMwlmJQLj3qIS87+jP
         MhG3AescQTDa5WyVxj3kjNisEHcnBcnD542vbVusuo/wTGtgvptQXTcA5uMlXXt1Oa+B
         gvBsqHowWWOpMWGVrWj9wIhJZ9CUQ0LRoVxuQi77hruO12ywFCGdEG7cRPbFNxcanvJ1
         4HIQ==
X-Forwarded-Encrypted: i=1; AHgh+RpnPJBTZONJoXOHYAhroNOe5FrFMiSd7hAIfzPi4o1B7oZzDynSIHTyazA9GgiNLEHgjZ6331nAjpSZjLWkfWOR@vger.kernel.org
X-Gm-Message-State: AOJu0YyKWbSlz79uMQwXylT6jwgb7qOsCu2PQa6d7bf28qRwzqhPpdJ5
	xb1abNZoueZcElRZ5nqV8EznWQYRG4MNIKX7ka7RptJeO0M4E3J6w3YfTqu1AWOSyE+pQzg3STO
	Pk8w9DrsWfKzg8P2fmhomhjBlOW0UEMWTQeR1aJ7qfdp16j9CBaMfSWSX9Zi3kCx5uNLfs4i9
X-Gm-Gg: AfdE7clSCvcrkxCJQTzlats5FYuYRDXu0PrtqbW4na3xOEcnANTnyBRxYWuSxH/19AC
	NUackW/viWZY7A4Y38PRxYLldBzcbBqOv0q/qJ3Djt3SQNct06OXSAyJPnRPz9dom3ZfeEC9cD3
	+4oiN7cDZvM97egsn1L+8uq3+5OQP8beOBv70olPaZmLCqFNaZAf4JHe6JwBdmDhjb6NvMtQJvf
	b/dz1Q8PDKWNGSAX3prns6LltAb9dXrnt19tKp5F17kA0N2GgL/LjtEbL5Yqv3+3zoBbme1DMgf
	74xeWbg8y21lf99w+OCR9AGvrcAPjr3Q/9AsgH7ETblZO7xm+NXzRBaN9dbVSQP9UP1cdQuNVY8
	qqcII7BzqswH7EGoaRe5z3sQpLGqCyaI4uUCjvw==
X-Received: by 2002:a17:903:1c9:b0:2c2:62ee:5a0d with SMTP id d9443c01a7336-2c718ed6396mr144609265ad.14.1782110507854;
        Sun, 21 Jun 2026 23:41:47 -0700 (PDT)
X-Received: by 2002:a17:903:1c9:b0:2c2:62ee:5a0d with SMTP id d9443c01a7336-2c718ed6396mr144609035ad.14.1782110507236;
        Sun, 21 Jun 2026 23:41:47 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c743bfe6c6sm63306685ad.58.2026.06.21.23.41.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Jun 2026 23:41:46 -0700 (PDT)
Date: Mon, 22 Jun 2026 12:11:41 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Sailesh Nandanavanam <saileshnandanavanam@gmail.com>
Cc: andersson@kernel.org, mathieu.poirier@linaro.org,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] remoteproc: qcom_q6v5_pas: Release dtb_firmware on stop
Message-ID: <20260622064141.zfakbyenknx6vbm5@hu-mojha-hyd.qualcomm.com>
References: <20260622040114.17128-1-saileshnandanavanam@gmail.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260622040114.17128-1-saileshnandanavanam@gmail.com>
X-Proofpoint-ORIG-GUID: dqomJCM92gYynBvEHLou4rnxIPl7Cavh
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIyMDA2MyBTYWx0ZWRfXyddTjizQ/Kbv
 Ul862CFDYzSltPfqTcM9ucOEcnErDFzM1EKpxwt6ilNtqIOm0kmxQ3QEKAYHkZQlFw0koVuJmOq
 RVAAG11EU5i5+o0L7iF5GNHrz6MrVdc=
X-Proofpoint-GUID: dqomJCM92gYynBvEHLou4rnxIPl7Cavh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIyMDA2MyBTYWx0ZWRfX5rqDQ0MUVgPO
 wSRrHpKy2SCa+E8VsvUEGJDumUf26P1rZoMND2BwK32xBjb/WY1vHU6qHf3w7Y4CmPATYTDVe+f
 JdCTDNAbYDoxqekSfj/OEsf+25PjHoyKYTpF4gMT3lPQgmPSRmpaREoLMpAKYJK2zilICpBm/NO
 0axchpYB+ql+J0XeDV01uoxPitc3E2F4UOjsqoAvLc2PPxoS5zl+Ggsfac8zlhBrVWeeXEjPxS5
 cJFcFq5kubl9G5HzsNVcYenmL1Yciq4bnsDBOkkH7nN1pdNsTT85e/uKTg36fncHXvWZtzinXAp
 2D+CjkTLl0v7qC+quFStUvELvKN+fjjoDgDAAVIc+f8UwhfJvsYyKSVwCJrBNNiSu8EOCT0MVmr
 gb6ZKxljib4vCheZ/Ai7IaslT8CwDaHFRb/IEJKI0QVg8rv0fcf1+402HOss2hcXh7GHuQzAbKj
 s0netnTKaqm+9FsBXtA==
X-Authority-Analysis: v=2.4 cv=FOQrAeos c=1 sm=1 tr=0 ts=6a38d92c cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=pGLkceISAAAA:8 a=ThCJF3AM6TL1KfZxvHMA:9 a=CjuIK1q_8ugA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-22_01,2026-06-18_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015 adultscore=0
 phishscore=0 spamscore=0 priorityscore=1501 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606220063

On Mon, Jun 22, 2026 at 09:31:14AM +0530, Sailesh Nandanavanam wrote:
> qcom_pas_load() acquires a reference to pas->dtb_firmware via
> request_firmware() whenever the platform defines dtb_pas_id. This
> reference is only released on the error path inside qcom_pas_load()
> itself, when qcom_mdt_pas_load() fails.
> 
> On the success path, pas->dtb_firmware is never released by
> qcom_pas_start(), qcom_pas_stop(), qcom_pas_unprepare(), or
> qcom_pas_remove(). Since qcom_pas_load() runs on every load/reload
> cycle, including subsystem-restart recovery, this leaks a firmware
> reference on every successful boot of remoteprocs that use a DTB
> co-firmware image (e.g. ADSP/CDSP/MPSS on SM8550, SM8650, SM8750,
> X1E80100).
> 
> A second, narrower leak window exists if qcom_pas_start() itself
> fails after the DTB carveout has been mapped: the remoteproc core
> does not invoke .stop for a remoteproc that failed to start, so
> qcom_pas_stop() never runs to release the reference in that case.

> 
> Release pas->dtb_firmware in both qcom_pas_stop() and at the
> unmap_dtb_carveout label in qcom_pas_start(), alongside the existing
> teardown of the DTB carveout mapping, and clear the pointer to avoid
> holding a stale reference into the next load cycle.
> 
> Fixes: 29814986b82e ("remoteproc: qcom_q6v5_pas: add support for dtb co-firmware loading")
>

Remove the line feed from here..

> Signed-off-by: Sailesh Nandanavanam <saileshnandanavanam@gmail.com>
> ---
>  drivers/remoteproc/qcom_q6v5_pas.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
> index da27d1d3c9da..040aabbe5860 100644
> --- a/drivers/remoteproc/qcom_q6v5_pas.c
> +++ b/drivers/remoteproc/qcom_q6v5_pas.c
> @@ -360,8 +360,11 @@ static int qcom_pas_start(struct rproc *rproc)
>  		qcom_scm_pas_metadata_release(pas->dtb_pas_ctx);
>  
>  unmap_dtb_carveout:
> -	if (pas->dtb_pas_id)
> +	if (pas->dtb_pas_id) {
>  		qcom_pas_unmap_carveout(rproc, pas->dtb_mem_phys, pas->dtb_mem_size);
> +		release_firmware(pas->dtb_firmware);

This is still not solving the issue. What if you have failed just after
the first function qcom_q6v5_prepare() in qcom_pas_start()?

would it be better to move dtb_firmware loading to qcom_pas_start() ?


> +		pas->dtb_firmware = NULL;
> +	}
>  disable_px_supply:
>  	if (pas->px_supply)
>  		regulator_disable(pas->px_supply);
> @@ -419,6 +422,8 @@ static int qcom_pas_stop(struct rproc *rproc)
>  			dev_err(pas->dev, "failed to shutdown dtb: %d\n", ret);
>  
>  		qcom_pas_unmap_carveout(rproc, pas->dtb_mem_phys, pas->dtb_mem_size);
> +		release_firmware(pas->dtb_firmware);
> +		pas->dtb_firmware = NULL;
>  	}
>  
>  	qcom_pas_unmap_carveout(rproc, pas->mem_phys, pas->mem_size);
> -- 
> 2.34.1
> 

-- 
-Mukesh Ojha
