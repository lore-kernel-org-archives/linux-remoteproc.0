Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA7A82A1C9
	for <linux-remoteproc@vger.kernel.org>; Thu, 15 May 2025 08:15:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747296953; cv=none; b=EGvrTYFzDCPbAZsF5pTFx8LVTf4Leg6AiybxdR7GnJIPyrmJEP5UCml+/TZJpMfg30Y6Fm0+/Cw8/2s7KHYoqke530OSDjiSu4ecAmdmWuvO6Dr5llkHRUsjAB22TWpz+1lfkKBb4+KTbU4z4MhQw7e0Io/jSxOCELFO6UWvs6M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747296953; c=relaxed/simple;
	bh=YguwcBlMb/cTSmCCq/EoI5Id+MZ8xvwtVXilmmMs0bo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Y3RfoWMiIOBjJAUTzCUoRZJC4M7iX0PaRnuVquNK0bkieAAMiFuTiY5dNXHUzFadzXJ9jB4MhfIse57GzUWAi5GdTuHM2m/B/Rwa2SrIg+pt4FGrulo3re+MZqVlF3YIliR3na0/Qnvu2HCdjAztFscJUj/cH9wmcQkd1JhTvtg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IuWRxLW2; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IuWRxLW2"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54EKuBuh012882
	for <linux-remoteproc@vger.kernel.org>; Thu, 15 May 2025 08:15:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=tl/mMjkoUz1Nl6G9vAUnnEVh
	02OPHA5TxAyZYAgrbto=; b=IuWRxLW2nefh+E1zUKc6+FBDAdTcBwuH96SJOK1k
	qSlycviI6EuaG6SzMWDy1daxq8kKhiXBcwxKWK2NR4FpIEPYGZLOtx0V/z5yDGqV
	rj8NI0X38uAu25AAKTnnIKoLfqoa//sNbG+0/S5w2o9FB09YR0Drmp+xr3PJOBfx
	owwOW88lVDP8l/mJQrhQmGUpkz5PgCgf5lCrFO8tGVcCRnldVUXGEJ+AV05rcxpr
	LFRmKSOe3mYpJeSTMkxZskMLtIMRB1NL+Ahw2DdVsGgo3PVG2QDIPBpDAxJqMqqj
	YSYNme50D0BJvWQDDV94hbpvWdFlmAtzaB9TGyNlfIb0dQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46mbcmnfur-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Thu, 15 May 2025 08:15:50 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7c5f876bfe0so113075885a.3
        for <linux-remoteproc@vger.kernel.org>; Thu, 15 May 2025 01:15:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747296949; x=1747901749;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tl/mMjkoUz1Nl6G9vAUnnEVh02OPHA5TxAyZYAgrbto=;
        b=VidtEf2aoq1XWXsGGfrYSAPS7mUPYDCV7Fitvf6MLtgdQWfrOQRsMFqL4Mgf7T9qwA
         4pmy9cwK5BesfP+1nB7vgUMEirJMC3n19PvRGR4JR2I5PeWrZheABAMiKbSVeRf23umr
         SbtRfsz0LjsUZMZt0ZDssx5OkAwPI2ZzlONBoZYPsth5x6szL0q8TbVLIvfg9QFK/RiG
         dvZ5Gw6BMeGznm70e3/r7AiysY7Y3bvG9ROC8BqvSVpSHPOh8GhS9YNDmzGtBSfuPjOA
         0bOzs9TEKPCj78MWJuHxrhP06RZn1rSrzpfKw+MF1ELydIDymIAVqmyBaAGUMcBKFB1P
         ycbA==
X-Forwarded-Encrypted: i=1; AJvYcCUclTs6srGzgQy3Q+vU4JZWbU4/cC8FZRVXex7duOgz558BMoqjy1M2cZ3G+TsupOHUIKnoOaTKhAcPwWuTAVgY@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/rQERSbP5MQHOj4ySuBSAF+X4yGfwCES7OzzoIWLfec1lH0CP
	ZafHrCcyDSZaMSlGUKDFt3aku4hFsCzHiLwqvKTFwCsgHSblGmePGDnDCmJPX3Pms5m22E8PIVB
	om4YroFMjDjDvEMSlMGBbASbCzqgnWbRwHH0Nh5ZM482PQuwDe84niTbTcZaKDFyuVF4w
