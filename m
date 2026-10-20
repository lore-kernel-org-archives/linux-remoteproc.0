Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792497547;
	b=GzyQk89Pq9LxYEjeZmpQHt5l/kcGtAVMr41GtJl1K1HbhJMUZq6hEYmzqW+sCbtz3oz/
	 hFgXGm/3aAHGg8NMkdKx9UE13l/W6d8OqFAi/p9bN6utHxy4/YKuanwvWLiKfS2Bhnr1A
	 fhprNZ8QINuvmfvi/9K8wen5S2zSDh/vH2HAH0LiHwmMH5cBWPayfpqiR6I73WwX0wihM
	 wEF0r4PJ+H1z7rMJ7vxbFx/w6qW3s5M4HBQRYt8yJeZ897/pRU1jagaqp7OwqFWzs4Ktb
	 5M6eR+j/BVQHA4MtMRzP7xkFyjKgxDIj+x9SalvIkLZpwsYT0Sccvkq7hEtbjk9VWJQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792497547;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=B7B0ogmG+yI8zgy4iQeMNyHKfdE1d/1H2LE3NA6bm4I=;
	b=kvdcVFl4p/6iW1zokqx5ped6D/XiNs2uYzGleqQAA5R7QtKzPmIrcb1X+fDhVus6KmiI
	 9Kk1c6qtWnwr1b6IzMuCOn/b9Rz1uA9+VIzjKsx2uGxtlj4loO2OqarbLb1VQ3m+i1QD7
	 d65tHkJzk6qRmMG2hIXYwcizNcd8KlpCJ60JiitjiuVigw756jffqHfRtUPi8Hj6GYm9I
	 JkstYIxo2NoO9pfjHL7BFijBNUpFGWIejr+2pp/r0umceeQkGVrcY90JrHlaYECwMuqOx
	 UgmePIMMEfKGkIXHP8RI/rlOpbchUTCSXK5mUWampMvHoi0bA+t6qKtphDw7HbQfoUw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CP2iwbvo;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HgGCpnxE;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B00D60A261E
	for <linux-remoteproc@vger.kernel.org>; Tue, 20 Oct 2026 11:59:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9B00D60A261E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CP2iwbvo;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HgGCpnxE
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69KAx2Yg599724
	for <linux-remoteproc@vger.kernel.org>; Tue, 20 Oct 2026 11:59:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	B7B0ogmG+yI8zgy4iQeMNyHKfdE1d/1H2LE3NA6bm4I=; b=CP2iwbvoj9AxplqB
	XtEYnOAUryPZSXQz4b96sLKEmHLqgy49V3FSllEBqwBhizNXO+xoEJBm+/bkr0W7
	CCc7PrY5HGU6jL6GUxJ30LcaQFSiggwWq2ll/apkteFfT6rXPts1PQN/9dnF9OtM
	l6NH4bLEyOr758vBG0QovrfpdRgPMfQrGn5LmKDxbtqBV3ph/H3CvAAa3yOmaBXh
	+LyksrSIHbFLC1TiaJP1fKYAsG/SAmDiRuo0jm1CimGtqPy+HQmVbhm1MmBBhAIW
	8AhZgXdKY7PxKoHn4idEsUwoSkvA+bd+xW+B1PCq0TeIRgYbYPQc6WaV8qu031Wt
	/qctwg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdw5n2amw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Tue, 20 Oct 2026 11:59:05 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5362ce9df1eso4038651cf.2
        for <linux-remoteproc@vger.kernel.org>; Tue, 20 Oct 2026 04:59:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792497545; x=1793102345; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=B7B0ogmG+yI8zgy4iQeMNyHKfdE1d/1H2LE3NA6bm4I=;
        b=HgGCpnxEBhkge1Z49EB/vhEsdhD5eMkHr79IrTXLfgO8apUtxkGbp455cpaRctktyD
         ymHeGB3N9kFZ37Mtzm09nXf4I8i0yXsIDE6+fWIs9SmhYwG1KM9cnYQHwj8Y8LzwMt3I
         DWT8CL1Xe0IkNfZ7itIcLHXMcozf3fgOcXypUR8FDhZBYgkKN/rZmhnoguPZ55ZFwK0o
         V4aN5R19CJ77J77Jzrr1CkZA5z+JfuFX+jYwgMtrXy46qUiMu8tnA9IKrhGsnG2nURMR
         g/3xNcasxFJ/kngRK7oIG1fm/ETOtEKol8tOfgi80e7dwAsqgLZBXza8REu+azigZzsf
         GS+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792497545; x=1793102345;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=B7B0ogmG+yI8zgy4iQeMNyHKfdE1d/1H2LE3NA6bm4I=;
        b=egZqSzhFaA7AN1WUDjljrtK/EC18zHqqGHIlDT+H9zBgRiABgSVI5sa7jFReXNw70C
         Q6+V7pL+hvghZFiDWI7NAgbIy+9bS8rGOBPJvvkaxS5ZAv/Ccw2sQIlL1xSjAqM7Fu/p
         q+ylQ3mKmJrb36SuT2D9kXTWUUMEMi4iNNxogbRefu8rfPMQZpCQnRlfq3ReY7iepbMr
         qpi1j3YGm9WEmDvTRBw87qd+zETv6QXWO/xoxFDmVL7A6dkrYF9up0hiNehMIWo5cXwb
         RZYopwtYALKlBr3ZO/sgce17DXwtxs20UDm0JIghyXCMq4Wx/aUTmI0dFdpqjG1XxMip
         LeuA==
