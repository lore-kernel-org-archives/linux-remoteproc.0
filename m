Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794580563;
	b=VNi5tAtVDkFftTjOgNRBvQrmUIuzQLF0DLONtnW51HuaNAPqQlVUwf3uy/XgJ+fskpmT
	 dQo5nqYxbAbXq5yl24qj1JczgyTW2s1/fFflM31cARMVIlbxBf5N8Kyl9NP6HmY4ePDYR
	 MGaYotwsnhSWBEgOb9GYkJEBfjYa74QOYF+v8Q/MglVzApPpU1tGUjPfFwIzQCDrSjYQG
	 WLe7DDgwUtXKLwXt32/UDE2Mc8GzBASM+PY+vIssTpto7tPu8W03XtOXCDzPOz1WQX/Al
	 oecTCW/TQIPUSfBZmk0q5ab1AYHvZ2O58rs1onYpqQ40qybVrLK3oUkONWwQptTyUQQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794580563;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=9N3Xm60xAl6wR1Ink0ENH9O64HK75M5rWTZYwH8Na0o=;
	b=O9SaQuX+OpH8NAVIEhgIb+VJS/o0gwn2hm7WG9wkCJyJTUm2ERSpu89MSx1TtwHSOBsO
	 cV8l+2Rm8nc66ySymXSt5eqvAsKJ9LAu06W8N3/iU54Gfa3UT2s0W8Yg9FuUEULY6wY3j
	 6mNBB/jtszHFd4ULXwbm7wZY0Z7uHkhTzWckrnYktQocLqdGVPrR+2iTSepOZpXzQDB63
	 MUG9DCe51ffLViAnGY7mUuT7pPhFhMth3Ngng3DrcsV+EJXOV9CXgY35BKBjxIBezQfYA
	 ouxgQifkwQF9/XvnCq150dWb04Angcb2hj/joXd4tGzQl4sywrknsBoNaxvb/iItl4A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=kxls12BC;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LxpF8k5M;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E742606A32D
	for <linux-remoteproc@vger.kernel.org>; Fri, 13 Nov 2026 14:36:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0E742606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=kxls12BC;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LxpF8k5M
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ADCJr3H516669
	for <linux-remoteproc@vger.kernel.org>; Fri, 13 Nov 2026 14:36:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9N3Xm60xAl6wR1Ink0ENH9O64HK75M5rWTZYwH8Na0o=; b=kxls12BC/9ybMijj
	R/yv3Lr8wUQxobhd0fgl5nEnfr6KyG9b6pff6WwhWO3ZCkGqig0W/RAf5o4P0871
	tSdHCf48qtBSzX6S5kP16n/2pezZ1uMFy3RXq87xxnjpzxrGkXhDLy3MpFF4bnAE
	7Osov5+6P5Hz64cwA6LeUrSWt6D7s1RQOj4fPfEF3/A54FfqJqvgdXbh19yZ8J9r
	1fWKFerXbz+5q42S9NHu0HHk+N36ne7Hzys8XYUQThNbN2uk31Ykx5rQsrciG62b
	45+KKsgIy+n5nh/SzlwHfyJaQ1zT+Tt5bhlA03KmH60W7Z5BS3YXfFa0VN/XjcxG
	m5xuNA==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwkfdkjw0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Fri, 13 Nov 2026 14:36:01 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-5eac74b0596so1131616e0c.3
        for <linux-remoteproc@vger.kernel.org>; Fri, 13 Nov 2026 06:36:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794580560; x=1795185360; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9N3Xm60xAl6wR1Ink0ENH9O64HK75M5rWTZYwH8Na0o=;
        b=LxpF8k5M3czBtCGqcdZliENr0XbS5UUzUSOujKzVAXK1v6oEczDMkyx85Lv/3LFzRs
         lVdtqoy0NfMLc7jgumS8zfhHcWYz1rbb/9mwmMqSbwP6WIhd+o22TlMx5F2pZmOpeCRH
         ju9ragy22PtS5wNCgZMHQjtf0z2QVRDRhQ3J1rRSKTF3VrZ80v08CKJ2CQ3s8niJbtSC
         OomrB/TfegDV1NzBDMehmWVnRlp3CvomGOjuBCAUSeCWIY5mDSq2MP6NuVrvyMtUDNdD
         ICY9ayKxjbWR6MRAc6WRjZPuN/qzAwQwMbeOX4OvYTSymGCKaQibCk0L/tNeJevAJ+YZ
         73gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794580560; x=1795185360;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9N3Xm60xAl6wR1Ink0ENH9O64HK75M5rWTZYwH8Na0o=;
        b=yIoS4s6brKOroIQpFYw9ui66X8vrcpf8q0ArAdK4Ap0eL4caVICM75leNOlzTLlnIb
         EwOG8euyJMpNOBIGLp1UQvr/pAp4OJRvJmT8bIKZr8+Q8GtfCobQd6UHdQxrd5zt7qMm
         ZN8mF2VMdXO4FoiNEDsD1Zd8WQkjbfvEA6ov2sw0X72fVJf7xVxcarMxwfLTmmtxiuU+
         xOEetw5uDMmWgR/wLpXHS/HqbT3VJr7sTqKrVdekp/OciFZuxTfxvAmz0gazCDCpIa1a
         3nj7ZLNyJKxFWXAdw7jo4/PjZb6EiAVpVT+/WrM3NTdm3WDHct627B/gvNdJouC5OBdV
         rglQ==
