Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6422527FB1F
	for <linux-remoteproc@vger.kernel.org>; Tue,  5 Aug 2025 14:05:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754402719; cv=none; b=nfESkSItzShCPSImEbPvYxLJ+wHLtfjQwoNmkX0hFpQDn8v/Gw1ZqwcjDfALPsJZkB0Ol9QoYugFt+GwOr21itjm+bOmJVJkWA2wC/5WUzU9Uk90OLE6zRhD40HctJM95dT4x47Iif/uRKvZ2uQ+WIXFauVnliqx3sMwYWj00Ak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754402719; c=relaxed/simple;
	bh=8J5cuWTNGNmnCmEFZreVGaQl+BFghG3/wBWhuX49l00=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fkfamZ9R/fGWEtvpkomqSut+NsF/LZv2EkLhUxH9KLJGn8lRYSQR1Npk8BrD9qPRiXCSZuW2zuIt2fyLzGW/V43SZ/LBpsK6ibBdrejl7vHU1z6gIeuh5qnd7E/i41arf/r+tWw0zrS4tRqGamxFUURWg4fDYlTnvHrgHiO+WA8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jAIMma6C; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jAIMma6C"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5757D22W003772
	for <linux-remoteproc@vger.kernel.org>; Tue, 5 Aug 2025 14:05:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=y8GWTLsDapJ06m9sj6GKQ34d
	0P33lgkh1NvaX1OZEs4=; b=jAIMma6CYw3JK3nfFf0Da2hkIb7nPW1Jh4bDgmtD
	5iw1pkAPLrNmwsi+f6MHzF+yZXpcqvNA+nivsWmTgTGBYZsyFEGHnZ6Z0C5WgLKo
	+UrsaTVsR3Hc2lBXoCXlKiULAlsfBm+nhYZSLvLhM1MECxBSCQIzQYtwqEhwEkkm
	SUHpQ9vVYlxAcPlFzel/7M8ThaizvIwdTPXXqqsufHLPnMeTT1EilxP+W6ZJKsHc
	C5z7N2AdRpr1WurFIipApsqpmD7uelP8DxdCKqXMZ8N9XgDUpIs4ptV4JDZ+vh3u
	eD4BQr9Qvh4D+WvpvJMBklk1m668AibdG7HQg3pQ7LjOIA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4898cjryg5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Tue, 05 Aug 2025 14:05:17 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-32129c65bf8so2936669a91.1
        for <linux-remoteproc@vger.kernel.org>; Tue, 05 Aug 2025 07:05:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754402716; x=1755007516;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=y8GWTLsDapJ06m9sj6GKQ34d0P33lgkh1NvaX1OZEs4=;
        b=XXHRSWvFYpvlR2iBHonWCmPNF9IJm/jxi7SSvcokwZhxxhAqhpVbt5Hj+dpIS4sySS
         tABR0bdBEzSaQtVQaCkfEiHPUghlIG6Zan3aszZ1QIGogEPYedbZDPZjh80BP6h9YeaB
         rIlOhr6J+JFgLrxAVfqUDJPxY3nnd4Z59/O7fDhcDXC1OwG/Pfym6JxRzHP9xtSYmfCy
         rtCGljYXwA7khQpSHL6QmWwbo4zvrgUwU5gq/wjNcVZjq+BTJG1gQFFFLO0pKF7UtqK1
         kPQOA6uxbQDEJRzt34WsQwMVnib6nguwX7Uy3c4Zxj7ttXu9MLPn4XYkL1b7+3ya9QkO
         pJnw==
X-Forwarded-Encrypted: i=1; AJvYcCWh2HCm4wNYgzpPeWqisNfLoEGyM1PpFD2iDszC6UiwXkgn6AhDGBV0VFIwdz5LUPOq2/C/BAU1yAlOYn0jWI1Y@vger.kernel.org
X-Gm-Message-State: AOJu0YwVEUYLWjd3RWYBPfyA35LHHruf1xG+4BwcX+7lUMehhr2R/gED
	XmsXxxO8C6mIxYcvpDIVoalAlMNAjT9rphWH3s5RX870CF0UcIeMm8oX3zY977dwQ+joIN75h4k
	g9hg0D7KvTl17k16p3x+nsChJ6cEWRY3kIVkT/EpdzZ44QGEghe0gUkwe1Ec/Mo9n4lInbZ6A
X-Gm-Gg: ASbGncvM/Po4Pgm05+54HopAxgTUd5t8IcaDbsEI7E+yVgkNUgqqQ/WVcy+fqSeg3Wl
	IWgjV54jh/lekhE8F9h4woHws2HLDdC5k1el8kH5JT7xVKuzsky5xYiOYMwhnDcj1140LbFkLBd
	fSeLp5MBfm/QkwYEl3Kp0SEhWh68K34UZe+zMcQ5/s1xsqSl3uwNzgxLhUvlBorzF4Nc6pCSibD
	StJe23Rwbq1kqMlxVPeC2RjvXDpzw7FoagTnmjBAjzZmP5ScJJJgJOgSL270lpQxpKhrIMGiXGY
	yJEcSZjcO/PAV3cfcJsGT79xCh5tW9GuO4Yd5uZVvKftpTa12/oC5v0Fr9/UvVieyPY=
