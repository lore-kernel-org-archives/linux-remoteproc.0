Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9538F433E60
	for <linux-remoteproc@vger.kernel.org>; Mon, 24 Aug 2026 14:19:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787581156; cv=none; b=jUY1hasglaNOASN+zDTzXjpMtp580OVDa+y/oddtCbWBSiFnwlnSmRXsiUnmOymbuXSdtDzR1PRCQ6AnCcHh9HRXN/ckJcQ0MPZFBzuG/xuezeK6Lc3FBl202KOxVtlM8Q13NKQgbo07KzRNJD4igVE1ke1mdC+eb8M+RnI+chI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787581156; c=relaxed/simple;
	bh=uGBZvFe03XTRnDnScoiVwUfr6a/QNJgJCLL5rZ5Drhg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=E4lQWuQZeQ0ykViQw8gQb18nVhl34LV/BnFBA5Wv1gPOXMvBcsx9mKj1R+vVfjBpbkbxNDXOPE+oicB8b1gI3FWGidtMTCU/l8ydq7rSZm/bGzrmde/Oc+N+aIYg0gJ+OQnwGVvWxvi+enKdke8MoXsRAlXm+EIFeVUxcZ+9O38=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fd6Iz2t0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dg+uUqCV; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fd6Iz2t0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dg+uUqCV"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67OCvVhI2579746
	for <linux-remoteproc@vger.kernel.org>; Mon, 24 Aug 2026 14:19:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iUX2OhZfsVuqQtVDi60W0GQY3wPaJ8rUSyWA44gD5Mw=; b=fd6Iz2t0/BUeqbt5
	YJnb8iyeIepriOd/Rd0itaNS1YPq/EgRMZL86MRM38s/D/WwMm1aocnmW+UxSE2l
	RqAbm5oXG47xkLiyYiLziMgO9DYCgILYcWV7j++4qBQTB0k4DILM0ekAtuBGtic8
	Ucb2t3ncQzGy1N7y4ln4b+w87xTnyJyL6KJCsiebN6APXrUcRaJEazkKt1P030MA
	ss50uvN+YcGG0Zt4xKc7eMSqg3nlzsgwobg5tGCDwcR8TXmB3HKVyzcTsqqVof0i
	wPdiPC0LGm7k1Yc8bjjDT8YF+TLWfkLAaQRQmiHhxD/N9dDffStnPZ955QbECQt/
	mpTsvA==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g8gdsj1ts-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Mon, 24 Aug 2026 14:19:13 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-73966c839bfso81480137.0
        for <linux-remoteproc@vger.kernel.org>; Mon, 24 Aug 2026 07:19:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787581148; x=1788185948; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iUX2OhZfsVuqQtVDi60W0GQY3wPaJ8rUSyWA44gD5Mw=;
        b=dg+uUqCVmIYG3RJKP1IUhZNTwn2o2GjMzHORiVjU+04EBUHNelSFcX/+R2RJf+grAK
         rlu9j+p6ibaXhVwHk/HMiIWkQJvxahMIyYgoC2YutiivNf3APKVsz7s8lKcEvbweYyLF
         TDibnhJC76ql67hXSvjiwnqAhEwCuCyftALGku7geP2GIn2FdcXvZy94n8YVyzUeSbzp
         NUZqhVwbkfBs4rFJ8Axabdk6odIqxVE5pRxvZscPo9I174N7JGMuonHKTUgWOuGdwHRu
         V0R4Yuaojc5wbK3USaQDGuFOCMFifgM3Muvc/we+4THd5viEEaWmQxJ+G8Otmp5A6YyS
         PJhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787581148; x=1788185948;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iUX2OhZfsVuqQtVDi60W0GQY3wPaJ8rUSyWA44gD5Mw=;
        b=QKu8Jsufjp/qtVsuuC7jEIkHF3R8lzpDwffxwccvT5YT3k6BZb4s3UGi+n12BI56dG
         0KBG3YcMSJsdSDuCdIuH7TCpkZa6rGetFjv2+DSFAqFvoqy+x/UiZcA5wWyPLojrJYpY
         lZtrweXLDhBp2lJdrr4/NCNs/YPSmie4q0QbMDZq7XBFlmCPiypjfJ25sdZbaTBBmHl+
         zryDkDGXHU0KZdjhiU5Rn+ji8Olw9/HZ6fJ2aRudx1tAKwC81Ko3JCrBivUeLwJqSjd0
         UsAAEO9Z1CDk15W6FK7e9fDlCn5S1CY6ESUL6byizvZp8FKjJIQ4gemi7MJYed7PVWs0
         TNtg==
X-Forwarded-Encrypted: i=1; AHgh+RpSSOJvyhZelz6PiF1ql+5h2R4uQOzSvKLxxNNf2Ln+4teanVMKayTVSKoDG7WAT8xbD1J0ZtnjTgupDDPSUW4c@vger.kernel.org
X-Gm-Message-State: AFuF++kGdfmaWpfMDCd/zMWL6tpf9uV4S/8iyLKOTVt0w6vwQTuOfHTh
	+wnsmUPSTyx8MWXCjAZ4+8mEEdsDiV6mFGh6AKRWDTia5/aeY0EffFIH4FIEhTYoMckI5QVZCtI
	rzIHNskjU5GRK5j9+y0n1k8/OZJeHAuyu08X7QfaA5C4emFC2onyaGWzsg56R3XMmvR5glLIP
