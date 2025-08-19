Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C110832275C
	for <linux-remoteproc@vger.kernel.org>; Tue, 19 Aug 2025 11:44:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755603873; cv=none; b=I+UM1sh5yrCdMzBcVDp3Mtb2tyi0wuoQqKnGgLGu5P2x/e16DWJHlWrclfr9xPPyqYKXY9l0MofW/O5MVUwsQ6u705uR/B+vhSp/bFMzuts8TV29Sw8tajuf5UWmC1jBQERmctUv5LExVFVRfX6ElDrL4xxm1u7kt1k4HGeHy5A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755603873; c=relaxed/simple;
	bh=Zea5ljBd6XshKIFWKGdfW1rTw6x2L14SIAqoCkfBcsA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=V/aNokOztYoWVybxDPEAvv1V9Yd7UKZsLbQQRKQDVDnICStWWKYjmncMQy8X+lmYv+Z6pAQSDmj9oacfUYq4Fq7mhX1Q6IKJ64qK0d4HBYJCNLy6LG4lmDH77tk4l+gHxbOOT+V5nDNwhIly/v5wkVsnJX6lMvVthnk71LWZ2w0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FLm3RxZ8; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FLm3RxZ8"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57J90bil029817
	for <linux-remoteproc@vger.kernel.org>; Tue, 19 Aug 2025 11:44:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=t+IK/PazK4gmkqL94P8OwZrz
	YQaHpy0GRokgzbSriT0=; b=FLm3RxZ8JlEsTtL2P8CZMPQqteKc8VpeL4J3rZq4
	iz+hxSr7W5LBCbT2UI7P9xrdb3my/00MsSz19+VSDZI2MGMrCbNEfMFRcRMFQ3wF
	i8O5S48WyqOJUfcj8VNWDAESLXwb/baCvpdcSSOi0sWB/TbpNM78PpLbnZMnHFj8
	Vv96TSYbKM+9yrOuleNorJpUwONeHfZxtBPMJbOg+TlCCUQlu+LuYeayHJQszzzS
	i7SOcgC9U+Q/1SeTVHJ2XiYmVrjBzpKbJcz+cpibyevRjfTsRZRTsE2ffsRI4gZu
	ywj6jXrTQFeABm+p1xq3FHSlvtCJlyLZSA2KXChff0ljxA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48jk5mg8kg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Tue, 19 Aug 2025 11:44:31 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4b109c8804dso166659491cf.3
        for <linux-remoteproc@vger.kernel.org>; Tue, 19 Aug 2025 04:44:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755603870; x=1756208670;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t+IK/PazK4gmkqL94P8OwZrzYQaHpy0GRokgzbSriT0=;
        b=YUuFfwJFcpCvjyvfplidchVY22ZWu5lxtwq50osgiYjZy5bVRUGv4rElpaJsebIHHL
         WUn3oRP58lwhBCJulbebC7cB7P9Q2Xon9nH7pIfYcQSlTufCAb+KNviEYkFpf8PxMKeF
         49aCOoLVGWWsbg73ys/2TQC/OuzGzxrzBh7qld0yL7zmFV1f55Jt1jiMtaXUUAXYodfp
         JFR3SdEZV/e528Yrbc03GC4fw9pc7KAryYmZgMZ/8/IdOzw7vZm8njfQBlXPoSXBIalx
         WSaYA/H2xioOYeHKnXdmpZv/hJRFoe+WCE9W5LO6rRDdqxfQfEN7FwNU10PKpoU2sjSQ
         /cqg==
X-Forwarded-Encrypted: i=1; AJvYcCXP2JzbAZZ55FhwzXNaoyfOX3cDqaln5fXbJsXJFy5Vx4Edz42v1+0y625MHQ40RdWcaaOSSdNyHI+gaNnQKyW8@vger.kernel.org
X-Gm-Message-State: AOJu0YznAAOi81rc0sF172Gq6UsJCe+NYY6++/XetP16gzcJyemhAH75
	L7tCKZ+k2VTIw3Z95qtJkvCKRrFO2Uvgd2rPswhSlMuOD+4ON0wfLfm9nxUH9a4ZIF24K8/ED5W
	mnhTMvhHBsl2YVGJaWrP2I2mjtEXjFREMGqaMJOiR9X8AzBJg3KpNzV6wGIOps7gETv2dbSgr
X-Gm-Gg: ASbGncutaDyLM9gm3wv+GwxcBenw6mQGwZ6E8lwKENB6TA0Rf3h1EA89G7aPsBkuBLg
	rjUMv45LPCJVfREpCzDAqWuIIvCIcHipAamH3ryPR2govrl1Rthu9xj9IFIGOxOuIOrtXR/1dP/
	9HGs6YxFnjdl0jKFD3124Bh5igEAUZB5pl+4A9BYJC0RZLubOtzOwek2rC6xyEOdaH3HJ4eVYSJ
	hwydnf2U2uZLXbTvtRZXyhZw1VYhdTNOxn6+iEPjv24EjItg0OYA7hdKkRADrZtyYDlM4HE3Z06
	wdIPqwIMCTX947VA9QMKcIHC0YAEfoTGZuuWEyPU7pfRqVtWA1L0SDHNtBag/wcNFQCFsxCLU35
	gLCi6xChF51qJo2YkmvlEb74gWqiiKgMQqg1AbwEzOfbCheiN3dgn
