Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30B01274FE7
	for <linux-remoteproc@vger.kernel.org>; Thu,  8 May 2025 14:43:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746715419; cv=none; b=emWFW1OQhfrXboIfNoSppADC+aHdOfp6wecwNxanNEXk9BxRUAZWmrlxflioO1efRazWlCz/l9hEuJa1QVOEKHXm3EDkxx/xiaK+zvoME+3qFBHZI9UhxqdBHbjZcYSVN7onri2p6+sd1eobMPlu141oRkmQBbI0/4Z4STrY3sI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746715419; c=relaxed/simple;
	bh=QZiZoalbyPIFmrGB7MjYu/yFu2xYCiPLxNK2Xpyl+GA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pBhUjQ31UbJYV5US1zmIPKpejHUi9sAguogQDKxmqyZHuq7BoRYBtpUNtOWbSEbtK+vZzFOx5uyVXwCf3Bs7OtylnF+aFNMpHU8AH86K4lh39DoJQz5yAw8rXcRMG+AFsDdq9+9p7stxtx3uwBdKy8eGSU/w1QcD0p7UPANohms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ja5X++K1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ja5X++K1"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 548D0JXx010511
	for <linux-remoteproc@vger.kernel.org>; Thu, 8 May 2025 14:43:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ccHcTHH6wwQXQQyGRXU8tZr/iAlIyx7YdnKF7+4xdLY=; b=ja5X++K1RQCV+lEh
	Gv3lIVnhgY7fSsT6FNPMIq+wbHxz2pbcMLboJ4u8AzaKuayp3SOWhES7WAjkWJpB
	NRK+QtXP/AtOaG+KQghJE27reoAUckb9THDbxVtTomfe5K/3vqlnYdzEmI3Ju+Ot
	CkdSH31AoraWSjkylBdrxcFxS+RsKqNdiL8BiiIhjDwkhJWiSden0CYVFS4y66oN
	j5qDdmHAf92rrjKO6bvuAELZKMetZl+ZkBlNS4IufQYpXYRAZx1aNYs10nIZwZfT
	NwoIbr4YV8XCEatPQFu1WPf6aPMVJbb+BzeBHPy0q1KEvaf++Yu5/4CPyCFaOrrr
	ss2wcA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46gnp79pj5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Thu, 08 May 2025 14:43:37 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c5841ae28eso24200785a.1
        for <linux-remoteproc@vger.kernel.org>; Thu, 08 May 2025 07:43:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746715416; x=1747320216;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ccHcTHH6wwQXQQyGRXU8tZr/iAlIyx7YdnKF7+4xdLY=;
        b=OG6GSWmNkBo/VZ0T4nvbTEumfzPBn126pQkNsGvlSvgMvd0vh1CZMCQLjs9biOwSxh
         8AaPKZYAGiCPMd919w5JvxR2wvl5qYHPDqNZTSA5TsLDgyRecsLSYkjY4N8l79bcvAsH
         msi61BV2IfhrhsMEA7g4eciUqyyWoU5qkErOcz7pnDDYByWHl/U8EQUQt1SuP3No1NLs
         qkxjaFeVI2O3r4Bs521X5qlsqFd2evJ9FwTUwlvO2whgE+LyPoKXKaT72abBRQoD37WG
         g6+rTkbWHzgyRdedJKafWQ0baFyfj8HIzlokYoY1wVpTqJ3SovFReW5+34sc04WPC5rN
         dsFQ==
X-Forwarded-Encrypted: i=1; AJvYcCU2uIGEcTfg9VZ70zTXR2JHH5KgPhQroZNZoHMStePiVPTDEfz6w/Inux185booShgOo219S67gWEj5YA+PFeOI@vger.kernel.org
X-Gm-Message-State: AOJu0YzzpPD81d0UzWzVCA34SO8GfvNPJipRr4y31F/IXNiUWNEDIJfi
	ZHFm5YcYQP0cdFixVm3qYGBkSR1TiYnXikNt2iesZHNsKFLV8t2tGBA3S+NnktaOdAIDNhkfZfK
	kygBpCDYuTqeE1k6Gx2JFjsiUK8DXP5+v36HWQnqUmlM4VlzvRioStgKsENMScAA+iO11
