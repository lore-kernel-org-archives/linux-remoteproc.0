Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7DE621518F
	for <linux-remoteproc@vger.kernel.org>; Fri,  2 May 2025 22:56:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746226565; cv=none; b=r6/xobyI/kjWqY3k/jIqlWKsPhVUfIkC5tmVSy4wJQmquTAM1Qe6hslj1UPfs5ytNuDnTPz61LNNY7B0MJUyCfAokpd9dTJfw9X7nv9yWjBy6dQyAGuDWIJuXNgYSU7ohS0glA9ozgsm2ldkINJECwxqqUVVN/WWRFwhrgn/U78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746226565; c=relaxed/simple;
	bh=8ztnMAKmbdyNsPGlxL7edxZO62BJYChUmRhguiclIuc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IaHcbXupeNSJEijH676VhqS6idpyHoRRvMtgA+9sO3NIf4DknoBXfrqgxlxRSoSsv7W/pGO9tQUtk7A7uc6twvyoTLM+D920Rh/arxbce4GX2QXjm/vzELxHq+TQ4Eaj0eNhFoHHiqIzwIUxbpGFj3eteK8IoQJnP58se39/3qA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nnMuuV/u; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nnMuuV/u"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 542KBg2O016916
	for <linux-remoteproc@vger.kernel.org>; Fri, 2 May 2025 22:56:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=1bOVgb8M6+D/Cf10VFmMIFoe
	5eQvQy5G8sTzJf7ev0Q=; b=nnMuuV/ukkrbGhT8RV3E3LdTpcgexym3eyUUA4Pe
	PB6PEsvGuek01R4Ao3fgmRzWOs6Qqog674w4R6NDeigYetsqsRcsr6D/AMZ6DgKq
	MARFHQp8u7UsR4pytkuex7dYtswv8Mz/21ytIjPxmJDhPU64/tiIjCetJcCj0nvJ
	jWyUGe9At2Mfahn5GC3UuhZ40aUi4XsALFgPLQHfCinautOjMg0sTrUeTJW7+blr
	GLXr9n5OrLCk5ufXn5S8HGNIm1dzi52tpkv5c2Rz1yfZH+J+/9f13a9QmpB0G8og
	QJrHCBcngKNHZJKH9SdOHcjRznODVtK7KaS/vV/TBI1Tpw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46b6uaheuh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Fri, 02 May 2025 22:56:03 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4853364ad97so31872771cf.0
        for <linux-remoteproc@vger.kernel.org>; Fri, 02 May 2025 15:56:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746226561; x=1746831361;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1bOVgb8M6+D/Cf10VFmMIFoe5eQvQy5G8sTzJf7ev0Q=;
        b=W+TpOLFk2FWqQWHjYpI/jlSE+b1o/oEjDpKTedLycmZxVOfeDsmfYuDNz9CgYkZ6tr
         i8yUzcSd5Y9WPgKgKyChCCv9rFsanlMf2A710UOi58Lqm9P3khHVj/Nlz0gsME2qDTA0
         5e6VhnIkD0Ei3pfGke19DhzIctr/QnNB1z6c+2N1IUXiEJmXfTXOt6f2gGk9XtZ2it77
         eeoU8DdlvMJSz7xoRNa6Fqtstd6GFjbZ17AkGnzMtbkq7GPR8S3wI0keOoK/BgAKnTpJ
         SPLZPjPSye+1oqaX03bVT+zz99V3hD+QN7ceF8gjzmnRV1/PuTpnPHs1gMIvW7mM7Uem
         ABRQ==
X-Forwarded-Encrypted: i=1; AJvYcCUxAvT2hCqUqjcyzoKEwYAIDs3p7UgMUdS/5dgxw2dDn6AZWJtHBy/hVGi567jfwgIP8POJXVsRXYPxD+jvCpOu@vger.kernel.org
X-Gm-Message-State: AOJu0YwFajcXNdz4yc0YUSA+aqsjvQQUM0WtFWpGngdoaEW3LO4ebJM1
	hNOSdbocJCHwCn/DsTWBKKXWoYIRxkBmhQNV5LU/LH7LxfxjfcJJiQ2C/w97IWppEcRopDJzJms
	oZFxyC1DhFNb4W02+fMcU8RBoOJ7gSUR1edXKZL1uncZM7aMj8gsD05myhyhfDzFmVKbl