X-Gm-Gg: ASbGncsakKtBit/hawVq24+8vw+pVFDUnpmKAHALOHlSGN66vRDiUwxrwFi4ON7Bh8e
	BeociAOb1AhWbkwX9hWKE4AD79zBqEhvA/8u5dvi4MRRWZqprRBTxfTxAcTQRFOXmVtNaOQPKyu
	uCj2dbv5Y5gsJRILcIzo5WeR0jS3iDlcS2PNmr8zh55tW7WUjEneHoQGOLdB9w36zI0S03JYSgL
	yrVlXhD24lDSQZbwaY163w4zs20m2J7s9Z/SumJh9QIzgvqnYuPYHE/0li7Ka3Cjps8Wq6XL5w4
	TeCjO2sXcFEngZuTBzWbAJ9vhx1F4gHp9T2y8w46J/PHsQyZXgts0Yr3BG42QP18WCzYKEZ830o
	=
X-Received: by 2002:a05:620a:3915:b0:7c5:49d6:733a with SMTP id af79cd13be357-7cd287eb63fmr1027725385a.21.1747296949557;
        Thu, 15 May 2025 01:15:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHK1kllNTjDC9K4sQ/7b/5JoLiAF4ZMkxAje2l2fuWXy42reJEZ5kgLog1bNJBJTjhzAlXyrw==
X-Received: by 2002:a05:620a:3915:b0:7c5:49d6:733a with SMTP id af79cd13be357-7cd287eb63fmr1027719585a.21.1747296949004;
        Thu, 15 May 2025 01:15:49 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54fc64ccb9csm2551299e87.234.2025.05.15.01.15.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 May 2025 01:15:48 -0700 (PDT)
Date: Thu, 15 May 2025 11:15:46 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Gokul Sriram P <gokul.sriram.p@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, andersson@kernel.org,
        mathieu.poirier@linaro.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, konradybcio@kernel.org, quic_mmanikan@quicinc.com,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, quic_srichara@quicinc.com,
        vignesh.viswanathan@oss.qualcomm.com
Subject: Re: [PATCH V5 4/6] arm64: dts: qcom: ipq5332: add nodes to bringup q6
Message-ID: <wzij5uhbc6yqxnqhgfrni64gds33chsuiac3no73otdkihft4c@wgvrfio26sze>
References: <20250417061245.497803-1-gokul.sriram.p@oss.qualcomm.com>
 <20250417061245.497803-5-gokul.sriram.p@oss.qualcomm.com>
 <242f6059-a32f-4ee2-a794-8a29b6449e96@oss.qualcomm.com>
 <7d4f174f-18e6-402f-9a29-c4c461d0db0b@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7d4f174f-18e6-402f-9a29-c4c461d0db0b@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE1MDA3OCBTYWx0ZWRfXyRoiwrAJRFlp
 ewL80ALuj4oUQBAlRXy8uLToV22VOtrnoTk8GUFgTVw+YeM8yvXAy5jbjQjZj+J6EAYbrlFiekP
 OHbc4Nm44IEdB2TaOGwuWdg0x98YVRCoP2IHteHAT4kM36WMDgbHYqyEDY/gnxB7XnIkRD5gZS6
 CiaIgtzNEJLUDvrIbYh79o9IwOjnUbi0oUY4WLM/43kKo6BIMVddoI3j/arFsX8vHvgsIkxaOi/
 aJfySWBjWzc9n/GGdfiuddNp0EUXQEusigJYx49gbJFp3LRRTsL+z87hvnhfhn9jG7qEKpB6cvl
 OR+eT/8fGoz5dsIxfwOQEqVPORGbvxhnCkHnDHBuDoZc9CQC2WflAqFKTLHTp8L2WO/lCf0EXEn
 f9XjTlX2MvRcJaKajfwio337Tgov/34Hqz8GYJVnlBbgYIHPpmhSHc0q7np1FCCyX1E9TLlT
