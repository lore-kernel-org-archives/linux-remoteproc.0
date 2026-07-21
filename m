Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C01D935C6B0
	for <linux-remoteproc@vger.kernel.org>; Tue, 21 Jul 2026 23:11:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784675498; cv=none; b=kYgUUWAyB4Y0wUug28RwP8Cm/WoAylSWm7zckRtizyJasSLnJDdItw90GrMLXL3EhJkI1+cEuKlNwr2E8DJB+O7WU0aSiXpzBQ879xOUO/kTwHh8cVKiurFd/S3UrlclMTGPucfXozjF4LDjMnKowqbf03nIdH588VHxw5kqUrc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784675498; c=relaxed/simple;
	bh=eH8z0mGXqV9qOIzaD8q0YQ/3GqyOUueOX4xNVDLwfA8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FnGSS1nVy0xrY4q6tp0PyytTT86pgQte21J/COhAFNlGSULvnuEGgQtlsTC5thzp8TqZXZwX+IyLDoORiCIFivuCsKBKhjrewAAXqADEYq+9UGw5ucK5T3sbB9wdyIKClZTkoH/AhAfVot3UB11V9psrGZ++Onp7W/3cSiO72EY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IWuHd0XH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HZ7cbXjO; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IWuHd0XH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HZ7cbXjO"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66LMZ58p3136804
	for <linux-remoteproc@vger.kernel.org>; Tue, 21 Jul 2026 23:11:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1HkUpSLfKpho1zBAC20rgIBYsxHtJvalAZZYsw2uvbs=; b=IWuHd0XH2i3IrAqJ
	tl2bgqXWgcif+YLiXP+8EP6BrOaE84blUBMMhPEr6dY5USMQ2iDSHfb7KTwiB/8b
	/BhiKzS3w1Rw79aIp40luvXhXAe2vu2sudp7uuvtpx3zfpj8D3cixC1yJPTTJ/xs
	XNZNH4UyEKIPciz6KKEpDbfY9BPcFVl2ZRHlnd/wrot4FN28+wB59jhm4tPYZdMD
	+dF7Cfyx6KwH7dYojA3K9hKJ9NP8Ic8Jynz+vWI8hTvCE2rMdueI5mLyrD6YXeFd
	A7f6T4uQdUa3qLhRWzdOjqPTtq6iMsXkEdHfVqjCH5dpK+wAhD3NQUg9EJdVF8fR
	1c8Ztg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fjd6d181w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Tue, 21 Jul 2026 23:11:34 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51c20762d21so117131851cf.0
        for <linux-remoteproc@vger.kernel.org>; Tue, 21 Jul 2026 16:11:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784675494; x=1785280294; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=1HkUpSLfKpho1zBAC20rgIBYsxHtJvalAZZYsw2uvbs=;
        b=HZ7cbXjO9EVNEzqie9FqtHAMTtkAABZPQlJw0QsLQL4jAI7nI3EVqhOagyMJuahBDH
         kWDrK8kULmsxqVWDmAAVq/a/FXhueKEIx3t+kG+zMkdpdd+9JCf8Z3n9P8jCa+h2Hn70
         ucaqbq4UrgNl/lzeGd2pGq/EZibR7xPgdqjwQgvr4WTf2nGQr5BrkoXNrn2tvo6PRLTL
         bE6qAsHlIGoEqKynQJkZ1v1t74CeAYgkR7ja1TQpO7fp02+vsbK+cn6zXjarKwmYdyMc
         NGDBMYzeQZSJDTollVrJOnPG/3Nt3g98pwW835Qr5fem9e1kuSIy2HdURXq0PrADl+Ou
         FvXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784675494; x=1785280294;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=1HkUpSLfKpho1zBAC20rgIBYsxHtJvalAZZYsw2uvbs=;
        b=d4UWIOHQ37hrzwaZ8FAZqfhlm9+kN12tkJn5jn6uRg4d20APLDpp47WTN7N+mwfQsD
         adPB+d86m1A4UDG22N/1Dj7NqPHG4yGzQyghd5RiGebQAlsPzNlnVdzcXMEF4aL5792t
         2e5lMYYmqAtV7skTCMZA0Vh7bcgSQ59lxYtxqA3MSkx6/3zjfyLscgUVd9uvnm/3QsIL
         XvIpILeiJG1Vf75/Q2yETIz0PznnOQlMx++9FLKZL7MfhA/J7pbFU3i+14fJop0KAweO
         1Ms+/4zWU/OejInrbcIr0ux/Zrn/5Ms4yw6FjqWoAIEbLZyE464Ast5xoljJQSeTPeV8
         wm4w==
