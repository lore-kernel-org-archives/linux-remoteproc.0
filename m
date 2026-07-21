Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5F9F443A80
	for <linux-remoteproc@vger.kernel.org>; Tue, 21 Jul 2026 23:13:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784675603; cv=none; b=j2kyX/NYVTsELBrvVP96d7n8U4FDlvC4NTCBfTRZ1XxPbbgpe5AdnJ5B2FyKHvWo+7zvWeuAGVUI48Efyq5EHoCZE1BabAVhJHr7yeHeJ8+mrOZ1m+10vCja3TI+0lwDiwU2/D/Z0pJMhPoxCYdstl2ElUqIAdMtHgYz8nW40RM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784675603; c=relaxed/simple;
	bh=DhHpn1dG9h+QAznsjBCgS7U6iCDto2DAUPjhpFCQdkc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=S+y1U62ZUMFmDgagnqor6VIR1N+i1ReIydsoKXSWOuNLlwe5aHum1Yje0z/6xsqjkIFlctaLhZmbRrGwb0CFwjAfVw+DCR+udpLO9Hro5bRtCBba1eVUZOxFcYhRGqxb2DHfm4jEmzPEA8MonP+XDn/N2cOJz8BqDGOF53htWJ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GteNjTA+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KpgN+J8i; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GteNjTA+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KpgN+J8i"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66LMZQpl3027073
	for <linux-remoteproc@vger.kernel.org>; Tue, 21 Jul 2026 23:13:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AIcAbhd/wTobiEPktqGtOTKTTR1SSJ5H2T2pJNnaoGE=; b=GteNjTA+gWdA9P7R
	w332AUsjtosaLwSa2KjDB0t4pN4hBI0w2+DRnnW1y56mh87hIkQM+gGo68SMfsrD
	XMsOzKGNnTT0P1jwSp04YvKMCcxQUCej2PfH3shWRuFJL4j1GMRIJJGe5uizhxOH
	06ck79BRZnJsoz24Nip1EzW4Pvk8lNuvpow/ns/UUMU/+/AwZK3ikC1EPfXH820Q
	BV4gICQ0ockJ4zMSjdKW3jX92NxzLVi1T23aUxpmBPG8V6MUbbCyCyworCKscjZO
	yQDYRf0gC3tJ9mi0+n2+HYZO1S15Kv6+xpHOWt3F6NaZgaFX1pNnQvfqQ9PXGUlI
	P8Ku+Q==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fj6pabb3e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Tue, 21 Jul 2026 23:13:17 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-5174a23afcbso106613351cf.3
        for <linux-remoteproc@vger.kernel.org>; Tue, 21 Jul 2026 16:13:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784675596; x=1785280396; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=AIcAbhd/wTobiEPktqGtOTKTTR1SSJ5H2T2pJNnaoGE=;
        b=KpgN+J8i1dd8Ai2xI36Fgfg7TNqK4hjVbWumbwoPIbzcy/AGrbgmhD5Ivdujn9MVYF
         sqPq682wPFrGWpxImP/1HcEKwtn06iNqir9YS7eC5J2kdYEkdcSLWUZKMQTe0WAxcmlb
         3JhbRvovr9Y4eC78u5wPGoP/sabzjixRRKOD0podnJ3AtTxx/yjxH2R1cGGUSbGn175U
         Atr1g3ATh6JNZ+3YdG+OITncg3BwxHRd14maPjP2jQA1AaUYxPWL45JrnWFgkJ67zVyP
         +kgwXTaxDbBukHc4BLNgnuz1CqFLRV3TGshXIDXKYC8h1y4onwTm2icEHQm/pciE0RYo
         GF+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784675596; x=1785280396;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=AIcAbhd/wTobiEPktqGtOTKTTR1SSJ5H2T2pJNnaoGE=;
        b=F9xVWLWEipmeG85MS5evI9KipAwHa7D+wq8dmAidwSmCAFE9z8qDbCAVZOvWGhU4cV
         UyeOXoLTUHDaMl0xmKhAf62EFimG1dETlIG0Vb2m+A/zVM/mD04VvVO4CxesxO3orYDI
         sHxH0Zz480xmPqZsFp5Rzr8z/twP+WpKFB0yjZwIvvygXnz14TeXIII9edYLXkNElyN+
         DbPSZic+yLJYl4aNJKCMfzrGAYCV+RvxUHJu1S0o3l6JwChvtvS9uY+hKWT4f68M+sxB
         IvItBwPx8NSDiZWhXAy11KikNawjG3cbNoQOAwqqTYbmK3ezclehpMPdXNUpftlhVI+N
         E6Xg==
X-Forwarded-Encrypted: i=1; AHgh+Roq8ETnXNaSeG9TLxO2obkiXfFmgQPlIzj4eY3yiIPgRJ8CM79iJAo3i9qjQFRQKPi2375QnCA5FYePhfQ2s8aR@vger.kernel.org
X-Gm-Message-State: AOJu0Yyk1FRzfYmjm9y2+FX1PkSGpts6sX7wSUFPmlGGy2zbwh1QV006
	4P137J9YEEMORqbFzcg3ynkAdmIz7slicjogyogqqR6EGbHiSyCNyQ3GRO/dyM2tsW83QZhWlQn
	TWdlcAz8551TDxjotkW/uRQHzwz9ZaKRTHmXuAG0aJC8RfUZzV1KXholcTN5L1CznHoHW6Fxa
