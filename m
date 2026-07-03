Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C2B425DB0D
	for <linux-remoteproc@vger.kernel.org>; Fri,  3 Jul 2026 15:48:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783093722; cv=none; b=Oliu1SFYs9NI/nBmrX7Jk1l+Vhwz2uksPMpg+tZe/RV9oyba7saTB4nDNhOCF4mHWi62XkobDs+SC9XBFb37Leq3X/Kmi/BmM7F5DJeurH2avhHB9FF/5YHGM+kVwleCO1qa3Ygc3QlJT9NnwRngQWIUw/9/9+LVEJv5At+mDGw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783093722; c=relaxed/simple;
	bh=+kphoTvANLDKHMDgJNzN8NAjl3dMOmN6aFLAl4/R3qs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DP8JYD6BAIGa5tkhhKuwHzBWUInfQQYczZN1mPrLCRD2HA73f+wyKYEdlMpGfpzeN8mMjuSnoaSUvAy9R2DQMoxwLYY8oHYTd9qqM2PQDrsPDTZRYNY25+/GOz4KtgyHZ0CDPFtQq+BRHdGdq6pLmi8BhnXof86d8jrGkvoufB4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dYBxKI8z; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JkShtexq; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dYBxKI8z";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JkShtexq"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 663A39OP3773578
	for <linux-remoteproc@vger.kernel.org>; Fri, 3 Jul 2026 15:48:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6uEU2G8CSSk6Zshq/zPfEKAJegI9f9YQqTxeUAIwcCk=; b=dYBxKI8zcY3WHh5P
	jPgSz3GQTvE6Zv2Z+SZKtYPmIqL5Y8kP0ydk5D+y6iAoBbW0BgP5AwPQw7h/q9GY
	nNaxhQ4ijGe/wq87kbgyqipDDCB5GcbQu3YYSsQfsorkTYW06eOU0Y2g2q3s95u9
	DUmwN6jOKDYnySPFykHDwvw2sWLBcaBF5JeGR6HJ8o3I9Hweqj1xQGc7cDLP3bKz
	Kbg5AXqKe5lAjAY/hlBw5m/rmObsumiS4urriyjMAPCKG5xNYAnwHwtiJ0Zvc/bK
	KJgyLuRaYs0Sl1JV0/fM4tfJpmfReEbb9JS6uOB74q0924VtduYXcBNbQV7KEQdm
	QZ+B3A==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f6b0398cp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Fri, 03 Jul 2026 15:48:39 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-5bda012e304so206189e0c.2
        for <linux-remoteproc@vger.kernel.org>; Fri, 03 Jul 2026 08:48:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783093719; x=1783698519; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=6uEU2G8CSSk6Zshq/zPfEKAJegI9f9YQqTxeUAIwcCk=;
        b=JkShtexqH6RzXwU+XAxyabd9/GkNTaEtXv5mOpVjUPqcHZyJAagYHEPRI0b6VGS5Sp
         i0eQ1hLaYQI9ltLFDFnFHk12KEdIJNWqlHQ9jms4va2XU/let8ac8Mo2LZ7rZ31oph37
         fTytd4cRQTudmR0S+EkQvQfsJByDv6m2iGTs4+SJMCWcCLkcmyeFymTrF4adw+46+Lyh
         MlwE7MrAbpODMLznzdrIrKMDv7Gw/JkimHQKDzXL1eFj3QEXQuYh4a7WrcCxVVTi/SMS
         TVJrRU3fI7Yzmd8zgAS/H1OQ7Kjd6LliXQOE1Hm6ICJmpUPNZEE6574O8Md2aVpcX1Sx
         ebhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783093719; x=1783698519;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6uEU2G8CSSk6Zshq/zPfEKAJegI9f9YQqTxeUAIwcCk=;
        b=ZMwpnUlDLP2cM+p4kxNU9YFSJpGDnm0ChRF8Y3GWBLHoYfH4pEQrpk620Uba1L3F5t
         arlQPsfrdkDGJjadz4nEFlb5xoBoI1mxVwgEsWW7xkxagzXFItDMtuV+BR8yv73NlfcX
         tVNW3MGF1ZmnWZgHKxQn8YivWSiPxIkN2uQ3INmh37RIQXn0M7Q14Ti2sXd6aR0g0SGN
         opqyWd93D/493El9TdUOqgh/CkLsHy8q0RKgQXmokN1ZPu/Spopg63PU29pFqT/vBZGC
         e6OJsM8Q+lVshVrEMiJ6tnSbX27Nt50Tbs2Rlgt0+a/npaari8F013GY4ojzFz9Q+tPd
         FeHQ==