X-Forwarded-Encrypted: i=1; AHgh+RqcB1leq4D/p1R2uWRbKbnIJ0WyzM6Zkvrr933joRm9ZNn0vV56wIu2P/f1R+p6I+Io8ZIH0EYV80WPimUruLQN@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7G8jL2RcNHV9QtHoi9oaf/rfaCBBVQc7wButZKY3tml70YCzP
	oFY13hFhoxKqvJH3/hYbUk7WU3eLqrbCN10Gmh+yVbqzKaZqyxtt18B1SXrepujG4T8o2T/UW66
	KSrnETFFkqWIhp0/mepbp9AGw20nFbnqfW+Jn6Tb3+dQdNVgLZr20FWMq0d9gT5Bc0HcynRTZ
X-Gm-Gg: AfdE7clx3XGb9nG+3wfII6A+bYgGfaEuMQh9EuusC04GJDRUz9MATobweYcQFRJZGN7
	KS7yyDwXckhThy276AvVO18iWKh81KXYOvDhb/9mNgGrc+hhB4LRCXnBSJ5XdO/lAD8dclXkMVr
	scmLT2sPv3NdLzxpklKWLAq+oAhJejJF9Jaw1qTUSFogYTnoyI2rUOPAxmE9JEr0e4rETyUAeKK
	8Fi561fUafQOV2aOGbV/9/tPOP1PazGbUBWSB+EmtgsUSI47us+7bbS1uw/TLOPSBgrCpupqXTf
	1xo9IvgtyUGFyGtuPbxJD36B+QBvSnoCs1dN5yaWRYUngc7K+o/CvqszG087wcbFZ7xzqKDZtKw
	CVYJjEHKs17HWe+zzog+kAAlSOJu5A5dqA5rPPS62HHTW9y4DalZB0CoPRp4Cg4BTp/yWoOw+3D
	2jPCzjZuPriPHi/A==
X-Received: by 2002:a05:622a:1813:b0:51c:140c:6893 with SMTP id d75a77b69052e-5213c10a2e4mr201998471cf.11.1784675494021;
        Tue, 21 Jul 2026 16:11:34 -0700 (PDT)
X-Received: by 2002:a05:622a:1813:b0:51c:140c:6893 with SMTP id d75a77b69052e-5213c10a2e4mr201998051cf.11.1784675493524;
        Tue, 21 Jul 2026 16:11:33 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39ef68885a0sm1662041fa.3.2026.07.21.16.11.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 16:11:31 -0700 (PDT)
Date: Wed, 22 Jul 2026 02:11:28 +0300
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
        linux-hardening@vger.kernel.org, manaf.pallikunhi@oss.qualcomm.com
Subject: Re: [PATCH v5 5/9] arm64: dts: qcom: kodiak: Enable CDSP & Modem
 cooling
Message-ID: <qhb3hy33azdadqqu23drpaca7wel6pr3ibwqaze4i4zf5ltnzj@h32dfogcpkke>
References: <20260721-b4-qmi-tmd-v5-0-99620e07f505@oss.qualcomm.com>
 <20260721-b4-qmi-tmd-v5-5-99620e07f505@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260721-b4-qmi-tmd-v5-5-99620e07f505@oss.qualcomm.com>
