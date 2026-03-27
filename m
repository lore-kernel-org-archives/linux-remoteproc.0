Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 050E236C5B6
	for <linux-remoteproc@vger.kernel.org>; Fri, 27 Mar 2026 20:33:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774643617; cv=none; b=eTSz+lVf1TqQNb2Iqrpi5h1ihtDG3qtx71SOZ5n0du5C1c4lgHBKL8LJH4DvmBIqBhweQJJBcTLzx8NW3/8ZLBKP4BcclPGu03Pw1nfWknkjhIFGW1p0lvQb90++6QWKyFw56s2rEDf2GqEVypxewpsLxr2w30uls3dgBIi5cY0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774643617; c=relaxed/simple;
	bh=keFw1/XjbB7jwqX5zESU+f6p/vJiLEdwKlMIJTnF7eM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cN5+XNx1hKhPEXLusVDnNrRqC877sD660fn577wMNyiaOZdweTb3y6Qb1j6CQIFidYkCm1IpoXb31MvMDnue2dfpkcxDabmijiM7qiNB3zKWEya56Hg5lnG6qL4NoWW9Wk87swY0qPBiPIm2wwvAAzYagJiUgqGAyhr8lsNNnhs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kCBt9pCx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TCXOnD0D; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kCBt9pCx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TCXOnD0D"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62RI2ZMs1458364
	for <linux-remoteproc@vger.kernel.org>; Fri, 27 Mar 2026 20:33:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rW0LpKAnyyF0Y3CdhoPuNAvMCsetS7o2O7ydNPWwqCs=; b=kCBt9pCxn0HTwQMA
	TxAnHiB86/KNNPHCKrXrk2Ve2IanSLoR1ldkjw8TYfMzF+LgVjMZH8UtBBEsZtv/
	Pm/HHxwS9qGh9uCUGRLIT7xAr7DDAzEpdXu4bFT07etq+qV7i1aObdkMUvWXj5Cw
	TJySeAcQCr7J4Lo8TkUIDN6Hvrw+jhEUfeL96VDfAoH+g4y2ccDpiw8vUmyfucq0
	owklJbFB16ns2kRSZYu/Htz2gkW8/qXeVZ5b96WnIf8Qu2ZyGtR4JPVOSHSJrnZA
	EgNaQgs6dsmdxLh7INEEEDmRYk20/x4w73GB5f1eq0n07JAVU57VsfO/XUqPdclS
	1IQ0bg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d5dd6m9vn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Fri, 27 Mar 2026 20:33:35 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50b52a2d70cso70448131cf.3
        for <linux-remoteproc@vger.kernel.org>; Fri, 27 Mar 2026 13:33:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774643614; x=1775248414; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=rW0LpKAnyyF0Y3CdhoPuNAvMCsetS7o2O7ydNPWwqCs=;
        b=TCXOnD0DkziihurKzpZrLPkciOvVhgP7TF+XyOwidQWb4oKxLiuKlF0Oet2nFANu6H
         ZGaCm3nIEawlaX6oiQ8IQjWsgSLXrRqkKlfkZ/yijktBbHxBKyGrIT+Kqozr4I1K/htQ
         yOS1dN5s9lS+1E153Izf+kiA6hPSCKIEVMeT0Vv+x9TzdqJxiy1uTsPjy+BZxqwAVDPX
         DO6913aindk56r3Pu0fLb5s+5WobZqj3yqtIB6SgcGy2m96k088Tx8yYNyGLOqkYptx9
         LsXq6k7k2NDczq4exqORITuh3s9mNnItpJxJtexzyS1xxY9t4EKw3w8EVVqfgzRwDsPq
         izeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774643614; x=1775248414;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rW0LpKAnyyF0Y3CdhoPuNAvMCsetS7o2O7ydNPWwqCs=;
        b=r8FMen8tWRRXX//hwghCyiiThxR9sg28wPMFIXXSprcbr9plGEJezm8oHQszgL02Iu
         eVfX+qhv9MFkbV9Ur29fl0jLqzXUxaKGaDcFIdAm1/HWSJYc93KPj5Bci7DTw64S2jUx
         zcXSqieFE/wuFb0WoQsW0SrMe/bxdIxwnwPG+pHCpE3MTMuBTcDl5VBM8JnnKihPDI22
         68HxMd0EtXw1Mi7zQxlVP5JO71Yo482F4BEN3LzfOEjDkATF0Q8jeorVzmaHosNDskLt
         sWadBDaHAk/KEXncUvILMSt4q1efO2NpIV18JoAqVfiYTd9i2Kd8/7KHz7C2j3mbE51v
         Lu+g==
X-Forwarded-Encrypted: i=1; AJvYcCUndCYhbyz3G3JZ9aK304EXjDqzzTq6nSjVh1UDbNoNX1fAHAWF3nOcvCLZJWCLFp4dGJ/elessKUdM0mdC91kA@vger.kernel.org
X-Gm-Message-State: AOJu0Yxy5BYJ0iDYL7U0rAcX4qw99x3vLN1Lies4DcaZl2DlhbrX3WBT
	bFb4Hsh4/FqVXb4wh0NbCjl49VTqy4ndWrD/RBZAQWzpfgQyJBaOZY+6s4s/qom+XWk6whpIyxx
	W5SsQPNdEKINt8SPKDT0Bg8SQgqrS/q3mKqz+mkJEKomQ9TEgeMx3g4Ax6Mq0OSisMEIKnbUm
