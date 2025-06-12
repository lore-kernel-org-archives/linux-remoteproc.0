Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DDD923E320
	for <linux-remoteproc@vger.kernel.org>; Thu, 12 Jun 2025 17:08:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749748082; cv=none; b=ou0Dy8loqtSGr8gnp44sj+n3cs1/fiN/Bo7UtmbLa1SnLdemFHm5ogHho3wJD7xmBHeS7mIWM6hRU1gmPFuQhb9GAIno4c1ufMjikcVCZk7d4oG2kilfE+7tD13uRs/m1E1FpTsvYPMkHr4IOQE6aqjVY8Hl3QOUzn+3hPd2rjc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749748082; c=relaxed/simple;
	bh=Q7GXlm2e5RgBPG1dGi7/YTqBRYy7c5r++waPcXzg61I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DNM02T0T2Ik+9omxiiDe+K7xE6JK11DetcLlJgfKa8rNv/ecYb2elexpQ0BweRjPfCEIaBESgb/kgUeuIi3xBg/k9ZtbhspUvvea0qRnHkII/5lxo1c4BkvbjfZH6K2UOg06+1Rdz/JhmzP0akhy+kkxDZ09EcIvDMo5anOCaTA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LVY+zO5/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LVY+zO5/"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55CG9G9J029304
	for <linux-remoteproc@vger.kernel.org>; Thu, 12 Jun 2025 17:08:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oCUX6pLJ4eKKsw/Jg+nykN8d2JIazB3083QqZVfXDF0=; b=LVY+zO5/secelIHb
	cer/cuJ45Y8xJDHx1dnTtwsMKfXGVTwoZ2KoB5BwDtpAWIJiU5FH6Ny5R5XaxvfB
	CsAIVj33VSTIuCcMDB13C0O2nwTALvSkNjpWTG3jrQcnKXNGT8c2Fk++pVmZF1Dn
	BjGL05gEzDosd+HBbUBHNyFaDFAtUdH30c90em60vvj6X11kagxa1BqGk6Vc5vDy
	HR8D6SnmXoNQ95r8G96FIvhDHID5nGUceYB96ePp840jKkmo5k5128w5mns/ejMW
	e6qDp4a3vWXQ9TmTenmZOwfX3r00vgkcDomWoaXv1yfAboZ0fStLxVY6sx+PjRTn
	Z/evlg==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 474dn6ha2y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Thu, 12 Jun 2025 17:08:00 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6f8aa327049so2986026d6.0
        for <linux-remoteproc@vger.kernel.org>; Thu, 12 Jun 2025 10:08:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749748079; x=1750352879;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oCUX6pLJ4eKKsw/Jg+nykN8d2JIazB3083QqZVfXDF0=;
        b=XGRqu+b1QsJ4bu4fAF7vly75JTO26761iaeF01HgetssDhbuiYk4Py5+8QqqvLwq6f
         fKvW0Y3XAzO7i0A1jgG28kzyyPcx8oNykqABOWSGafu8qtY9GzoQKlfZGpHzF1AwkJQY
         jTAqoX0QarFW7xw8PIELB3tNFF46tliqgbhncmCWOCvaVT4BPH29P38wAVKFK23EodR7
         pgirW1LZFRa2kzeBnHVME3SLyda7iJ0s9AtVmyMZc30k6olj/31z2H8vEGDo741gHJt+
         SfqjCF9nGvcVbKsYXjAJzcwWL+GEbEr300MpcoSIq54PvN722RWRL3svciw01Gd4z9LM
         O2kA==
X-Forwarded-Encrypted: i=1; AJvYcCURRHuIyPYlq/EtglwxJFMTVvbQTwwxmRcmMO2zjFDLaPbUEEI0x51PEb/E2oUnyrOPwa2MaFTg87v4tYGAnO3G@vger.kernel.org
X-Gm-Message-State: AOJu0YwpGNRhj9MJpacgVdCmgbsIyrmjlJPMt+hQsOPxa3Ga3yrwH7dr
	r/fk3k7VnWaBSK4XTzQOUiJyvOExhBQJ/aq18XjU6pO4wadpgO83RCQm3ECKBDQKig0YqN2ZS6m
	YJuO3pwRgYlULZ0gWRtrboUomB5rIcxMCw7AnIStEA9BBcUfNKp3x3Nj9WUWz38Zwet3fPIot