X-Forwarded-Encrypted: i=1; AL+hErFGal4jNvxMOzer+B2lPW59JCtNIbAA/Z76RGbRoC7Ixxenj9vv1hd1BTLvZ0vo5429vp0oQUCZJF9DbltD0NX5@vger.kernel.org
X-Gm-Message-State: APuU4Z8npimAU3Ma8MR1pXl7QR1YyaLJvkoAvlszGD5TmEqV9+mIPq9s
	a0LU3nOI60MtmdJabYFsOI+YKGwLN2B1IJjHnAMpK0zze2QGPT/ra/6wF0vuh6Zw0K9NExMqr3z
	znAmtKgxjsYllucos8SuhT+DUGCOVuosw1BP6g6D6MizuViKGCndvwD6/4187CqKbGGVpeTJz
X-Gm-Gg: AYBFou0JwXnAlLzqW5hwYRNXTh0PZJAOuOBNwQ07T3KWdrlZUZbWjIdbMUCyDhvVnGO
	ODgl9V2av+tMwvl55U4IA7SZF980x3hDKbfhaD5mYHTwRLTJErGpa/nDrsRvxamNoITedzI3orp
	Kz36bCkESohI7r38APUIsPa4ND06dGWd01vQYBV0IU7wWFqB0f6Irt5BgXfyNBkoHYjZrkUaaai
	X9LzYI597NvtFHBpSksPHTpiIkNXsqATT42u1LnJ0iCWo7Cg3x0Y6PJsU1ZFkoBdJ70Y5PorF3o
	fs5VGkMJj0Rf5M1PFFXcCpMEVo/QoGW7MgDbtTTqhuyxHE/WkIetURLvWqjiKAxGtTfzOWhFRBE
	/1s4NX1DhPel3cmMlXdj4g47T3j+n08n3qBWpxlsiNbe+4u6BXM7TRCdk24tsaNAkF0rqOmQrge
	rM
X-Received: by 2002:a05:6122:552:b0:5ea:e17d:fc73 with SMTP id 71dfb90a1353d-5ee3466f8e9mr884666e0c.3.1794580560104;
        Fri, 13 Nov 2026 06:36:00 -0800 (PST)
X-Received: by 2002:a05:6122:552:b0:5ea:e17d:fc73 with SMTP id 71dfb90a1353d-5ee3466f8e9mr884648e0c.3.1794580559595;
        Fri, 13 Nov 2026 06:35:59 -0800 (PST)
Received: from [10.218.30.203] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5ee34d4ed43sm1387544e0c.2.2026.11.13.06.35.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Nov 2026 06:35:59 -0800 (PST)
Message-ID: <315d7bf0-352e-4dd5-9779-89e8ea75427d@oss.qualcomm.com>
Date: Fri, 13 Nov 2026 20:05:51 +0530
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Post: <mailto:linux-remoteproc@vger.kernel.org>
List-Help: <mailto:linux-remoteproc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-remoteproc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/3] arm64: dts: qcom: shikra: Add EL2 overlay for EVK
 variants
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Kumar Patro <bibek.patro@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20261104-shikra-el2-v4-0-97e7019debff@oss.qualcomm.com>
Content-Language: en-US
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
In-Reply-To: <20261104-shikra-el2-v4-0-97e7019debff@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDA1OCBTYWx0ZWRfX6M20XUcRossz
 Mx7iAGA0iJ4J79lWZmDk4PDmW8G4yE/JOhQ+q4TVZ3dKsGjFYFJxGpkkx0fcqRsPQ3rEWl7hGx9
 28jBv6LqFlK7S75v/traH1RPo2W5h3U=
