Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2354331D37B
	for <linux-remoteproc@vger.kernel.org>; Fri, 19 Dec 2025 13:31:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766151074; cv=none; b=WFP/eTys/NDWpUnQb/6Ukm6hNBMMcZ2FxqYZVtCfQAbv8P1d+bRKdSjmRM95pm7RNY+b5zryFQ2Zi6E0GgVflRQUii9DekRit9fbKsTlAr/um0W6V59Akw1Hr5pu65OS07F0+l/7pLt8Xhmdc8fCc6+aQI08gFqPZucNJVZ16sQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766151074; c=relaxed/simple;
	bh=dEmBppkxaay4i+N+h/ee3+KsupdGObJvGv+u/lDxpZY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=msizva1r+vfVjlbHYb2RsqyaIORkRaXAJHGLfbB/bAmBA/1xgyFTWXU3LvLlpVtGpET7pFHamBtcKXkR/RHnfJPZbDab+FtbNMu184uUCBB2Lwg7i7gSsesi232kvb0yZmplS01Uil46WAMhYmF8pTgsUApVGMAp3gDWGpDr2u8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dYlijHxl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KKjNCCDf; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dYlijHxl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KKjNCCDf"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BJBYSEn3702483
	for <linux-remoteproc@vger.kernel.org>; Fri, 19 Dec 2025 13:31:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	63FZmjx94t3vOCQ2GaeFBbfCszGhL53iuxJuREliAh0=; b=dYlijHxlSsNw/vN7
	mApopERZeygtqz9ij07Syaxz4zDP0ovmENIBauI6PDTiK9EiNbtk1LG4PQjPLRTT
	pIiMFXFeDra1AZBqU+DUuLpoauL9QfBBxBrYoYO4uffTw0g84nKZavGWSnvLGZf/
	/y0kJ03ztCElDiDD383IfBGesqnp+G+IjfxzU287J0KVVfELYVNdr4AUoEukrdhY
	3td6NtMGeKvCwgKEUWobEhzWEdrV8AUtjf+GMAzsZgAszlWor6Yq5zhfHGSrxwvg
	Ft5BpOf1Y1NXuMt76MkpUxJTk9JKTI39tPeMQMaYt5uf3gflCSS4cDX7KAYzNzMd
	ezeQDA==