X-Gm-Gg: ASbGnctkF2SI/4AQOxT2fcMyn+NQzjHh186hHTRVrxTtwbB3e/Kjqq0SFJF9CbUzVgC
	lJAPQC9GhzDkfDCvaZMf7zEMjVeJV0avYf18O4cRG8HY6R3wKbjQTAClv9IpeIQ30667PqWLrmU
	mywJvX2aRgUM1d6hlDdTg8M62FRI46IGNQKpWYrqRD73gGgymRxvKdTXjRAo+yoVNtySwGDLP5U
	BgdE5/ZsVaKzeuwrWN0uSHW/2Ojlcq30sqszMQ9yDH6M7F7RgmkF0JdNAo6Py0L53y1P1zPNxzG
	O1Z+XKQdZ7hGJ46RDRrsKC6yhx23/2g5IKVvgFzPRJswYJnCNbk69CvCaerKEBIGEOPQBXmmDUg
	=
X-Received: by 2002:a05:622a:1924:b0:48a:2122:5047 with SMTP id d75a77b69052e-48c30d80312mr77701851cf.8.1746226561598;
        Fri, 02 May 2025 15:56:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHT8z6Lg3ovxc73cJTMCXyVkvLsgnAqZM902lh4jo0RicuOeI5EXmmvrbC9puKXeOOVnqrsqg==
X-Received: by 2002:a05:622a:1924:b0:48a:2122:5047 with SMTP id d75a77b69052e-48c30d80312mr77701501cf.8.1746226561049;
        Fri, 02 May 2025 15:56:01 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-32029019c4dsm5052961fa.46.2025.05.02.15.55.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 May 2025 15:56:00 -0700 (PDT)
Date: Sat, 3 May 2025 01:55:58 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH 3/3] arm64: dts: qcom: sc8280xp: Add SLPI
Message-ID: <rjhuxssogtsxitmocxnlt3im44imyvui5ssc6ptshepxvgo2hv@npmexcs7nqpy>
References: <20250503-topic-8280_slpi-v1-0-9400a35574f7@oss.qualcomm.com>
 <20250503-topic-8280_slpi-v1-3-9400a35574f7@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250503-topic-8280_slpi-v1-3-9400a35574f7@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=BNizrEQG c=1 sm=1 tr=0 ts=68154d83 cx=c_pps a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=G4SMBwoHVf5iV8dplL4A:9 a=CjuIK1q_8ugA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTAyMDE4OCBTYWx0ZWRfXxJ80FgmbY2sd pvehHZy9gN4m35hI1NNC10XowTrA8L73Umw47rM06IEw5cVFWCQlFBBquUGJqkRy4TysvUsHbte pMn1Lj478d/LHogmFs5OvFOWIWarGhcNvnSag1AFS1MHkkRZ+g/DvjIyIwP1j8OqJWE4hZrosVB
 WIkfOefxIR/jt3gdU12zPzsh+hCgqWJRgTuFQ/bQaxrJ6RILWipnX1x2590GhDuPez7hZNo4xWX gq52q2o4X9R6xumrOdqoho5dMW409HletiwK8baJloBJ6kynlF5bkIehaGvK6EboHO6Ec6wuLMZ N9NU20PAYGVAnxllaIEm3q7+VPV3g+LlZrnyv4NrT5LuY7+ilgRhiZ/wEF2okDd5rN7XRcavDtv
 93IIPQC9cbITse9OgpLzw38P2hc0XFxKbk2iFAQs6bW2oSbDchkrDgGmVEGW6vrZDQ83EPA3
X-Proofpoint-GUID: Ukb2grhTwEN3FavL26u9ED0M2wR70EUm
X-Proofpoint-ORIG-GUID: Ukb2grhTwEN3FavL26u9ED0M2wR70EUm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-02_05,2025-04-30_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 impostorscore=0 bulkscore=0 clxscore=1015 spamscore=0 adultscore=0
 phishscore=0 mlxscore=0 suspectscore=0 lowpriorityscore=0 malwarescore=0
 mlxlogscore=499 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505020188

On Sat, May 03, 2025 at 12:38:01AM +0200, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> SC8280XP features a SLPI (Sensor Low Power Island) core. Describe it.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Have your tried enabling it for X13s? Windows drivers provide
qcslpi8280.mbn in the qcsubsys_ext_scss8280.cab cabinet.

