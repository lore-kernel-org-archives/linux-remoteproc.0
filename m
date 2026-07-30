Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E83F3659EB
	for <linux-remoteproc@vger.kernel.org>; Thu, 30 Jul 2026 16:41:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785429691; cv=none; b=bne1zYf0Vd0iEX7Ddr4S6173Nz7hVsHk8ASKBgAoCSOtwWYrQ4zINPs8ICiF0Rb8vV3arSRLOnOrjzTSrz47QeDpm2H1QgohsF6ebNt6WRJMWC14VGvfU/6p2Rl3Q2lPgSjKENQ/g/XxeDvMvkYEEGEYFS8FnfMmOtPm0NBfcsc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785429691; c=relaxed/simple;
	bh=W1qHPOfiLKP9reR3QhYi9YeVhYLovQs0sDLJcbc29/c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=j4UzCdyTo6m9VQcXhjbLodrFNHQ53tVc1G/REcxqefbdoABMiSpOlHtLHGvdBvRpplpsfIsl+xoUtJf5NuOPy5QyE5qTWvOvvEunNZde6EzcjUocnnmw7lEpeJ3wKaBbjANflK8fBkBV1e+cfSh2Fb/4VRb0fISaitFyctIU0L0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=P0dTlVDc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VmKViDoS; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="P0dTlVDc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VmKViDoS"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66UGWRxd1179812
	for <linux-remoteproc@vger.kernel.org>; Thu, 30 Jul 2026 16:41:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aF+l9BeJEjOCx930xc+un+WIoVHa/ZgTrH/eyrfC/jI=; b=P0dTlVDc8DfrJ4wI
	pytp3nTccA75LMtWp+hPPaH2FIDyucvJc7kaK5q8mDhNrGle7ySsOMYKUqPib6Ul
	n5BUUdH2o9OU6mc07tT2CVHB+KYKyl6YA3TeYBaHKxsXDhjDB/fK1LmSlom44ubz
	dJuxLCFcbzcQqer/yZgurp/AxMGPYU3fBu5eyPGylsomifbrpHShWeBY/+RwUSPB
	4UxFKqH1ynlD1DmpEiExcjSSP/0AVE75LqRlRRwG2uOGvS9p608BhwPmzvtP4ZRl
	MFzGDEfbPiLoJxjtdzWx3A2V1ipYpx6ycV4dmSEXgjY5XBxy45AgwG0ZOZqquiAj
	mV1tFQ==