X-Proofpoint-GUID: xZxgEM2qCgBZ3e65TvgYb_ghcKzXx1M5
X-Proofpoint-ORIG-GUID: xZxgEM2qCgBZ3e65TvgYb_ghcKzXx1M5
X-Authority-Analysis: v=2.4 cv=XaG5Co55 c=1 sm=1 tr=0 ts=6a5ffca6 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=-RMoDcQjNk1oVyBcn38A:9 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDIzOSBTYWx0ZWRfX4vFSmAwN7Is1
 mveD18a4qiOY2jCd2HH55MK7lS0pXQ97YeUqH8Z2hEnHgp79W8wMhrkNyYW03TDGQviBilLMNuL
 GXZ9Or37yCURPL0klDbEggMhzEaK7Bcae/3yXUTKiKUVlyGBWuEOPdYlZBUhqwsWvmWgS82Csnm
 HwPVL77mYXK943t+F6Y1i81oMT9+JHfhKrvyWNLAMwCI+ic4sFCXoYgnjb7M9RRV+41euoZSKN8
 jpo4wc7dKzweF+BnEjKyE1kGaRtqHNiu7p9giCAlOVDIcvvgNXRGTBmmEJAmLGn3MRcD6Rlk+vq
 l4zmvIhTdPSSJnVOHy0753hZgPz8pxYegYKaa+arUa08wKhwfq6HhSAynnPuxMDS/DUonh6QVCh
 UHHv2VdUypejT2O+sC3SjOBDSjJz199l1pILemsJWzoq3UCfjV35ZeTDYCy7p0fwjKheNMsekmd
 3XqmaPye1qFG6L++W9g==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDIzOSBTYWx0ZWRfX0qczyw9lx2GO
 Hp8tIlBCH1LeMSRh9VBkR7E7LJRjWftcxFgWxUrvUgkkP4/bR1K3Adv66BI4ZrjIOTo1QzvlOyr
 MAP+e04EroS7ZQ3ACXnM5UI3+VfTvZs=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-21_04,2026-07-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 spamscore=0 lowpriorityscore=0 suspectscore=0
 bulkscore=0 impostorscore=0 clxscore=1015 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607210239