X-Authority-Analysis: v=2.4 cv=G5scE8k5 c=1 sm=1 tr=0 ts=6825a2b6 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=Rh4vyNp77t38Oup4XtEA:9
 a=CjuIK1q_8ugA:10 a=bTQJ7kPSJx9SKPbeHEYW:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: DmczPb1XPvAjDLEIyp6pTXFm8BEIaS5d
X-Proofpoint-ORIG-GUID: DmczPb1XPvAjDLEIyp6pTXFm8BEIaS5d
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-15_03,2025-05-14_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 mlxlogscore=943 clxscore=1015 phishscore=0 bulkscore=0
 suspectscore=0 spamscore=0 impostorscore=0 lowpriorityscore=0 mlxscore=0
 malwarescore=0 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505150078

On Thu, May 15, 2025 at 09:46:50AM +0530, Gokul Sriram P wrote:
> 
> On 4/26/2025 1:53 AM, Konrad Dybcio wrote:
> > On 4/17/25 8:12 AM, Gokul Sriram Palanisamy wrote:
> >> From: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
> >>
> >> Enable nodes required for q6 remoteproc bring up.
> >>
> >> Signed-off-by: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
> >> Signed-off-by: Gokul Sriram Palanisamy <gokul.sriram.p@oss.qualcomm.com>
> >> ---
> >> changes since v3:
> >>         - added necessary padding for 8digt hex address in dts 
> >>         - fixed firmware-name to use .mbn format
> >>
> >>  arch/arm64/boot/dts/qcom/ipq5332.dtsi | 64 ++++++++++++++++++++++++++-
> >>  1 file changed, 63 insertions(+), 1 deletion(-)
> >>
> >> diff --git a/arch/arm64/boot/dts/qcom/ipq5332.dtsi b/arch/arm64/boot/dts/qcom/ipq5332.dtsi
> >> index 69dda757925d..fc120fd8b274 100644
> >> --- a/arch/arm64/boot/dts/qcom/ipq5332.dtsi
> >> +++ b/arch/arm64/boot/dts/qcom/ipq5332.dtsi
> >> @@ -2,7 +2,7 @@
> >>  /*
> >>   * IPQ5332 device tree source
> >>   *
> >> - * Copyright (c) 2022-2023 Qualcomm Innovation Center, Inc. All rights reserved.
> >> + * Copyright (c) 2022-2025 Qualcomm Innovation Center, Inc. All rights reserved.
> >>   */
> >>  
> >>  #include <dt-bindings/clock/qcom,apss-ipq.h>
> >> @@ -146,6 +146,11 @@ smem@4a800000 {
> >>  
> >>  			hwlocks = <&tcsr_mutex 3>;
> >>  		};
> >> +
> >> +		q6_region: wcss@4a900000 {
> >> +			reg = <0x0 0x4a900000 0x0 0x2b00000>;
> >> +			no-map;
> >> +		};
> >>  	};
> >>  
> >>  	soc@0 {
> >> @@ -545,6 +550,39 @@ frame@b128000 {
> >>  				status = "disabled";
> >>  			};
> >>  		};
> >> +
> >> +		q6v5_wcss: remoteproc@d100000 {
> >> +			compatible = "qcom,ipq5332-wcss-sec-pil";
> >> +			reg = <0x0d100000 0x4040>;
> > This is 0x10_000-long
> >
> >> +			firmware-name = "ath12k/IPQ5332/hw1.0/q6_fw0.mbn";
> > Is the firmware OEM signed?
> >
> No. This isn't OEM signed. userPD firmwares will only be OEM signed.

Indeed, it contains only Qualcomm / QTI signature, OEM signature is not
present.

-- 
With best wishes
Dmitry
