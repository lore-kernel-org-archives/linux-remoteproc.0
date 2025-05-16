Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85C991E6DC5
	for <linux-remoteproc@vger.kernel.org>; Fri, 16 May 2025 22:11:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747433489; cv=none; b=mrLPtBeGp9kyykxChCFDXDHQIJXwpWhdPE51haTf4dRdtyzQTHRS4sneTCEwCGzx1pB0WgRP91LsUrwJXwsLi7xV3L3vglbFMceA/uV4hd+McTaUIjnUAicp/VNO00XRqAY4ZJqvNIvBa3iYnzdBMMOlB3twtD1NHqDuZ2k5Rfw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747433489; c=relaxed/simple;
	bh=sx/nZ8ANqCHg1XZRS+aNuOi9Z1CoaOzMIuQZpulm7w8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cTblKu6uzblxKd+B7Jw82LkfjuWe1QcWyrm4FdJLegXe7vBn/wyoiSOmq235FCFmVLgXGKn/hhv25DquVHeWCqnTzRey9HsPiRIv5dZjKZoaHRxcXAw9jJq64m+91mg/O7b9noMgfdpU4UplUe/CGVLuOe4zidEmXGbK+2ufVBM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jnJN7jpz; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jnJN7jpz"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54GBkR1t032604
	for <linux-remoteproc@vger.kernel.org>; Fri, 16 May 2025 22:11:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Nm/4NfT8gFS0Xa8OiBIX3tBr
	yuDvlEcD31Ih0TOw8JA=; b=jnJN7jpzu2HKvMfZ2SyV7OSu0TK5p9GKW7wh3xYm
	y0jH4ZNjc19cSoKZCXiogTyJ/IckYnbGwAhZumYnGNcfAkF6xaPI8XKUce3Mfp1C
	PUozfldrHfQVo72HZemGPjssD3owpczCUjy6jJooY0u4mm1stjDvYzZSEAFzfuHq
	AyHQl8uROQ77/t3aYEorFnGMOZddldV6ioeQUTOQizqI6GiOfJ1uCib4paxYGNrV
	K1qSzvr0gOVSaFAPrAaeOivbP690kPGUdk0JKol878+vXGRCOEf9gG7F5/egVOrV
	RklBJeYD5wvZ8tZZSzPYpwoMfoKNoSvhiYLkHwG+WaHQGA==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46mbcp37fn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Fri, 16 May 2025 22:11:26 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6f8bdbd9174so23096396d6.0
        for <linux-remoteproc@vger.kernel.org>; Fri, 16 May 2025 15:11:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747433485; x=1748038285;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Nm/4NfT8gFS0Xa8OiBIX3tBryuDvlEcD31Ih0TOw8JA=;
        b=M8ROHjE5AX1qCCmk4ktzl0VJ9LmBfaMUAFV+IFWs+v1M8ax1fsgbmzG1Lk/PWPEQVr
         RYXbVCEqF+evLCekE4kN433F4/u/+p3Qgpj96qSiIT3GGm+qVscHZIG7FWkZ/C6mGqO+
         f7ujbFlMefrKuA/xE+Q0GuiIVIcPb+290NK3ZVNDD5RvnPqTcxqs7oBUrYx1VUytx1le
         HHfSI2Ooz903PFj6tglxo1831p7cIcs0yA/5glti/dzPQ99iV03xUzyz5g9L/Uk6g5gb
         1OiZyB628hrW+e5/cWtKKp/wKkhP0YbBqrpNpIIDJlif9SRSb4o8oARP/8VzeNGq75yj
         2dDw==
X-Forwarded-Encrypted: i=1; AJvYcCUF6Wk2m2tTcJuIa/EWqYyElB/2AGZH5czpD2R1gLvAUS/zJ732dlWAru+Opsvwl2kWOlJ+4fq19sFh8MOYx/9H@vger.kernel.org
X-Gm-Message-State: AOJu0YzknZzKez1a8TTG6CICO0JYSPx7KfsVG8n4HOU42CV5Ye/l2tsM
	YDUCstpyo41COgPlY1bgY5sBiNBanqmuE1eC9Mpx2YTenw+avCX8WCyeIXZM+kQKY5GMj693vzL
	xsAqvrVwZLL/kwHDqg33TJuyVyMfhbhe/39hRO/NJOlw/4c+1cfhVGNPYti78lZ9Spmvc8KmM