On Tue, Jul 21, 2026 at 11:59:02AM +0530, Gaurav Kohli wrote:
> Unlike the CPU, the CDSP/Modem does not throttle its speed automatically
> when it reaches high temperatures in kodiak.
> 
> Set up CDSP cooling by throttling the cdsp when it reaches 100°C and
> for modem when it reaches to 95°C.
> 
> Add polling-delay-passive so the governor periodically evaluates
> the zone during passive cooling and steps up cooling levels when
> temperature stabilizes below the next trip.
> 
> Since the remoteproc_mpss node doesn't exist on non modem boards, the
> cooling-maps that reference it cause DT compilation errors. To fix that
> remove inherited mdmss cooling-map nodes.
> 
> Signed-off-by: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/kodiak.dtsi               | 134 ++++++++++++++++++++-
>  .../boot/dts/qcom/qcs6490-radxa-dragon-q6a.dts     |  29 +++++
>  arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts       |   1 +
>  .../dts/qcom/qcs6490-thundercomm-minipc-g1iot.dts  |  29 +++++
>  .../boot/dts/qcom/qcs6490-thundercomm-rubikpi3.dts |  29 +++++
>  .../boot/dts/qcom/qcs6490-vicharak-axon-mini.dts   |  29 +++++
>  .../boot/dts/qcom/sc7280-herobrine-lte-sku.dtsi    |  29 +++++
>  .../boot/dts/qcom/sc7280-herobrine-wifi-sku.dtsi   |  28 +++++
>  8 files changed, 304 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/kodiak.dtsi b/arch/arm64/boot/dts/qcom/kodiak.dtsi
> index 7e73348fe0d0..df5099023b77 100644
> --- a/arch/arm64/boot/dts/qcom/kodiak.dtsi
> +++ b/arch/arm64/boot/dts/qcom/kodiak.dtsi
> @@ -30,6 +30,7 @@
>  #include <dt-bindings/sound/qcom,lpass.h>
>  #include <dt-bindings/sound/qcom,q6afe.h>
>  #include <dt-bindings/sound/qcom,q6asm.h>
> +#include <dt-bindings/thermal/qcom,qmi-tmd.h>
>  #include <dt-bindings/thermal/thermal.h>
>  
>  / {
> @@ -3431,6 +3432,8 @@ remoteproc_mpss: remoteproc@4080000 {
>  			qcom,smem-states = <&modem_smp2p_out 0>;
>  			qcom,smem-state-names = "stop";
>  
> +			#cooling-cells = <3>;
> +
>  			status = "disabled";
>  
>  			glink-edge {
> @@ -4803,6 +4806,8 @@ remoteproc_cdsp: remoteproc@a300000 {
>  			qcom,smem-states = <&cdsp_smp2p_out 0>;
>  			qcom,smem-state-names = "stop";
>  
> +			#cooling-cells = <3>;
> +
>  			status = "disabled";
>  
>  			glink-edge {
> @@ -4922,6 +4927,7 @@ compute-cb@14 {
>  					};
>  				};
>  			};
> +

Extra empty line.

>  		};
>  
>  		usb_1: usb@a600000 {
> @@ -7732,6 +7738,8 @@ map0 {
>  		};
>  
>  		nspss0-thermal {
> +			polling-delay-passive = <200>;
> +
>  			thermal-sensors = <&tsens1 3>;
>  
>  			trips {
> @@ -7741,15 +7749,31 @@ nspss0_alert0: trip-point0 {
>  					type = "hot";
>  				};
>  
> +				nspss0_alert1: trip-point1 {
> +					temperature = <100000>;
> +					hysteresis = <5000>;
> +					type = "passive";
> +				};
> +
>  				nspss0_crit: nspss0-crit {
>  					temperature = <110000>;
>  					hysteresis = <0>;
>  					type = "critical";
>  				};
>  			};
> +
> +			cooling-maps {
> +				map0 {
> +					trip = <&nspss0_alert1>;
> +					cooling-device = <&remoteproc_cdsp QCOM_TMD_CDSP_SW
> +							 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
> +				};
> +			};
>  		};
>  
>  		nspss1-thermal {
> +			polling-delay-passive = <200>;
> +
>  			thermal-sensors = <&tsens1 4>;
>  
>  			trips {
> @@ -7759,12 +7783,26 @@ nspss1_alert0: trip-point0 {
>  					type = "hot";
>  				};
>  
> +				nspss1_alert1: trip-point1 {
> +					temperature = <100000>;
> +					hysteresis = <5000>;
> +					type = "passive";
> +				};
> +
>  				nspss1_crit: nspss1-crit {
>  					temperature = <110000>;
>  					hysteresis = <0>;
>  					type = "critical";
>  				};
>  			};
> +
> +			cooling-maps {
> +				map0 {
> +					trip = <&nspss1_alert1>;
> +					cooling-device = <&remoteproc_cdsp QCOM_TMD_CDSP_SW
> +							 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
> +				};
> +			};
>  		};
>  
>  		video-thermal {
> @@ -7803,7 +7841,9 @@ ddr_crit: ddr-crit {
>  			};
>  		};
>  
> -		mdmss0-thermal {
> +		mdmss0_thermal: mdmss0-thermal {
> +			polling-delay-passive = <200>;
> +
>  			thermal-sensors = <&tsens1 7>;
>  
>  			trips {
> @@ -7813,15 +7853,37 @@ mdmss0_alert0: trip-point0 {
>  					type = "hot";
>  				};
>  
> +				mdmss0_alert1: trip-point1 {
> +					temperature = <95000>;
> +					hysteresis = <2000>;
> +					type = "passive";
> +				};
> +
>  				mdmss0_crit: mdmss0-crit {
>  					temperature = <110000>;
>  					hysteresis = <0>;
>  					type = "critical";
>  				};
>  			};
> +
> +			cooling-maps {
> +				map0 {
> +					trip = <&mdmss0_alert1>;
> +					cooling-device = <&remoteproc_mpss QCOM_TMD_PA
> +							 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
> +				};
> +
> +				map1 {
> +					trip = <&mdmss0_alert1>;
> +					cooling-device = <&remoteproc_mpss QCOM_TMD_MODEM
> +							 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
> +				};
> +			};
>  		};
>  
> -		mdmss1-thermal {
> +		mdmss1_thermal: mdmss1-thermal {
> +			polling-delay-passive = <200>;
> +
>  			thermal-sensors = <&tsens1 8>;
>  
>  			trips {
> @@ -7831,15 +7893,37 @@ mdmss1_alert0: trip-point0 {
>  					type = "hot";
>  				};
>  
> +				mdmss1_alert1: trip-point1 {
> +					temperature = <95000>;
> +					hysteresis = <2000>;
> +					type = "passive";
> +				};
> +
>  				mdmss1_crit: mdmss1-crit {
>  					temperature = <110000>;
>  					hysteresis = <0>;
>  					type = "critical";
>  				};
>  			};
> +
> +			cooling-maps {
> +				map0 {
> +					trip = <&mdmss1_alert1>;
> +					cooling-device = <&remoteproc_mpss QCOM_TMD_PA
> +							 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
> +				};
> +
> +				map1 {
> +					trip = <&mdmss1_alert1>;
> +					cooling-device = <&remoteproc_mpss QCOM_TMD_MODEM
> +							 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
> +				};
> +			};
>  		};
>  
> -		mdmss2-thermal {
> +		mdmss2_thermal: mdmss2-thermal {
> +			polling-delay-passive = <200>;
> +
>  			thermal-sensors = <&tsens1 9>;
>  
>  			trips {
> @@ -7849,15 +7933,37 @@ mdmss2_alert0: trip-point0 {
>  					type = "hot";
>  				};
>  
> +				mdmss2_alert1: trip-point1 {
> +					temperature = <95000>;
> +					hysteresis = <2000>;
> +					type = "passive";
> +				};
> +
>  				mdmss2_crit: mdmss2-crit {
>  					temperature = <110000>;
>  					hysteresis = <0>;
>  					type = "critical";
>  				};
>  			};
> +
> +			cooling-maps {
> +				map0 {
> +					trip = <&mdmss2_alert1>;
> +					cooling-device = <&remoteproc_mpss QCOM_TMD_PA
> +							 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
> +				};
> +
> +				map1 {
> +					trip = <&mdmss2_alert1>;
> +					cooling-device = <&remoteproc_mpss QCOM_TMD_MODEM
> +							 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
> +				};
> +			};
>  		};
>  
> -		mdmss3-thermal {
> +		mdmss3_thermal: mdmss3-thermal {
> +			polling-delay-passive = <200>;
> +
>  			thermal-sensors = <&tsens1 10>;
>  
>  			trips {
> @@ -7867,12 +7973,32 @@ mdmss3_alert0: trip-point0 {
>  					type = "hot";
>  				};
>  
> +				mdmss3_alert1: trip-point1 {
> +					temperature = <95000>;
> +					hysteresis = <2000>;
> +					type = "passive";
> +				};
> +
>  				mdmss3_crit: mdmss3-crit {
>  					temperature = <110000>;
>  					hysteresis = <0>;
>  					type = "critical";
>  				};
>  			};
> +
> +			cooling-maps {
> +				map0 {
> +					trip = <&mdmss3_alert1>;
> +					cooling-device = <&remoteproc_mpss QCOM_TMD_PA
> +							 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
> +				};
> +
> +				map1 {
> +					trip = <&mdmss3_alert1>;
> +					cooling-device = <&remoteproc_mpss QCOM_TMD_MODEM
> +							 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
> +				};
> +			};
>  		};
>  
>  		camera0-thermal {
> diff --git a/arch/arm64/boot/dts/qcom/qcs6490-radxa-dragon-q6a.dts b/arch/arm64/boot/dts/qcom/qcs6490-radxa-dragon-q6a.dts
> index 82ebd88f9aba..befd3f908ce5 100644
> --- a/arch/arm64/boot/dts/qcom/qcs6490-radxa-dragon-q6a.dts
> +++ b/arch/arm64/boot/dts/qcom/qcs6490-radxa-dragon-q6a.dts
> @@ -24,6 +24,35 @@
>  /delete-node/ &adsp_mem;
>  /delete-node/ &cdsp_mem;
>  /delete-node/ &ipa_fw_mem;
> +
> +&mdmss0_thermal {
> +	cooling-maps {
> +		/delete-node/ map0;
> +		/delete-node/ map1;
> +	};
> +};
> +
> +&mdmss1_thermal {
> +	cooling-maps {
> +		/delete-node/ map0;
> +		/delete-node/ map1;
> +	};
> +};
> +
> +&mdmss2_thermal {
> +	cooling-maps {
> +		/delete-node/ map0;
> +		/delete-node/ map1;
> +	};
> +};
> +
> +&mdmss3_thermal {
> +	cooling-maps {
> +		/delete-node/ map0;
> +		/delete-node/ map1;
> +	};
> +};

This is out of place. If you want to remove maps, remove them directly
by label, rather than deleting them through a path under a thermal node.

> +
>  /delete-node/ &mpss_mem;
>  /delete-node/ &remoteproc_mpss;
>  /delete-node/ &remoteproc_wpss;
> diff --git a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
> index e9a932c90d14..48751bc2265d 100644
> --- a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
> +++ b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
> @@ -25,6 +25,7 @@
>  /delete-node/ &rmtfs_mem;
>  /delete-node/ &adsp_mem;
>  /delete-node/ &cdsp_mem;
> +

Why?

>  /delete-node/ &video_mem;
>  /delete-node/ &wlan_ce_mem;
>  /delete-node/ &wpss_mem;

-- 
With best wishes
Dmitry
