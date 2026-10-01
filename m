Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9647C3DA5A7
	for <linux-remoteproc@vger.kernel.org>; Thu,  1 Oct 2026 08:38:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790843909; cv=none; b=T4GxVNgulue35YfeIJY1e9wZbu5KvoADHgJMFunEQei+0K4jTIc+1sGZ8FB4GEMNvkOxaFPXwX2K2SkoAhwge13jm0EF1rxFaJu9hblzBdEUSWbC9rnvYGHNzUuVJE0qTQfMdlucNAvSsVPSoZgru7eJJfmXVMXkRxxR2Lw8FLM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790843909; c=relaxed/simple;
	bh=WUyUAJBFfHzzdVEpTJgHPcbRAXJp+ZSWpmKqyoZNWE4=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=RFA4fuH4yMXK0+kuNi5p0e9KlTq7zI1ZjdIAFRGC+qTEx4f9iJj2YLhHak6lO/o7BZ1gWUSJWqK7j4ZvWStDZAZN9CH6fmn0l85r5MFweatzGrpswKI6IL7Xkm8T++TW7eTZB/yXna472hXpyMDagYt9IWiYrFgPt2Lanzirl20=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oHfIsqxM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=O2kG7ykl; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oHfIsqxM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="O2kG7ykl"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6916xLFD1932294
	for <linux-remoteproc@vger.kernel.org>; Thu, 1 Oct 2026 08:38:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	T3cJXMjP/XsqzQusIsx52/0qeSWTh7VDvbG6/9h1C08=; b=oHfIsqxMFDv1XqOa
	+r//Ln64jYBlWuQI7dku7Zka5NDjISxvle2r+LM3L83yU7Cr/NUZOYDRSiJM93Uq
	vuiGJrLVhd5b8EsSyeTY5LJgeJ7USvcNYrpkL+Wjcii4h1gnxscZr3nqrt0yr/Wz
	G/JsRw8vMUo8CNAZ0qbrieFxMxmlgojpZTzSqSQXsvOr5DVODl2FM6tN9cieTXZe
	GA99wV2Otc96r7YxKvRIJYPV8vx9PT1/R6DezWRsS1epTUwK/nyElfEVRoHJjgT0
	LiaBlagLJk3bLmaxP2AUpdOM8F9EwuhBJc9ncdHTFYNkz77+XX2g+Vg9AbMO9Bs8
	eR9MJw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h1bh59vr8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Thu, 01 Oct 2026 08:38:27 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-5338bd59032so1279101cf.1
        for <linux-remoteproc@vger.kernel.org>; Thu, 01 Oct 2026 01:38:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790843907; x=1791448707; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=T3cJXMjP/XsqzQusIsx52/0qeSWTh7VDvbG6/9h1C08=;
        b=O2kG7ykl5pGAfCI7KJLeGUsNkDBdQe8dcutFflrixYP9z+rB45mVFm+rkWfsql6K70
         6bEcvlNX1puKuomC91f/aTvYe93mBkeKygy+7t88q/auUrWKXsTnAeqJNV79qh8eHnSc
         5TCTCNu9UfJ1dWXDpV0iYUTpd1zBk48E67P7IBUUH7ZLwNrFAvuWlhhyQESypdSnRSFv
         dNooYnOU9np6KTf+0vj7Gg1IEneclxC2ptjYF4aq6SVoZJe0evnkPKsKdSjQ7UrOM2+5
         TRoZODrLR6Cvlh3KOBIro241T3OUHkfslCNxkrDEeDyEFPqrupEM32/IuIoJmbDyJqT9
         JxdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790843907; x=1791448707;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=T3cJXMjP/XsqzQusIsx52/0qeSWTh7VDvbG6/9h1C08=;
        b=yyA7JXFe9n+9JrQPpPbbh5lEdt7ZVkULN87BSQM4VY2MTcQVtwQoS5GBbSHEpakCa+
         YRLk1dscD7GXxaDqG6CnUtn/woe4vIu6AxBr+BSVPYQNkBkJrUU1qwewLYYMv1SA/6FC
         hGXh9fGuQ4qWeUgDtxoXeDaVLi2ansCGT6yzNPl7e9L/Wqjw4htYsvtLwaBd2t+E7ah3
         N4N/PBmPyocWvnz4Ws/DP8YM9aNCuJyunQ4pXjhncYUxB+i98jBxm9vwINwrfRlUDt5/
         cqa8xk9pcpWaJrk6eWKcn8yRdrfMSCtuzLhHCS4IA+Z9w6Uj0fFgq1CzDUSKfSVNo/L6
         Utxw==
X-Forwarded-Encrypted: i=1; AKwUvBz8NR8T9ZiZH68XhQE+/q0UsY994fe/tk87TG5cpMiCTbvPn0WOXu7/TfYTK7J0FUUf8rCah2x9hnRbtIndv008@vger.kernel.org
X-Gm-Message-State: AFuF++kIOPgYGOEWBlCUqzPBQteI9GC9+FDLxzTzI02gqxBhr6zUh+eQ
	R7V3cPgVp24eYUmOemmxZVT4Edaf/fQPxKaUXOKo0LmT6+Uf3qO748iStHYQ6w0vB4CGQQQkln0
	5aQAtFRZmo4XNzryUfHGNQd2S3xvca+AVqpr3JbvBoa9ODwkj/mWkMw9fbBUJ6So79lABXyfc
