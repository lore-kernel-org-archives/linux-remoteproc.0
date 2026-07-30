Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E9B8431A5C
	for <linux-remoteproc@vger.kernel.org>; Thu, 30 Jul 2026 17:10:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785431429; cv=none; b=pEyhbZjWRtTyKZCGAYMW4SZBO4QVtDhqPhoSKhMqfoYvSsh2ssj/jVfnCZv57HEgfMdmUGCNY08f8hoA2FEJN39dk37CUlqQA3p/y+Q2PaWpK67TdNk1RHbwk3wQEfGuGVcET/Aic5GLVMGXSHKRiTQcG38EBJVuoEkxwq37cic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785431429; c=relaxed/simple;
	bh=fqTSDQN7nJlREtRO3Fm1yNRF9pzv58xXEuu6JG9X3TU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nqunlphVq/lJEjGJqRZqb84F6BQmkeE6+ziFm1FOb+RCTZkA21xKNsZylugIdjR8NXgtHgzQiSRYdqEzcIqrluisakXUCeqaaKB/xRXGcHpCrXRe/zZC7Qt9+TrpwgI/oJkcvThbDJZ/TbBygg5wpvxQOMLTzr/JYg68PBKIXv4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UBBy/EH4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=j7HMRfQt; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UBBy/EH4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="j7HMRfQt"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66UGWfr42556055
	for <linux-remoteproc@vger.kernel.org>; Thu, 30 Jul 2026 17:10:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ho3uBP1okvITlExnW9igFrl0dofyDrS+e5s1TgETMgA=; b=UBBy/EH4eTWBX0Tn
	AVOdHWoyU8LrVZtHlD3F36nCQV22VwWBBeyg7nrZ1hh2vaKsMF7Ktm68fuv27sBK
	rqVZbzO3Rrs0HZQLRpOKzIdFoXwY36qlcAvwWb+8KyEQWkQVrHXAhaLhtLu1iRmq
	rsatS7DOR4+fhvOOSgehwwSl5MKVoMUQtmNQ8G1vKOADqpsH8fqms+MZQtp5UE8s
	hmKXQWr8vWwikGX8gGkk8GzhAgnymfvCqAfLAEzUb9lxd/zG4hDbAUwIlesf+HH0
	Afi2xQCMeOZgRa4518qxTr9oreC87FbPGdgRnwOqoxPbUySts7nWUgNGcqXCPqrr
	9zqGIQ==