X-Proofpoint-ORIG-GUID: gnFJa3aRbjpXp3rnDxcPq7uqsfnZutyV
X-Authority-Analysis: v=2.4 cv=DoTDa2/+ c=1 sm=1 tr=0 ts=6af72051 cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=yyvnBEBB80qBeyI6t6IA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=vmgOmaN-Xu0dpDh8OwbV:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDA1OCBTYWx0ZWRfXw/ObmOKm+nKk
 dRseBMlgoiBx/o1D11R1PM0nWVwQUgObCc2NMzTWDDEcQJYAU/R/w3BpD7yaKEleSk7nxEsQ3Jc
 bffK1PRgiiVPqEHw/f0Jk/mU/kva2KMcqFYoZcYSBn6nunox9l9tBFqXZsW/p7HPtlhqMsT+ora
 VqFAFXISqZ2wvtMdbUNX6fFlLu7Teu32P73d0wdRUR4zivuWBECUmClulsnWnFWdB4/682zh4SP
 NfJTRmBTO6kAsF8Mh3zy5UoPHW8jIqrG7dPdT3O6zqDyGByLec70EwluYw4Rmq+EjEuqVyW879F
 25eLw9861+mHgbO/yPyqIpzc0MmWKES/3lYJX+v0fn0D4KVqo14E6bQw6L/jsKvXGcRM5cONvqu
 a6IiCgU7Pk9KFQPlOlJC6pDRdAO59OTRAxiK45Ob3Vqpi6aYjln7hAGLcVGEw2Uid6l3/u1QtQj
 cM0qjWU95/jtPrhzHag==
X-Proofpoint-GUID: gnFJa3aRbjpXp3rnDxcPq7uqsfnZutyV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_04,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 adultscore=0 priorityscore=1501 malwarescore=0
 spamscore=0 impostorscore=0 suspectscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611130058

On 11/4/2026 7:33 PM, Komal Bajaj wrote:
> All existing Shikra EVK board variants boot Linux under a hypervisor,
> which means Linux typically runs at EL1. For EL2 boot without the
> hypervisor, remote processor firmware IOMMU streams must be described in
> the DeviceTree consumed by Linux.
>
> Add a Shikra EL2-specific DT overlay and wire it up in the Makefile to
> produce -el2.dtb artifacts for the Shikra EVK variants alongside the
> regular dtbs.
>
> This series also relaxes the Qualcomm PAS remoteproc `iommus` item limit,
> needed for Shikra EL2 remoteproc SMMU mappings.
>
> Komal Bajaj (2):
>    dt-bindings: remoteproc: qcom,shikra-pas: Allow 3 IOMMUs for LPAICP
>    arm64: dts: qcom: shikra: Add EL2 overlay for remoteproc SMMU mappings
>
>   .../bindings/remoteproc/qcom,pas-common.yaml       |  3 ++-
>   arch/arm64/boot/dts/qcom/Makefile                  | 12 ++++++++++++
>   arch/arm64/boot/dts/qcom/shikra-el2.dtso           | 23 +++++++++++++++++++++++
>   3 files changed, 37 insertions(+), 1 deletion(-)
>
> Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>

I  have addressed these comments in v5, which is available here: 
https://lore.kernel.org/all/20261113-shikra-el2-v5-0-8aca743de97f@oss.qualcomm.com/

Thanks
Komal

> ---
> Changes in v4:
> - Add a patch to move the iommus constraint from qcom,pas-common.yaml to SoC-specific PAS bindings (Mukesh)
> - Add iommus constraints for all Shikra PAS compatibles instead of only relaxing the limit for LPAICP
> - Add WiFi firmware iommus to Shikra EL2 overlay
> - Link to v3: https://lore.kernel.org/r/20261005-shikra-el2-v3-0-618f7343695c@oss.qualcomm.com
>
> Changes in v3:
> - Drop qcom,pas-common reference and add per-compatible iommus limits for Shikra (Krzysztof)
> - Link to v2: https://lore.kernel.org/r/20260930-shikra-el2-v2-0-f0822be5aaee@oss.qualcomm.com
>
> Changes in v2:
> - Relax the Qualcomm PAS remoteproc `iommus` item limit, needed for Shikra EL2 remoteproc SMMU mappings.
> - Link to v1: https://lore.kernel.org/r/20260918-shikra-el2-v1-1-07bb072baa31@oss.qualcomm.com
>
> ---
> Komal Bajaj (3):
>        dt-bindings: remoteproc: Move iommus constraint to SoC-specific bindings
>        dt-bindings: remoteproc: qcom,shikra-pas: Add iommus constraints
>        arm64: dts: qcom: shikra: Add EL2 overlay for remoteproc SMMU mappings
>
>   .../bindings/remoteproc/qcom,pas-common.yaml       |  3 ---
>   .../bindings/remoteproc/qcom,sa8775p-pas.yaml      |  6 +++++
>   .../bindings/remoteproc/qcom,shikra-pas.yaml       |  5 ++++
>   .../bindings/remoteproc/qcom,sm8150-pas.yaml       | 12 +++++++++
>   .../bindings/remoteproc/qcom,sm8550-pas.yaml       | 12 +++++++++
>   arch/arm64/boot/dts/qcom/Makefile                  | 11 ++++++++
>   arch/arm64/boot/dts/qcom/shikra-el2.dtso           | 29 ++++++++++++++++++++++
>   7 files changed, 75 insertions(+), 3 deletions(-)
> ---
> base-commit: d6bcfc94eb4da6e089c5473970cd96727292fd97
> change-id: 20260918-shikra-el2-ea8969385c3c
>
> Best regards,

