Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C383F364046
	for <linux-remoteproc@vger.kernel.org>; Fri, 13 Feb 2026 17:26:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771003578; cv=none; b=aNou+v7STq3C8kbZgaVKJ3iD1bzr9T0lomihQ13on98pZFjYutCLoJ2m6dZOwh6v6bOX1g0RH2c0jGFOjOL/iIvyMJlmMtgIWtyva4+sELAP9zJBtWgT91cuy+1YOZNmtxmLi13fOEnTCA1sv6CKc1pJgUPiWJ6x6gIeCn9+PKQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771003578; c=relaxed/simple;
	bh=8TrtvTTNxEeTZRhHNhov12JjgRtv4ZwgGGXZZshGtZ0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GlZeHoRYq5bYKMIjgT46V4VS5kW6qWyva6LIZlrtSRy4MYkCSLHscbD4LVevIhOKMB1gL5VwJuemWW+Q9IAma6WIDDoc4BSvvN54c2OfMXTMoZfVuPIw9IxHeMeOsODwGtPe78euJkDUk6A+QZ7pmowtxDT8kLJU6FUWOZNp6qY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LzxnnhQM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aI7CLAfE; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LzxnnhQM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aI7CLAfE"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61DGXVTm2733479
	for <linux-remoteproc@vger.kernel.org>; Fri, 13 Feb 2026 17:26:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=PlyFBbUQVp4HXtMNveiNXCmc
	cPJmA4dANJAQzvSFSd4=; b=LzxnnhQMWq8v4mvI7kOskpP4MA50gxkKqLKzinXr
	S7f77hh4RTgtGZOaMXMi6ZxiHTfUKIx0Y81tVBiwmmbWtJkwIb7gg96/viLZtBbe
	e6rcZbnlTz7131c1R8iEaxwYF3ZxA89KQHqRgHl4EnxKRLQGsWngOqdGL+zyQehx
	OHMGHkJQ7aCZUVTLvLcR+TyQY6SFHtOw0XbkxqSJvPJY9i3EuyXqlZR1m5D7Ae/i
	jsOaDcSl1HxGnX/YtnEQZeiQmvIX1XGJhzrg4YX3rftAMWHNncc0Z/ZSUv9t6+MW
	5G2lRjtYA7zwzj+ty4e47Y7rX6YJC3y2IAz5Kw6mUik2qQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c9s6wug3y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Fri, 13 Feb 2026 17:26:16 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8cb3ad1b81aso593527885a.2
        for <linux-remoteproc@vger.kernel.org>; Fri, 13 Feb 2026 09:26:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771003575; x=1771608375; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=PlyFBbUQVp4HXtMNveiNXCmccPJmA4dANJAQzvSFSd4=;
        b=aI7CLAfEkiNC4BF0DJwPAdUpWXwPPrn0YKMj0nYN+4UTpxxq+vxuRvZ+qmOj94Bh2d
         xrxwQ4bfVv/Ur7XQMTaJxJT7eosqOqo3dw6OWnlzxLDG5vImhVe0sfSdVOkEk2aA+azR
         J1tn2Ovohc6aZdpHulgL3blupQCf6/It/o0QD7Wx3n5qha/p1Rvfu4Y/2QZQpHFYejPC
         I5neJdoolcaK4e4YQOM3tVeQiAw32URn0x//Jxkenjdf3UiLWBB59aGKJFKqpxqAIxXJ
         8dVoNfDiQlMAFv/MiwETpRtI284FUJl1bGHqePBP8LgaKXUrn9ImyS+NfZf54l9Wd0Yb
         tKqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771003575; x=1771608375;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PlyFBbUQVp4HXtMNveiNXCmccPJmA4dANJAQzvSFSd4=;
        b=g1/z6FRBnLHh7E4c6jepldyp8fIDXqR8qtU067yMUJqOy8pf5g4H6mHCRtsaDbXVxI
         I1oiWYTvOP8Lf1BndIo/NC4tgB6lnM3JcOW/JVGiF2lwKPb3vNGtJJ0ZjaRKRbu9VVRT
         LIQo1uvucd/s8B2Fwf7jrotr5Dx79wvulrKn5hQCC2H+Zl47HChMl6JiDt+0t06PJuFt
         YQQgQ68YYNhdo9VevxR1Yid+ilgyk7OczQC1JOkYVnPuOoMTqnEqvGlUnLSWs66U4oK5
         zd0c8GRMMQTHKLuDlJPCHTnJCihGvV2IHOYezAsLdwXZb1eEIcoTylZlZeudUZJncFcf
         df3g==