Received: from mail-yx1-f69.google.com (mail-yx1-f69.google.com [74.125.224.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fr8n80pu2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Thu, 30 Jul 2026 16:41:29 +0000 (GMT)
Received: by mail-yx1-f69.google.com with SMTP id 956f58d0204a3-66896a924a2so6087948d50.0
        for <linux-remoteproc@vger.kernel.org>; Thu, 30 Jul 2026 09:41:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785429689; x=1786034489; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aF+l9BeJEjOCx930xc+un+WIoVHa/ZgTrH/eyrfC/jI=;
        b=VmKViDoSdRN6V1NdLzQSsY9D6kIdUkESqgdE9QGYHy9+OOBB+kbjbQ3LcIU7uEBIiv
         7LTHwM5BzfhGDCGMvhWu3UhxtlwQBLoEREeXWBvJX3wVX6DvUup3tME9hJ5HyKFsNkoI
         yE9ZQPFLmlKiH1OcVWituIrElCn5F3iqlIegxjjndKySE/yyYrggufje5ZuAZ9Kn79yP
         7hiToanYnAkiT2ehZ0/ZREDs1FkrteMs2GF6ECnMVGrK3HyB5Gm/ZAitrEmzKK+iCqVn
         xxFXwc157BMGq/FZrZoq1I07hHqJz+i+D13JjLLlTr/Yt9eAtfCBSiTQVHs8XQlfP7C9
         LUYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785429689; x=1786034489;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aF+l9BeJEjOCx930xc+un+WIoVHa/ZgTrH/eyrfC/jI=;
        b=LkiinYF1KWYdPOCxmsLdRumEdQ4AsferD8geRtmoSASwYSQrmCPXdDZSDgRMH0COCQ
         fN9JqT8ThCZZidhNYHCL/1IDTIkCzQpltXlePMVdatpnGEYX1E0i/BA27+6Q2uju4Fuz
         pmBjvFMPVvdcHxbY0qrYz84RzuQWcoHaG1jwMSa25e3S/g6ssOQfVRiNVfHLNNVzS96M
         RF7waVB1fz/pP7p+ayUm3746uPSXOf2Rxg2M02CP0aaJBRoxw7/dmHqH3rFxMgXFf0Sv
         Z7It3B6kSfAZjokfZO7+aieootzgXt7emVjNjl6IpZ7+JW9ux+RApRVt4S4U8UHxgBwm
         cn7Q==
X-Forwarded-Encrypted: i=1; AHgh+Rrf0YeOjhdAGTAR4gs1tpUds7CWmPuKKEDA9SAbPEhGV5GmiMM89dKeFncQM0kFz1/XXSBnyByVzBtUmxm60Rix@vger.kernel.org
X-Gm-Message-State: AOJu0YwHVqIZDTW1PbSuQw0dzUUW1/QyRHVeindZcJQOsNPcAcb7MBdk
	XzklPT36FQbz/V7kapvhE7f1W9BWapk2+jXRq2FAN8/KEme89J7GM+6wtrlZQuK5pjeMpXTEc1m
	5ue3gGMqp0Y0pejFSW9u6ySXeAp/IarMq85SCr9mevGbBfaz/Z09G9rLmPqmApIrvn4RBjFHF
X-Gm-Gg: AR+sD11hd+DP9DT1wN9h2+nBLrNDWirQu5X317FmNRfCWDXnmr0nbnylnq1NrA5Te6T
	crXe8LbPZZc8OP6FKHmlWgBXk8Sgy6bNsUJiPPoJw2wSkugoEj2wd3oVCdj/nXrbc0vOmaUnxts
	9LCs4/q3BNkq7ZSM54RyMHK7qlsZsG5v+g1irKWCu/NMBZsz6L0rl69CWWrIWAT/Fe7Ly6doXHO
	AJ4WXlrr5pPRFdftqPFZ8Rl5YPzv6z4tO8mOfIEiabfotV/T2sUA3AR9aKgumD+hwXNPYtPzwqp
	VTzuCHX9QcKal8ckukUewK18ICSXYzdJoqIH+6dFX6aztxl5fTo7n07u3hu26xTthGBobUJaqYe
	vKtfF43RSkGX4ia9jErfUAdldwTXXVsyCSe69uXrnPMm7pMtiWEnJZHbqUbzXR2U19Q==
X-Received: by 2002:a53:aecf:0:b0:667:b5d4:98a3 with SMTP id 956f58d0204a3-6693a62cff9mr530867d50.96.1785429688632;
        Thu, 30 Jul 2026 09:41:28 -0700 (PDT)
X-Received: by 2002:a53:aecf:0:b0:667:b5d4:98a3 with SMTP id 956f58d0204a3-6693a62cff9mr530830d50.96.1785429688008;
        Thu, 30 Jul 2026 09:41:28 -0700 (PDT)
Received: from ?IPV6:2a01:cde0:108:24ed:2206:62e9:bbc4:c360? ([2a01:cde0:108:24ed:2206:62e9:bbc4:c360])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-6692c95ca34sm1627738d50.17.2026.07.30.09.41.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Jul 2026 09:41:27 -0700 (PDT)
Message-ID: <ac813518-1fc2-4262-a166-dc54545bff9b@oss.qualcomm.com>
Date: Thu, 30 Jul 2026 18:41:20 +0200
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 6/9] arm64: dts: qcom: lemans: Enable CDSP cooling
To: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Amit Kucheria <amit.kucheria@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        "Rafael J. Wysocki"
 <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Manivannan Sadhasivam <mani@kernel.org>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        cros-qcom-dts-watchers@chromium.org
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-hardening@vger.kernel.org,
        manaf.pallikunhi@oss.qualcomm.com,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20260727-b4-qmi-tmd-v6-0-973cd3a226af@oss.qualcomm.com>
 <20260727-b4-qmi-tmd-v6-6-973cd3a226af@oss.qualcomm.com>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <20260727-b4-qmi-tmd-v6-6-973cd3a226af@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMwMDEyNSBTYWx0ZWRfXyboAZt6wl55p
 fIWlpPnD18ZdJfqsEnIAzzWXIL9pzcf+gZtSbywiGDMpAeCkX1tvIKT0aBUOuGM/LQyRkMomQ4B
 wiKb1u2Mx3sIsQvxw7uRdINzMLVKM/TztdCET8bELG6mIjD/VshT122Cs0dGEWVew7iBPqrzF+5
 cFTNsq6pSzi9a/X/9uWXtrUWrVUHaM39nMN8r5KljRnGY9lu30Ip+O1h40ZxQ0AlqIS7tMENIaZ
 kbxiRHOcpDpKFRG48fyxzbQTY/6uMeJeLT6nea57YCvseZbRYquUTXDlNdNB+KgIA1Q8EJF8Nla
 o5enWBnOv/H5KeX30PTXDIXTB2K8WjskGz/hUSaNj/jIYII8/cS8mEuPNT05FkK0UQpgFou7dNF
 eHuJOH2JYz1xAOGoGNYJtPHXmobm7ipOCLBE/V9Yz8itQsJkdAUgEwVoWGci8mjQMlkpj5vAUqD
 W4Fc5e5ieq06nrQiJQg==
X-Authority-Analysis: v=2.4 cv=DNq/JSNb c=1 sm=1 tr=0 ts=6a6b7eb9 cx=c_pps
 a=J+5FMm3BkXb42VdG8aMU9w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=Oo7k-GI02y8c9wmTVmcA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=Epx66wHExT0cjJnnR-oj:22
X-Proofpoint-ORIG-GUID: yIrzYmjUIkFElsthEcKcE75t4UDThrXd
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMwMDEyNSBTYWx0ZWRfXw+v08FjcQ9ox
 mdxfDZg54OHE3UR+rxcdKQHpn8SBcnfE9MjPn26qRt2T9vU59iH5YqbsMzvP+QrkfW6JK+dRvbO
 jgutnwdbPfY4emI6hCmg8QHTuL4jCsE=
X-Proofpoint-GUID: yIrzYmjUIkFElsthEcKcE75t4UDThrXd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-30_05,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 priorityscore=1501 suspectscore=0 clxscore=1015
 impostorscore=0 bulkscore=0 spamscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607300125

On 7/27/26 16:22, Gaurav Kohli wrote:
> Unlike the CPU, the CDSP does not throttle its speed automatically
> when it reaches high temperatures in lemans.
> 
> Set up CDSP cooling for both instances by throttling the cdsp, when
> it reaches 105°C.
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
> ---

Reviewed-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>

A side note, not related to these changes. The passive polling intervals 
look very short (10ms) on this platform, may be worth to double check 
these values in the future
