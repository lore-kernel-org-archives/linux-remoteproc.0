Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EE794582E6
	for <linux-remoteproc@vger.kernel.org>; Tue,  4 Aug 2026 11:23:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785842641; cv=none; b=DEc+iAUSphDZue95wdsRpZhLSSAVIcr1YSKL6qQEjDcu58lSXZzg0RTVPpx3m4e72cUPy0WZap7Bmhdb8aa28D7JqaXF81gwgVqk6ZqE51TGa8nQ5nP5zV9fcx7CN7xHDbHYDab3DypybdVNCBDva7rdhe+lMk5kaJrG/D10WUY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785842641; c=relaxed/simple;
	bh=dSqYtsfKFijnCsZOZ95MAlgSqmBheENypsz4hHbUyh8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tQxfmWyRnoqjKkPliyO/7Rm7Gj3MHmVxgrSy0LIQ3EeFGw8EfA+Ij/QyYc27Qc6vu/pY0k6T1glR1PUHzaG5NEdhN2pNo+h0eEp2OFA/z9ZFUNZdlZ7QvMis8E6+am0a9WypMOJpAAh6vfk+hjf7N+5CwU/I/0HJSqA1hGaBNAk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pSzp/OZz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bE+RH4lD; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pSzp/OZz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bE+RH4lD"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6748CBDp2978751
	for <linux-remoteproc@vger.kernel.org>; Tue, 4 Aug 2026 11:23:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=z0kUAmeOvZB7aq8PtBEq+wMx
	JDgcUdO8yHMNm6TSqSk=; b=pSzp/OZzOLPvvX8qCOl7hxQw8WODYbzWyC7avT22
	/vLBctRDf7OW+L8cMKXa5izb62xlTCrjp/VW1O2QTYtpJvOKeBBfIkrWKXu0qYHz
	dIvHoNEmp7FWDKpouUjo8eyS562SK005iHHN4/DD3vTEeD45F4LlF/sfXQYf81ul
	bMOMZ6egnuAA76Pcz4WTTQE0D3KxFE+8JZ/KQHnw2t3UnACPJp8rdYnbHD3AS7+f
	1+q6gUc/Z7vMlJi7cLpohfARu7uXk8JfHODNAYsMCIBCXBt+tXAjLaI9yS/098r9
	8NMqhNOdNnvUKdPG0Gc3iuCX9qmEfSOAnAEOyH1AJACeMg==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fu2syjxf6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Tue, 04 Aug 2026 11:23:57 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c89704da8c7so6960087a12.0
        for <linux-remoteproc@vger.kernel.org>; Tue, 04 Aug 2026 04:23:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785842637; x=1786447437; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=z0kUAmeOvZB7aq8PtBEq+wMxJDgcUdO8yHMNm6TSqSk=;
        b=bE+RH4lDvxi2tkbYHI2r5iJjPKkl6AuKEAxpR+yJfpQYjot3HKMnHPgCPSgpQ1k+lm
         TqOB9Ji8spnknE2JQnK6H8X2TesY7kNUxkoZ1u1E8+7zfoU0+9XlLoyQWW8dVH4L5Y7m
         cKBynzoV94VQT8umZbeEQVQW/Dbx3ce/qu5/qt1BWw9To7xMsmFbM/q9X4zaCYY7nTNP
         sSEffEBph/omQ5Yz5xXQ5anShjqzgVn7DOCLEIUmC4K8L17sB5gwEANlEUVx6iI3ERDr
         jeDhkD0EHMlgstqBtAHOHIHi71ji9sIDCE60Qa8gS+pCNvl3tEY1klscqwpfc0xajKKp
         VrJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785842637; x=1786447437;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=z0kUAmeOvZB7aq8PtBEq+wMxJDgcUdO8yHMNm6TSqSk=;
        b=NJAMTg3/KJ/GOWSsYckiyz8wESwQuC3kt3t1uuBDt4e3qKMnVaPtyv16m9nWD66fCD
         bh/5DsmUg3CGOH84ZamhRZDLVOt92y3rWxCTQTtj9o+nHVCw0fBTo/f9vrY5rhjAMztY
         WzN+F6qjh3ynvqvev6s4WnWbTpdGkXOuVCl7y2EPYx4mt8TJ3brQNW87Tu+z5wEZ/7F3
         XGpgAplM9MG37l+VAEjyGume1Czq76UnBWyVnuZwAiR5ZfMGDU+wM6Aq2Kk2SLEy+RSk
         n5v5wiVLmlmnApL78B4ewhW+vUCeR6tWztBifXVzh22AMqxXSwEAOkHcHhmhshQ7+ZP4
         HW2w==