X-Forwarded-Encrypted: i=1; AJvYcCWytntHTVprv14yYDJoU2m0HIJQ21WFVqSqdtU9csSpQ1dldr8NYE954l6VpSskKzalhh8xY+8KheXyXDm2J6o5@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4TbN85NGk+KqhcwMaA5nvz/Qi8jSlRvxGj3KApEQ7bUUsEALi
	pTe7UyQTxnVNVHDp9jyUAfutbLQB5Yd9JsUDDnKaWtqw/dRrP/Iuvr20SMRxCRDnCuL5WZkMIkR
	vsLSvIZpr+eShZf5AuqFs5VJEvIGQkrFcRIGspgDYP9EVq6Yh3mMQ/4YMU/KwZbBd+SvvhiFh
X-Gm-Gg: AZuq6aK5IBVBEI6uCNr6wAhw5JpT17L+6kGSmkH35RO5zXMpRd2tADI0a58MaK6MCZt
	+GVjTQOxDEXThFoQLOBweyCT8EkAXR8xe/1T2FAxlxb8XSdvE69Jp6wtJMqWeLpKBNyzd/kjBrp
	sxsSPvFRrNylsoG6tBK8sYqLE5emgYuyEvrVUt9dtULM+GyNy8aEAKWj+0QpExT3mKAceq8bduD
	bqaJFfAY2iHH/KI84Ds1Qs2xTCRyqINKD+uEGIio+5JTCiwrDF0lHuTitOQQauH5D+K72IUgypW
	hZRf2k/VSCaRVaPnB9Tcxmmp1JbWrGaFMuy+OMRaMwH+ZUJHgGWjbOHxjHbd7a6qhR+Vy0a3Q5c
	22QVBmZLX/eyfiULxMyVQUIaDJ4o6g0g7qeT3Jmh0kKGp4ZgWcVqbhGnvNFFjGgYGHk7xgpddNh
	Rw+f3WgiuATnwy58Q4JftdaX0d5BdcK+M93hY=
X-Received: by 2002:a05:620a:280b:b0:8ca:1107:1214 with SMTP id af79cd13be357-8cb4bf97ce9mr41051685a.7.1771003574986;
        Fri, 13 Feb 2026 09:26:14 -0800 (PST)
X-Received: by 2002:a05:620a:280b:b0:8ca:1107:1214 with SMTP id af79cd13be357-8cb4bf97ce9mr41047885a.7.1771003574496;
        Fri, 13 Feb 2026 09:26:14 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59e5f563054sm1681135e87.1.2026.02.13.09.26.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Feb 2026 09:26:13 -0800 (PST)
Date: Fri, 13 Feb 2026 19:26:12 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Cc: andersson@kernel.org, mathieu.poirier@linaro.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, konradybcio@kernel.org,
        quic_mmanikan@quicinc.com, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Vignesh Viswanathan <vignesh.viswanathan@oss.qualcomm.com>,
        Gokul Sriram Palanisamy <gokul.sriram.p@oss.qualcomm.com>,
        George Moussalem <george.moussalem@outlook.com>
Subject: Re: [PATCH v10 3/6] remoteproc: qcom: add hexagon based WCSS secure
 PIL driver
