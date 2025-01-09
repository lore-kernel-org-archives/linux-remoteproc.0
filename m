Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E384EBA2E
	for <linux-remoteproc@vger.kernel.org>; Thu,  9 Jan 2025 13:12:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736428361; cv=none; b=VxILMmzNGC7+Gdynv/fEKpSybum5FKFgpvfa/6v1f0+eJtANk8zBg9LHE7g27quzREEJAHjbyQWYnKxacdBSoGnOHAmuJf/i+91Xqso0yeKf754SeSkcUMyWoqx62wcReBJGZ0Z7o6B4C+jMuHrozFDvGg7GmdAMh+iVmTIjqVU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736428361; c=relaxed/simple;
	bh=jpwNmvkXoNR6B+tH8Sx83R+MPfKaIHFv2zRN1lJcpYU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Hrkdugzrdg+9GXsdTQwB12tOJVf4Fl+BziGK94EPKYc3e8Ffx27VtPsR2LY+RBB4o6wizqNuKvfdOrQ2Ea2WQTXRASWljsECzrHEwBqGOzV/B6c/FtIXncowMf7zXkFqjqNjZmCRXGd7isnN6GUpOHX9wGo/0QIItWauS9cMHGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YvIKrjkJ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YvIKrjkJ"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5098wb4d007216
	for <linux-remoteproc@vger.kernel.org>; Thu, 9 Jan 2025 13:12:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aVaJFDIFSQan13L04M0avNtyYD02w5zrm6M+LsFD+O4=; b=YvIKrjkJxoxcyDKD
	Wwq7jWSrdkyzrqBahfEJEIZD3W+Mt5F18dVqf+y4yksk0VzjsErY9/AKn++PcmDU
	4q4PENSVxb36XDj4O2MYS1psXJpWl1n+kyTIVMxhOypKgC5ym1tD/QwJwJYg1axy
	1m8ufri1XSTZckvJYt8h229KQ2EwUNAxGQsWHSPVQIh89QPWahH88O7LPppUZFBb
	oLoyYQzMZaVCVPG7lTUOgGehtItH4v6WnzajmQz8Icz7XQLFGvAVpgutPMZuRUFZ
	CCqDJGZeRnKfRiULALWmzI3S7iwzEYMEAvm3ved76setlAoogX0eFMKNQYPLwdxq
	KOyssA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 442bdxgjy2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Thu, 09 Jan 2025 13:12:39 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4679d6f9587so752281cf.1
        for <linux-remoteproc@vger.kernel.org>; Thu, 09 Jan 2025 05:12:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736428358; x=1737033158;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aVaJFDIFSQan13L04M0avNtyYD02w5zrm6M+LsFD+O4=;
        b=QH2ZSlU6BRbP4MzEUJEU5l0FfUw/qK8x7O/ZbaIKOdf7EROAx2EHC0SO4OgeK42ZEl
         7+AsJFZgXvEAXeV8E2w5nL+80YUX/Ijo22XkTJC9zg9xTLPBMSM0888XVo8Zn2sJUdS5
         0s75d4I25Sr0sKPlxPz2/SncToZ+JUldQYvfC7jfxwG1+CUPmuNOMS3qFUsOpSyIFpoC
         h+2CgxETZAkcg/W0oM+xBlS9TislhcfiduKLDG9sap7ggeVwLcM80hduwruqcs6/W63c
         0XC7Kv07DH2ZWMEmxd/rApeBO43ma38eiu6PNnJtxhaZsPlEoGg8Th5J0WDjA/2P/4I7
         wYog==
X-Forwarded-Encrypted: i=1; AJvYcCXE3w6NDOne773aw96Je1N8oDG5p+dqm8SyzlQgufG+JtYoC4FK4TbVK0FTls7e16sBnc2Wd2qo/v3X4IAmqJbR@vger.kernel.org
X-Gm-Message-State: AOJu0YyyrSjtsiGHq9PVkJxtevCYQ32uj9lJor2DF+0LjzleoIQ3aAjT
	uHKacdWeGvPa99ZN//AUh13Uwz146hLJRTn1YsiTkUFNE502CkblykyhUaofmGmsH5B/gbm0ieE
	Fo5MX2a+K88TY0WAtW/DU02De26QyxSR46STT+ppjUHMY3EDJYhYt21I8gSO1lvmRtZxi
X-Gm-Gg: ASbGnctsx9g5Ua2dEDS2xIpKfkLJ0ldWZ7I6+GsBRdJMNwg0nJ+gm8td1m/kYfpmhB3
	kPO98J+nnT3n1MK81c5UPmbrRfnT9CJCbqnRtvmhNKllq4z7fJzSy8PwvFtKlz3tzF3XQOVt/JP
	iATwlFlv7fZWdeUzHmH4q0gyytqd3nJe9F4mKmlsQj1C3D2wZw5R3jVUmrSvtW9GqoHeCLpud/f
	N3peJzWPc/+y+MT8zUd69WZY4DLsF/lwRTGVOmLTd+e+FidwN0zRp3eYxIBSsVdmtHRQgQgXgLh
	d63gJYMSUfARdCGRM+I+1lkLS+gpi2qaHgc=
X-Received: by 2002:ac8:5a16:0:b0:467:6b59:42e with SMTP id d75a77b69052e-46c7102b634mr38200231cf.7.1736428357827;
        Thu, 09 Jan 2025 05:12:37 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGkwHMLW9GjZHWcKUH2RSnFzZoO8UTVYRg9nJFkeAjeMJoOIke56jqRMFk/LL/dquo5VojYhw==
X-Received: by 2002:ac8:5a16:0:b0:467:6b59:42e with SMTP id d75a77b69052e-46c7102b634mr38200061cf.7.1736428357436;
        Thu, 09 Jan 2025 05:12:37 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d99008c37csm607503a12.6.2025.01.09.05.12.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Jan 2025 05:12:37 -0800 (PST)
Message-ID: <20abe9a9-34dc-4712-8fde-b959eb3e22c6@oss.qualcomm.com>
Date: Thu, 9 Jan 2025 14:12:34 +0100
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V3 7/8] arm64: dts: qcom: ipq9574: add nodes to bring up
 q6
To: Gokul Sriram Palanisamy <quic_gokulsri@quicinc.com>,
        jassisinghbrar@gmail.com, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, andersson@kernel.org, mathieu.poirier@linaro.org,
        konradybcio@kernel.org, quic_mmanikan@quicinc.com,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        dmitry.baryshkov@linaro.org
Cc: quic_viswanat@quicinc.com, quic_srichara@quicinc.com
References: <20250107101647.2087358-1-quic_gokulsri@quicinc.com>
 <20250107101647.2087358-8-quic_gokulsri@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250107101647.2087358-8-quic_gokulsri@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: C6xyqMzQEGEeGr1PJSLSGRFveyjnXcmp
X-Proofpoint-ORIG-GUID: C6xyqMzQEGEeGr1PJSLSGRFveyjnXcmp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 adultscore=0
 mlxlogscore=632 impostorscore=0 lowpriorityscore=0 suspectscore=0
 priorityscore=1501 mlxscore=0 bulkscore=0 clxscore=1011 phishscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501090105

On 7.01.2025 11:16 AM, Gokul Sriram Palanisamy wrote:
> From: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
> 
> Enable nodes required for q6 remoteproc bring up.
> 
> Signed-off-by: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
> Signed-off-by: Gokul Sriram Palanisamy <quic_gokulsri@quicinc.com>
> ---

The comments you got on patch 6 apply here and to patch 8 too

Konrad