X-Forwarded-Encrypted: i=1; AHgh+Rp8ckbIsGx9Xb+zaUT3tHlehDdOEIAa+Und4jGX/wCAvsGq53ng5ULbR979TB1VhsHghDc/xwkG0aXj8Mzb9JhO@vger.kernel.org
X-Gm-Message-State: AOJu0YzPfkBjrdaZy0j7tM85+8YCM+b/i7fP2XuG64jYpuJOQlGYqVDA
	Boc3WgJ34NDs/+N1NjJq1gpOEB7sabkx6Kyt8eAI4R5zxSBlcYSyX/L8ro1VAgLp7NJDI+vYDnI
	fOxNVOyu2MRpCEIcTGMC7ToYC7RLlSQQzGFSEUjiDMpjJFkk/UNCEDBuH8tyYrJU57BrvXBUc
X-Gm-Gg: AR+sD133MfjS+JGpa3pKu6Jya6jwLUO1CiuYlk1q8nuiakQmaXejhBH5CE49zAoJAkl
	pZdm6RHC/JqM19xZzmioyY07xS+RkAn/hJToli5gh0V2AnI5/0P2IQUDBbXkK+I/qLZgxA1bAMm
	mWiLzCh+w3unSfa2LWeXZLHn2dCVuXpxJ/0ZoFNbFCQchCHjdWHmUiKTehcR5J6tS6oOOakyVJH
	U5yWW6GIO1q0HZ9qFVWte2KQk31wjd0KMP1z8ndawm2GkcW7UPDVVZ6UOWnZNOuhdGtuOzxJG14
	vuweHPg2sS+QGnt34TQkdajKCtFDqXN64yJZOTXaEaNLt88qqQao0gZ4xRaeT0RkiuuwlkaHhw/
	xMgK1uZeLfbsVguZitSKWxCQLDeSFYF76lFae5EysRnOZszAl1xqcj5vQlpjtSkNQuY8l/+XVhg
	GQNaUbt6jUTfPxiLHiMoEgCTXAPydG1g==
X-Received: by 2002:a05:6a21:9cca:b0:3bf:6c08:fba7 with SMTP id adf61e73a8af0-3c92a84ec9amr14379010637.59.1785842637160;
        Tue, 04 Aug 2026 04:23:57 -0700 (PDT)
X-Received: by 2002:a05:6a21:9cca:b0:3bf:6c08:fba7 with SMTP id adf61e73a8af0-3c92a84ec9amr14378980637.59.1785842636763;
        Tue, 04 Aug 2026 04:23:56 -0700 (PDT)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3158673be4dsm5730394eec.16.2026.08.04.04.23.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Aug 2026 04:23:56 -0700 (PDT)
Date: Tue, 4 Aug 2026 16:53:48 +0530
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manikanta Mylavarapu <manikanta.mylavarapu@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Gokul Sriram Palanisamy <gokul.sriram.p@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Vignesh Viswanathan <vignesh.viswanathan@oss.qualcomm.com>
Subject: Re: [PATCH v14 1/9] firmware: qcom_scm: ipq5332: add support to pass
 metadata size
