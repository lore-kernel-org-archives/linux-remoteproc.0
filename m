Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D06FF418A34
	for <linux-remoteproc@vger.kernel.org>; Thu, 23 Jul 2026 10:00:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784800836; cv=none; b=TfkxXbihMoaT5BsuZH/MXF4syppzN5y00b4W+2m4YEAzy8Qb6QD5G6xLz5NRL2ird3d7oILDpfwlR97N7O2TrY7hF+61fVAfwC1gIOBHgT8316xXr6uswwInnkE2Wt1wswLf3eN56v2fwG94FAjQEDWXeTvsFuyXGo9wGfd1Ctc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784800836; c=relaxed/simple;
	bh=VLw6u5uJQ0A0aDtacuxkHmJKmF7uVFvEbyUyO50WYAA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uWDATDq8i3h7IQUMjM4ASyyHT11bvb/wpv88Rpl3y3mwvfoevyU3Nvg/HEEj+4pwkBnMsJjYvXEK0UKmlGoEbvhvMZIZq4o7kVlzZQLv7XqyFyT7RxsUlGBVVimMRDhw3qGCIOZwMWu1YD3XD7OQTadx4Q75FImMOYE+e4QmgBo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HLKjhQ5k; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AfQ7jQji; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HLKjhQ5k";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AfQ7jQji"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66N8qZ773648591
	for <linux-remoteproc@vger.kernel.org>; Thu, 23 Jul 2026 10:00:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=MCAPhmwzwrd8RGe5r/R4THSX
	uofPqZMNQCsZGRPWI8Q=; b=HLKjhQ5kOFJmzUZ6j5w0zuO1mTqzz//wqjgA3VqG
	92j01WMU0EKKMcYTo0PdA0ofJeSt/RgG63lMudiSSiKzk4snytGB76c4yPitCn9h
	DLCxsKp4fQuAh3mWK///agGv9u8jYLLqbvfTwG9wYjPYGaU0rngxRORq8jRONV8b
	pPs40skveGvQL4HbLCcWifE18el4GuznvJRcqQR8xRyxd4vG0qWrcfdCXOX/sNdx
	ec1Zpw+ocuKbeq0E+2EkAl9MPQwhoXoGJWoMADjYOjiA8Mz50kaTWTFGZ07n5Lc6
	iSZXDMJQEJx96Q6YPbLZUX2xZ5A7/F/jFoQsijZWpwl1RA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fk6c7jdxp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Thu, 23 Jul 2026 10:00:33 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2ce7dff6253so3198545ad.1
        for <linux-remoteproc@vger.kernel.org>; Thu, 23 Jul 2026 03:00:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784800833; x=1785405633; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=MCAPhmwzwrd8RGe5r/R4THSXuofPqZMNQCsZGRPWI8Q=;
        b=AfQ7jQjivVtcsmz/+JXByx0Wux2pwx6IJjpLcOk8z4xGz30RcyWsytDMqJHH58C6Jn
         cBmpKfcaLVE/8Kf/rodlWMlzNrUHloRXgvNw5FdqOB/QUkCE2EM8fkk7jc44GkwtDoPE
         YhOs2wairsUTrlyw4ILHn+oRVxvnjUME2qHM670N20+bT+Y81IfOoNDMEpafpEsCzV9F
         toiZb8AaZXARHmcsHNfYJY+jsSpGMLhaqWYsL5RhoXbHt6B6lzJYHngtg1RQgbYXo68o
         QXJhkqAalueFkblKzIZtt2SULqO8jxUrNFxSst8trYz8p+de8TQbDhWqnClVWcughvM/
         pZ2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784800833; x=1785405633;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MCAPhmwzwrd8RGe5r/R4THSXuofPqZMNQCsZGRPWI8Q=;
        b=Chh87kuTxMEdONzDC6Cln2mQgixlvYkj9mttTP5O1xj6a/EIrOqaQeo0MJVXsIrEa/
         /G4ZKDRZrBSYqWnzxVTP3QSSMx1+lpfzyr1KHyug72VsFuApZzEXfJzxAYTbeY7SXnhF
         iCIupVVxB2xunFzrfA9Djp0Ii18cqGkvJhZtGsqGyO/TqGJXWktHoo28VRZpB9dRe1/b
         AOVd+/cV1DfXen4ybYBW4hJfoRRHyawrRovAUGQxJ4aL1dPH4JFaBpZ8RgT9brTXeDlV
         y+ptzeYnVMz5q2ovAphpiy4msW7qt4GkUwkaOR+6qCefS/6iUPVXV4+S+Oi90sFLVX19
         8J9w==
