Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795516065;
	b=JKzMYSwsda22nlPwW+BiyA3MUv468UmfK4GpDoctgOACVikrWm1+Frj4XlshGsrYE+jh
	 ms09dLOi6Aam4oTT7GjhMJmx/yhUC1tktUogBj1VAJV88uzsCGWqqLlfcsKA7KmzYzIJm
	 ZGD9mSmOzWR3jU67t6yaVwSIrrnTaSrED0xllGhITMY5YrE0nHkAKvpwsqk5lhOYa+jyM
	 927Foj3EJLqVZN8quYm591QAtW9N+8I4eSWucZ62qvlOuyU/Eosk4a26PAk32qvtSNuR0
	 ZGutsdV/nn+Y4OSDkp/gw3n1Ae5LmYzalhaIOqwSXwLA6teqec6JyJm0InRT87BreMw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795516065;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=vcl5YiUrbFKyKkOQnxaMI+T47Jq9o3luS62ccZg1YjY=;
	b=sepw19bMIl7tgiMYYFH98i9+LTxU3hOIG1FIzjFJzSa5tRpdHfbOTHUPo6Ty5EKQDVoW
	 2ucLcTDAcQRY+syUuLSJ86LdAUtiof8sZWD4BapcVo430nhL7fww9t2DExq8oEO+pqTbo
	 R6XPPKlbdTI56ogZQ1ZBIK31tOFbIwQOuwHI1XIMkZvBusBdTYsM/yyo3FrL865l3eVgh
	 I95Aumgmfaf3YowjlQjDxB6LYFTueOBc/+017Bpk5RWk2yRzOW3byULZVOCQPnrU+iHvB
	 x6Xa2o61jUfCxXnCxRCU2zwdqGbOIrczrEx2z6lwVZa4/6LWeEroZuBTzZXgEdiKS2Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OGCN7uqN;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="AK4Qhj/d";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60429606A321
	for <linux-remoteproc@vger.kernel.org>; Tue, 24 Nov 2026 10:27:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 60429606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OGCN7uqN;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AK4Qhj/d
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AO8coKq902444
	for <linux-remoteproc@vger.kernel.org>; Tue, 24 Nov 2026 10:27:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=vcl5YiUrbFKyKkOQnxaMI+T4
	7Jq9o3luS62ccZg1YjY=; b=OGCN7uqN05tuOGacoC1593ZXu/H840KxnH4UJ6Zt
	NUsSLwJunItQqdz7vX1SttC39rEeMZ2dFc+S09B9W/R5PFaoTVFNJ6aT/rnSqSCl
	KIe/XrjD/ppEuI4rLTu/MTiL5Tpx7YhezQkkL8SVwHYxPVfCYW+bJsqGPzwn3kjK
	A7JsNx5M+b4AjFk88vjhdydgcDk0qLnocYhz6tyuMm4dGe9NDieu/IqmoocxkOyO
	fG8/e5HjHwuURIrzSjJa5+Fj7OZsQGPl9JKpueS5XG2WbLoqI2USbBF2xyYrSonr
	Fwv/PdZ7sq7+5oYSLa3tM/yOaTVdm2lp37Ha6g7CHe5tPQ==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4w6sts0m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Tue, 24 Nov 2026 10:27:44 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-1b29df78132so3910827c88.1
        for <linux-remoteproc@vger.kernel.org>; Tue, 24 Nov 2026 02:27:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795516064; x=1796120864; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vcl5YiUrbFKyKkOQnxaMI+T47Jq9o3luS62ccZg1YjY=;
        b=AK4Qhj/dBvYGgezfeuuAmX9FgHkw3wYkmnJGSx/tgYXCm5g+z/dX2iXGu+Dka15vD8
         PlIQlPiINrgMpX6Bi1SdHHyXJWpG7Z2PpF8oFLY5+aJ3T9scN+e3D1U9gCnv9qrpOZz/
         m7lgtzHiBhxIEfgCYj5KwnA15CydxsQLQrmJasfoCJYsEkUX7xRuLf7wb3yCCDuiC5x2
         +LA3B9tQYHb8J4i1RqwuO3+slCNKMDuCIGaw1fBoYcd1Zgs7tHbR1Pb+kMb1hoZaUfIK
         9Lp+E4ktbFYcP+pWhHR8fZN7+/PPBrK8dxV4oJJG/o/xPmW4Cf+Q4lPQN8+1tLMNMbOX
         m69A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795516064; x=1796120864;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vcl5YiUrbFKyKkOQnxaMI+T47Jq9o3luS62ccZg1YjY=;
        b=gDKpdligZu3GrLSuABjxAZn7/xsFYZBavkzZqV0eG9G6IuccKGSverNnD82Gszgi+u
         DpqWM5nkXf3DcpXPXDJYK/1Zn17PNp+TbS8PzoKzY9y41G+WcL9ylWuTuM0ypPKrwTSf
         sQudsXBdkOWPCZA/ss95W8r8kYRNjHHkCMbEOY7Q3NagHOFQx0GBq/BM5Sa3qeeAxaMx
         afgD+m5cEMZ6JYPwJWsuhLrPesoa4/BuIs9vAXOzSf3qme9MbKAO/V92feB1uk1AxkS5
         S6iuZIroTOMYk3Hc/W1GoraO72MEOQxR15UiFj0OenkhKcqIh9cPhbkcuV+ScFilQoGF
         q+6w==