Message-ID: <anHLxOdGJwChDnEz@hu-varada-blr.qualcomm.com>
References: <20260803-rproc-v14-0-a1f87b0b0ad2@oss.qualcomm.com>
 <20260803-rproc-v14-1-a1f87b0b0ad2@oss.qualcomm.com>
 <20260803123537.utocak6hvhl5ijqh@hu-mojha-hyd.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260803123537.utocak6hvhl5ijqh@hu-mojha-hyd.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=TIh1jVla c=1 sm=1 tr=0 ts=6a71cbcd cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=W_EDbNz8WyltxIkMcgYA:9 a=CjuIK1q_8ugA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA0MDA5MCBTYWx0ZWRfX1kdx6lGzpMm2
 78AEl+boL9NeGV9ayhTuN9nNY08aer+LEgxiLxLsONnw6FnsLA7J9m1mJWhnhbsbkMjqjQ1/3lC
 g0E0dECXzesoxkJ4ojG20lEZc61rymY=
X-Proofpoint-ORIG-GUID: xMQ7QkWOz6HOFtYV1FXwNTLVOzq6o8yi
X-Proofpoint-GUID: xMQ7QkWOz6HOFtYV1FXwNTLVOzq6o8yi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA0MDA5MCBTYWx0ZWRfXwTnC9wuBDlDx
 wAoXarGH3JRtZZB7G+0KEqpc72gAnqpahl8sM/2/vfLfwrLEwBb3N/ERlTy+hSKvwvqPL4fDqkl
 gMePLo3/vABQ84Iv5Fbh0LJhWWI+TGF2ib/8MmGMfmUglPNV2JU1krxK3/9mW/Hr+W8DUfSebzI
 XZnxUgyZxP4gslUrhDwEii/lQSZHtiJYmhPw6Z7c3Oxs0AIcXnYGxyhsXNk23vH1xTUQBpdMIEJ
 PMf44fgY2R1+UayeYtsYu5kLW2wk0qcGOpuL3mWP8s844sKXi3tXMDebWo3uLpfZBt1XMUCE/4H
 pmp0CgCmi2qYoLNiT7eBAIkvioVq9DCkYUgRLjrjSvdQ16pioc778bj8NXNjO+LuLyLBkRGR1EM
 dnsKT0U2xpCCfB6pG1a3mF6jeE2BMwDxnGcsxkg6nseuAIbzfxAw+Mt5s1HUEmGcVkKiPD3LVau
 0h7+MqKyWU3BL/9AhPw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-04_02,2026-08-03_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 phishscore=0 malwarescore=0 spamscore=0
 bulkscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608040090

Mukesh,

[ . . . ]

> >  	if (IS_ERR(gunyah_wdt_dev)) {
> > -		dev_err(scm->dev, "Failed to register Gunyah watchdog device: %ld\n",
> > +		dev_err(scm->dev, "Failed to register Gunyah watchdog device: %pe\n",
>
> stray change..

Based on AI feedhack changed %ld to %pe to print PTR_ERR.

Thanks
Varada

> >  			PTR_ERR(gunyah_wdt_dev));
> >  		return;
> >  	}
> > diff --git a/drivers/firmware/qcom/qcom_scm.h b/drivers/firmware/qcom/qcom_scm.h
> > index cf90a565fdfb..e58c76aba45c 100644
> > --- a/drivers/firmware/qcom/qcom_scm.h
> > +++ b/drivers/firmware/qcom/qcom_scm.h
> > @@ -105,6 +105,7 @@ int qcom_scm_shm_bridge_enable(struct device *scm_dev);
> >  #define QCOM_SCM_PIL_PAS_SHUTDOWN	0x06
> >  #define QCOM_SCM_PIL_PAS_IS_SUPPORTED	0x07
> >  #define QCOM_SCM_PIL_PAS_MSS_RESET	0x0a
> > +#define QCOM_SCM_PIL_PAS_INIT_IMAGE_V2	0x1a
> >  #define QCOM_SCM_PIL_PAS_GET_RSCTABLE	0x21
> >
> >  #define QCOM_SCM_SVC_IO			0x05
> >
> > --
> > 2.34.1
> >
>
> Otherwise, looks fine.
>
> Reviewed-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
>
> --
> -Mukesh Ojha