X-Gm-Gg: AYBFou3YquAakDDSvESA62tRduUw+57ALeC0nr0rp2+dqnCDoKAuTBBc0p0u2izVGlt
	qLlB2p18znEQhze/7eKU+pkYo0NVu75drncTXCUVB4R72wDAOF6smo2NVetWDjtu0R4gmUTn08c
	8kfz6UDFO/EKL7EE7hGAxBU3ptVEiWE5oYaUKsiLMeXexyWVIABGG0q9CNHTcnK9O+hDNKfCBDW
	gSxx5pzVVEtAWTm6N7vMTzbJujJW8FPcjjqfcbWNzjzrGxi3mFwG/RY0t/xXSYgSJ+z1qx3zVvT
	2MNffTW6EDGhIwgEnUUd46UorOpjM/x0QNntG6RdYrgvW/qEDYVW8c7arPG0Bdr4KFr8rHCKxHa
	JCOYa+kvi/rXimsfj5x9utg==
X-Received: by 2002:a05:620a:3948:b0:939:8148:1e3d with SMTP id af79cd13be357-93ca95726dcmr698828785a.2.1790843906621;
        Thu, 01 Oct 2026 01:38:26 -0700 (PDT)
X-Received: by 2002:a05:620a:3948:b0:939:8148:1e3d with SMTP id af79cd13be357-93ca95726dcmr698826185a.2.1790843906036;
        Thu, 01 Oct 2026 01:38:26 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2e31d7a4e3sm110149566b.53.2026.10.01.01.38.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Oct 2026 01:38:25 -0700 (PDT)
Message-ID: <9d5d45aa-2678-4453-b18f-16efd4316732@oss.qualcomm.com>
Date: Thu, 1 Oct 2026 10:38:22 +0200
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 06/11] arm64: dts: qcom: sdm670: add adsp
To: Richard Acayan <mailingradian@gmail.com>,
        Jassi Brar <jassisinghbrar@gmail.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-remoteproc@vger.kernel.org
References: <20260922015801.32373-1-mailingradian@gmail.com>
 <20260922015801.32373-7-mailingradian@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260922015801.32373-7-mailingradian@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: lVSgmXxB_1zhRjCyU6iiVKb1EJg3pAoJ
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAxMDAzNCBTYWx0ZWRfX+RTSwADmC/0L
 PVXuPk9avENFzYYNsxl9sUMyqVadcBIPLMx0boK+sAJuZX1FlzuzANUlB0Mr452F6FK01lEGK5v
 hbJgmSYJuq68IDgdwTPKIIFQ22CaULU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAxMDAzNCBTYWx0ZWRfX68Be5wrelTGK
 3O6xSuRSg7YIW0788J8+oOyVgJCrqSxtr2+KDS/U0KwLYL9lcVn3s8rAmhdMwiog1RxOVQopAa4
 y4tL+yCpwWXPUZDGP+uwwe7z/1miB+ROR5yRCl1cWWWN0Qoj0xInC8PwXGHsj0n+IiaZw4WnkG3
 vHV+i0LOwuTt5c8688yuy3i5bTGXTAsl8ZU971noCKQMHE3uN1DGhR/FVsPH5YkZ0/SFhrNFeQY
 IMB2SeALTvUA4eh+89+ueft2fgjSYumgskqkcAAIMkl9kBNWl7og7jmdVCdTB7Ugq+oQ62/QIRW
 O5W4vop/iygDqtfoN/6TVuWWk0RB/cC5RLSOZD1uiPM8TJsprTBPRvt6RT/5NI0IiOdGLgz0+hM
 iC6UjnabTo0Z1OBSpNsx+1PZe2HA5Q67f+6429smqnVn96O+MmK6R+OGOOmQY73sZBIizo26nyW
 YC6c1pKNqjZXX2cs6kQ==
X-Authority-Analysis: v=2.4 cv=NuxE4MdJ c=1 sm=1 tr=0 ts=6abe1c03 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=pGLkceISAAAA:8 a=Auy6gPqRZWqvY-t5LT4A:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: lVSgmXxB_1zhRjCyU6iiVKb1EJg3pAoJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-01_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 phishscore=0 bulkscore=0 impostorscore=0
 lowpriorityscore=0 suspectscore=0 priorityscore=1501 adultscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2610010034

On 9/22/26 3:57 AM, Richard Acayan wrote:
> The Audio DSP (Digital Signal Processor) is responsible for audio and
> sensors on SDM670. Add this, along with the SMP2P nodes used to
> communicate with it.
> 
> The sleep state is included to prevent the following crash:
> 
>     qcom_q6v5_pas remoteproc-adsp: fatal error received: err_qdi.c:450:EF:sensor_process:1:sar.cc:27:chre_utils fatal
> 
> Otherwise, it is unused.
> 
> Signed-off-by: Richard Acayan <mailingradian@gmail.com>
> ---

[...]

> +		/*
> +		 * The ADSP crashes if this is not present. Simply probing this
> +		 * magically prevents the crash. It does not need any driver to
> +		 * interact with it. It is labelled in case proper support is
> +		 * added for it.
> +		 */
> +		adsp_smp2p_sleepstate: sleepstate {
> +			qcom,entry-name = "sleepstate";
> +			#qcom,smem-state-cells = <1>;
> +		};

It's not magic, the driver registers it in the SMEM item, and the
ADSP likely looks it up and complains if it's missing. You can
drop this comment, since you already explained it in the commit
message.

[...]

> +		adsp_pas: remoteproc@62400000 {
> +			compatible = "qcom,sdm670-adsp-pas";
> +			reg = <0 0x62400000 0 0x100>;

len=0x4040

[...]					compute-cb@6 {
> +						compatible = "qcom,fastrpc-compute-cb";
> +						reg = <6>;
> +						iommus = <&apps_smmu 0x1806 0x0>;
> +						qcom,nsessions = <2>;

This property is going away, please remove it

Konrad