X-Forwarded-Encrypted: i=1; AL+hErEyDuCPFDDbtsNKJ1NApv7JfF2ORLRahGzviKCT0SLbXXpUARdlEBWkUSxW3DNt5D0LZAk/GJzST0RenUtOQTVk@vger.kernel.org
X-Gm-Message-State: APuU4Z8szU/CVX99jkAQnNuDD77ffbEklbpFiMC474DqluTgCQS5PfV0
	ntFMO3DibF5oXJmaj59Wt8bu6pk9f43GL2REv+hKdJj4q0NTrT6cnL6FJ28ofZ26fpjTIHzDM+W
	pT41OHbfIbsJ2+BGH/tXtR18cepp/QGKsFmhNS4WiRp7yMX0OZYKL6AoniknWe6eRnZXLmLcI
X-Gm-Gg: AZFdTZdHLj+TvZ750kbWcsRkBzoKRgT5fAP8eniAYAhrik/Z5i9GJT9OHYDFoNoDGDx
	JtKxXgs7tOE7G2lU0DbVGntQUeJM64UNIyt8Hd58T52lVLJqblXV5anAPnWNSpNmGyIwVwIqLFd
	KSHvfhGGCuQIjpmwJ24txMPeEP2zMedOapBWL+AP55kqbW5klHXVkK6Vw4ibyCpTtwVddGeuMd/
	l64sYSdKW925xtjh0Gdf1aedavlEufe1vFYF0hMWFU04TXA1TuW5zoQn4Gk3IbgDodOFt9vdh5b
	Wq1LXKWpa5EcKQblMfbUG4K0NkyS8NUZHnk3KafPQqcCe0wyZmODCffSMMISc58iemMwB8XYesu
	bbyQUsD3bul8dAeiau1JTfKfJeZ492+icFHMafyMTj5wXzv7nMj/aG3CZhqTin1weFZXO3wZwB8
	jP
X-Received: by 2002:a05:701b:2514:b0:16a:c6f2:60c2 with SMTP id a92af1059eb24-1b55689fcb2mr12874022c88.12.1795516063610;
        Tue, 24 Nov 2026 02:27:43 -0800 (PST)