Received: from mail-yx1-f71.google.com (mail-yx1-f71.google.com [74.125.224.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b4r2ejqdq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Fri, 19 Dec 2025 13:31:10 +0000 (GMT)
Received: by mail-yx1-f71.google.com with SMTP id 956f58d0204a3-6446e2a7008so399034d50.2
        for <linux-remoteproc@vger.kernel.org>; Fri, 19 Dec 2025 05:31:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766151070; x=1766755870; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=63FZmjx94t3vOCQ2GaeFBbfCszGhL53iuxJuREliAh0=;
        b=KKjNCCDf7TLZ429m99i/T6SMnxVl7vXI818T1Z/ujPUiWXW5DwwP6UvT7euBaYMFX/
         ky5vdhGg+iowrpV1CiWWtKUZ6xZxIn5be6W315FDq9I2n9u3yr/rOKRDjTFiEkI98zKE
         JQ0lvT5fQMQ3QSfV0MamNusFQhFbg5paE+5kFDlQhPd6h54rH9hVmf6JMQmo2yz3bFY2
         MPwOALhzvok3zMEvfuPMSJqvUpg5sfLxHhSq7hhNQsiSIAqzMh4Q+QipLFhvj7QPEDxJ
         lV9Pvl8rzcQ8yi48BAqKpTPdyjruuv3U8s7DD2IKdxWDlFUl8G4ITJwFs3K1XKjfdXrQ
         BftQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766151070; x=1766755870;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=63FZmjx94t3vOCQ2GaeFBbfCszGhL53iuxJuREliAh0=;
        b=A4P/liFSyyckHuNo6ZxohwAf/e2zjleoXD6q1t0E83zKg71ZKp1ds54YHPL3nkPB9B
         GVVcjyLNJzXp2YcNh1ZukxYya88Iu9LdxvJhc25b0Cosglk7/V9Q9c3A1jBlSutftYD7
         vSWIh32+4uOGh0ttHuDwPGojAdJ1eXG1VKZpV7LAn7EMcSGaDlsRBqmrl8g6IYd9kvzY
         2AFlvkOVSunrCsoKgiYstzY0oA7Xff3MIzZnc/JRf9c1Nbf2yOd7ff0Y+O9XViKBxlhr
         WOtkCks2ejEL/kT/3wfW4b+TGC59hpmrWrUd69lXjE5qo7b1nWkz23Mx16m70Sh8MsHr
         wBCA==
X-Forwarded-Encrypted: i=1; AJvYcCWeLUtP9Ddar1QGVNxWCHC+WrnBn27vBSi0+lOnu39l+0t+Q/emwYR99L+NJQ2YeNXT4j/kNC05rzk8Ysz6Ge6g@vger.kernel.org
X-Gm-Message-State: AOJu0YwaHgk5iO8LsyLUux8gqi8SMAELQIlSTJr9FOdNdxJDqvkDNpOY
	6SzXqL0gkIyywFFpeCxJUsQUxdL6DqmY34srmohZKaZqSlyeNxUHlaWzjhK9wvApJEcbEtLob/t
	aMPXaZQm0JMGJNM/XcJPPlXHbhYmTRXj5rbTFNB0JYst2VhYiIZ0z8xyV6ya6MYg6uoJdoFWM
X-Gm-Gg: AY/fxX6rk17hE4Gd6jsS7s0yYs6dxJonGYBr2unyJDLb23sJvpfzJyndwXcks2uE2l+
	L+Z5euu6bvpmva1Tsktue/EKWmzrI97Jr5TezEKfX8bxgczk1UsGJolaWqju8f4HW5RfHIM1WeC
	3DpHkeuVIPbmnLQU4q9RKiThNRqqpGnnZwKZN9ZeRsIUl9Ocep8QQltGYAuJGnfhVrV9BAVPuri
	W1zg4Og5/8zo6hbvmEa12YO4Jr2saaE5EzlLI2/WhVTufWpUlG9diqI6qque+PNnGW7MaWvxmYy
	WEAFhI30RBr0suTXd9hYThAM79fk+m2ktDWgOrgF+EklJLcenCyPoiPoA1W/kFRWaCbHX/Ctt0E
	U85aOpVA+JS4cFR8DjbYa3uiD/Zd0OLGh54PJiTD2VrE0AnGIp8Er0gONTGyc8AU9zQ==
X-Received: by 2002:a05:690c:c507:b0:78c:2c4d:3df9 with SMTP id 00721157ae682-78fb3e6940dmr21821687b3.0.1766151070168;
        Fri, 19 Dec 2025 05:31:10 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHcuP6AViHgjtSGuGdVF5GotpiyX3Y8C/WU9irJwTqiCa8+DEcrW6sklLAWctD0A0BMV99JKA==
X-Received: by 2002:a05:690c:c507:b0:78c:2c4d:3df9 with SMTP id 00721157ae682-78fb3e6940dmr21821457b3.0.1766151069795;
        Fri, 19 Dec 2025 05:31:09 -0800 (PST)
Received: from [192.168.119.72] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8037ae2dbesm240415266b.29.2025.12.19.05.31.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 Dec 2025 05:31:09 -0800 (PST)
Message-ID: <f4cd079b-0b44-4ea8-9aa9-9bfaa4c2d03f@oss.qualcomm.com>
Date: Fri, 19 Dec 2025 14:31:07 +0100
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 8/9] remoteproc: qcom_q6v5_wcss: drop unused clocks from
 q6v5 struct
To: Alexandru Gagniuc <mr.nuke.me@gmail.com>, andersson@kernel.org,
        mathieu.poirier@linaro.org, krzk+dt@kernel.org,
        Gokul Sriram Palanisamy <quic_gokulsri@quicinc.com>,
        Govind Singh <govinds@codeaurora.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20251219043425.888585-1-mr.nuke.me@gmail.com>
 <20251219043425.888585-8-mr.nuke.me@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251219043425.888585-8-mr.nuke.me@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: QQaZdWzAplpbFJGcj21d9OW57AqiMaSe
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE5MDExMyBTYWx0ZWRfX9/S5o+CQpSOu
 LxnzcTYTujc0+CkQTsqyjeq5tArnWiJPaV2oVe6gBnn3oHjSmaVgie8qAUUvK9yrUfdWvK3tyWi
 bRfcuV+IZXfEqE0ghoHqaRyUfW08n90/uH0hFHfiChxf/OVGKnDQ+queBITloOce14GQkjYnKmZ
 10ZlMDvSGfIYpKWOOMxsi9G1V8KOxWkMH/oe/CQU6oWXzs5v7eyfI514Fql7qGn7Xr6UKnDX9f/
 J3RJtEILIduHaReHz+O9Nh+zQgahbhtcKLjjKXHWmJ/ziPDkxvJceNty3X47rsjYc9zSb7GpQWC
 5FLxHWlN/hkJLzfS5xqKSMEBI2aB+6+dknX7bOu4YoiOj/jDSdFlhY8dIQ/q8x2nH8vHpayePqV
 AHkRclp4+T1DpIdRqkCufNzM0ePasQhYRh9dkkS15TckE3AR/YL3tVA3wA2MeFNoSXjjKhXCHOP
 0vGQMnddvhhgsPalnCg==
X-Proofpoint-ORIG-GUID: QQaZdWzAplpbFJGcj21d9OW57AqiMaSe
X-Authority-Analysis: v=2.4 cv=EabFgfmC c=1 sm=1 tr=0 ts=6945539e cx=c_pps
 a=ngMg22mHWrP7m7pwYf9JkA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=pGLkceISAAAA:8 a=TZsz2u26A_VOhFdBpeEA:9
 a=QEXdDO2ut3YA:10 a=yHXA93iunegOHmWoMUFd:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-19_04,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015
 bulkscore=0 suspectscore=0 priorityscore=1501 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512190113

On 12/19/25 5:34 AM, Alexandru Gagniuc wrote:
> Three of the clocks from struct q6v5_wcss are not populated, and are
> not used. Remove them.
> 
> Fixes: 0af65b9b915e ("remoteproc: qcom: wcss: Add non pas wcss Q6 support for QCS404")
> 
> Signed-off-by: Alexandru Gagniuc <mr.nuke.me@gmail.com>
> ---

It's worth noting they are handled by the driver through register accesses
to the Q6 regspace

This patch can be moved to #1 so that Bjorn can pick it up independently

Konrad