Message-ID: <ihgkjbcrxiutww7xrr2nksakypyhmukhnpeiukhf2qfnn42e7k@npacu2x7eig5>
References: <20260113092021.1887980-1-varadarajan.narayanan@oss.qualcomm.com>
 <20260113092021.1887980-4-varadarajan.narayanan@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260113092021.1887980-4-varadarajan.narayanan@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: W16CdiC6VLFDIDnidZger9h46U8IgaG8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjEzMDEzNCBTYWx0ZWRfXwG+HCbBgOeMA
 Ac5fbqR7Gh3n+P5tIWr8aCz5nKgzHffowsWcujKenlBb+zNEjSrg8cYAB6A12/ynpqtI01JmRgM
 n9Uay/0WK4HKJ7dfu5IB85sf1VVSjRsqc8v3/q2vLVaNc6ObWbQnrmi66krwmyzTTNmF+tau4zN
 VjOajRq9z+EObMcfkAqAcJWrRX62naLUnjX5DMYGnKeHmQ0xkXF/esLrg2o/FndLldEcv8/Seb/
 oVMJO/uuMK2bDfI9LbQKOr668rOU3HQlFECU7RDAnm8Q6pWsCHyktcKAzEOBbAH8Ycf843vhAta
 dvQQ5NTEc/LepgyILlIsCZAzlXWDnzGZL+OB0nqKWhdGBkzk6G6gF2HqsnG7dbg+ClwTzBa/4tw
 7E3kPy4BKPHaXNt2FEkfxqbbWLnsmvTa7vP8pAGFP1iQ2aMh7su5TnmabHgjuA0ZFe45oFOvj2I
 hKbQJ4dRy1pErnFoCcw==
X-Proofpoint-GUID: W16CdiC6VLFDIDnidZger9h46U8IgaG8
X-Authority-Analysis: v=2.4 cv=CLInnBrD c=1 sm=1 tr=0 ts=698f5eb8 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8 a=UqCG9HQmAAAA:8 a=_028WNt5gqhadA5UqRUA:9
 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-13_03,2026-02-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 suspectscore=0 clxscore=1015 lowpriorityscore=0
 malwarescore=0 phishscore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602130134

On Tue, Jan 13, 2026 at 02:50:18PM +0530, Varadarajan Narayanan wrote:
> From: Vignesh Viswanathan <vignesh.viswanathan@oss.qualcomm.com>
> 
> Add support to bring up hexagon based WCSS using secure PIL. All IPQxxxx
> SoCs support secure Peripheral Image Loading (PIL).
> 
> Secure PIL image is signed firmware image which only trusted software such
> as TrustZone (TZ) can authenticate and load. Linux kernel will send a
> Peripheral Authentication Service (PAS) request to TZ to authenticate and
> load the PIL images.
> 
> In order to avoid overloading the existing WCSS driver or PAS driver, we
> came up with this new PAS based IPQ WCSS driver.
> 
> Signed-off-by: Vignesh Viswanathan <vignesh.viswanathan@oss.qualcomm.com>
> Signed-off-by: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
> Signed-off-by: Gokul Sriram Palanisamy <gokul.sriram.p@oss.qualcomm.com>
> Signed-off-by: George Moussalem <george.moussalem@outlook.com>
> [ Dropped ipq5424 support ]
> Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
> ---
> v10: Remove unused members from 'struct wcss_sec'
>      Remove glink and ssr subdevices if wcss_sec_probe() fails
> 
> v8: Dropped ipq5424 support.
>     The comments related to 'use_tmelcom' in [1] not applicable
>     [1] https://lore.kernel.org/linux-arm-msm/72f0d4f7-8d8a-4fc5-bac2-8094e971a0e3@oss.qualcomm.com/
>     Changed copyright for drivers/remoteproc/qcom_q6v5_wcss_sec.c
> ---
>  drivers/remoteproc/Kconfig              |  19 ++
>  drivers/remoteproc/Makefile             |   1 +
>  drivers/remoteproc/qcom_q6v5_wcss_sec.c | 325 ++++++++++++++++++++++++
>  include/linux/remoteproc.h              |   2 +
>  4 files changed, 347 insertions(+)
>  create mode 100644 drivers/remoteproc/qcom_q6v5_wcss_sec.c
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