X-Forwarded-Encrypted: i=1; AHgh+RozBV+CTRoFAzn8N6No8KoIsunpMW/vq5KkbS3YWVwqwvbB5w52aTmXYsKDAwry9Rwux5IYNVy/sBBNobk/Sy8n@vger.kernel.org
X-Gm-Message-State: AOJu0YyhF45i2OZANrjoBlqjlUOgeJeHLbJB1XJIchV0nPQ1wy2Jw05F
	qinTMnLakdwXxriy74AvryfPaNiOLsBPYC8MJ/H4cIb7yaIz2kaFs4apw92BbnPUusHKPw5PWVo
	uHAM8SYR6BjW+CO3CaWOHkaKXbipMb8NNUd0Fik2yRJ0XJ0tgFs7JickkWz64k/d3jZKj+0SJ
X-Gm-Gg: AR+sD12KHOfPgOsQyhOwmNhpxvfp1DmlGx6DiJLvqFYxhHtpl1cOAnmx4X/mrjnc9ip
	t5KwuAiNeU/7Gh0Wn8Fwx0VmChq1NS1F9T7RnXLgjVAeEoCmQpAhHbCZGFNojeLkkqe32omlwoK
	eQMQbK4cPuu0qb2zZiP8DsS0ObOnXEBD5S8p5Bt/4o4IUzUD980LlVDJr1X3AG+vXQMsEAaJnYv
	VvZgCtT/TxpLE06LpAA3QWdtgvukRfRcQlFA3tBAYMyxGx5tlwUI+pAAogT3+hSju7t/Iy06tn3
	gKYxbpCyeQ2tOkMTGT5/dJo9i2dv3GGX1Bg9RDRo91LHizLoa892yGpnyX1B0O9uWglkYoyQri2
	upReFnRlrlF6qXeLRigBw82pq0NA=
X-Received: by 2002:a17:903:4b50:b0:2ce:b3e5:3249 with SMTP id d9443c01a7336-2cfa95213b0mr21245745ad.18.1784800832926;
        Thu, 23 Jul 2026 03:00:32 -0700 (PDT)
X-Received: by 2002:a17:903:4b50:b0:2ce:b3e5:3249 with SMTP id d9443c01a7336-2cfa95213b0mr21245295ad.18.1784800832306;
        Thu, 23 Jul 2026 03:00:32 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3149198adb8sm8920572eec.4.2026.07.23.03.00.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 03:00:31 -0700 (PDT)
Date: Thu, 23 Jul 2026 15:30:25 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Shengjiu Wang <shengjiu.wang@nxp.com>,
        Fernando Guzman Lugo <fernando.lugo@ti.com>,
        Ohad Ben-Cohen <ohad@wizery.com>, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] remoteproc: Allow shutdown of crashed processors
Message-ID: <20260723100025.75rgmzv2drb7ufgo@hu-mojha-hyd.qualcomm.com>
References: <20260723-rproc-rmmod-not-crashing-v1-0-546dfd5de0e6@oss.qualcomm.com>
 <20260723-rproc-rmmod-not-crashing-v1-1-546dfd5de0e6@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260723-rproc-rmmod-not-crashing-v1-1-546dfd5de0e6@oss.qualcomm.com>