> ---
>  arch/arm64/boot/dts/qcom/sc8280xp.dtsi | 72 ++++++++++++++++++++++++++++++++++
>  1 file changed, 72 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
> index 3f9195da90ee898c68296f19dc55bcb3ac73fe29..75ec34bfa729946687c4c35aa9550685cac95a10 100644
> --- a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
> @@ -695,6 +695,11 @@ pil_adsp_mem: adsp-region@86c00000 {
>  			no-map;
>  		};
>  
> +		pil_slpi_mem: slpi-region@88c00000 {
> +			reg = <0 0x88c00000 0 0x1500000>;
> +			no-map;
> +		};
> +
>  		pil_nsp0_mem: cdsp0-region@8a100000 {
>  			reg = <0 0x8a100000 0 0x1e00000>;
>  			no-map;
> @@ -783,6 +788,30 @@ smp2p_nsp1_in: slave-kernel {
>  		};
>  	};
>  
> +	smp2p-slpi {
> +		compatible = "qcom,smp2p";
> +		qcom,smem = <481>, <430>;
> +		interrupts-extended = <&ipcc IPCC_CLIENT_SLPI
> +					     IPCC_MPROC_SIGNAL_SMP2P
> +					     IRQ_TYPE_EDGE_RISING>;
> +		mboxes = <&ipcc IPCC_CLIENT_SLPI
> +				IPCC_MPROC_SIGNAL_SMP2P>;
> +
> +		qcom,local-pid = <0>;
> +		qcom,remote-pid = <3>;
> +
> +		smp2p_slpi_out: master-kernel {
> +			qcom,entry-name = "master-kernel";
> +			#qcom,smem-state-cells = <1>;
> +		};
> +
> +		smp2p_slpi_in: slave-kernel {
> +			qcom,entry-name = "slave-kernel";
> +			interrupt-controller;
> +			#interrupt-cells = <2>;
> +		};
> +	};
> +
>  	soc: soc@0 {
>  		compatible = "simple-bus";
>  		#address-cells = <2>;
> @@ -2454,6 +2483,49 @@ tcsr: syscon@1fc0000 {
>  			reg = <0x0 0x01fc0000 0x0 0x30000>;
>  		};
>  
> +		remoteproc_slpi: remoteproc@2400000 {
> +			compatible = "qcom,sc8280xp-slpi-pas", "qcom,sm8350-slpi-pas";
> +			reg = <0 0x02400000 0 0x10000>;
> +
> +			interrupts-extended = <&pdc 9 IRQ_TYPE_EDGE_RISING>,
> +					      <&smp2p_slpi_in 0 IRQ_TYPE_EDGE_RISING>,
> +					      <&smp2p_slpi_in 1 IRQ_TYPE_EDGE_RISING>,
> +					      <&smp2p_slpi_in 2 IRQ_TYPE_EDGE_RISING>,
> +					      <&smp2p_slpi_in 3 IRQ_TYPE_EDGE_RISING>;
> +			interrupt-names = "wdog",
> +					  "fatal",
> +					  "ready",
> +					  "handover",
> +					  "stop-ack";
> +
> +			clocks = <&rpmhcc RPMH_CXO_CLK>;
> +			clock-names = "xo";
> +
> +			power-domains = <&rpmhpd SC8280XP_LCX>,
> +					<&rpmhpd SC8280XP_LMX>;
> +			power-domain-names = "lcx", "lmx";
> +
> +			memory-region = <&pil_slpi_mem>;
> +
> +			qcom,qmp = <&aoss_qmp>;
> +
> +			qcom,smem-states = <&smp2p_slpi_out 0>;
> +			qcom,smem-state-names = "stop";
> +
> +			status = "disabled";
> +
> +			glink-edge {
> +				interrupts-extended = <&ipcc IPCC_CLIENT_SLPI
> +							IPCC_MPROC_SIGNAL_GLINK_QMP
> +							IRQ_TYPE_EDGE_RISING>;
> +				mboxes = <&ipcc IPCC_CLIENT_SLPI
> +						IPCC_MPROC_SIGNAL_GLINK_QMP>;
> +
> +				label = "slpi";
> +				qcom,remote-pid = <3>;

No fastrpc contexts?

> +			};
> +		};
> +
>  		remoteproc_adsp: remoteproc@3000000 {
>  			compatible = "qcom,sc8280xp-adsp-pas";
>  			reg = <0 0x03000000 0 0x10000>;
> 
> -- 
> 2.49.0
> 

-- 
With best wishes
Dmitry