X-Received: by 2002:a17:90b:3e8a:b0:321:3715:993 with SMTP id 98e67ed59e1d1-32137150ad5mr11688565a91.14.1754402715848;
        Tue, 05 Aug 2025 07:05:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHjmfwajEFNC0n/4JWnoR261FA5nFMX6Yqgmg9OjOOyA6BAlGJkbJzfB308KbNyUV9w099bVQ==
X-Received: by 2002:a17:90b:3e8a:b0:321:3715:993 with SMTP id 98e67ed59e1d1-32137150ad5mr11688449a91.14.1754402714757;
        Tue, 05 Aug 2025 07:05:14 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-321611d846esm369077a91.8.2025.08.05.07.05.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Aug 2025 07:05:13 -0700 (PDT)
Date: Tue, 5 Aug 2025 19:35:06 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Vikash Garodia <quic_vgarodia@quicinc.com>,
        Dikshita Agarwal <quic_dikshita@quicinc.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Jeff Johnson <jjohnson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-wireless@vger.kernel.org,
        ath12k@lists.infradead.org, linux-remoteproc@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Subject: Re: [PATCH 2/3] soc: qcom: mdt_loader: Remove pas id parameter
Message-ID: <20250805140506.b6d2x5berkss3it3@hu-mojha-hyd.qualcomm.com>
Mail-Followup-To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Vikash Garodia <quic_vgarodia@quicinc.com>,
	Dikshita Agarwal <quic_dikshita@quicinc.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Jeff Johnson <jjohnson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org, linux-wireless@vger.kernel.org,
	ath12k@lists.infradead.org, linux-remoteproc@vger.kernel.org,
	Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
References: <20250804-mdtloader-changes-v1-0-5e74629a2241@oss.qualcomm.com>
 <20250804-mdtloader-changes-v1-2-5e74629a2241@oss.qualcomm.com>
 <658d7d55-fd5e-42cb-bc5d-abcc0b47a168@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <658d7d55-fd5e-42cb-bc5d-abcc0b47a168@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=MNBgmNZl c=1 sm=1 tr=0 ts=68920f9d cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=9ZXyijcKk7BvzWFVFWYA:9
 a=CjuIK1q_8ugA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: 7bpgn-mnBInBcIRJZV8f2JUBrq0WKFCO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA1MDEwMiBTYWx0ZWRfX/qQhsxBWpIs+
 jGgaFxDkt2iEu2PL2dfozheVEcQst/PE1ZqlXak8Tz4rV4EGq6B9aWMutDoEj4NRA8L72hOWfBh
 jRs+HVqNIn+J3WX8oonqAqp3PLYUEkHlFgkYzcNK/ypbHry/zapkmWNDdS3xvv9I9SxcFbtggXg
 SBLGxK0nWL6Wk9nfDEue98RWjTA4y13t4uXGcSHusOl4IU2z11fOcJcMh+4tM/4OqN33znTYt9n
 gu2cM2usdOnUefK9QeODbRfLTjcNyBEVMayixtWtFVyjhK6ueoeXZTn8D4TKOdzJMrt8uIgPcHo
 kfEWEQszFWjQJn7EgV1+A2EPVdsJmNlS3dAzRo4ZBEVjKYa3ohhjmEcw1b18p/7h/Zlvk0+iN5J
 SiPOUfKQN04zNlgGmYCfcz02WGHWtaFcCis3pFq019eQfD3BcDuSCy0mzOYkINWTUH2QQq9T
X-Proofpoint-GUID: 7bpgn-mnBInBcIRJZV8f2JUBrq0WKFCO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-05_04,2025-08-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 phishscore=0 mlxlogscore=911 suspectscore=0
 spamscore=0 mlxscore=0 priorityscore=1501 clxscore=1015 adultscore=0
 lowpriorityscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2508050102

On Mon, Aug 04, 2025 at 07:17:02AM -0700, Jeff Johnson wrote:
> On 8/4/2025 5:41 AM, Mukesh Ojha wrote:
> > pas id is not used in qcom_mdt_load_no_init() and it should not
> > be used as it is non-PAS specific function and has no relation
> > to PAS specific mechanism.
> > 
> > Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> > ---
> >  drivers/media/platform/qcom/venus/firmware.c |  4 ++--
> >  drivers/net/wireless/ath/ath12k/ahb.c        |  2 +-
> >  drivers/remoteproc/qcom_q6v5_adsp.c          |  2 +-
> >  drivers/remoteproc/qcom_q6v5_pas.c           |  7 +++----
> >  drivers/remoteproc/qcom_q6v5_wcss.c          |  2 +-
> >  drivers/soc/qcom/mdt_loader.c                | 14 ++++++--------
> >  include/linux/soc/qcom/mdt_loader.h          |  7 +++----
> >  7 files changed, 17 insertions(+), 21 deletions(-)
> 
> Since this patch touches files which go through different maintainers, do you
> have a plan on how this will be merged?

I am hoping,  Bjorn should be ok to take this into his tree ?

> 
> I can ack the drivers/net/wireless/ath change once I know how it will be handled.

Going to send v2, please ack it, once we have confirmation on the above
question.

-Mukesh

> 
> /jeff
