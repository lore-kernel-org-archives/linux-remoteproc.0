Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A3B1352FE7
	for <linux-remoteproc@vger.kernel.org>; Fri,  5 Sep 2025 13:47:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757080024; cv=none; b=dGYCPW+mDuw+h1F2EE0sjKe4LjKAIL5TWDgdS3Bcvpsq18EINBo7gj1c3suMskKHhCtcedgbYXbYAhOAbP5FrmGHz2ZQ4T1aRZEFbFbHORvY3DGNJMohWBejB040s8eBsp99EMSSpVcvSc97CG54uYRfhvGHbBDjhs8/bDP0NKs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757080024; c=relaxed/simple;
	bh=h0O09iRsf9dHfeMthnJk999pMS5aMUcInRudkzUILkY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uw+DJZ6M0lPoDTtwppLsXsZxsVnfO86MeW5Sv5sGkWmTDI8Pp25ScF/IrTGtQ2xIeu3bt07WbHXxk4EDKkRVwiurJjHVdj1IEeMZUCnnvV7e69gY45TUoiWeoskC51hHW01iT8xT2pnHYUQaJuJCWF8YVTZHFGF0edtGx+qoZTg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=d8bULyHx; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="d8bULyHx"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5856eWxN031741
	for <linux-remoteproc@vger.kernel.org>; Fri, 5 Sep 2025 13:47:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=LEqUXc5cbwTjOkkBL1dldf4G
	sxuKtt2JT9JVdaymvUY=; b=d8bULyHxtMyy4qKNiXFY3gFBjl+3oJl1y6bSpPD/
	QcfaJvpSj4Fsoa2XWuNo3HoorvWL+qCd7f/DVfvWB6pE7hh7zQ8WEeCIfQ+wwT6S
	w5Al1qefwhoV0WxtQWY5pqjLdtiureWuFqmAKyXstBrp2dp1qDJYhvSyTuReedqR
	QPzK1VztV7pciEa4bzqorSv3m0fhDnmusvYtD39dgKuA9Eu0yslelaT9KamiRY2Y
	SIEvqfeULowexsIbINxuoiJzfvNrMaTGFAgaCPcsN3DI3U3+cMuWVOgZCZntgp34
	MUxKXsh8yERd3uqUR3OgyO4ifCxgEnyjP5MZ00gIhdlQfg==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48urw0bcbd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Fri, 05 Sep 2025 13:47:01 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-70fa9206690so49728396d6.0
        for <linux-remoteproc@vger.kernel.org>; Fri, 05 Sep 2025 06:47:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757080021; x=1757684821;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LEqUXc5cbwTjOkkBL1dldf4GsxuKtt2JT9JVdaymvUY=;
        b=SO06rAw2yx6nyGurYc3aW2wINUdS8x+TnDerfdVAuk93/Z4JM/+69MA8+TQz8LmUMl
         PL7HlB8U2CU9BNGr31z4naqYmLzySFq8ffBEIRO173oJaaQZcUy4YyzsFMt2H11GeYt3
         eKmDD63LQJ8ZPk/aPwP8QoG5xpC6Nc8kmA9cXxXW9nvr7kyKQyOd27OsSKjuIJv84kq2
         QqrNzoCXyaoDYs1tQkmU4QangSsF0UmvItTiVOUeVHqL2T4DPqMdOplFqieWh2EYG8P2
         fxSyTV9qxuWwQbe0U4dUfTyBrb0Z0rqSKFBUkLSlMWVFeyr0O88jcJHHGtWbHAlQHR3U
         l1RA==
X-Forwarded-Encrypted: i=1; AJvYcCXlUWJqn9pK9/yzNCcR/WD7qp+mpGFSCWrFHzeMe7nL6bdWvTnTle5GkFF+v3rTn4zq8e5BaHCkxdQAk023HfTo@vger.kernel.org
X-Gm-Message-State: AOJu0YyKiE8nR8FDFhJf/RglmaPHxcT483A+wOkbyPOtWac84yMH6hBF
	4zNoZlGfNTB47qH4YJeGG4qYqU33PMK1jfHcTAHPU81HrZRbuaKKSmPEbW2uNceAoXvxXM69K8g
	uJrUV8JWoWldjN/HUL7izcw6gjE61RAg3l0aBZIRtwfk3yxO/fCz21PnVgQSEg40vHmuBLc4J
