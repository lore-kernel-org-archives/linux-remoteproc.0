Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71899214204
	for <linux-remoteproc@vger.kernel.org>; Sat,  5 Jul 2025 20:57:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751749043; cv=none; b=p0Tm1J+P2eNi4qsM87EVF2+/TGRh9yHxY1s258IKjnKBzGrvx93BhwDT4VfuqtcRUVo/4xwKdTpA1GseYX0JLnTxWW1dqAKsvs6v+ap3D6dvFFg2BAlxsF1zTh0U7eYIjZNbKbPgeGKf7vThzahrQwpKT2gURvYlf6+9c2K4PKw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751749043; c=relaxed/simple;
	bh=yd3QB9i6892Oi/RELZQPA7eTy1+ck7mvWaDjNXHvHaY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tDUh8ZzhQy1SBxVb9puhu7adBshYkm8XATQvFohwjhdrEhGsVEiefwSMxmCbrd/WHNvJCp7lOnmtBUP5VTEBzmJU3580HYZqkCSj3PZ/riScpaPV3M8fY42/SmlNV11F8hrUhL/JtCwrdrjET8prlghdrYo5f9ES1Jzv+CrClVY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ElYaW0ug; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ElYaW0ug"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 565JZNOu013346
	for <linux-remoteproc@vger.kernel.org>; Sat, 5 Jul 2025 20:57:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ixkjiJJ5xJZnwXwbUy5Cg/AO
	bRkh+NRxwTSQlLi8b1c=; b=ElYaW0ug6LU0UeA2xfo0yGyIvfeLfPCN7rTkYyhb
	ZYFBtjWrj4+qPIfe+3wx3aDg3IwmwrOVgGHEeFA2stdx4Wo9EC2/JHd9bdcOL1+A
	NLd8cC/rrXyDIVVxTbi03o3+B5+nwRa3Y9fg5Adw83+ZfPYu2BCKSpGn9VS16mjI
	bYIM6lpbrvzryEnKquVFG+c5GFgYeEshxd4qEdkeShd82VqXZdREUA7V+nk/DJi0
	uzr61JCebhW9udhyFfXviCWrkduuMfxJQ2qRqcZ3amavnvm9p5tLGvKLh1OPFGVf
	EaqJO2k3bKAxt9hTG5D7GR+47BDd0rqIlF7Z2txQymKX6w==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47psdqa9a3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Sat, 05 Jul 2025 20:57:20 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7d446ce0548so321044385a.3
        for <linux-remoteproc@vger.kernel.org>; Sat, 05 Jul 2025 13:57:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751749039; x=1752353839;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ixkjiJJ5xJZnwXwbUy5Cg/AObRkh+NRxwTSQlLi8b1c=;
        b=V+wwOBEPOTcCxqsBIob5myiiZYJD0Bsc0DbMaAG+4IpcsIoOwo4x9CGvBjUmABjBlS
         HDYIW3IyeQCj+Z2eSJZIu67RWi2TwvDJhcfppMCyPDddp92jTaC6bzyrYkcYhW2YxeAG
         FH4NOc5MbVJMmRgwFhrBSRsgWWasRH7bbX36N7MaVz2jYWkS50UIrSpl4QfzSYquNlcX
         As2Jq/pyvJbQgqDxUyfZu9qcRKtVL1hzzcWcshZovcCZhauFDm9YRm/5KfAdKgtapiCu
         RUI+epvC3iPVtQasXRXrFp0We84y0ID3LeL3qmZqKdmhSnlCSVopBq7DM83XIsJMNgu/
         MoGQ==
X-Forwarded-Encrypted: i=1; AJvYcCXs5bCMtGge2FGo0bIezzuue/zO9CvTb3QGLt3NN1qSPtwL1pcuF1RWrvgeAiJIn4IIQkw1P3sFDuY9KaH89GlX@vger.kernel.org
X-Gm-Message-State: AOJu0Yyh+Sup8Zd9ZJ2x0BOi/OwWpdJHSO2/kn46c2IavVVk8tP67ZDb
	7gTLA2o4MsaKWF3cibA7ODzqqYxlyxIDKykPvKSDIl9aVo99x06E5Hd8FlzBMpqvVhLZCkhstje
	5kx4HTA63ojAfxiSY2SkuJBr2cVz9QgRCbbXrQ8RGx1lp4YwLoM9tChI3krTYW1yWSk7mF+St