X-Forwarded-Encrypted: i=1; AHgh+RqADcczaW+ZpHMa7Gq7PxNsvBjX+bjztpYj8wViUSGbHbs63eVbcFrfZ2GPjIoaPsdnUg38zRqMasEKOJbb3tr2@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7NiIXVbaMDsxIvFl+rxvUjOPWrlC6szxCzxPFVzsSrvmNAURJ
	UWJ/5CgCmN3hTSbpc4R7gEfi4waHYalyEJ0QHtkYQ85iytLFQbITE8otPsH/fro7M4XroKKYZvH
	OrbSlWXCd3IPdVL6g91HWa2yDrUfkQsSJyr0W0nS9xgHp76JVDI0Be2vXZsFtO5ANXKdN5b/o
X-Gm-Gg: AfdE7cnTB89bsPIXmYnrj8AiNhEvMPD4pHHflaevYn5ogleF9a+9/QkZeGTqMKnrTn4
	0OhqK32G94khOP7gjt5LrNo5Byb3iLigTvHV5RAoJxnaW8R7zoaQsbwe7i9JRv+kG3snGFstjdC
	7s1ExWGcLnrBTvbNTlQpjABdCscJ7dCPFTsj9ItPaygn6Bc+8/TonKUYoCO8KJwWT+IolTlBkud
	G8Ons+/2cd5D/a6vj5ji01ZAiTxr6yB4TVElhoXK72GBljKIcDtzi3y8QxRtPj0OoF0pm5ZKQvn
	2ClYhgd657vVhV31VYIfGOii4knDoDWwdgAzVCY7PqIl2krPcgCB0DRYxGsOJ8FsdiBpBc11sYX
	rKzxYDD27+6PypNnqvgdywrldJ2QAVxBgIHtzXrpnQ2u+SrRlpdEBKnE0HEk0aMPwQqaRbty287
	H6Mcb58bxqC3FkOkaH4lmjRTC5
X-Received: by 2002:a05:6122:c83:b0:5bd:742d:ba77 with SMTP id 71dfb90a1353d-5be1028b9c1mr26710e0c.10.1783093718717;
        Fri, 03 Jul 2026 08:48:38 -0700 (PDT)
X-Received: by 2002:a05:6122:c83:b0:5bd:742d:ba77 with SMTP id 71dfb90a1353d-5be1028b9c1mr26696e0c.10.1783093718195;
        Fri, 03 Jul 2026 08:48:38 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aed137705dsm571958e87.32.2026.07.03.08.48.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 08:48:35 -0700 (PDT)
Date: Fri, 3 Jul 2026 18:48:33 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
        Amit Kucheria <amit.kucheria@oss.qualcomm.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-hardening@vger.kernel.org,
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
Subject: Re: [PATCH v4 06/10] arm64: dts: qcom: kodiak: Enable CDSP & Modem
 cooling
Message-ID: <pli4napz5xis7i24oum73wnaecvqz53nxy7ek6mftlxsq7qkyt@nc7jp6oi4fix>
References: <20260703-qmi-tmd-v4-0-3882189c1f83@oss.qualcomm.com>
 <20260703-qmi-tmd-v4-6-3882189c1f83@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260703-qmi-tmd-v4-6-3882189c1f83@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDE1NyBTYWx0ZWRfX/S91+HIwP59m
 v/tC7se6a6B4pNqoFPm1l2i5nhyVT3tnsUJPDJCwd4TKtkV2kiKYWOq1X1ISL3z7wlul80nFraL
 2MEIhYeFpWUU6bk/qeDyLSayHAL4YaM=
X-Proofpoint-GUID: LHl5jClY7F4PhF7qWWqDBSrruq79tbQ-
X-Authority-Analysis: v=2.4 cv=FoY1OWrq c=1 sm=1 tr=0 ts=6a47d9d7 cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=FiV8zanugsH5vQb0BJEA:9 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10
 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDE1NyBTYWx0ZWRfX0+5oDhx9+Pal
 NprNAykw9yLWFInPLiUv6MIsXAwjf9D985naecU2RzRj1cJFnVSGOSoHCIdA8JLyfIeUzYsbeta
 FEEH7WjPHB5QLwdVU0+ftu3f+DepxrziiKWGXC1QzT/GUiHmYr5e9jr6n/DPV/0jXiLtPdXxzoY
 PFI4AOH6oZZwvR+xaT5IBztvgJ4wuF6zlgPx+yYS2QAblLbOu2H91mdXxHprqHEaQ4esLcqWfKE
 gyma5tuSL9tio2P0eLDhceTHU/jW28z0De9kvtHmJ92pDxoVHMagaIbpW5whmveSRtFJx/3Ndtb
 L0rhpZ2CkXbvuB9TCCZdft57QaKNY2MAnNSh1AnJRD9itf/iMyVRh+nkQNlg+Fe04Qu/3PQmtEk
 Ycy415jNHf2Usdr11fx1OOGYu/4ij4r7xquuxZ2OJLb2aiP8CFjy41P1iaGINY+k4kCS4UCmX/l
 DBspg9HNxmTxYHx246A==