X-Gm-Gg: AR+sD114y1hAHX0/aY36gxHdLahfCgQNsrSVOqVdQZ6K63V8mAC0mCNMVgcnUJBoDB8
	nguhtOSjZC4NnyMDf2ciWDEJYIiBFg1pDrm8mirY0gCeviqDNVXDIFXKYs4OmglHDacQb5CK2QJ
	AZ7zlwopQXL50H0e8BZhha2VkePdTAOXLPnqB6rg0pU+EMirMhO+S2pcwHzH56jQTG3EGDTVg6u
	g8siJJUD5puBg+k8KCMVYtO9/x7WS771zUfYHDrAe08an+JiyBhE0vzoLUlQFytZQmB6X0AXwhL
	0bjf1RCBLDRtPO1LfgK4lXoexBGhI+LnOLS4wYgCrSQgunORSXFLB04WgBylpqbvwG6f2/QGSWH
	WmQiBVXslmXZRwF6NaAWdWRvn
X-Received: by 2002:a67:fa03:0:b0:77f:76f:2c58 with SMTP id ada2fe7eead31-77f076f3cb0mr479105137.1.1787581147689;
        Mon, 24 Aug 2026 07:19:07 -0700 (PDT)
X-Received: by 2002:a67:fa03:0:b0:77f:76f:2c58 with SMTP id ada2fe7eead31-77f076f3cb0mr479073137.1.1787581147092;
        Mon, 24 Aug 2026 07:19:07 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a1c2fab2f9sm14278301fa.27.2026.08.24.07.19.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Aug 2026 07:19:06 -0700 (PDT)
Message-ID: <01cd0d90-2908-42cb-9ae8-29828d4c03a0@oss.qualcomm.com>
Date: Mon, 24 Aug 2026 16:19:02 +0200
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 8/9] arm64: dts: qcom: monaco: Enable CDSP cooling
To: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
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
References: <20260809-b4-qmi-tmd-v8-0-b15d47adc379@oss.qualcomm.com>
 <20260809-b4-qmi-tmd-v8-8-b15d47adc379@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260809-b4-qmi-tmd-v8-8-b15d47adc379@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: LiRnYCU_-c9jzgqtrJm7ssULw5K-xbnk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI0MDEyMCBTYWx0ZWRfX1TzIoRW851B7
 5VM60jVijTtq3XUKf/kpj6QELZG43y7MUtjtU1jyJKcW4JB3xSmaI9ii7w62fXcFv1jSAfh3MO6
 gfSXTtoKycgUswTCWdhcUeZesrhUfe/3Whq+BY24ph8r/6Ce7Qaz/GZVUTMrb0XwnlwE8v1+uvK
 M4Ib+2oXP5VsBuGqfzcMBUpKNgEkhwgkGv/0GNqbHtnNH7Pa2YfmbsovDwsXcUSv7/wX+FFRkL7
 LK0ldfDmdmrKTyvV86Jgorz6DcV3mpXJPA79qJUWaKXkmeFep275SOh3WiUetHbLBiINnWOQtRp
 QGMlRV44li0i5ytG7hXGItSMS6IXlS9p39hN6d0ye4ezrrfrjeJRXvpuvuoe3ihbCXOXk2/R0by
 OeuN/Pi4aXfP42XuV+WOTHG0mTbi0rp99pWloKvUw4g7y+AFwhJLskR+VSjp5aR0UrwTZ3dw+w9
 0quAJd0pHl0P5fU8Syg==
X-Authority-Analysis: v=2.4 cv=Fqo1OWrq c=1 sm=1 tr=0 ts=6a8c52e1 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=lpwU2ilW0SqlNkBhVkYA:9 a=QEXdDO2ut3YA:10 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-ORIG-GUID: LiRnYCU_-c9jzgqtrJm7ssULw5K-xbnk
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI0MDEyMCBTYWx0ZWRfX6OKo5v9l3TTv
 xG6b0ix0FTzxua4emXQu5wZ9L6BRFaKQJ7lUDxo9SfY4aHimOJN6sfwJ6fbo22j2ROvWJQ/Vfb2
 C22cwwP28IIx9VURzD1kL0AHl8n/fas=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-24_04,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0 suspectscore=0
 impostorscore=0 phishscore=0 spamscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608240120

On 8/9/26 2:29 PM, Gaurav Kohli wrote:
> Unlike the CPU, the CDSP does not throttle its speed automatically
> when it reaches high temperatures in monaco.

[...]

>  		nsp-0-0-0-thermal {
> +			polling-delay-passive = <200>;

..and here it's 200 - I really think there should be a single value
that makes sense, this seems no less than random

Konrad