X-Gm-Gg: ASbGncs+8fHE9aEJIWR4X6YZzIiVjt1wbCfRz9eWFUaw+qhD/cu1Kj+wGMwjLNmB8iq
	ypCsgaaDmTS/yXG9dK8NawZI01bqoMyzjxjvpjyyzOGjWPGVLAPaM/MPe0Rf3GA6zJvJHa3SOe6
	OFBuOp2CeWvrmZl8RCxrkx816jnb0prAOTyLRjcJgr2IBlFCvg0LzQoIiyRyFWrl0dcncRzRBrj
	mEm9wrwCH9VRQra+wExB4kNk8OQaIcaTHl1VUh50YCKQ3sc7C11G9dUZ4RoSWztyx3aA8k16Cre
	roVsADxR0lP8NE4onTLmdY7U3sKH1ogz7sy9ibSAzw8Q83PPd90e50EFIl1GZ6lxEpmAokRrRQ4
	h5TE=
X-Received: by 2002:a05:6214:5017:b0:6fa:ba15:e86 with SMTP id 6a1803df08f44-6fb2c25783cmr50670886d6.0.1749748078756;
        Thu, 12 Jun 2025 10:07:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGUVxUe6jZC7/MV4tS+FVdBiQl+jx9Qa8OGDtsq1v0I0wDt4u6bV0IdkUSIiWHVGe4VFxRwVg==
X-Received: by 2002:a05:6214:5017:b0:6fa:ba15:e86 with SMTP id 6a1803df08f44-6fb2c25783cmr50670686d6.0.1749748078261;
        Thu, 12 Jun 2025 10:07:58 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6086a58eefdsm1474265a12.23.2025.06.12.10.07.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Jun 2025 10:07:57 -0700 (PDT)
Message-ID: <2d768e39-428a-42fd-8e31-a36fd11ea776@oss.qualcomm.com>
Date: Thu, 12 Jun 2025 19:07:54 +0200
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: qcom: sa8775p: Correct the interrupt for
 remoteproc
To: Lijuan Gao <lijuan.gao@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Jassi Brar <jassisinghbrar@gmail.com>,
        Konrad Dybcio
 <konradybcio@kernel.org>,
        Ling Xu <quic_lxu5@quicinc.com>,
        Tengfei Fan <quic_tengfan@quicinc.com>,
        Dmitry Baryshkov <lumag@kernel.org>
Cc: kernel@oss.qualcomm.com,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250612-correct_interrupt_for_remoteproc-v1-0-490ee6d92a1b@oss.qualcomm.com>
 <20250612-correct_interrupt_for_remoteproc-v1-2-490ee6d92a1b@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250612-correct_interrupt_for_remoteproc-v1-2-490ee6d92a1b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjEyMDEzMCBTYWx0ZWRfXxWR4Y/vlxKyy
 p7Rpw5DKXD1hKwkgj1SPSQnmk2GysQShBHQU0XbkZoi2XR7Ly2+8BdUjFSZE4SRFiLX5SxO5bCG
 NtINvUvoB56+Ktsp4IUKsWJtiI6NIielTIyQUwlXT4tqmy6XZOuTOtRC7Tz6N0KdG+hFPuMM1BQ
 rmGv1mFP4NcxE5fxmnopizdW3HJr/otloR/6Xsl+UYARC9Vut746AfJgjK2AlUdbn0BmjSChcxZ
 gWWbGKuUKdqpFO/H1A2GtJ7qDWZe0s60/0Wt7hvIWg4Y+5gYfIMcx880QpyLeUyzxu8/yktUwVq
 kEJ1kYYJza0u78XngzlTpzsUsofXGD0P/IF778GH5i30WHTNLRHn9+DlsyL472Zn67ovcPNwjFI
 XSpdZRn+gaUGp3Js1yQNeQIAILa+48lXpZ/PytX1zYS/wEyOAqtDPCtiJ24zJWttdcrIZPGb
X-Proofpoint-GUID: QAvyu4nSpix7KtB8pKSuXQ69CjduDWvo
X-Authority-Analysis: v=2.4 cv=FaQ3xI+6 c=1 sm=1 tr=0 ts=684b0970 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=wrLjHZacoFgeWOAOTdYA:9
 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-ORIG-GUID: QAvyu4nSpix7KtB8pKSuXQ69CjduDWvo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-12_09,2025-06-12_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 bulkscore=0 phishscore=0 adultscore=0
 mlxlogscore=704 mlxscore=0 spamscore=0 suspectscore=0 malwarescore=0
 priorityscore=1501 clxscore=1015 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506120130

On 6/12/25 4:39 AM, Lijuan Gao wrote:
> Fix the incorrect IRQ numbers for ready and handover on sa8775p.
> The correct values are as follows:
> 
> Fatal interrupt - 0
> Ready interrupt - 1
> Handover interrupt - 2
> Stop acknowledge interrupt - 3
> 
> Fixes: df54dcb34ff2e ("arm64: dts: qcom: sa8775p: add ADSP, CDSP and GPDSP nodes")
> Signed-off-by: Lijuan Gao <lijuan.gao@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