X-Gm-Gg: ASbGncvLNmceTHq2UAJMhf+KdS0kDTGlGiGQ+SID9BxoPOOo1XX5s0S7YloD1rcrApH
	iSAQWNchoO9UgyIkvWOEo5FERmtJIqbXkDewSocEdeQARNnL1kfbVaIuHxaUw800LVqA39ZQjpw
	4eXKYjIDSCfCkWgsKF6ZreZq9az/reO1LgwpdcW2YG4WJqPhq/97FCgaBldUIj0B7a/0Bcz+nsA
	Arwo4CqVkwUb6iYW4QmcauCx7BlSyY+7qrm4e9JOCD0zwGur+39rQETLo7OpX8I/liOmLKUlFXI
	SML0TzoMBqLAhIys4ZtXsmaOP7jI36hGYaXB1jMduIAkkSYjwMe88ARegSMw+sNxW4ifFvvQ+Eo
	q+jvxMwxI5UEPvngyHZm68/NcKFIc3OiOIMIP9Ox7ewVj4kF4XfwC
X-Received: by 2002:a05:6214:1948:b0:716:fdea:db16 with SMTP id 6a1803df08f44-72bbf3fb1eamr41244556d6.12.1757080020439;
        Fri, 05 Sep 2025 06:47:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF99i4+ZgNHpEENrXMMJgwJoCqpA1mmRHdqXIu/OPhQnChIfbPSAVcT15ZOYrUVmX+skG5VYQ==
X-Received: by 2002:a05:6214:1948:b0:716:fdea:db16 with SMTP id 6a1803df08f44-72bbf3fb1eamr41244306d6.12.1757080019748;
        Fri, 05 Sep 2025 06:46:59 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5608abc63c8sm1812504e87.61.2025.09.05.06.46.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Sep 2025 06:46:58 -0700 (PDT)
Date: Fri, 5 Sep 2025 16:46:57 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v4 2/2] remoteproc: qcom: pas: Add Milos remoteproc
 support
Message-ID: <nxhx4ocjpeeyyttqqbzwfax2kf3qd27cbfurvggzgds5utplyr@zt3vk4zpmy6g>
References: <20250905-sm7635-remoteprocs-v4-0-9e24febcb246@fairphone.com>
 <20250905-sm7635-remoteprocs-v4-2-9e24febcb246@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250905-sm7635-remoteprocs-v4-2-9e24febcb246@fairphone.com>
X-Proofpoint-GUID: z9AB-pkZmK02eMi5E1DIMrEkU-ZwvR-w
X-Proofpoint-ORIG-GUID: z9AB-pkZmK02eMi5E1DIMrEkU-ZwvR-w
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAyNyBTYWx0ZWRfXyXSgrAaI6Nie
 NkB6I6TDmLaMXyrMyJDFNl/3VZrrwI0M601pbH8l466cdmKRK96Qjzp0VjZlxBD0AsS7yvUTYv+
 tlQUJ4u9Jj4DMVaiPmzH5vqeIH3GeKboo0goalrMp7YuerB6pNGpMhpf5RTtoqi/UPx9M7wmRsr
 CzfzHjS6u3Ylcp2DWyVNxhwCFMAny/5abR0+JpO6pAtarHxAiVosXSztE+WSsBzXMhUzk5wBy0a
 hSa+yxUQcOOVFd5EzLPidjNc1Ami+Rov3sos5nr1hTsbRn2q0oWLSiOWNa02GwbBAri5CbTFqsC
 xHcHw+WnqmqVQJOpef2+FMRh6OOY75q/vpJfuUnNIrjoOet8kHzNu1eHcxkGQsprCdWYqhYsgj5
 8PtW0Gi1
X-Authority-Analysis: v=2.4 cv=NrDRc9dJ c=1 sm=1 tr=0 ts=68bae9d5 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=6H0WHjuAAAAA:8 a=ENn5GrddmNxYPxOGv5YA:9
 a=CjuIK1q_8ugA:10 a=iYH6xdkBrDN1Jqds4HTS:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-05_04,2025-09-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 impostorscore=0 spamscore=0 bulkscore=0 adultscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508300027

On Fri, Sep 05, 2025 at 11:37:05AM +0200, Luca Weiss wrote:
> Add the different remoteprocs found on the Milos SoC: ADSP, CDSP, MPSS
> and WPSS.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>  drivers/remoteproc/qcom_q6v5_pas.c | 24 ++++++++++++++++++++++++
>  1 file changed, 24 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