X-Proofpoint-ORIG-GUID: LHl5jClY7F4PhF7qWWqDBSrruq79tbQ-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 malwarescore=0 adultscore=0 suspectscore=0
 spamscore=0 bulkscore=0 priorityscore=1501 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607030157

On Fri, Jul 03, 2026 at 10:33:09AM +0530, Gaurav Kohli wrote:
> Unlike the CPU, the CDSP/Modem does not throttle its speed automatically
> when it reaches high temperatures in kodiak.
> 
> Set up CDSP cooling by throttling the cdsp when it reaches 100°C and
> for modem when it reaches to 95°C.
> 
> Since the remoteproc_mpss node doesn't exist on non modem boards, the
> cooling-maps that reference it cause DT compilation errors. To fix that
> remove inherited mdmss cooling-map nodes.
> 
> Signed-off-by: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/kodiak.dtsi               | 134 ++++++++++++++++++++-
>  .../boot/dts/qcom/qcs6490-radxa-dragon-q6a.dts     |  17 +++
>  arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts       |  17 +++
>  .../dts/qcom/qcs6490-thundercomm-minipc-g1iot.dts  |  17 +++
>  .../boot/dts/qcom/qcs6490-thundercomm-rubikpi3.dts |  17 +++
>  .../boot/dts/qcom/sc7280-herobrine-lte-sku.dtsi    |  17 +++
>  .../boot/dts/qcom/sc7280-herobrine-wifi-sku.dtsi   |  16 +++
>  7 files changed, 231 insertions(+), 4 deletions(-)
> 
> @@ -7716,6 +7722,8 @@ map0 {
>  		};
>  
>  		nspss0-thermal {
> +			polling-delay-passive = <200>;

Why? This applies to all added polling delays.

> +
>  			thermal-sensors = <&tsens1 3>;
>  
>  			trips {
> diff --git a/arch/arm64/boot/dts/qcom/qcs6490-radxa-dragon-q6a.dts b/arch/arm64/boot/dts/qcom/qcs6490-radxa-dragon-q6a.dts
> index bb5a42b038f1..400d128132fc 100644
> --- a/arch/arm64/boot/dts/qcom/qcs6490-radxa-dragon-q6a.dts
> +++ b/arch/arm64/boot/dts/qcom/qcs6490-radxa-dragon-q6a.dts
> @@ -24,6 +24,23 @@
>  /delete-node/ &adsp_mem;
>  /delete-node/ &cdsp_mem;
>  /delete-node/ &ipa_fw_mem;
> +
> +&mdmss0_thermal {
> +	/delete-node/ cooling-maps;

Don't kill what is unnecessary to be killed. Remove only MPSS maps.

> +};
> +
> +&mdmss1_thermal {
> +	/delete-node/ cooling-maps;
> +};
> +
> +&mdmss2_thermal {
> +	/delete-node/ cooling-maps;
> +};
> +
> +&mdmss3_thermal {
> +	/delete-node/ cooling-maps;
> +};
> +
>  /delete-node/ &mpss_mem;
>  /delete-node/ &remoteproc_mpss;
>  /delete-node/ &remoteproc_wpss;
> diff --git a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
> index 37a3b51323ce..187bc2899191 100644
> --- a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
> +++ b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
> @@ -25,6 +25,23 @@
>  /delete-node/ &rmtfs_mem;
>  /delete-node/ &adsp_mem;
>  /delete-node/ &cdsp_mem;
> +
> +&mdmss0_thermal {
> +	/delete-node/ cooling-maps;

But MPSS is there. Why are you removing it?

> +};
> +
> +&mdmss1_thermal {
> +	/delete-node/ cooling-maps;
> +};
> +
> +&mdmss2_thermal {
> +	/delete-node/ cooling-maps;
> +};
> +
> +&mdmss3_thermal {
> +	/delete-node/ cooling-maps;
> +};
> +
>  /delete-node/ &video_mem;
>  /delete-node/ &wlan_ce_mem;
>  /delete-node/ &wpss_mem;
> diff --git a/arch/arm64/boot/dts/qcom/qcs6490-thundercomm-minipc-g1iot.dts b/arch/arm64/boot/dts/qcom/qcs6490-thundercomm-minipc-g1iot.dts
> index a5ad796cb65d..1e190ed18ae5 100644
> --- a/arch/arm64/boot/dts/qcom/qcs6490-thundercomm-minipc-g1iot.dts
> +++ b/arch/arm64/boot/dts/qcom/qcs6490-thundercomm-minipc-g1iot.dts
> @@ -22,6 +22,23 @@
>  /delete-node/ &cdsp_mem;
>  /delete-node/ &ipa_fw_mem;
>  /delete-node/ &mpss_mem;
> +
> +&mdmss0_thermal {
> +	/delete-node/ cooling-maps;
> +};
> +
> +&mdmss1_thermal {
> +	/delete-node/ cooling-maps;
> +};
> +
> +&mdmss2_thermal {
> +	/delete-node/ cooling-maps;
> +};
> +
> +&mdmss3_thermal {
> +	/delete-node/ cooling-maps;
> +};
> +
>  /delete-node/ &remoteproc_mpss;
>  /delete-node/ &remoteproc_wpss;
>  /delete-node/ &rmtfs_mem;
> diff --git a/arch/arm64/boot/dts/qcom/qcs6490-thundercomm-rubikpi3.dts b/arch/arm64/boot/dts/qcom/qcs6490-thundercomm-rubikpi3.dts
> index f47efca42d48..8e8dd4efd8c0 100644
> --- a/arch/arm64/boot/dts/qcom/qcs6490-thundercomm-rubikpi3.dts
> +++ b/arch/arm64/boot/dts/qcom/qcs6490-thundercomm-rubikpi3.dts
> @@ -23,6 +23,23 @@
>  /delete-node/ &adsp_mem;
>  /delete-node/ &cdsp_mem;
>  /delete-node/ &ipa_fw_mem;
> +
> +&mdmss0_thermal {
> +	/delete-node/ cooling-maps;
> +};
> +
> +&mdmss1_thermal {
> +	/delete-node/ cooling-maps;
> +};
> +
> +&mdmss2_thermal {
> +	/delete-node/ cooling-maps;
> +};
> +
> +&mdmss3_thermal {
> +	/delete-node/ cooling-maps;
> +};
> +
>  /delete-node/ &mpss_mem;
>  /delete-node/ &remoteproc_mpss;
>  /delete-node/ &remoteproc_wpss;
> diff --git a/arch/arm64/boot/dts/qcom/sc7280-herobrine-lte-sku.dtsi b/arch/arm64/boot/dts/qcom/sc7280-herobrine-lte-sku.dtsi
> index b721a8546800..1e9d7e7b5fa2 100644
> --- a/arch/arm64/boot/dts/qcom/sc7280-herobrine-lte-sku.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7280-herobrine-lte-sku.dtsi
> @@ -26,8 +26,25 @@ &ipa {
>  	status = "okay";
>  };
>  
> +&mdmss0_thermal {
> +	/delete-node/ cooling-maps;
> +};
> +
> +&mdmss1_thermal {
> +	/delete-node/ cooling-maps;
> +};
> +
> +&mdmss2_thermal {
> +	/delete-node/ cooling-maps;
> +};
> +
> +&mdmss3_thermal {
> +	/delete-node/ cooling-maps;
> +};
> +
>  &remoteproc_mpss {
>  	compatible = "qcom,sc7280-mss-pil";
> +	/delete-property/ #cooling-cells;
>  	reg = <0 0x04080000 0 0x10000>, <0 0x04180000 0 0x48>;
>  	reg-names = "qdsp6", "rmb";
>  
> diff --git a/arch/arm64/boot/dts/qcom/sc7280-herobrine-wifi-sku.dtsi b/arch/arm64/boot/dts/qcom/sc7280-herobrine-wifi-sku.dtsi
> index 3ebc915f0dc2..6642076f62c4 100644
> --- a/arch/arm64/boot/dts/qcom/sc7280-herobrine-wifi-sku.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7280-herobrine-wifi-sku.dtsi
> @@ -7,6 +7,22 @@
>  
>  /* WIFI SKUs save 256M by not having modem/mba/rmtfs memory regions defined. */
>  
> +&mdmss0_thermal {
> +	/delete-node/ cooling-maps;
> +};
> +
> +&mdmss1_thermal {
> +	/delete-node/ cooling-maps;
> +};
> +
> +&mdmss2_thermal {
> +	/delete-node/ cooling-maps;
> +};
> +
> +&mdmss3_thermal {
> +	/delete-node/ cooling-maps;
> +};
> +
>  /delete-node/ &mpss_mem;
>  /delete-node/ &remoteproc_mpss;
>  /delete-node/ &rmtfs_mem;
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