Received: from mail-yw1-f198.google.com (mail-yw1-f198.google.com [209.85.128.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fr8169247-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Thu, 30 Jul 2026 17:10:26 +0000 (GMT)
Received: by mail-yw1-f198.google.com with SMTP id 00721157ae682-81e8f17ada0so1091837b3.2
        for <linux-remoteproc@vger.kernel.org>; Thu, 30 Jul 2026 10:10:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785431426; x=1786036226; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ho3uBP1okvITlExnW9igFrl0dofyDrS+e5s1TgETMgA=;
        b=j7HMRfQtV8IdaZwv6a0t0XSmldKWYBN3TM81xzD3EYVx+jp/o3veo/FQnoIxvUy3+n
         kdQVWzdZSw5WJMy6K2cftqilBcRhnv9JzzTYPtxidB9hxuJXwakE5y85MLAS16L1o6v+
         p6srn37T/zWeudhmPdDtWK176RTm/BdQk7be9Mup+K8ISdUK/WJkFBiO4Qmkx1CicY2P
         Jnwh1Zf3BtjRMPZSxqqaC9c6l0klZ+FpjEUWtYRXI543VncaSCTqneqSFNtddZXUM7m+
         al7N6pIlp0PzqX8DQutUY5Os2DqY1jj8cbSHb+0LDHBPjsqKnqe2Qn4W5Fgt0X7SytwV
         x2uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785431426; x=1786036226;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ho3uBP1okvITlExnW9igFrl0dofyDrS+e5s1TgETMgA=;
        b=s+CUUnxB2HdRaJ0ASmNtkAlmlW6TLV8a+Dkqaqju/Ng8Qh2CYog6rNrhLJefAi6k4t
         iJrcF/LiyKDITib1wUbueEHtBiRMJGnWifkUx8aqegt/CwV8Lr0tpbe3yJm0SljZGSwk
         f1a+6cnUIUUMQvGnva+xy7KOluOmgC9/kDviSX/QAjQ137JSI55+sq7RASbGFbBKTZTQ
         gUrxeU18b6mijCFj816h86OyOXleyAaZIKHHV2VEOjAkuQU8OPNSIMQYN82KXsRQykzG
         plpoWN36xrwMJgABVRaFgtUk8M98fBxvEaShd/FWnjRHmf4B1ZeiLwpbCmxSV/dyaJfM
         hkIg==
X-Forwarded-Encrypted: i=1; AHgh+RqAZ+9Hnw5Mm540SEmZ2yqt+XR4EfeHBfuw0o0X/VPM2KF6DZHC4RDMmAaucSykYopQch7vD7VZDku0Vtlpx25R@vger.kernel.org
X-Gm-Message-State: AOJu0Yyrhv5JnI1yOPyGFuYHUBHJFWae6l78QU3kQzpUHV9SVx9051Y/
	ApBt5bIdg4VxeYXCgICHsckxR5s9kF66xQc9egTOYdQOVhBQv4A6MkgzLETHhxHimNx/mtLIAIx
	bJaYPi0BV0EHNLO2B4AVd9MbxJossk7M/icBvk9NfGmZ8Kl55tGdGkD8yFH7RmUTodhB9dfhk
X-Gm-Gg: AR+sD12EuQ3zIV5SugDg+emus2bfqBXDYopaUKtkcPfzakAJvgJZQu/XeccdUWkd7yS
	XveB8YAe7yb7BQ5EXBADQZH1wAqOAZh4Rlzr2nTWqFgleswpYurcDZVo8MvyHHJBAh3LU3tpc6U
	b5dqzUTD92ijUIqv5nIO53n1+EaS70lmDkK143y6qq+3t/gPzvCpVzDayEnD/U06m34P89EnFYi
	mUVlyNDH5UQCWKb5UBzyn2zXpOYk4ApIi1QS+yISCESrwtKc1q3XPstdNzJ+s5n1XSyOuns+xpW
	0ICgYkBMmokuY1OMKXFahICITOU86aiMzIdKoawf67LXlXMQRCwLaj+e1UFs39w0i8varxkm0r0
	vpCU82vrJZ2GPWUq5eCFztucMc/ocoF+JL1/r4lMnaHp7dt4cVljjyocqt+Agnjvj
X-Received: by 2002:a05:690c:7342:b0:81e:8b2c:a7f0 with SMTP id 00721157ae682-81fb89ce3ffmr24565087b3.10.1785431425591;
        Thu, 30 Jul 2026 10:10:25 -0700 (PDT)
X-Received: by 2002:a05:690c:7342:b0:81e:8b2c:a7f0 with SMTP id 00721157ae682-81fb89ce3ffmr24564627b3.10.1785431425081;
        Thu, 30 Jul 2026 10:10:25 -0700 (PDT)
Received: from ?IPV6:2a01:cde0:108:24ed:2206:62e9:bbc4:c360? ([2a01:cde0:108:24ed:2206:62e9:bbc4:c360])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-81fb8a8feb5sm13764387b3.31.2026.07.30.10.10.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Jul 2026 10:10:24 -0700 (PDT)
Message-ID: <0f56d22d-437d-409a-852f-9fbf4e303284@oss.qualcomm.com>
Date: Thu, 30 Jul 2026 19:10:10 +0200
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 9/9] arm64: dts: qcom: hamoa: Enable CDSP cooling
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
        Dipa Ramesh Mantre <dipa.mantre@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20260727-b4-qmi-tmd-v6-0-973cd3a226af@oss.qualcomm.com>
 <20260727-b4-qmi-tmd-v6-9-973cd3a226af@oss.qualcomm.com>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <20260727-b4-qmi-tmd-v6-9-973cd3a226af@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMwMDEyOCBTYWx0ZWRfX49o51kQIq2QG
 AiUvniUWE4s48WasTmBC0SxbTNflzEwCArEoqDGpylchwgk7d3nJmze7g0zEnKw4WS6Ek8NY1AB
 m9u0jVPonr2aL60xHwrs7jf7W2i680I5DLidvKzHNtVd0HIab2YC9HuRSDXXqv/MC2WUtphtZ5w
 gQ7B1uHSwMI2u5c/hKQe+foCW4n4qM0DOvPXSFhFodCMxSB9Dfj02oWC4xiuFg+UOCZ0kIn4iNs
 oWbXQE4k2bW9+61BbvZYywwQgaIe1qArDXtjSESzXVC4XFbmW4OGmH7mwD3PV4PuwTX4E7OUKoQ
 kF5wZoPjojLkJPj/EcID9VmtbC27SIxWPAMXntbTGqaPL2dU1vIe9W1czNIvZ27syicTWLlbjfY
 E6pVFIwjoJ2T39zKTjSULJHnmPrUteTWOKTeJbeLNg3vprNHCYHCbksCeJ77bDxICWNm2iqjZom
 BUe7bZCRTKKKw5vPVgQ==
X-Authority-Analysis: v=2.4 cv=LIlWhpW9 c=1 sm=1 tr=0 ts=6a6b8582 cx=c_pps
 a=g1v0Z557R90hA0UpD/5Yag==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=vpmf1welhrwVHoobIegA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=MFSWADHSvvjO3QEy5MdX:22
X-Proofpoint-ORIG-GUID: 7qdKY2v3JbMUMhgWeAqfWrusHRv48dAC
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMwMDEyOCBTYWx0ZWRfX0IhbM3ubuHEM
 CdxJnb1C3H6uBInDRIFat5aboxPLn+C0Lt54/yU5ByTkrmm96tuZXN1kyJUC70ZiYYtiUzxYG2Q
 Fthb042iv3XBAyWZnxdKdJiEMsUGsyg=
X-Proofpoint-GUID: 7qdKY2v3JbMUMhgWeAqfWrusHRv48dAC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-30_05,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 impostorscore=0 clxscore=1015 suspectscore=0
 lowpriorityscore=0 phishscore=0 adultscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607300128

On 7/27/26 16:22, Gaurav Kohli wrote:
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
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
> ---
>   arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts | 32 +++++++++++++++
>   arch/arm64/boot/dts/qcom/hamoa.dtsi        | 63 ++++++++++++++++++++++++++++++
>   2 files changed, 95 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts b/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts
> index 9fa86bb6438e..a146be1cb5fb 100644
> --- a/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts
> +++ b/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts
> @@ -1684,4 +1684,36 @@ trip-point0 {
>   			};
>   		};
>   	};
> +
> +	nsp0-thermal {
> +		trips {
> +			trip-point1 {
> +				temperature = <105000>;
> +			};
> +		};
> +	};
> +
> +	nsp1-thermal {
> +		trips {
> +			trip-point1 {
> +				temperature = <105000>;
> +			};
> +		};
> +	};
> +
> +	nsp2-thermal {
> +		trips {
> +			trip-point1 {
> +				temperature = <105000>;
> +			};
> +		};
> +	};
> +
> +	nsp3-thermal {
> +		trips {
> +			trip-point1 {
> +				temperature = <105000>;
> +			};
> +		};
> +	};

 From thermal-zones.yaml:

	...

	required:
	  - temperature
	  - hysteresis
	  - type

	...