X-Gm-Gg: ASbGncsCn+10B4R1Euy9moMpejNIvP3gbae5SkRIXSXSNytgKlyLtzdW8xxSQFJ9DFP
	1uiWhECt8QGF9ZXC2drR/zv+j5jd4BIWcTJM2qsEsfMrc1f6ShSP6ff0IinKh8k71mQzfe7x4A7
	uA0S/06KPKZ3MFbzQK0NVKlHIy1JBmdJjxweDOuKcX2iEeRILh8KisJtUkFlzdkrUhq6FnfvLeD
	Z2In/1Vs4Ub66rytwgdpuhRie5edQ60DcrKWuW8IVKgXPufuQzqkySbRjQkgs6NoVayFgcTNpzp
	yiMbNCLZF0dnr4K0EFsVguHEU9CExSo4MAtlZ1pvqbAOTA4S8IjyLDcGaGr2r9g0TJzLYYANZvw
	=
X-Received: by 2002:a05:6214:da5:b0:6f5:e0c:b203 with SMTP id 6a1803df08f44-6f8b2c59b60mr67813956d6.11.1747433485493;
        Fri, 16 May 2025 15:11:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEU6DgtmcjBL2iVwjhEQQMnBzBgU/+jxc+isjl2mVSHAPdsCVtuT0yhaLNg+VN9yVOb9Q7+Zg==
X-Received: by 2002:a05:6214:da5:b0:6f5:e0c:b203 with SMTP id 6a1803df08f44-6f8b2c59b60mr67813646d6.11.1747433485155;
        Fri, 16 May 2025 15:11:25 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-550e9cb4d69sm502623e87.21.2025.05.16.15.11.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 May 2025 15:11:24 -0700 (PDT)
Date: Sat, 17 May 2025 01:11:22 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Lijuan Gao <quic_lijuang@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>, kernel@quicinc.com,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v3 5/6] arm64: dts: qcom: qcs615: add ADSP and CDSP nodes
Message-ID: <thtk5vv2hpbnoapmt6j7nlgrcyedjzjbi3ntlyb3ll7atks46n@bp4isaoert67>
References: <20250516-add_qcs615_remoteproc_support-v3-0-ad12ceeafdd0@quicinc.com>
 <20250516-add_qcs615_remoteproc_support-v3-5-ad12ceeafdd0@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250516-add_qcs615_remoteproc_support-v3-5-ad12ceeafdd0@quicinc.com>
X-Proofpoint-GUID: bCjX-di4gJv454UTU6LfOOfGMdLmsNQH
X-Proofpoint-ORIG-GUID: bCjX-di4gJv454UTU6LfOOfGMdLmsNQH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE2MDIxNiBTYWx0ZWRfX38aP6y/52ulk
 /Hsd+4Tfwy0DCHlKyknLuzYEi1/aZmOtP9m8IfZBpooTRHy3XPUQFelQFg53WJBUnm1D8zzwvu2
 wYEtWNIZLEBp4nnu6bQ1ZFUu22mQkdWZAPAqGTLVeszLUpVlnkWYaw5y54GMHNIiWnssKAymqxE
 nJXtQFxtU0x6BrUBm4W4KnDxr/YXezJpWpveVi+4yZus1MT9zRnu0+/RwpYath3c1MJuzztV58G
 53lSL7JLjdkKkxtgbEv2Nyw4lqJbXHN4n0xMtHQ8BlgMJ4tfABDyz3FMHmL1AiJtGoZkM0Hr9vN
 R5z0P+ZautIvXu2sLfKKfnzx/H0JWNEP7aA/0HCFUYNIS36Xd1r7OCem49K1JApUWo7pedCguOM
 fYKRh679jztjBINRpy2sAVqdYU1p0Caq4bdFw8Ufh86m4mZ/Q0HYtD+2hvi+3apbf08a3sY7
X-Authority-Analysis: v=2.4 cv=Gp9C+l1C c=1 sm=1 tr=0 ts=6827b80e cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8 a=jONUQADHCp84k9KtN9AA:9
 a=CjuIK1q_8ugA:10 a=OIgjcC2v60KrkQgK7BGD:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-16_07,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0 impostorscore=0
 bulkscore=0 adultscore=0 suspectscore=0 priorityscore=1501 mlxscore=0
 malwarescore=0 mlxlogscore=586 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505160216

On Fri, May 16, 2025 at 11:27:06AM +0800, Lijuan Gao wrote:
> Add nodes for remoteprocs: ADSP and CDSP for QCS615 SoC to enable proper
> remoteproc functionality.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Lijuan Gao <quic_lijuang@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/qcs615.dtsi | 86 ++++++++++++++++++++++++++++++++++++
>  1 file changed, 86 insertions(+)

Is the MPSS not present on the QCS615? It was a part of the SM6150
design.

-- 
With best wishes
Dmitry