X-Gm-Gg: ASbGncvkUNvMPmL8yb+05JqdQMJSzBMXXFLQCoZ+WBex3sUmyAwoswUAfIFqgxRVmf6
	PBIMQzXzvOSd9Xceax9c72KS0IaAZ4yEgZeNOynKSD5K4LPWMC6PDdsSxRMmFZ8yq14Syp8DZaE
	IMB/H/PEn3yOsADLfcsf6U/NCtSS7E5B2Xseeq22f3vlR17a5Eud0A8jvhCeoy/2N9G420rHqHE
	xHYuju/WlLGS6kEwgXEs3SWJtXOfdj9DYrdVPNgYIROhgUTA9Klz//9qWpCSqz+kLf00oA5cTx7
	xIgNIIcWzwYcWWT+X7J7S42c+ZeWGM1bmuIJek0WJDUJsYr0EQR39NtbX1NHio3DzTM=
X-Received: by 2002:a05:620a:1793:b0:7c0:b81f:7af9 with SMTP id af79cd13be357-7caf73a26f5mr453366985a.6.1746715415854;
        Thu, 08 May 2025 07:43:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGGZx8hwuxykMt2kAYXqKEJRioot+1Hdnl4uKrWI1L1nMr/jVge9mVrLmUsf/5ZZ75qKvBAWA==
X-Received: by 2002:a05:620a:1793:b0:7c0:b81f:7af9 with SMTP id af79cd13be357-7caf73a26f5mr453365085a.6.1746715415324;
        Thu, 08 May 2025 07:43:35 -0700 (PDT)
Received: from [192.168.65.105] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5fa77c04411sm11181106a12.67.2025.05.08.07.43.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 May 2025 07:43:34 -0700 (PDT)
Message-ID: <1df330ef-4de4-4641-a42a-532b05bbd98e@oss.qualcomm.com>
Date: Thu, 8 May 2025 16:43:31 +0200
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/6] arm64: dts: qcom: qcs615-ride: enable remoteprocs
To: Lijuan Gao <quic_lijuang@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: kernel@quicinc.com, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250507-add_qcs615_remoteproc_support-v2-0-52ac6cb43a39@quicinc.com>
 <20250507-add_qcs615_remoteproc_support-v2-6-52ac6cb43a39@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250507-add_qcs615_remoteproc_support-v2-6-52ac6cb43a39@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA4MDEyNSBTYWx0ZWRfX0D5OciYrGU66
 TYSskwWQ7JUqyYm5MkRDpbJLljb8+iNpw/AixruzPK7O1HhoPs0LCUlr3QA0xpEW/DxCGlDckxR
 V7lcgFGPRlCRa4ZQHGJX6fGMi2FnMFd7zh+zuQGda6tlOIa/wOIywXfheEk+Qpgs7FtGsaOAMcf
 6YX2ukBHXRR/29VLzjFq6zWzfVjepXemcK09tvcCoBojheOVXQNvySA5tyCG7hr3YA0gPY/oMmu
 GIF3liaBveiAyyCuoXkgb1x5yEkHkfEo4b5jQ48KX8St/Nj8zoLw7qDUgLpx4iMWQC1mz8PRbmy
 eqR7Xv44Mp9sTzKBQ/jyYujhYXeIB0jo6nUDxXxq49rqwlwM4dCKSkh4+NBphT7WS7sMI+8909l
 UI3JwFOpSgX1jLIXY2Cv3wN1e29V8vfaA6xsVFrW4v7gyrl4XTdff+jgDwwbHoTD1O10dvC/
X-Proofpoint-GUID: P_VZlkUZl5d0f1zno3D2XIW-CouolxVL
X-Authority-Analysis: v=2.4 cv=B/G50PtM c=1 sm=1 tr=0 ts=681cc319 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=32Q6MQ-mccEAdxySR7UA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: P_VZlkUZl5d0f1zno3D2XIW-CouolxVL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-08_05,2025-05-07_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 lowpriorityscore=0 mlxscore=0 spamscore=0
 suspectscore=0 phishscore=0 priorityscore=1501 bulkscore=0 adultscore=0
 mlxlogscore=718 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505080125

On 5/7/25 12:26 PM, Lijuan Gao wrote:
> Enable all remoteproc nodes on the qcs615-ride board and point to the
> appropriate firmware files to allow proper functioning of the remote
> processors.
> 
> Signed-off-by: Lijuan Gao <quic_lijuang@quicinc.com>
> ---


Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