X-Gm-Gg: ATEYQzzWUqWUI/9jPbKYrfG1oMNhh2r76jmOeh8wOKdOlSGqqu0e3rGt6uXO2gF2Itl
	Jk9jLMC6+2AryRprMr1F7245AKJYWab5+XFqr9sxLABWRtM1I3jezzS2JS2/FttWrPdF7CoJsMe
	/z8etYFY4+LzXYWnFWBpt6ELHgK28Htek2l8P64XOr4RzG6/2ACwwWUNqGgI5nAbfgsAyHxdSac
	TUuVeTDHeMZEuUj7HiIjJl42JrBktUu8IO3jwjSoWkpNGVoxpU4jmdxRi+PeoQqpjZUi6Ts/2Hq
	0Gx1o2S1mXn6eKXkNON6MBiVtQdaQrzA/cT0Jh52cKm8c4rZ0+uC5RYVgwYJrUhAeQLUAZkPYJe
	FLnkjAJcqL8NJPKilvN3AgK4Ba/Rjb0OxKI4yRyKmtSuoXJvPmwH4e2JuewZlCYUJU3MAz1mhXQ
	HIu3psu4OXamivvHqMoRHmasFYK8gBm9F01EI=
X-Received: by 2002:a05:622a:15d0:b0:50b:28b9:b0a1 with SMTP id d75a77b69052e-50ba391db58mr53731481cf.45.1774643614370;
        Fri, 27 Mar 2026 13:33:34 -0700 (PDT)
X-Received: by 2002:a05:622a:15d0:b0:50b:28b9:b0a1 with SMTP id d75a77b69052e-50ba391db58mr53730961cf.45.1774643613843;
        Fri, 27 Mar 2026 13:33:33 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2b1455e14sm6079e87.64.2026.03.27.13.33.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 13:33:32 -0700 (PDT)
Date: Fri, 27 Mar 2026 22:33:30 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: =?utf-8?B?QmFybmFiw6FzIEN6w6ltw6Fu?= <barnabas.czeman@mainlining.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Stephan Gerhold <stephan@gerhold.net>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-remoteproc@vger.kernel.org
Subject: Re: [PATCH 0/7] MSM8953/SDM632 rpmpd/mss fixes
Message-ID: <lv2ali4zgsfdh54yd74cx5mvec2z5kg7v4rkayyukpjt6juyft@vzprb3rvewkm>
References: <20260327-sdm632-rpmpd-v1-0-6098dc997d66@mainlining.org>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260327-sdm632-rpmpd-v1-0-6098dc997d66@mainlining.org>
X-Authority-Analysis: v=2.4 cv=NenrFmD4 c=1 sm=1 tr=0 ts=69c6e99f cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=OuZLqq7tAAAA:8 a=4YYDNayrJdHcgVGABboA:9 a=3ZKOabzyN94A:10
 a=wPNLvfGTeEIA:10 a=uxP6HrT_eTzRwkO_Te1X:22 a=AKGiAy9iJ-JzxKVHQNES:22
X-Proofpoint-GUID: FuFspFK6MQ9k9DwvnOAzTbcbFO4cNXY_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI3MDE0MyBTYWx0ZWRfX7+p3e6JtnTh2
 EQgU6XRWM5YE3q7U83eBab0xFeZ5q6d+FfphXg2M0ItRO8qGUKUU0WrDRGZHcgg5AxLVpUiv6b5
 Gw+NTM1DoNbZorGl3cnyZCeewUiECKs7rliJsp5hovp8SOZzk/TjQAiNLLJwqvc1L36JBcFsYBD
 fcwYqzFd9xvAjDeG4tJjsiwuDeFUQMjOA/mLFGgeFLRqMtmSRgC+A0+iEzD690w/CYpAABPJc+S
 Qa0qRLwzpQjNTSBVF90r5GllLrXTk7kfo9x6wHJJEDKcKWtWD8ZcIpn1tMiwn5ISahBjiGY2Fw2
 g27rfqyPTFcyRsKwdl5ViL4hczk8i/1VMZJ2FXKumFXuU8nuPj07qabn7jcb+UfMLFT/KAB1qXu
 5Z22akzx2l6gj+2B9LxM17fcqPPYgwejbNNhVMQvf/NahOXZFAV1XJM9Nf99ocRMjLCwpLsnxD/
 CRBJ1+nB3ZrneJUUN2A==
X-Proofpoint-ORIG-GUID: FuFspFK6MQ9k9DwvnOAzTbcbFO4cNXY_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-27_01,2026-03-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0
 clxscore=1015 suspectscore=0 adultscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603270143

On Fri, Mar 27, 2026 at 09:11:42PM +0100, Barnabás Czémán wrote:
> SDM632 pm domains are different from MSM8953 because MSM8953
> is defining pm8953_s1 as regulator but SDM632 is defining it
> as pm domain.
> 
> This patch series correcting the pm domains defined in rpmpd
> driver and splitting the MSS resources for the both SoC to match
> the reality.
> 
> These changes was discussed in a previous threads:
> https://lore.kernel.org/all/2b057aa5-4416-4fd4-aeab-6bc23acbb53d@oss.qualcomm.com/

Was 4.9 never expected to work on MSM8953? Or did it require firmware
changes?

> 
> Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
> ---

-- 
With best wishes
Dmitry