X-Received: by 2002:a05:701b:2514:b0:16a:c6f2:60c2 with SMTP id a92af1059eb24-1b55689fcb2mr12874001c88.12.1795516063089;
        Tue, 24 Nov 2026 02:27:43 -0800 (PST)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b55684c85fsm49238690c88.14.2026.11.24.02.27.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 02:27:42 -0800 (PST)
Date: Tue, 24 Nov 2026 15:57:34 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Kumar Patro <bibek.patro@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org
Subject: Re: [PATCH v7 5/5] arm64: dts: qcom: sm8750: Add EL2 overlay for MTP
Message-ID: <20261124102734.7hf4s5nf5kpkw64y@hu-mojha-hyd.qualcomm.com>
References: <20261120-shikra-el2-v7-0-9d9000eb50d4@oss.qualcomm.com>
 <20261120-shikra-el2-v7-5-9d9000eb50d4@oss.qualcomm.com>
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Post: <mailto:linux-remoteproc@vger.kernel.org>
List-Help: <mailto:linux-remoteproc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-remoteproc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261120-shikra-el2-v7-5-9d9000eb50d4@oss.qualcomm.com>
X-Proofpoint-GUID: AgCTIN_zVDUYrE55LplKJ8umptR0yZJc
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDA0MCBTYWx0ZWRfX/kW0P4faFAq7
 ZRT+kXjdrXnWll5jelfXDOiaXEidww8Jhw2snFs1a7Eb5HwOkE/uzKkS767hf7J3HYbPeoIDUT8
 9c8yUJ2gMMxPpAtllVG4pTaFsZH4QyU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDA0MCBTYWx0ZWRfX52Quwgql9SgN
 OXE1b+ibYknonJvyxWXgCixAicI4ZXMFj9OYyQQDjGfbDx4pTpuile52Ru8XXIrh09Pyn0d+yTF
 QiYMK7kGFYmc4vFyFGYlEne0NCkInk8BNrVes634fOJeOjeWPjaMvP8JUv/D/Fp2f9AHVGiBMfO
 SxKDRYmhBHo5aPNbDk3Bwr3zYykxOueuCkxwNVXBOq/j8xR5xOlvywhRuz01ZBP8//vna3VJzK7
 x4Zolg+QRdS2O0UMa9HlTte+UZpiff5F9Jte+TuFMpA1+StjIqejB6J8V5hoGnfeaFCeJ2DezM2
 jH766JtPqBVaVvIQ0fKZHvq666qBxBwYen/W2U1A3LJ+VukV8fX1WbiKRPLU2bnORvTyU63bV4P
 srZseeAABNAgPaQxnWNBYZ+wRN7isoTDQ+CEPBywwiGhdwRh8+KWd/PckQe8TYAOJnPY+d2jYTY
 K3Z73YBSoba4tSkqIhg==
X-Proofpoint-ORIG-GUID: AgCTIN_zVDUYrE55LplKJ8umptR0yZJc
X-Authority-Analysis: v=2.4 cv=V8DoQuni c=1 sm=1 tr=0 ts=6b0566a0 cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=RR6Oj5ZeI5PBhayghEMA:9 a=CjuIK1q_8ugA:10
 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_01,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 bulkscore=0 spamscore=0 impostorscore=0
 lowpriorityscore=0 adultscore=0 priorityscore=1501 phishscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611240040

On Fri, Nov 20, 2026 at 06:50:53PM +0530, Komal Bajaj wrote:
> SM8750 boards boot Linux under the Gunyah hypervisor, with Linux
> running at EL1. Linux can also be booted directly at EL2 on these
> devices.
> 
> For EL2 boot, describe the IOMMU streams used by the remote processor
> firmware in the DeviceTree consumed by Linux. Also disable GPU zap
> shader and Iris video codec.
> 
> Add an EL2-specific DT overlay and apply it to the SM8750 MTP to
> produce sm8750-mtp-el2.dtb alongside the standard DTB.
> 
> Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>


Reviewed-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>

-- 
-Mukesh Ojha