X-Gm-Gg: ASbGncvlL24SgfOnSYIkCsRg91E4MFNZ9K4O5KCKkk/V+zUWjnAfv/8q6+PanqSWwoP
	1U9we6BrkGYdAXrR6OsSqPzd4yZwtAViZGE5rpMqGk9SGRQ2xrqZh/VaiHZd/kZ6jCRNHprTm89
	VwjLqik4TAlfbsqKfPAWAgxmQGdXyLxfLt7H7l5GO2bVB+yLTcvDLS8HdAa6Y2+XP8E+9lQqeuN
	9kuR8syvqrYpIVi6dVSN/lDosStrF2oI/Ty0SzKxIhvvK8fFW6moI3ieR3FdxrQIbOu5kmrf3B9
	DHbUS43a4sHrhs3/zuBs1DQnnWT9Bjql6iIs7HLknWJqZ2OFmBN9D9rfe9s0rCVj2FFzgXZselA
	r1/PNNRhzlABWZaQDXZRNDVyBgkKHKNKvVoA=
X-Received: by 2002:a05:620a:178f:b0:7d0:97a6:4539 with SMTP id af79cd13be357-7d5df10425dmr744840785a.4.1751749039470;
        Sat, 05 Jul 2025 13:57:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGM59TkO8u8/py6MOdyXPISy6kh3KQYZz44Fii7ZoY06xkcbs1OMh+BhhFj9MBNEaem6Skz6w==
X-Received: by 2002:a05:620a:178f:b0:7d0:97a6:4539 with SMTP id af79cd13be357-7d5df10425dmr744838785a.4.1751749039059;
        Sat, 05 Jul 2025 13:57:19 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-556383babd6sm705164e87.32.2025.07.05.13.57.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Jul 2025 13:57:18 -0700 (PDT)
Date: Sat, 5 Jul 2025 23:57:16 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Luca Weiss <luca@lucaweiss.eu>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/4] remoteproc: qcom_q6v5_pas: Use resource with CX PD
 for MSM8974
Message-ID: <hwewzj4ygfbb22vxrahjfc3b4oxyagh3nkd26bs3p5k2fcxr6m@mkgtyjkxz3d7>
References: <20250621-msm8974-rpmpd-switch-v1-0-0a2cb303c446@lucaweiss.eu>
 <20250621-msm8974-rpmpd-switch-v1-2-0a2cb303c446@lucaweiss.eu>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250621-msm8974-rpmpd-switch-v1-2-0a2cb303c446@lucaweiss.eu>
X-Authority-Analysis: v=2.4 cv=ffSty1QF c=1 sm=1 tr=0 ts=686991b0 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Wb1JkmetP80A:10 a=dlmhaOwlAAAA:8 a=l10-tqhT6-g9Bduh0oQA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=y4cfut4LVr_MrANMpYTh:22
X-Proofpoint-ORIG-GUID: X3JDbRYrlZdqVI8EmuA3M_swyTILpNos
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA1MDEzOSBTYWx0ZWRfX9W4HauiNEjEZ
 WKp9Hyagbh66HrWZVy5kyJNkj32bKncoOVeQqQsaIgUtPqyaPUoYA3fTk8OZsfLZOmdwZ7TEX+P
 j6ZpwPIW465GTPwWeExYQ3kTqrYky2qcYSqtukRmqMuMsYL7OX4HkY9i87d2W7AYOh2UUf2ccrR
 mQQ9Py+bOzWXDdMX7a/Eah2QOPdIHEs53EWiGWKAQJ9uZ6yoR7J5+cN8XWTbjnBWZ983U1FwWni
 IMeZShgoWbRFgxIOZ6HA2NuuOLW1DJGAx89mxG9NEhTCKrPG7tjp8vD8dv4IOpcXTUXCQ38rlgw
 FYX4L6/yUzNPybA6ZxkkqteRV2sLrMqLze1NN8N62nhFzlZ3h2xvYCMcfMaDWBn6hLVcypSh1SK
 /MZQxc8x379qAgiLpH+cgU4Thm4wRI3ShovZSPojp+HFLaaa/7ohbwkVZGitBRJ88HmU8O/o
X-Proofpoint-GUID: X3JDbRYrlZdqVI8EmuA3M_swyTILpNos
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-04_07,2025-07-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 mlxlogscore=918 mlxscore=0 bulkscore=0 priorityscore=1501
 phishscore=0 clxscore=1015 suspectscore=0 impostorscore=0 lowpriorityscore=0
 spamscore=0 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507050139

On Sat, Jun 21, 2025 at 03:19:57PM +0200, Luca Weiss wrote:
> MSM8974 requires the CX power domain, so use the msm8996_adsp_resource
> which has cx under proxy_pd_names and is otherwise equivalent.
> 
> Signed-off-by: Luca Weiss <luca@lucaweiss.eu>
> ---
>  drivers/remoteproc/qcom_q6v5_pas.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Hmm. You are modifying the ADSP configuration in the driver, but at the
same time you've dropped CX supply from the MSS remoteproc.

-- 
With best wishes
Dmitry