X-Proofpoint-GUID: _Y1XW64HM3r82O1dkROGToXpMzSiiFAI
X-Proofpoint-ORIG-GUID: _Y1XW64HM3r82O1dkROGToXpMzSiiFAI
X-Authority-Analysis: v=2.4 cv=baZbluPB c=1 sm=1 tr=0 ts=6a61e641 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=olGLvaFp8OSokbd0vAoA:9 a=CjuIK1q_8ugA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIzMDA5NyBTYWx0ZWRfXzSggLPsM3GKV
 dG2p/O4Sd8HBe7MO0iE+As1LAUbG1m4e6jIpZM0iawgZ56IdFBuGGbmCHNdwxlbiL8ZNNNzyEAD
 WWkx/xiuHOMwNM4PGfb+l0Y/i3X6g04=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIzMDA5NyBTYWx0ZWRfX02clZw40u1v1
 rfgwtNTCFQhs+zq3IgF7j6HZC33MNQQIKD/gkJ3CMBs2rr58H/2+9Wkxzl3fD0U/7X2fTLkvvud
 MwV1idW3N+/S0gsufEvz01QRHI4xEAo+05DcQ4+KGlZMa3RVr1ivmfUoGdFFTJoRU8stJBu94tJ
 slWpsS0ZYhgEN3hukAIRxJbbE7Z4jpM+2s5tsoG3i7GOEunkCd60ahsMWlpmCARV+SGsfVR8W2Z
 rN0jegI9HjdPNETZLDWh95+CkoLnuFlfQ0C8U23B+XAXlIy3FB7NBrV46iJ0yHeWIJocrgNvYw/
 rSV86rMyIe9NksB7FoF/M37mzuf6ngyfihxSpEBDSdkGs2U4BQiQIyYpqyL03AvcSgCHOfgv4s1
 rsMNu+gV++gJYbTmMbbcZ5QMVpFcFhWa5CRY0LwVGpFsurvFFUn/qE1wmEsf1YwwQugZSqqLWRl
 vyI7mYg0e4S+bdP5ROw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-23_03,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 phishscore=0 suspectscore=0
 adultscore=0 impostorscore=0 priorityscore=1501 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607230097

On Thu, Jul 23, 2026 at 03:52:27AM +0000, Bjorn Andersson wrote:
> rproc_shutdown() rejects a remoteproc in RPROC_CRASHED state, and
i> rproc_del() ignores that error. The result of these two decisions is
> that a user cannot stop a remoteproc that with recovery disabled that
> has entered a crash state, and removal of an associated remoteproc
> driver will release resources without first stopping the remoteproc.
> 
> Allow rproc_shutdown() to stop crashed processors. Propagate the crash
> state to subdevice teardown, to allow subdevices to dismantle things
> appropriately.
> 
> Assisted-by: OpenCode:GPT-5.5
> Fixes: 5e6a0e05270e ("remoteproc: core: Move state checking to remoteproc_core")
> Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
> ---
>  drivers/remoteproc/remoteproc_core.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
> index 0583d3a56212..3cd4570513c2 100644
> --- a/drivers/remoteproc/remoteproc_core.c
> +++ b/drivers/remoteproc/remoteproc_core.c
> @@ -2002,6 +2002,7 @@ EXPORT_SYMBOL(rproc_boot);
>  int rproc_shutdown(struct rproc *rproc)
>  {
>  	struct device *dev = &rproc->dev;
> +	bool crashed;
>  	int ret;
>  
>  	ret = mutex_lock_interruptible(&rproc->lock);
> @@ -2011,16 +2012,18 @@ int rproc_shutdown(struct rproc *rproc)
>  	}
>  
>  	if (rproc->state != RPROC_RUNNING &&
> -	    rproc->state != RPROC_ATTACHED) {
> +	    rproc->state != RPROC_ATTACHED &&
> +	    rproc->state != RPROC_CRASHED) {
>  		ret = -EINVAL;
>  		goto out;
>  	}
> +	crashed = rproc->state == RPROC_CRASHED;
>  
>  	/* if the remote proc is still needed, bail out */
>  	if (!atomic_dec_and_test(&rproc->power))
>  		goto out;
>  
> -	ret = rproc_stop(rproc, false);
> +	ret = rproc_stop(rproc, crashed);
>  	if (ret) {
>  		atomic_inc(&rproc->power);
>  		goto out;
> 
> -- 
> 2.53.0
>

Reviewed-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>

-- 
-Mukesh Ojha