X-Forwarded-Encrypted: i=1; AKwUvByhV+r7AdfrgYzuGeF4Zb6GOk8IiUFI+BcR7YbAole4XWTo4cl9U+IS17xltN07h3HVZgNCewWYIy1PYn81t25x@vger.kernel.org
X-Gm-Message-State: AFq9FYK/65s7NJYvQbQbISRraj1AM+OKIpeF5HQ/OqkiH3ssj4j+OL4y
	cWb0/tolNc5tMtLPnSWB2AnoiCLW/cVPYXTuvovTW/Mjz3ZFCU4GfCsqsCBjPoZOpkNqeYyOGvE
	NuRM5Xo9Ti1eWd23tEV8TPMfWL5Z5gIQDZQV8GEHH/NgobkiIlXAoMBIjmnevQ3ALxrwOMdtH
X-Gm-Gg: AYBFou0bLNBTGvFQ0TGNX22A+pxliOLcelycI+8AfjVCimnVyMBvmSyvSuKhraG+/SZ
	H1tJawT40wTOPN70LVXQ8aBTvq+Bvbslvm4hjrW111ljZ7mQ6oR4xujwb5kH2XSpmkaDjjpILnS
	pmtc3jJdlGYC4uiK1IZN2m1+vrNLk7Hp8J+tSA/1So3gdm1+j7eBpqNfN6OzpxYQsPzl/6rdlJF
	cXToKb4K637iEodlztJcva4rDq/a0iagqzUeboLD4LGKnR2u4X902xnW1GCcpjbFBRHXeAcxQuX
	baiGfZLKLffG1Vdx6TDe9J4w/PNz+pbgrzk/yKnHvzzqfXLemjTmplN+V9Pz7kQnnlnzPT7Ns8f
	8qf5YyKvCSc100KD1AodBwg==
X-Received: by 2002:a05:622a:411:b0:535:162c:2e81 with SMTP id d75a77b69052e-5364616cceemr192543791cf.5.1792497544978;
        Tue, 20 Oct 2026 04:59:04 -0700 (PDT)
X-Received: by 2002:a05:622a:411:b0:535:162c:2e81 with SMTP id d75a77b69052e-5364616cceemr192543371cf.5.1792497544441;
        Tue, 20 Oct 2026 04:59:04 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c408e32bc33sm476375366b.5.2026.10.20.04.59.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Oct 2026 04:59:03 -0700 (PDT)