X-Gm-Gg: AR+sD11khMb1zyvSibExXWSQslx1/wDYe/4prtqhWDN2qI7tMqgLYenQaLayGtKRx6J
	nuVAlqSjjxDpON1EQ1GJqCGTpa2ws+SIXxrRTrxmUBEj1w/hNBAyOxTVoYsVNFYdWFOBvJykvr2
	AIyW4QxsK1bko7EzloxjESF2EV5usM6giJ+4v9CY3M72vFno4vFlts7qD/3IT7TUZC4jfTVCvQi
	kVMD3/9OXCAYYXiu3FNrZcVZe5OtmN6C8j/uu/OZrIv4+xNwj3HQoraQfi53l+54FlXKEvxVGVB
	+FMyNXpRZjiSwxmGvncdmbhF0wEQfMgazt5yxmoVJ4MJ5iCuUaCsnjZ8GwtaoPiPUOTWFEOZlwS
	j1w84MJ7+hk10gX7IUZvbDfWCkWMTzj8H4XVCGrWJZENCIXmeZvnlkxdzboJFezPOjRFXRl3tjt
	OeSyxWRYPQp776yw==
X-Received: by 2002:a05:622a:a13:b0:527:f19c:734d with SMTP id d75a77b69052e-527f19c876cmr6418691cf.7.1784675596408;
        Tue, 21 Jul 2026 16:13:16 -0700 (PDT)
X-Received: by 2002:a05:622a:a13:b0:527:f19c:734d with SMTP id d75a77b69052e-527f19c876cmr6418361cf.7.1784675595889;
        Tue, 21 Jul 2026 16:13:15 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b2a9f4d42esm148526e87.79.2026.07.21.16.13.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 16:13:14 -0700 (PDT)
Date: Wed, 22 Jul 2026 02:13:11 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
        Amit Kucheria <amit.kucheria@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Manivannan Sadhasivam <mani@kernel.org>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-hardening@vger.kernel.org, manaf.pallikunhi@oss.qualcomm.com,
        Dipa Ramesh Mantre <dipa.mantre@oss.qualcomm.com>
Subject: Re: [PATCH v5 9/9] arm64: dts: qcom: hamoa: Enable CDSP cooling
Message-ID: <ymw5womsjuri3okfwmrhlqp42kgio6t7btikarfiolm74fkmjc@brekx7lckr5v>
References: <20260721-b4-qmi-tmd-v5-0-99620e07f505@oss.qualcomm.com>
 <20260721-b4-qmi-tmd-v5-9-99620e07f505@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260721-b4-qmi-tmd-v5-9-99620e07f505@oss.qualcomm.com>
X-Proofpoint-GUID: E8riaMmxgWm76SMBV3NIneFQzVwjDXaa
X-Proofpoint-ORIG-GUID: E8riaMmxgWm76SMBV3NIneFQzVwjDXaa
X-Authority-Analysis: v=2.4 cv=eYYNubEH c=1 sm=1 tr=0 ts=6a5ffd0d cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=_nN_CDt7C_a4776dohAA:9 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDIzOSBTYWx0ZWRfXxIp+4rccQJX+
 /bx5IOFzT4lS3D7P8Ctu0n9uLtyLfz/IhusRJuHqPK5uMlN0P0nH2MFzQyvGK+YsmUuUppKm9RK
 G5BkDbRVw8KjI+ZvhyHBQpYNO1SJCrEcEXnMNfs2xYIzbTJU8+Lx4z90Cg+JzTMhm4WEy9GMLZW
 fir3L+pwXIBA0ZTwxsQFK1hTgh/DxIexMtxF56vlW3ZYu4gZ7T1jUxf1p6t+XU4W5nGz+Kyi56Z
 YtLb2wGIVmKt7eNPBfaAuUX/lfsuhXXtNhcHbsvrV+TZtAYPZ1YJR9VeLf84hTVedZMhlWRyJVF
 suTO9iwqqCFvw9upIPfUKp4F34ljKfy+esRZyGlUCDDgVRmr8pVLTAZ0lfFMYKrlqGRyNObiucz
 jJ6t5vIvrk9HiUGa3S+NLCsEAAq2zAjPhYjKG2d+Qcv1UyGF94CvbkApC1Ek+F7EhWVqq39XoPa
 MnNNXju8CiMiorwMDnA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDIzOSBTYWx0ZWRfXx5DZ+PC70KJg
 NYGD4zwtiUYtUKoNNTN7rN1nROVxEn8+PL1NFWxrX/PXbjNrGCBtow4WUvBKSKxfBv8XjDoC52L
 ygn/aj5M4qNUB9Py+BQNoBpudvwAMRQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-21_04,2026-07-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 malwarescore=0 priorityscore=1501
 spamscore=0 bulkscore=0 impostorscore=0 phishscore=0 adultscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607210239

On Tue, Jul 21, 2026 at 11:59:06AM +0530, Gaurav Kohli wrote:
> From: Dipa Ramesh Mantre <dipa.mantre@oss.qualcomm.com>
> 
> Unlike the CPU, the CDSP does not throttle its speed automatically
> when it reaches high temperatures in hamoa.
> 
> Set up CDSP cooling for both instances by throttling the cdsp, when
> it reaches 95°C.
> 
> Add polling-delay-passive so the governor periodically evaluates
> the zone during passive cooling and steps up cooling levels when
> temperature stabilizes below the next trip.
> 
> Signed-off-by: Dipa Ramesh Mantre <dipa.mantre@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts | 32 +++++++++++++++
>  arch/arm64/boot/dts/qcom/hamoa.dtsi        | 63 ++++++++++++++++++++++++++++++
>  2 files changed, 95 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