X-Received: by 2002:a05:622a:1a9c:b0:4b0:699c:6083 with SMTP id d75a77b69052e-4b286eb8fa5mr20490991cf.54.1755603869718;
        Tue, 19 Aug 2025 04:44:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHcjjGf0YmdQDLA+f53MBcfPsM3Y7DcIQachNiyj5czwadbiyRfo7iRyUgewgc90wLBYBktsg==
X-Received: by 2002:a05:622a:1a9c:b0:4b0:699c:6083 with SMTP id d75a77b69052e-4b286eb8fa5mr20490741cf.54.1755603869221;
        Tue, 19 Aug 2025 04:44:29 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55cf4d0d472sm1491778e87.48.2025.08.19.04.44.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Aug 2025 04:44:28 -0700 (PDT)
Date: Tue, 19 Aug 2025 14:44:26 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Sibi Sankar <quic_sibis@quicinc.com>, Abel Vesa <abel.vesa@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org, Konrad Dybcio <konradybcio@kernel.org>
Subject: Re: [PATCH 1/3] remoteproc: qcom_q6v5: Avoid disabling handover IRQ
 twice
Message-ID: <czaabkgp3aerp7fntqnpwgilipnum5vmdwwrkem5mugcs7vvd3@q2mwq6ijfbmt>
References: <20250819-rproc-qcom-q6v5-fixes-v1-0-de92198f23c7@linaro.org>
 <20250819-rproc-qcom-q6v5-fixes-v1-1-de92198f23c7@linaro.org>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250819-rproc-qcom-q6v5-fixes-v1-1-de92198f23c7@linaro.org>
X-Authority-Analysis: v=2.4 cv=Sdn3duRu c=1 sm=1 tr=0 ts=68a4639f cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=KKAkSRfTAAAA:8 a=NkVUA5Dj0ueqCG6wnC0A:9 a=CjuIK1q_8ugA:10
 a=dawVfQjAaf238kedN5IG:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: kNXxAj5ySUtiswypTnDmlzvwkpialJcC
X-Proofpoint-GUID: kNXxAj5ySUtiswypTnDmlzvwkpialJcC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE2MDA0MiBTYWx0ZWRfX1YMc56tXP4Up
 GJnuWYydrLkS90lZjQFCoyMcOYiw+M4wsWhoYQLNoX9YinqDOXYuAZbKNlFHki4zlfnZD7baYNw
 UTP4W+dmf32unaF26T7+QKxqV0hYnR5+ZSpMChsEDQN0ViOWXhmt65bNT6TMMAdDpwoNxAMGiAJ
 vjFCrwCSDWFVejPc8Cp0MwNg/qL9rKoJMUVwmGoLH7ZMiD/cF5PGdWIkEu/pnzsKzBrh8GSvZhx
 wjhBF64Bkn/TpaHQcObbfHi4TQUEzcdGXxBdHveNVTq9EmLLAOiMiUgsw3DFkVgMesHQuajXL4h
 +svtgFotaxak+GOJ7Hltw953MV75KK10LFH/4EU5LBHNV0PgFkEyJ4OyckAXFQQRnCW0ojwc+ba
 sYARUT41
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-19_02,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 suspectscore=0 priorityscore=1501 spamscore=0
 adultscore=0 malwarescore=0 bulkscore=0 phishscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508160042

On Tue, Aug 19, 2025 at 01:08:02PM +0200, Stephan Gerhold wrote:
> enable_irq() and disable_irq() are reference counted, so we must make sure
> that each enable_irq() is always paired with a single disable_irq(). If we
> call disable_irq() twice followed by just a single enable_irq(), the IRQ
> will remain disabled forever.
> 
> For the error handling path in qcom_q6v5_wait_for_start(), disable_irq()
> will end up being called twice, because disable_irq() also happens in
> qcom_q6v5_unprepare() when rolling back the call to qcom_q6v5_prepare().
> 
> Fix this by dropping disable_irq() in qcom_q6v5_wait_for_start(). Since
> qcom_q6v5_prepare() is the function that calls enable_irq(), it makes more
> sense to have the rollback handled always by qcom_q6v5_unprepare().
> 
> Fixes: 3b415c8fb263 ("remoteproc: q6v5: Extract common resource handling")

Didn't earlier versions also have the same behaviour?

> Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
> ---
>  drivers/remoteproc/qcom_q6v5.c | 3 ---
>  1 file changed, 3 deletions(-)
> 
> diff --git a/drivers/remoteproc/qcom_q6v5.c b/drivers/remoteproc/qcom_q6v5.c
> index 4ee5e67a9f03f5f766f04396b9a3e45f77293764..769c6d6d6a731672eca9f960b05c68f6d4d77af2 100644
> --- a/drivers/remoteproc/qcom_q6v5.c
> +++ b/drivers/remoteproc/qcom_q6v5.c
> @@ -156,9 +156,6 @@ int qcom_q6v5_wait_for_start(struct qcom_q6v5 *q6v5, int timeout)
>  	int ret;
>  
>  	ret = wait_for_completion_timeout(&q6v5->start_done, timeout);
> -	if (!ret)
> -		disable_irq(q6v5->handover_irq);
> -
>  	return !ret ? -ETIMEDOUT : 0;
>  }
>  EXPORT_SYMBOL_GPL(qcom_q6v5_wait_for_start);
> 
> -- 
> 2.50.1
> 

-- 
With best wishes
Dmitry