Message-ID: <372be891-fa8b-4d17-a9d4-2d7becf1ad8f@oss.qualcomm.com>
Date: Tue, 20 Oct 2026 13:59:00 +0200
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
Subject: Re: [PATCH 2/2] arm64: dts: qcom: shikra: Enable CDSP & Modem cooling
To: Dipa Ramesh Mantre <dipa.mantre@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        gaurav.kohli@oss.qualcomm.com
References: <20260911-shikra_qmi_tmd-v1-0-96c1cca82f30@oss.qualcomm.com>
 <20260911-shikra_qmi_tmd-v1-2-96c1cca82f30@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260911-shikra_qmi_tmd-v1-2-96c1cca82f30@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=aIplOr9m c=1 sm=1 tr=0 ts=6ad75789 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=2J1e7r4m5WDM-kp8FRYA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDA0NyBTYWx0ZWRfX7WvhHj40SKRz
 C0Ce1gplrvGenXpt4T91kCD/zH4FXT2pvV4ThYzaZZ6L0wIub3MWMmaA+4GS2302RrcvsVG5qaZ
 Weh9NMvv4YMlfu1NizvWufRdsuYRzm0=
X-Proofpoint-GUID: d9qY6ByDpZRvl28muB4M9Uw1o9trXI0R
X-Proofpoint-ORIG-GUID: d9qY6ByDpZRvl28muB4M9Uw1o9trXI0R
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDA0NyBTYWx0ZWRfX/XabcECndh2x
 3Qh1QHgFH+ZvmnmeDMUl+Rl865cEOEKj2lzGvsSTT3F0XpmSjfb8BhDqthNEAf9grXmQNgt5uVU
 F3thhjlFpwChH2jFLmmeA6EQuL5u58akEj7/uTeGILCKWkcxnEFB2cxskXWhYuygDx3FYwNMsfs
 0829jZgv8Y/mwbfr74t6QCwra8PkzUAFciRJph4qvK5xAEPs5fSjODrCwg5k3EDZep7ZRjgDrGY
 4ApKjrmP6f2shsoY3gIgOcDIYIZyi2UgBq7/q/ah7gvBt7KEV9de5cJF7b94npsKc1k2yLKERYb
 LB/HJ9BMSuh1yeYKo4TO9FZe8u/Y/4gs1H32U4N7TwQRfn6lZxufXP4/PcxvhZ39r7hLtb9/R1l
 zKGikxuxWjeLXosmOcVVp7t7W+1iZ6+44gxDB0ghCamouVmCmOobJ8P5WjyWMDKB7aoBLJ0ftoC
 Gy4TgoBub9caRGg984g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_01,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 adultscore=0 bulkscore=0 suspectscore=0
 spamscore=0 impostorscore=0 phishscore=0 priorityscore=1501 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610200047

On 9/11/26 7:03 AM, Dipa Ramesh Mantre wrote:
> Unlike the CPU, the CDSP/Modem does not throttle its speed automatically
> when it reaches high temperatures in shikra.
> 
> Set up CDSP/Modem cooling by throttling the CDSP and modem when they
> reach 115°C using the QMI TMD cooling device framework.
> 
> Signed-off-by: Dipa Ramesh Mantre <dipa.mantre@oss.qualcomm.com>
> ---

[...]

> -				nsp-critical {
> +				nsp_alert1: nsp-alert1 {
>  					temperature = <115000>;
> +					hysteresis = <5000>;
> +					type = "passive";
> +				};

No "hot" points? And no throttling at all until 115?

> +
> +				nsp-critical {
> +					temperature = <118000>;
>  					hysteresis = <0>;
>  					type = "critical";
>  				};
>  			};
> +
> +			cooling-maps {
> +				map0 {
> +					trip = <&nsp_alert1>;
> +					cooling-device = <&remoteproc_cdsp QCOM_TMD_CDSP_SW
> +							 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;

Please align the arguments so that we have:

<&foo bar
 FOO BAR>

instead of

<&foo bar
FOO BAR>


Konrad
